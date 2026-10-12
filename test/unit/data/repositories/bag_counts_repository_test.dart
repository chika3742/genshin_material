import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/asset_cache.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/data/models/bag_counts.dart";
import "package:genshin_material/data/models/hoyolab_api.dart";
import "package:genshin_material/data/repositories/bag_counts_repository.dart";
import "package:genshin_material/data/repositories/bag_counts_single_repository.dart";
import "package:genshin_material/db/database.dart";
import "package:genshin_material/db/extensions/in_game_character_state_db_extension.dart";
import "package:genshin_material/models/character.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/ingredients.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/providers/hoyolab_api.dart";
import "package:genshin_material/providers/hoyolab_game_server.dart";

import "../../../utils/asset_data.dart";
import "../../../utils/db.dart";
import "../../../utils/fake_hoyolab_game_api.dart";
import "../../../utils/hoyolab_game_server.dart";
import "../../../utils/in_memory_pref.dart";
import "../../../utils/provider_container.dart";
import "../../../utils/test_data.dart";

const _uid = "uid_1";

const _charaVariantId = VariantId("test_chara");
const _groupId = CharacterId("group_1");
const _groupVariantId = VariantId("group_1_anemo");
const _disabledCharaId = CharacterId("disabled_chara");
const _disabledVariantId = VariantId("disabled_chara");
const WeaponId _disabledWeaponId = "disabled_weapon";

const _talentHyvId = 80001;
const _groupTalentHyvId1 = 80101;
const _groupTalentHyvId2 = 80102;
const _groupSharedTalentHyvId = 80103;
const MaterialId _materialId1 = "material_1";
const MaterialId _materialId2 = "material_2";
const _materialHyvId1 = 91001;
const _materialHyvId2 = 91002;
const _unknownMaterialHyvId = 91999;

