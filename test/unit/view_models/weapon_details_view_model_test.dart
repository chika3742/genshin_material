import "package:flutter/foundation.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/asset_cache.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/data/repositories/character_state_repository.dart";
import "package:genshin_material/data/repositories/single_character_state_repository.dart";
import "package:genshin_material/db/database.dart";
import "package:genshin_material/db/extensions/bookmark_db_extension.dart";
import "package:genshin_material/models/character.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/level_range_values.dart";
import "package:genshin_material/providers/hoyolab_game_server.dart";
import "package:genshin_material/providers/pref_notifier.dart";
import "package:genshin_material/view_models/database/weapon_details_view_model.dart";

import "../../utils/asset_data.dart";
import "../../utils/db.dart";
import "../../utils/in_memory_pref.dart";
import "../../utils/provider_container.dart";

const _weaponId = "weapon_1";
const _variantAId = VariantId("char_1");
const _variantBId = VariantId("char_2");
const _otherTypeVariantId = VariantId("char_3");

AssetData _buildAssetData() {
  return buildTestAssetData(
    characters: {
      for (final (id, weaponType) in [
        (_variantAId, "sword"),
        (_variantBId, "sword"),
        (_otherTypeVariantId, "claymore"),
      ])
        CharacterId(id): buildTestCharacter(id: CharacterId(id), weaponType: weaponType),
    },
    weapons: {
      _weaponId: buildTestWeapon(id: _weaponId, type: "sword"),
    },
    weaponIngredients: buildIngredientConfigurations(
      rarity: 5,
      purpose: Purpose.ascension,
      levels: {for (final level in [20, 40, 50, 60]) level: const []},
    ),
  );
}

