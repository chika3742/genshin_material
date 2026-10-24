import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/asset_cache.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/data/models/bag_counts.dart";
import "package:genshin_material/data/models/hoyolab_api.dart";
import "package:genshin_material/models/character.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/ingredients.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/providers/hoyolab_api.dart";
import "package:genshin_material/providers/hoyolab_game_server.dart";
import "package:genshin_material/view_models/database/single_bag_counts.dart";

import "../../utils/asset_data.dart";
import "../../utils/fake_hoyolab_game_api.dart";
import "../../utils/hoyolab_game_server.dart";
import "../../utils/in_memory_pref.dart";
import "../../utils/provider_container.dart";
import "../../utils/test_data.dart";

const _charaVariantId = VariantId(testCharaId);
const _disabledCharaId = CharacterId("disabled_chara");
const _disabledVariantId = VariantId(_disabledCharaId);
const WeaponId _disabledWeaponId = "disabled_weapon";

const MaterialId _materialId = "material_1";
const _materialHyvId = 91001;

AssetData _buildAssetData() {
  return buildTestAssetData(
    characters: {
      // A single hyvId, so that resolving the avatar ID needs no avatar list.
      testCharaId: buildTestCharacter(id: testCharaId, hyvIds: [charaHyvId], element: testAnemo),
      _disabledCharaId: buildTestCharacter(
        id: _disabledCharaId,
        variants: [
          buildTestCharacterVariant(
            id: _disabledVariantId,
            characterId: _disabledCharaId,
            disableSync: true,
          ),
        ],
      ),
    },
    // Named, because the request carries the weapon name.
    weapons: {
      testWeaponId: buildTestWeapon(
        id: testWeaponId,
        hyvId: weaponHyvId,
        name: LocalizedText.untranslatable(text: "Weapon"),
      ),
      _disabledWeaponId: buildTestWeapon(
        id: _disabledWeaponId,
        name: LocalizedText.untranslatable(text: "Disabled weapon"),
        disableSync: true,
      ),
    },
    materials: {
      _materialId: buildTestMaterial(id: _materialId, hyvId: _materialHyvId),
    },
    elements: createTestElements(),
    // The request targets the last level of each table.
    characterIngredients: IngredientConfigurations(
      expItems: [],
      rarities: {
        5: IngredientPurposes(purposes: {
          Purpose.ascension: "ascension",
          Purpose.normalAttack: "talent",
        }),
      },
      sliders: [],
      ingredientTables: {
        "ascension": IngredientLevels(sliderTicks: [20, 90], levels: {20: [], 90: []}),
        "talent": IngredientLevels(sliderTicks: [2, 10], levels: {2: [], 10: []}),
      },
    ),
    weaponIngredients: buildIngredientConfigurations(
      rarity: 5,
      purpose: Purpose.ascension,
      levels: {20: [], 90: []},
    ),
  );
}

void main() {
  ProviderContainer createContainer(FakeHoyolabGameApi api) {
    return createTestContainer(
      assetData: _buildAssetData(),
      overrides: [
        isLinkedWithHoyolabProvider.overrideWithValue(true),
        overridePref(PrefKeys.syncBagLackNums, true),
        ...overrideHoyolabGameServerPrefs(),
        hoyolabGameApiProvider.overrideWith((ref) async => api),
      ],
    );
  }

  /// Listens to the provider first, so that it is not disposed while loading.
  Future<BagCounts?> readSingle(
    ProviderContainer container, {
    VariantId? variantId,
    WeaponId? weaponId,
  }) {
    final provider = singleBagCountsProvider(variantId: variantId, weaponId: weaponId);
    container.listen(provider, (_, _) {});
    return container.read(provider.future);
  }

  test("returns null without calling the API for a sync-disabled variant", () async {
    final api = FakeHoyolabGameApi();

    final result = await readSingle(createContainer(api), variantId: _disabledVariantId);

    expect(result, isNull);
    expect(api.batchComputeCalls, isEmpty);
  });

  test("returns null without calling the API for a sync-disabled weapon", () async {
    final api = FakeHoyolabGameApi();

    final result = await readSingle(createContainer(api), weaponId: _disabledWeaponId);

    expect(result, isNull);
    expect(api.batchComputeCalls, isEmpty);
  });

  test("fetches the variant and the weapon as one item", () async {
    final api = FakeHoyolabGameApi(
      computeResult: const CalcResult(overallConsume: [
        CalcConsumptionItem(id: _materialHyvId, num: 10, lackNum: 3),
      ]),
    );

    final result = await readSingle(
      createContainer(api),
      variantId: _charaVariantId,
      weaponId: testWeaponId,
    );

    expect(result, {_materialId: 7});
    final item = api.batchComputeCalls.single.single;
    expect(item.avatarId, charaHyvId);
    expect(item.weapon?.id, weaponHyvId);
  });

  test("fetches a weapon alone", () async {
    final api = FakeHoyolabGameApi();

    await readSingle(createContainer(api), weaponId: testWeaponId);

    final item = api.batchComputeCalls.single.single;
    expect(item.avatarId, isNull);
    expect(item.weapon?.id, weaponHyvId);
  });

  // testWidgets, so that tester.pump can run the retention timer. See the
  // retention group in bag_counts_repository_test.dart.
  testWidgets("fetches again when a listener is added after the counts expire", (tester) async {
    final api = FakeHoyolabGameApi();
    final container = createContainer(api);
    final provider = singleBagCountsProvider(weaponId: testWeaponId);

    container.listen(provider, (_, _) {});
    await container.read(provider.future);
    await tester.pump(const Duration(hours: 1));
    container.listen(provider, (_, _) {});
    await tester.pump(Duration.zero);
    await container.read(provider.future);

    expect(api.batchComputeCalls, hasLength(2));
    // testWidgets fails on a timer still pending at its end
    container.dispose();
  });
}
