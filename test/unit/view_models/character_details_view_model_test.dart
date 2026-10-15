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
import "package:genshin_material/view_models/database/character_details_view_model.dart";

import "../../utils/asset_data.dart";
import "../../utils/db.dart";
import "../../utils/in_memory_pref.dart";
import "../../utils/provider_container.dart";

const _characterId = CharacterId("char_1");
const _variantAId = VariantId("char_1_a");
const _variantBId = VariantId("char_1_b");

AssetData _buildAssetData() {
  return buildTestAssetData(
    characters: {
      _characterId: buildTestCharacter(
        id: _characterId,
        variants: [
          for (final id in [_variantAId, _variantBId])
            buildTestCharacterVariant(id: id, characterId: _characterId),
        ],
      ),
    },
    characterIngredients: buildIngredientConfigurations(
      rarity: 5,
      purpose: Purpose.normalAttack,
      levels: {for (final level in [2, 3, 4, 5]) level: const []},
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

  ProviderContainer createContainer({required Map<Purpose, int> storedLevels}) {
    return createTestContainer(
      assetData: _buildAssetData(),
      db: db,
      overrides: [
        isLinkedWithHoyolabProvider.overrideWithValue(true),
        singleCharacterStateRepositoryProvider.overrideWith2(
          (_) => _FakeCharacterStateRepository(storedLevels),
        ),
        overridePref(PrefKeys.syncCharaState, true),
        overridePref(PrefKeys.lastSelectedCharacterVariants, const <CharacterId, VariantId>{}),
        overridePref(PrefKeys.autoRemoveBookmarks, false),
      ],
    );
  }

  /// Opens the state with variant A selected and keeps it alive.
  Future<CharacterDetailsViewModelProvider> open(ProviderContainer container) async {
    // Created once and reused through the returned provider, as the page does with useMemoized.
    final key = UniqueKey();
    final provider = characterDetailsViewModelProvider(key, _variantAId);
    container.listen(provider, (_, _) {});
    await container.read(provider.future);
    return provider;
  }

  /// Bookmarks the normal attack materials of [variantId] up to level 4.
  Future<void> addNormalAttackBookmark(VariantId variantId) {
    return db.addMaterialBookmarks([
      buildMaterialBookmark(
        materialId: "mat_1",
        characterId: variantId,
        purposeType: Purpose.normalAttack,
        upperLevel: 4,
      ),
    ]);
  }

  group("synced character state", () {
    test("is the stored state of the selected variant", () async {
      final container = createContainer(storedLevels: {Purpose.normalAttack: 2});
      final provider = await open(container);

      expect(container.read(provider).value!.characterState?.levels, {Purpose.normalAttack: 2});
    });

    test("follows the stored state being updated by a sync", () async {
      final container = createContainer(storedLevels: {Purpose.normalAttack: 2});
      final provider = await open(container);

      final repository = container.read(singleCharacterStateRepositoryProvider(_variantAId).notifier);
      (repository as _FakeCharacterStateRepository).store({Purpose.normalAttack: 3});
      final state = await container.read(provider.future);

      expect(state!.characterState?.levels, {Purpose.normalAttack: 3});
    });

    test("is null once sync is turned off", () async {
      final container = createContainer(storedLevels: {Purpose.normalAttack: 2});
      final provider = await open(container);

      await container.read(prefProvider(PrefKeys.syncCharaState).notifier).set(false);
      final state = await container.read(provider.future);

      expect(state!.characterState, isNull);
    });
  });

  // Regression: a rebuild caused by a watched dependency is an AsyncLoading,
  // so `build` never kept the previous sliders and started over instead.
  group("manual slider changes", () {
    test("survive the stored state being updated by a sync", () async {
      final container = createContainer(storedLevels: {Purpose.normalAttack: 2});
      final provider = await open(container);
      container.read(provider.notifier).setRange(Purpose.normalAttack, LevelRangeValues(3, 4));

      final repository = container.read(singleCharacterStateRepositoryProvider(_variantAId).notifier);
      (repository as _FakeCharacterStateRepository).store({Purpose.normalAttack: 3});
      final state = await container.read(provider.future);

      expect(state!.sliders.ranges[Purpose.normalAttack], _range(3, 4));
    });

    test("survive sync being turned off", () async {
      final container = createContainer(storedLevels: {Purpose.normalAttack: 2});
      final provider = await open(container);
      container.read(provider.notifier).setRange(Purpose.normalAttack, LevelRangeValues(3, 4));

      await container.read(prefProvider(PrefKeys.syncCharaState).notifier).set(false);
      final state = await container.read(provider.future);

      expect(state!.sliders.ranges[Purpose.normalAttack], _range(3, 4));
    });
  });

  // Regression: a state set while `build` awaited made it an AsyncData, and
  // `build` returned it as is even though the variant had changed.
  group("switching the variant", () {
    test("starts over for the new variant even if the sliders change while it loads", () async {
      await addNormalAttackBookmark(_variantBId);
      final container = createContainer(storedLevels: {Purpose.normalAttack: 2});
      final provider = await open(container);
      final notifier = container.read(provider.notifier);

      notifier.selectVariant(_variantBId);
      // Starts the rebuild, then lands while it awaits the stored state of B.
      notifier.setRange(Purpose.normalAttack, LevelRangeValues(2, 3));
      await pumpEventQueue();

      final state = container.read(provider).value!;
      expect(state.variant.id, _variantBId);
      expect(state.sliders.ranges[Purpose.normalAttack], _range(3, 4));
    });
  });

  // Regression (#552): switching the variant applied its levels to the sliders
  // of the previous one, so the bookmarks of the new one were ignored.
  group("slider ranges after switching the variant", () {
    test("start from the bookmarks of the new variant rather than its current level", () async {
      await addNormalAttackBookmark(_variantBId);
      final container = createContainer(storedLevels: {Purpose.normalAttack: 2});
      final provider = await open(container);

      container.read(provider.notifier).selectVariant(_variantBId);
      final state = await container.read(provider.future);

      expect(state!.variant.id, _variantBId);
      expect(state.sliders.ranges[Purpose.normalAttack], _range(3, 4));
    });

    test("drop the bookmarks of the previous variant", () async {
      await addNormalAttackBookmark(_variantAId);
      final container = createContainer(storedLevels: {Purpose.normalAttack: 2});
      final provider = await open(container);

      container.read(provider.notifier).selectVariant(_variantBId);
      final state = await container.read(provider.future);

      expect(state!.variant.id, _variantBId);
      expect(state.sliders.ranges[Purpose.normalAttack], _range(2, 5));
    });
  });

  // Regression: a synced level below the bookmarked range pulled its start
  // down to the current level.
  group("applying synced levels", () {
    test("keeps the bookmarked start above the current level", () async {
      await addNormalAttackBookmark(_variantAId);
      final container = createContainer(storedLevels: {Purpose.normalAttack: 2});
      final provider = await open(container);

      await container.read(provider.notifier).applySyncedLevels({Purpose.normalAttack: 2});

      expect(container.read(provider).value!.sliders.ranges[Purpose.normalAttack], _range(3, 4));
    });

    test("raises the start to the current level", () async {
      final container = createContainer(storedLevels: {Purpose.normalAttack: 2});
      final provider = await open(container);

      await container.read(provider.notifier).applySyncedLevels({Purpose.normalAttack: 3});

      expect(container.read(provider).value!.sliders.ranges[Purpose.normalAttack], _range(3, 5));
    });
  });
}

/// Serves [levels] as the stored state of every variant, and lets a test
/// replace it as a sync storing new data does.
class _FakeCharacterStateRepository extends SingleCharacterStateRepository {
  _FakeCharacterStateRepository(this.levels);

  final Map<Purpose, int> levels;

  @override
  Future<CharacterState?> build(VariantId variantId) async => _buildState(levels);

  void store(Map<Purpose, int> levels) {
    state = AsyncData(_buildState(levels));
  }

  CharacterState _buildState(Map<Purpose, int> levels) {
    return CharacterState(
      levels: levels,
      equippedWeaponId: null,
      weaponLevels: const {},
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
