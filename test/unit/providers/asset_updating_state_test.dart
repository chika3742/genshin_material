import "dart:io";

import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/asset_updater.dart";
import "package:genshin_material/providers/asset_updating_state.dart";

/// Fails every request. `AssetUpdater` builds its own `http.Client`, which on
/// the VM wraps a `dart:io` `HttpClient`, so overriding the client factory is
/// the only way to keep `checkForUpdate` off the network.
class _FailingHttpClient implements HttpClient {
  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.isSetter) {
      return null;
    }
    throw const SocketException("Network access is disabled in tests");
  }
}

class _OfflineHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) => _FailingHttpClient();
}

const _pathProviderChannel = MethodChannel("plugins.flutter.io/path_provider");

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  HttpOverrides? previousOverrides;

  setUp(() {
    tempDir = Directory.systemTemp.createTempSync("asset_updating_state_test");
    // path_provider has no plugin implementation in a unit test, so its method
    // channel is answered with a throw-away directory.
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      _pathProviderChannel,
      (call) async => tempDir.path,
    );
    previousOverrides = HttpOverrides.current;
    HttpOverrides.global = _OfflineHttpOverrides();
  });

  tearDown(() {
    HttpOverrides.global = previousOverrides;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_pathProviderChannel, null);
    tempDir.deleteSync(recursive: true);
  });

  ProviderContainer createContainer() => ProviderContainer.test();

  AssetUpdatingStateNotifier createNotifier(ProviderContainer container) =>
      container.read(assetUpdatingStateProvider.notifier);

  AssetUpdatingState readState(ProviderContainer container) =>
      container.read(assetUpdatingStateProvider);

  group("AssetUpdateProgressState", () {
    test("isChecking is only true while checking for an update", () {
      for (final state in AssetUpdateProgressState.values) {
        expect(
          state.isChecking,
          state == AssetUpdateProgressState.checkingForUpdate,
          reason: "$state",
        );
      }
    });

    test("isUpdating is only true while downloading or installing", () {
      const updating = [
        AssetUpdateProgressState.downloading,
        AssetUpdateProgressState.installing,
      ];
      for (final state in AssetUpdateProgressState.values) {
        expect(state.isUpdating, updating.contains(state), reason: "$state");
      }
    });

    test("hasError is only true for the three error states", () {
      const errors = [
        AssetUpdateProgressState.errorWhileChecking,
        AssetUpdateProgressState.errorWhileDownloading,
        AssetUpdateProgressState.errorWhileInstalling,
      ];
      for (final state in AssetUpdateProgressState.values) {
        expect(state.hasError, errors.contains(state), reason: "$state");
      }
    });

    test("isBusy covers checking, downloading and installing", () {
      const busy = [
        AssetUpdateProgressState.checkingForUpdate,
        AssetUpdateProgressState.downloading,
        AssetUpdateProgressState.installing,
      ];
      for (final state in AssetUpdateProgressState.values) {
        expect(state.isBusy, busy.contains(state), reason: "$state");
      }
    });

    test("a finished or idle state is neither busy nor an error", () {
      for (final state in [
        AssetUpdateProgressState.none,
        AssetUpdateProgressState.noUpdateAvailable,
        AssetUpdateProgressState.updated,
      ]) {
        expect(state.isBusy, isFalse, reason: "$state");
        expect(state.hasError, isFalse, reason: "$state");
      }
    });
  });

  group("AssetUpdatingState", () {
    test("keeps the progress fields set by copyWith", () {
      const initial = AssetUpdatingState();

      final updated = initial.copyWith(progress: 0.25, totalBytes: 4096);

      expect(updated.progress, 0.25);
      expect(updated.totalBytes, 4096);
      expect(updated.state, AssetUpdateProgressState.none);
    });

    test("keeps the error across a later state change", () {
      const error = SocketException("boom");

      final withError = const AssetUpdatingState().copyWith(error: error);
      final afterStateChange = withError
          .copyWith(state: AssetUpdateProgressState.errorWhileChecking);

      expect(afterStateChange.error, same(error));
      expect(afterStateChange.state.hasError, isTrue);
    });
  });

  group("build", () {
    test("starts idle with no progress and no error", () {
      final container = createContainer();

      final state = readState(container);

      expect(state.state, AssetUpdateProgressState.none);
      expect(state.progress, isNull);
      expect(state.totalBytes, isNull);
      expect(state.error, isNull);
    });
  });

  group("checkForUpdate", () {
    test("moves to errorWhileChecking and keeps the error when the release "
        "index cannot be fetched", () async {
      final container = createContainer();
      final notifier = createNotifier(container);

      await notifier.checkForUpdate();

      final state = readState(container);
      expect(state.state, AssetUpdateProgressState.errorWhileChecking);
      expect(state.state.hasError, isTrue);
      expect(state.error, isNotNull);
    });

    test("marks the state as checking before the first suspension", () {
      final container = createContainer();
      final notifier = createNotifier(container);

      final pending = notifier.checkForUpdate();

      expect(
        readState(container).state,
        AssetUpdateProgressState.checkingForUpdate,
      );
      return pending;
    });

    test("throws while another check is still running", () async {
      final container = createContainer();
      final notifier = createNotifier(container);

      final pending = notifier.checkForUpdate();
      await expectLater(notifier.checkForUpdate(), throwsStateError);

      await pending;
    });

    test("can be retried after a failed check", () async {
      final container = createContainer();
      final notifier = createNotifier(container);

      await notifier.checkForUpdate();
      expect(readState(container).state.isBusy, isFalse);
      await notifier.checkForUpdate();

      expect(
        readState(container).state,
        AssetUpdateProgressState.errorWhileChecking,
      );
    });
  });
}
