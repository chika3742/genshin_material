import "dart:io";

import "package:drift/drift.dart" show Value;
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/in_game_character_state_db_extension.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/providers/hoyolab_credential.dart";
import "package:genshin_material/providers/miscellaneous.dart";

import "../../utils/db.dart";
import "../../utils/in_memory_pref_notifier.dart";
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
        overrides: [
          overridePref(PrefKeys.hyvUid, uid),
        ],
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