void main() {
  late AppDatabase db;

  setUp(() {
    db = createTestDatabase();
  });

  tearDown(() async {
    await db.close();
  });

  ProviderContainer createContainer({
    Map<VariantId, int> equippedLevels = const {},
    bool autoRemoveBookmarks = false,
  }) {
    return createTestContainer(
      assetData: _buildAssetData(),
      db: db,
      overrides: [
        isLinkedWithHoyolabProvider.overrideWithValue(true),
        singleCharacterStateRepositoryProvider.overrideWith2(
          (_) => _FakeCharacterStateRepository(equippedLevels),
        ),
        overridePref(PrefKeys.syncCharaState, true),
        overridePref(PrefKeys.autoRemoveBookmarks, autoRemoveBookmarks),
      ],
    );
  }

  /// Opens the state and keeps it alive.
  Future<WeaponDetailsViewModelProvider> open(
    ProviderContainer container, {
    WeaponId weaponId = _weaponId,
    VariantId? initialCharacterId = _variantAId,
  }) async {
    // Created once and reused through the returned provider, as the page does with useMemoized.
    final key = UniqueKey();
    final provider = weaponDetailsViewModelProvider(key, weaponId, initialCharacterId);
    container.listen(provider, (_, _) {});
    await container.read(provider.future);
    return provider;
  }

  /// Bookmarks the ascension materials of the weapon equipped by [characterId]
  /// up to [upperLevel].
  Future<void> addAscensionBookmark(VariantId characterId, {required int upperLevel}) {
    return db.addMaterialBookmarks([
      buildMaterialBookmark(
        materialId: "mat_1",
        characterId: characterId,
        weaponId: _weaponId,
        purposeType: Purpose.ascension,
        upperLevel: upperLevel,
      ),
    ]);
  }

  group("character selection", () {
    test("selects the initial character among those who can equip the weapon", () async {
      final container = createContainer();
      final provider = await open(container, initialCharacterId: _variantBId);

      final state = container.read(provider).value!;
      expect(state.selectedCharacter.id, _variantBId);
      expect(state.selectableCharacters.map((e) => e.id), [_variantAId, _variantBId]);
    });

    test("falls back to the first selectable character when the initial one cannot equip the weapon", () async {
      final container = createContainer();
      final provider = await open(container, initialCharacterId: _otherTypeVariantId);

      expect(container.read(provider).value!.selectedCharacter.id, _variantAId);
    });

    test("returns null when the weapon is not found", () async {
      final container = createContainer();
      final provider = await open(container, weaponId: "weapon_unknown");

      expect(container.read(provider).value, isNull);
    });
  });

  group("initial slider ranges", () {
    test("start from the level the selected character has the weapon at", () async {
      final container = createContainer(equippedLevels: {_variantAId: 40});
      final provider = await open(container);

      expect(container.read(provider).value!.sliders.ranges[Purpose.ascension], _range(40, 60));
    });

    test("ignore the bookmarks of other characters", () async {
      await addAscensionBookmark(_variantBId, upperLevel: 50);
      final container = createContainer();
      final provider = await open(container);

      expect(container.read(provider).value!.sliders.ranges[Purpose.ascension], _range(1, 60));
    });

    test("start a range bookmarked from the first level at 1", () async {
      await addAscensionBookmark(_variantAId, upperLevel: 20);
      final container = createContainer();
      final provider = await open(container);

      expect(container.read(provider).value!.sliders.ranges[Purpose.ascension], _range(1, 20));
    });
  });

  group("switching the character", () {
    test("starts from the bookmarks of the new character", () async {
      await addAscensionBookmark(_variantBId, upperLevel: 50);
      final container = createContainer(equippedLevels: {_variantAId: 20});
      final provider = await open(container);

      container.read(provider.notifier).selectCharacter(_variantBId);
      final state = await container.read(provider.future);

      expect(state!.selectedCharacter.id, _variantBId);
      expect(state.sliders.ranges[Purpose.ascension], _range(40, 50));
    });

    test("keeps the sliders when the new character has neither levels nor bookmarks", () async {
      final container = createContainer(equippedLevels: {_variantAId: 40});
      final provider = await open(container);

      container.read(provider.notifier).selectCharacter(_variantBId);
      final state = await container.read(provider.future);

      expect(state!.selectedCharacter.id, _variantBId);
      expect(state.sliders.ranges[Purpose.ascension], _range(40, 60));
    });

    test("starts over for the new character even if the sliders change while it loads", () async {
      await addAscensionBookmark(_variantBId, upperLevel: 50);
      final container = createContainer();
      final provider = await open(container);
      final notifier = container.read(provider.notifier);

      notifier.selectCharacter(_variantBId);
      // Starts the rebuild, then lands while it awaits the stored state of B.
      notifier.setRange(Purpose.ascension, LevelRangeValues(20, 60));
      await pumpEventQueue();

      final state = container.read(provider).value!;
      expect(state.selectedCharacter.id, _variantBId);
      expect(state.sliders.ranges[Purpose.ascension], _range(40, 50));
    });
  });

  group("manual slider changes", () {
    test("survive the stored state being updated by a sync", () async {
      final container = createContainer(equippedLevels: {_variantAId: 20});
      final provider = await open(container);
      container.read(provider.notifier).setRange(Purpose.ascension, LevelRangeValues(50, 60));

      final repository = container.read(singleCharacterStateRepositoryProvider(_variantAId).notifier);
      (repository as _FakeCharacterStateRepository).store(40);
      final state = await container.read(provider.future);

      expect(state!.sliders.ranges[Purpose.ascension], _range(50, 60));
    });

    test("survive sync being turned off", () async {
      await addAscensionBookmark(_variantAId, upperLevel: 60);
      final container = createContainer();
      final provider = await open(container);
      container.read(provider.notifier).setRange(Purpose.ascension, LevelRangeValues(20, 40));

      await container.read(prefProvider(PrefKeys.syncCharaState).notifier).set(false);
      final state = await container.read(provider.future);

      expect(state!.sliders.ranges[Purpose.ascension], _range(20, 40));
    });
  });

  group("applying synced levels", () {
    test("raises the start to the current level", () async {
      final container = createContainer(equippedLevels: {_variantAId: 20});
      final provider = await open(container);

      await container.read(provider.notifier).applySyncedLevels({Purpose.ascension: 40});

      expect(container.read(provider).value!.sliders.ranges[Purpose.ascension], _range(40, 60));
    });

    test("keeps the bookmarked start above the current level", () async {
      await addAscensionBookmark(_variantAId, upperLevel: 60);
      final container = createContainer();
      final provider = await open(container);

      await container.read(provider.notifier).applySyncedLevels({Purpose.ascension: 40});

      expect(container.read(provider).value!.sliders.ranges[Purpose.ascension], _range(50, 60));
    });

    test("deletes the obsolete bookmarks of the selected character only", () async {
      await addAscensionBookmark(_variantAId, upperLevel: 40);
      await addAscensionBookmark(_variantBId, upperLevel: 40);
      final container = createContainer(autoRemoveBookmarks: true);
      final provider = await open(container);

      final removed = await container.read(provider.notifier).applySyncedLevels({Purpose.ascension: 40});

      expect(removed, isTrue);
      expect(await db.getWeaponMaterialBookmarkLevelRanges(_weaponId, _variantAId), isEmpty);
      expect(await db.getWeaponMaterialBookmarkLevelRanges(_weaponId, _variantBId), isNotEmpty);
    });

    test("keeps the bookmarks when auto removal is off", () async {
      await addAscensionBookmark(_variantAId, upperLevel: 40);
      final container = createContainer();
      final provider = await open(container);

      final removed = await container.read(provider.notifier).applySyncedLevels({Purpose.ascension: 40});

      expect(removed, isFalse);
      expect(await db.getWeaponMaterialBookmarkLevelRanges(_weaponId, _variantAId), isNotEmpty);
    });
  });
}

/// Serves each variant as having [_weaponId] at the level in [equippedLevels],
/// or no weapon if absent, and lets a test replace it as a sync storing new
/// data does.
class _FakeCharacterStateRepository extends SingleCharacterStateRepository {
  _FakeCharacterStateRepository(this.equippedLevels);

  final Map<VariantId, int> equippedLevels;

  @override
  Future<CharacterState?> build(VariantId variantId) async => _buildState(equippedLevels[variantId]);

  void store(int weaponLevel) {
    state = AsyncData(_buildState(weaponLevel));
  }

  CharacterState _buildState(int? weaponLevel) {
    return CharacterState(
      levels: const {},
      equippedWeaponId: weaponLevel != null ? _weaponId : null,
      weaponLevels: {Purpose.ascension: ?weaponLevel},
      lastUpdatedAt: DateTime(2026),
    );
  }
}

/// [LevelRangeValues] has no `==`, so ranges are compared field by field.
Matcher _range(int start, int end) {
  return isA<LevelRangeValues>()
      .having((e) => e.start, "start", start)
      .having((e) => e.end, "end", end);
}