AssetData _buildAssetData() {
  return buildTestAssetData(
    characters: {
      for (final c in [
        buildTestCharacter(
          id: testCharaId,
          hyvIds: [charaHyvId],
          weaponType: testSword,
          variants: [
            buildTestCharacterVariant(
              id: _charaVariantId,
              characterId: testCharaId,
              element: testAnemo,
              weaponType: testSword,
              talents: {
                "normalAttack": CharacterTalent(
                  idList: [_talentHyvId],
                  name: LocalizedText.untranslatable(text: "Talent"),
                ),
              },
            ),
          ],
        ),
        buildTestCharacter(
          id: _groupId,
          hyvIds: [groupHyvId1, groupHyvId2],
          weaponType: testSword,
          variants: [
            buildTestCharacterVariant(
              id: _groupVariantId,
              characterId: _groupId,
              element: testAnemo,
              weaponType: testSword,
              talents: {
                "normalAttack": CharacterTalent(
                  idList: [_groupTalentHyvId1, _groupTalentHyvId2],
                  name: LocalizedText.untranslatable(text: "Talent"),
                ),
                "elementalSkill": CharacterTalent(
                  idList: [_groupSharedTalentHyvId],
                  name: LocalizedText.untranslatable(text: "Talent"),
                ),
              },
            ),
          ],
        ),
        buildTestCharacter(
          id: _disabledCharaId,
          variants: [
            buildTestCharacterVariant(
              id: _disabledVariantId,
              characterId: _disabledCharaId,
              disableSync: true,
            ),
          ],
        ),
      ]) c.id: c,
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
      for (final (id, hyvId) in [(_materialId1, _materialHyvId1), (_materialId2, _materialHyvId2)])
        id: buildTestMaterial(id: id, hyvId: hyvId),
    },
    elements: createTestElements(),
    weaponTypes: createTestWeaponTypes(),
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

BagCountRequests _request({VariantId? variantId, WeaponId? weaponId}) {
  return BagCountRequests(requests: {(variantId: variantId, weaponId: weaponId)});
}

void main() {
  late AppDatabase db;

  setUp(() {
    db = createTestDatabase();
  });

  tearDown(() async {
    await db.close();
  });

  ProviderContainer createContainer(
    FakeHoyolabGameApi api, {
    bool linked = true,
    bool syncEnabled = true,
  }) {
    return createTestContainer(
      assetData: _buildAssetData(),
      db: db,
      overrides: [
        isLinkedWithHoyolabProvider.overrideWithValue(linked),
        overridePref(PrefKeys.syncBagLackNums, syncEnabled),
        ...overrideHoyolabGameServerPrefs(uid: _uid),
        hoyolabGameApiProvider.overrideWith((ref) async => api),
      ],
    );
  }

  /// Listens to the provider first, so that it is not disposed while loading.
  Future<BagCounts?> readBagCounts(ProviderContainer container, BagCountRequests requests) {
    final provider = bagCountsProvider(requests);
    container.listen(provider, (_, _) {});
    return container.read(provider.future);
  }

  group("bagCountsProvider", () {
    group("disabled sync", () {
      test("returns null without calling the API when not linked", () async {
        final api = FakeHoyolabGameApi();

        final result = await readBagCounts(
          createContainer(api, linked: false),
          _request(variantId: _charaVariantId),
        );

        expect(result, isNull);
        expect(api.batchComputeCalls, isEmpty);
      });

      test("returns null without calling the API when the preference is off", () async {
        final api = FakeHoyolabGameApi();

        final result = await readBagCounts(
          createContainer(api, syncEnabled: false),
          _request(variantId: _charaVariantId),
        );

        expect(result, isNull);
        expect(api.batchComputeCalls, isEmpty);
      });
    });

    group("invalid requests", () {
      for (final (description, request) in [
        ("an unknown variant", _request(variantId: const VariantId("unknown"))),
        ("an unknown weapon", _request(weaponId: "unknown")),
        ("a sync-disabled variant", _request(variantId: _disabledVariantId)),
        ("a sync-disabled weapon", _request(weaponId: _disabledWeaponId)),
      ]) {
        test("throws without calling the API for $description", () async {
          final api = FakeHoyolabGameApi();

          await expectLater(
            readBagCounts(createContainer(api), request),
            throwsA(isA<ArgumentError>()),
          );
          expect(api.batchComputeCalls, isEmpty);
        });
      }
    });

    group("bag counts", () {
      test("subtracts the missing number from the needed number per material", () async {
        final api = FakeHoyolabGameApi(
          computeResult: const CalcResult(overallConsume: [
            CalcConsumptionItem(id: _materialHyvId1, num: 10, lackNum: 3),
            CalcConsumptionItem(id: _materialHyvId2, num: 5, lackNum: 0),
          ]),
        );

        final result = await readBagCounts(createContainer(api), _request(variantId: _charaVariantId));

        expect(result, {_materialId1: 7, _materialId2: 5});
      });

      test("skips materials missing from the asset data", () async {
        final api = FakeHoyolabGameApi(
          computeResult: const CalcResult(overallConsume: [
            CalcConsumptionItem(id: _materialHyvId1, num: 10, lackNum: 3),
            CalcConsumptionItem(id: _unknownMaterialHyvId, num: 1, lackNum: 1),
          ]),
        );

        final result = await readBagCounts(createContainer(api), _request(variantId: _charaVariantId));

        expect(result, {_materialId1: 7});
      });
    });

    group("compute request", () {
      test("targets the max levels of the character and the weapon", () async {
        final api = FakeHoyolabGameApi();

        await readBagCounts(
          createContainer(api),
          _request(variantId: _charaVariantId, weaponId: testWeaponId),
        );

        final item = api.batchComputeCalls.single.single;
        expect(item.avatarId, charaHyvId);
        expect(item.elementAttrId, anemoHyvId);
        expect(item.currentAvatarLevel, 1);
        expect(item.targetAvatarLevel, 90);
        expect(item.skills, [
          const CalcComputeSkill(id: _talentHyvId, currentLevel: 1, targetLevel: 10),
        ]);
        expect(item.weapon?.id, weaponHyvId);
        expect(item.weapon?.currentLevel, 1);
        expect(item.weapon?.targetLevel, 90);
      });

      test("sends a weapon without a character", () async {
        final api = FakeHoyolabGameApi();

        await readBagCounts(createContainer(api), _request(weaponId: testWeaponId));

        final item = api.batchComputeCalls.single.single;
        expect(item.avatarId, isNull);
        expect(item.weapon?.id, weaponHyvId);
      });

      test("sends one item per request in a single call", () async {
        final api = FakeHoyolabGameApi();

        await readBagCounts(
          createContainer(api),
          BagCountRequests(requests: {
            (variantId: _charaVariantId, weaponId: null),
            (variantId: null, weaponId: testWeaponId),
          }),
        );

        expect(api.batchComputeCalls.single, hasLength(2));
      });
    });

    group("avatar id of a character with several ids", () {
      test("uses the id saved for the uid without looking it up", () async {
        await db.setCharacterState(InGameCharacterStateCompanion.insert(
          uid: _uid,
          characterId: groupHyvId2,
          elementId: anemoHyvId,
          purposes: const {Purpose.ascension: 40},
          equippedWeaponId: weaponHyvId,
          weaponPurposes: const {Purpose.ascension: 50},
        ));
        final api = FakeHoyolabGameApi();

        await readBagCounts(createContainer(api), _request(variantId: _groupVariantId));

        expect(api.batchComputeCalls.single.single.avatarId, groupHyvId2);
        expect(api.avatarListCalls, isEmpty);
      });

      test("sends the talent ids of the resolved id", () async {
        await db.setCharacterState(InGameCharacterStateCompanion.insert(
          uid: _uid,
          characterId: groupHyvId2,
          elementId: anemoHyvId,
          purposes: const {Purpose.ascension: 40},
          equippedWeaponId: weaponHyvId,
          weaponPurposes: const {Purpose.ascension: 50},
        ));
        final api = FakeHoyolabGameApi();

        await readBagCounts(createContainer(api), _request(variantId: _groupVariantId));

        expect(
          api.batchComputeCalls.single.single.skills!.map((e) => e.id),
          [_groupTalentHyvId2, _groupSharedTalentHyvId],
        );
      });

      test("looks the id up by the weapon type and saves it", () async {
        final api = FakeHoyolabGameApi(pages: {
          1: [buildTestAvatar(id: groupHyvId2, elementAttrId: anemoHyvId)],
        });

        await readBagCounts(createContainer(api), _request(variantId: _groupVariantId));

        expect(api.batchComputeCalls.single.single.avatarId, groupHyvId2);
        expect(api.avatarListCalls.first.weaponCatIds, [swordHyvId]);
        expect(await db.getSavedHyvId(_uid, [groupHyvId1, groupHyvId2]), groupHyvId2);
      });

      test("falls back to the first id when the character is not found", () async {
        final api = FakeHoyolabGameApi();

        await readBagCounts(createContainer(api), _request(variantId: _groupVariantId));

        expect(api.batchComputeCalls.single.single.avatarId, groupHyvId1);
      });
    });

    group("retention", () {
      // testWidgets, so that tester.pump can run the retention timer.

      testWidgets("keeps the counts for a while after the last listener leaves", (tester) async {
        final api = FakeHoyolabGameApi();
        final container = createContainer(api);
        final provider = bagCountsProvider(_request(weaponId: testWeaponId));

        final subscription = container.listen(provider, (_, _) {});
        await container.read(provider.future);
        subscription.close();
        await tester.pump(const Duration(minutes: 1));

        container.listen(provider, (_, _) {});
        await container.read(provider.future);

        expect(api.batchComputeCalls, hasLength(1));
      });

      testWidgets("fetches again once the counts are dropped", (tester) async {
        final api = FakeHoyolabGameApi();
        final container = createContainer(api);
        final provider = bagCountsProvider(_request(weaponId: testWeaponId));

        final subscription = container.listen(provider, (_, _) {});
        await container.read(provider.future);
        subscription.close();
        await tester.pump(const Duration(hours: 1));

        container.listen(provider, (_, _) {});
        await container.read(provider.future);

        expect(api.batchComputeCalls, hasLength(2));
      });
    });
  });

  group("bagCountsSingleProvider", () {
    Future<BagCounts?> readSingle(
      ProviderContainer container, {
      VariantId? variantId,
      WeaponId? weaponId,
    }) {
      final provider = bagCountsSingleProvider(variantId: variantId, weaponId: weaponId);
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
          CalcConsumptionItem(id: _materialHyvId1, num: 10, lackNum: 3),
        ]),
      );

      final result = await readSingle(
        createContainer(api),
        variantId: _charaVariantId,
        weaponId: testWeaponId,
      );

      expect(result, {_materialId1: 7});
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
  });
}
