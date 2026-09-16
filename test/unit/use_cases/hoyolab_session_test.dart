import "dart:convert";

import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/data/repositories/hoyolab_cookie_repository.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_exceptions.dart";
import "package:genshin_material/providers/hoyolab_game_server.dart";
import "package:genshin_material/use_cases/hoyolab_session.dart";
import "package:http/http.dart" as http;
import "package:mockito/mockito.dart";

import "../../utils/crashlytics.dart";
import "../../utils/crashlytics.mocks.dart";
import "../../utils/hoyolab_game_server.dart";
import "../../utils/http_client.dart";
import "../../utils/http_client.mocks.dart";
import "../../utils/remote_config.dart";
import "../../utils/secure_storage.dart";

String _okBody(Object? data) =>
    jsonEncode({"retcode": 0, "message": "OK", "data": data});

void main() {
  late bool hoyolabLinkEnabled;
  late MockClient client;
  late MockCrashlyticsService crashlytics;

  final storage = setUpSecureStorageMock();

  setUp(() {
    hoyolabLinkEnabled = true;
    client = MockClient();
    crashlytics = MockCrashlyticsService();
  });

  /// Builds the container and waits for the cookie repository's first storage
  /// read.
  ///
  /// The repository is an [AsyncNotifier], so its synchronous snapshot is
  /// `AsyncLoading` until that resolves. `storage.clear()` has to come before
  /// the call, because the storage is read exactly once.
  Future<ProviderContainer> createContainer() async {
    final container = ProviderContainer.test(overrides: [
      overrideRemoteConfig(RemoteConfigKeys.hoyolabLinkEnabled, hoyolabLinkEnabled),
      overrideHttpClient(client),
      // Both use cases report their failure paths through the service, and the
      // real one reaches an uninitialized Firebase.
      overrideCrashlyticsService(crashlytics),
      ...overrideHoyolabGameServerPrefs(),
    ]);
    await container.read(hoyolabCookieRepositoryProvider.future);
    return container;
  }

  group("HoyolabStoreCookieUseCase", () {
    test("stores the cookie once HoYoLAB accepted it", () async {
      stubPost(client, _okBody({"user_info": {"account_name": "tester"}}));
      storage.clear();
      final container = await createContainer();

      await container.read(hoyolabStoreCookieUseCaseProvider)(fakeCookie);

      expect(storage["hoyolab_cookie"], fakeCookie);
      expect(container.read(hoyolabCookieRepositoryProvider).value, fakeCookie);
    });

    test("rejects a cookie HoYoLAB refused, without storing it", () async {
      stubPost(client, jsonEncode({"retcode": -100, "message": "Not logged in"}));
      storage.clear();
      final container = await createContainer();

      await expectLater(
        container.read(hoyolabStoreCookieUseCaseProvider)(fakeCookie),
        throwsA(isA<CredentialVerificationException>()),
      );
      expect(storage, isEmpty);
      expect(container.read(hoyolabCookieRepositoryProvider).value, isNull);
    });

    test("refuses to store while the link is disabled", () async {
      hoyolabLinkEnabled = false;
      storage.clear();
      final container = await createContainer();

      await expectLater(
        container.read(hoyolabStoreCookieUseCaseProvider)(fakeCookie),
        throwsA(isA<HoyolabLinkDisabledException>()),
      );
      expect(storage, isEmpty);
      verifyZeroInteractions(client);
    });
  });

  group("HoyolabUnlinkUseCase", () {
    late String? cookieAtLogout;

    setUp(() {
      cookieAtLogout = null;
    });

    /// Stubs the logout call, recording the cookie the storage still held when
    /// the request went out.
    void stubLogout({String body = ""}) {
      when(client.post(any, headers: anyNamed("headers"), body: anyNamed("body")))
          .thenAnswer((_) async {
        cookieAtLogout = storage["hoyolab_cookie"];
        return http.Response(body.isEmpty ? _okBody(null) : body, 200);
      });
    }

    void expectLocalStateCleared(ProviderContainer container) {
      expect(storage, isEmpty);
      expect(container.read(hoyolabCookieRepositoryProvider).value, isNull);
      expect(
        container.read(hoyolabGameServerProvider),
        isA<UnlinkedHoyolabGameServer>(),
      );
    }

    // The order is the point: HoYoLAB is told about the sign-out while the
    // cookie is still stored, and only then is the local state dropped.
    test("logs out of HoYoLAB before dropping the local state", () async {
      stubLogout();
      final container = await createContainer();

      await container.read(hoyolabUnlinkUseCaseProvider)();

      expect(cookieAtLogout, fakeCookie);
      expectLocalStateCleared(container);
    });

    test("drops the local state even when the logout call fails", () async {
      stubLogout(body: jsonEncode({"retcode": 10001, "message": "Failed"}));
      final container = await createContainer();

      await container.read(hoyolabUnlinkUseCaseProvider)();

      expectLocalStateCleared(container);
      verify(crashlytics.reportIfNonSilent(any, any)).called(1);
    });

    // Regression for the defect reported in the review of PR #485: unlinking
    // used to throw before any local cleanup when the remote flag was off, so a
    // user whose flag was turned off server-side kept their credentials
    // forever, with no way to sign out from the UI.
    test("unlinks even when the link is disabled by remote config", () async {
      hoyolabLinkEnabled = false;
      final container = await createContainer();

      await container.read(hoyolabUnlinkUseCaseProvider)();

      expectLocalStateCleared(container);
      verifyZeroInteractions(client);
    });
  });
}
