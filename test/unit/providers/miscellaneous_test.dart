import "dart:convert";
import "dart:io";

import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/api_request_queue.dart";
import "package:genshin_material/data/repositories/hoyolab_cookie_repository.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_account_api.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/providers/hoyolab_api.dart";
import "package:genshin_material/providers/miscellaneous.dart";
import "package:http/http.dart" as http;
import "package:mockito/mockito.dart";

import "../../utils/db.dart";
import "../../utils/http_client.mocks.dart";
import "../../utils/provider_container.dart";
import "../../utils/secure_storage.dart";

/// `shouldHideImages` only consults the sign-in state on Apple platforms; on
/// every other host it short-circuits to false.
final _isApplePlatform = Platform.isIOS || Platform.isMacOS;

void main() {
  late AppDatabase db;

  /// Both subjects below read the cookie through `HoyolabCookieRepository`,
  /// which goes straight to `flutter_secure_storage`.
  final storage = setUpSecureStorageMock();

  setUp(() {
    db = createTestDatabase();
  });

  tearDown(() async {
    await db.close();
  });

  group("RealtimeNotesActivationState", () {
    late MockClient client;

    setUp(() {
      client = MockClient();
    });

    /// The cookie repository is an `AsyncNotifier`, and the subject reads its
    /// synchronous snapshot, so the container is handed over only once the
    /// first storage read has resolved. `storage.clear()` has to come before
    /// that read, because the repository reads the storage exactly once.
    Future<ProviderContainer> createContainer({bool signedIn = true}) async {
      if (!signedIn) {
        storage.clear();
      }
      final container = createTestContainer(
        db: db,
        overrides: [
          hoyolabAccountApiProvider.overrideWith(
            (ref) async => HoyolabAccountApi(
              cookie: fakeCookie,
              client: client,
              queue: ApiRequestQueue(interval: Duration.zero),
            ),
          ),
        ],
      );
      await container.read(hoyolabCookieRepositoryProvider.future);
      return container;
    }

    void stubGameRecordCards({required bool isPublic}) {
      when(client.get(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response(
          jsonEncode({
            "retcode": 0,
            "message": "OK",
            "data": {
              "list": [
                {
                  "game_id": 2,
                  "data_switches": [
                    {"switch_id": 3, "is_public": isPublic},
                  ],
                },
              ],
            },
          }),
          200,
        ),
      );
    }

    test("reports the realtime notes switch of the Genshin record card",
        () async {
      stubGameRecordCards(isPublic: true);
      final container = await createContainer();

      expect(
        await container.read(realtimeNotesActivationStateProvider.future),
        isTrue,
      );
    });

    test("reports false when the switch is off", () async {
      stubGameRecordCards(isPublic: false);
      final container = await createContainer();

      expect(
        await container.read(realtimeNotesActivationStateProvider.future),
        isFalse,
      );
    });

    // Asking HoYoLAB about an account nobody signed in to is pointless, so the
    // provider answers without touching the network.
    test("reports false without calling the API when signed out", () async {
      final container = await createContainer(signedIn: false);

      expect(
        await container.read(realtimeNotesActivationStateProvider.future),
        isFalse,
      );
      verifyZeroInteractions(client);
    });

    test("updateValue pushes the new value to HoYoLAB", () async {
      stubGameRecordCards(isPublic: false);
      when(client.post(any, headers: anyNamed("headers"), body: anyNamed("body")))
          .thenAnswer((_) async => http.Response(
                jsonEncode({
                  "retcode": 0,
                  "message": "OK",
                  "data": <String, dynamic>{},
                }),
                200,
              ));
      final container = await createContainer();
      await container.read(realtimeNotesActivationStateProvider.future);

      await container
          .read(realtimeNotesActivationStateProvider.notifier)
          .updateValue(true);

      expect(container.read(realtimeNotesActivationStateProvider).value, isTrue);
      verify(client.post(any,
              headers: anyNamed("headers"), body: anyNamed("body")))
          .called(1);
    });
  });

  group("shouldHideImages", () {
    /// Builds a container without the `shouldHideImagesProvider` override, so
    /// the real implementation runs.
    ProviderContainer createContainer({required bool signedIn}) {
      if (!signedIn) {
        storage.clear();
      }
      return createTestContainer(shouldHideImages: null);
    }

    /// As [createContainer], but waits for the cookie read so that the provider
    /// sees an `AsyncData` rather than the initial `AsyncLoading`.
    Future<ProviderContainer> createLoadedContainer({
      required bool signedIn,
    }) async {
      final container = createContainer(signedIn: signedIn);
      await container.read(hoyolabCookieRepositoryProvider.future);
      return container;
    }

    test("is false on a non-Apple platform even when signed out", () async {
      final container = await createLoadedContainer(signedIn: false);

      expect(container.read(shouldHideImagesProvider), isFalse);
    }, skip: _isApplePlatform ? "Apple platforms take the other branch" : null);

    test("hides the images on an Apple platform when signed out", () async {
      final container = await createLoadedContainer(signedIn: false);

      expect(container.read(shouldHideImagesProvider), isTrue);
    }, skip: _isApplePlatform ? null : "Apple-only branch");

    test("shows the images when signed in with HoYoLAB", () async {
      final container = await createLoadedContainer(signedIn: true);

      expect(container.read(shouldHideImagesProvider), isFalse);
    });

    // The cookie read takes several event loop turns, so the first frame has no
    // answer yet. Hiding is the safe answer until it resolves.
    test("hides the images while the cookie is still loading", () {
      expect(
        createContainer(signedIn: true).read(shouldHideImagesProvider),
        isTrue,
      );
    }, skip: _isApplePlatform ? null : "Apple-only branch");

    test("reflects the value passed to createTestContainer", () {
      expect(
        createTestContainer(shouldHideImages: true)
            .read(shouldHideImagesProvider),
        isTrue,
      );
      expect(
        createTestContainer(shouldHideImages: false)
            .read(shouldHideImagesProvider),
        isFalse,
      );
    });
  });
}
