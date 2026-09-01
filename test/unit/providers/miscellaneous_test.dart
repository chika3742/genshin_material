import "dart:convert";
import "dart:io";

import "package:drift/drift.dart" show Value;
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_account_api.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/in_game_character_state_db_extension.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/providers/hoyolab_api.dart";
import "package:genshin_material/providers/hoyolab_credential.dart";
import "package:genshin_material/providers/miscellaneous.dart";
import "package:http/http.dart" as http;
import "package:mockito/mockito.dart";

import "../../utils/db.dart";
import "../../utils/hoyolab_credential.dart";
import "../../utils/http_client.mocks.dart";
import "../../utils/provider_container.dart";

/// `shouldHideImages` only consults the sign-in state on Apple platforms; on
/// every other host it short-circuits to false.
final _isApplePlatform = Platform.isIOS || Platform.isMacOS;

void main() {
  late AppDatabase db;

  setUp(() {
    db = createTestDatabase();
  });

  tearDown(() async {
    await db.close();
  });

  Future<void> addCharacterState(String uid, CharacterId characterId) {
    return db.setCharacterState(InGameCharacterStateCompanion.insert(
      uid: uid,
      characterId: characterId,
      purposes: const {},
      equippedWeaponId: const Value.absent(),
    ));
  }

  group("ownedCharacters", () {
    ProviderContainer createContainer({String? uid}) {
      return createTestContainer(
        db: db,
        overrides: overrideHoyolabCredentialPrefs(uid: uid),
      );
    }

    test("returns null when no uid is stored", () async {
      final container = createContainer();

      expect(await container.read(ownedCharactersProvider.future), isNull);
    });

    test("returns the characters synced for the stored uid", () async {
      await addCharacterState("uid_1", "char_a");
      await addCharacterState("uid_1", "char_b");
      final container = createContainer(uid: "uid_1");

      final result = await container.read(ownedCharactersProvider.future);

      expect(result, unorderedEquals(["char_a", "char_b"]));
    });

    test("ignores the characters synced for another uid", () async {
      await addCharacterState("uid_1", "char_a");
      await addCharacterState("uid_2", "char_b");
      final container = createContainer(uid: "uid_1");

      final result = await container.read(ownedCharactersProvider.future);

      expect(result, ["char_a"]);
    });

    test("returns an empty list when nothing is synced for the uid", () async {
      await addCharacterState("uid_2", "char_b");
      final container = createContainer(uid: "uid_1");

      expect(await container.read(ownedCharactersProvider.future), isEmpty);
    });
  });

  group("RealtimeNotesActivationState", () {
    late MockClient client;

    setUp(() {
      client = MockClient();
    });

    ProviderContainer createContainer({bool signedIn = true}) {
      return createTestContainer(
        db: db,
        overrides: [
          isHoyolabSignedInInitialProvider.overrideWithValue(signedIn),
          hoyolabAccountApiProvider.overrideWith(
            (ref) async => HoyolabAccountApi(
              enabled: true,
              cookie: "ltoken_v2=token; ltuid_v2=123456;",
              client: client,
            ),
          ),
        ],
      );
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

      expect(
        await createContainer().read(realtimeNotesActivationStateProvider.future),
        isTrue,
      );
    });

    test("reports false when the switch is off", () async {
      stubGameRecordCards(isPublic: false);

      expect(
        await createContainer().read(realtimeNotesActivationStateProvider.future),
        isFalse,
      );
    });

    // Asking HoYoLAB about an account nobody signed in to is pointless, so the
    // provider answers without touching the network.
    test("reports false without calling the API when signed out", () async {
      expect(
        await createContainer(signedIn: false)
            .read(realtimeNotesActivationStateProvider.future),
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
      final container = createContainer();
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
    /// Builds a container without the `shouldHideImagesProvider` override that
    /// `createTestContainer` installs, so the real implementation runs.
    ProviderContainer createContainer({required bool signedIn}) {
      return ProviderContainer.test(overrides: [
        isHoyolabSignedInInitialProvider.overrideWithValue(signedIn),
      ]);
    }

    test("is false on a non-Apple platform even when signed out", () {
      final container = createContainer(signedIn: false);

      expect(container.read(shouldHideImagesProvider), isFalse);
    }, skip: _isApplePlatform ? "Apple platforms take the other branch" : null);

    test("hides the images on an Apple platform when signed out", () {
      final container = createContainer(signedIn: false);

      expect(container.read(shouldHideImagesProvider), isTrue);
    }, skip: _isApplePlatform ? null : "Apple-only branch");

    test("shows the images when signed in with HoYoLAB", () {
      final container = createContainer(signedIn: true);

      expect(container.read(shouldHideImagesProvider), isFalse);
    });

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
