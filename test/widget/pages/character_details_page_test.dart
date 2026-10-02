import "dart:convert";
import "dart:io";

import "package:clock/clock.dart";
import "package:collection/collection.dart";
import "package:flutter/material.dart" hide Material;
import "package:flutter_riverpod/misc.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/level_slider.dart";
import "package:genshin_material/components/material_item.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/core/theme.dart";
import "package:genshin_material/data/repositories/character_state_repository.dart";
import "package:genshin_material/data/repositories/single_character_state_repository.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/bookmark_db_extension.dart";
import "package:genshin_material/models/character.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/element.dart" as model;
import "package:genshin_material/models/ingredients.dart";
import "package:genshin_material/models/level_range_values.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/models/weapon.dart";
import "package:genshin_material/pages/database/characters/character_details.dart";
import "package:genshin_material/providers/database_provider.dart";
import "package:genshin_material/providers/hoyolab_game_server.dart";
import "package:genshin_material/providers/miscellaneous.dart";
import "package:genshin_material/providers/versions.dart";

import "../../utils/asset_data.dart";
import "../../utils/crashlytics.dart";
import "../../utils/crashlytics.mocks.dart";
import "../../utils/db.dart";
import "../../utils/in_memory_pref.dart";
import "../utils.dart";

void main() {
  // Every image on the page resolves to this one file (images are hidden and
  // the element icons point at it), so it has to exist and to decode.
  final onePixelPng = base64Decode(
    "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
  );

  // RarityStars and MaterialCard read their colors off this extension without
  // a fallback.
  final componentTheme = ThemeData(
    extensions: [
      ComponentThemeExtension(
        starColor: Colors.orange,
        rarity1Color: Colors.grey,
        rarity2Color: Colors.green,
        rarity3Color: Colors.blue,
        rarity4Color: Colors.purple,
        rarity5Color: Colors.orange,
      ),
    ],
  );

  // The group alone defines the ascension materials, while each variant
  // overrides `secondary` for its talents.
  const groupId = "group_1";
  const variantAId = "variant_a";
  const variantBId = "variant_b";
  const elementA = "element_a";
  const elementB = "element_b";

  const primaryId = "primary_mat";
  const groupSecondaryId = "group_secondary_mat";
  const localId = "local_mat";
  const variantASecondaryId = "variant_a_secondary_mat";
  const variantBSecondaryId = "variant_b_secondary_mat";
  const variantABossId = "variant_a_boss_mat";
  const variantBBossId = "variant_b_boss_mat";

  const talentPurposes = [Purpose.normalAttack, Purpose.elementalSkill, Purpose.elementalBurst];

  final materials = [
    buildTestMaterial(id: primaryId, groupId: "primary_group", craftLevel: 1),
    buildTestMaterial(id: groupSecondaryId, groupId: "group_secondary_group", craftLevel: 1),
    buildTestMaterial(id: localId),
    buildTestMaterial(id: variantASecondaryId, groupId: "variant_a_secondary_group", craftLevel: 1),
    buildTestMaterial(id: variantBSecondaryId, groupId: "variant_b_secondary_group", craftLevel: 1),
    buildTestMaterial(id: variantABossId),
    buildTestMaterial(id: variantBBossId),
  ];

  final talents = {
    for (final purpose in talentPurposes)
      purpose.name: CharacterTalent(
        idList: const [],
        name: LocalizedText.untranslatable(text: purpose.name),
      ),
  };

  final characters = [
    buildTestCharacterGroup(
      id: groupId,
      name: LocalizedText.untranslatable(text: "Group"),
      variantIds: [variantAId, variantBId],
      materials: const {
        "primary": "group:primary_group",
        "local": "id:$localId",
        "secondary": "group:group_secondary_group",
      },
    ),
    buildTestCharacterVariant(
      id: variantAId,
      parentId: groupId,
      element: elementA,
      name: LocalizedText.untranslatable(text: "Variant A"),
      talents: talents,
      materials: const {
        "secondary": "group:variant_a_secondary_group",
        "talentBoss": "id:$variantABossId",
      },
    ),
    buildTestCharacterVariant(
      id: variantBId,
      parentId: groupId,
      element: elementB,
      name: LocalizedText.untranslatable(text: "Variant B"),
      talents: talents,
      materials: const {
        "secondary": "group:variant_b_secondary_group",
        "talentBoss": "id:$variantBBossId",
      },
    ),
  ];

  // Mirrors the slider configuration of character-ingredients.yaml, with every
  // level costing the same ingredients so that the ranges stay easy to follow.
  final ingredients = IngredientConfigurations(
    expItems: const [],
    rarities: {
      5: IngredientPurposes(purposes: {
        Purpose.ascension: "ascension",
        for (final purpose in talentPurposes) purpose: "talent",
      }),
    },
    sliders: [
      SliderEntry(
        title: LocalizedText.untranslatable(text: "Ascension"),
        purposes: const [Purpose.ascension],
        preferredTargetType: PreferredTargetType.group,
      ),
      SliderEntry(
        title: LocalizedText.untranslatable(text: "Talents"),
        purposes: talentPurposes,
        preferredTargetType: PreferredTargetType.variant,
      ),
    ],
    ingredientTables: {
      "ascension": const IngredientLevels(
        sliderTicks: [1, 2, 3, 4, 5],
        levels: {
          2: _ascensionIngredients,
          3: _ascensionIngredients,
          4: _ascensionIngredients,
          5: _ascensionIngredients,
        },
      ),
      "talent": const IngredientLevels(
        sliderTicks: [1, 2, 3, 4, 5],
        levels: {
          2: _talentIngredients,
          3: _talentIngredients,
          4: _talentIngredients,
          5: _talentIngredients,
        },
      ),
    },
  );

  late AppDatabase db;
  late Directory assetDir;

  setUp(() {
    db = createTestDatabase();
    assetDir = Directory.systemTemp.createTempSync("character_details_page_test");
    final blankImage = File(getBlankImagePath(assetDir.path));
    blankImage.parent.createSync(recursive: true);
    blankImage.writeAsBytesSync(onePixelPng);
  });

  tearDown(() async {
    await db.close();
    assetDir.deleteSync(recursive: true);
  });

  /// Pass [syncedLevels] to link with HoYoLAB and have the sync on opening the
  /// page report them.
  Future<void> pumpPage(
    WidgetTester tester, {
    CharacterId id = groupId,
    CharacterId? lastSelectedVariant,
    Map<Purpose, int>? syncedLevels,
  }) async {
    final assetData = buildTestAssetData(
      assetDir: assetDir.path,
      characters: {for (final c in characters) c.id: c},
      materials: {for (final m in materials) m.id: m},
      characterIngredients: ingredients,
      elements: {
        for (final element in [elementA, elementB])
          element: model.Element(
            hyvId: 0,
            imageUrl: "img/blank.png",
            text: LocalizedText.untranslatable(text: element),
          ),
      },
      weaponTypes: {
        "": WeaponTypeInfo(hyvId: 0, name: LocalizedText.untranslatable(text: "Weapon type")),
      },
    );

    await tester.pumpWidget(
      createProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(db),
          shouldHideImagesProvider.overrideWithValue(true),
          // Returned synchronously: the page and the cards call `requireValue` on it.
          assetDataProvider.overrideWith((ref) => assetData),
          isLinkedWithHoyolabProvider.overrideWithValue(syncedLevels != null),
          if (syncedLevels != null) ...[
            singleCharacterStateRepositoryProvider.overrideWith2(
              (_) => _FreshCharacterStateRepository(syncedLevels),
            ),
            overrideCrashlyticsService(MockCrashlyticsService()),
          ],
          ..._prefOverrides(
            lastSelectedVariants: {groupId: ?lastSelectedVariant},
          ),
        ],
        child: createScreenWithApp(
          theme: componentTheme,
          child: CharacterDetailsPage(assetData: assetData, id: id),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }


  /// The material cards listed under the slider section of [purposes].
  Iterable<MaterialItem> materialItemsOf(WidgetTester tester, List<Purpose> purposes) {
    return tester
        .widgetList<MaterialItem>(find.byType(MaterialItem, skipOffstage: false))
        .where((e) => const DeepCollectionEquality().equals(e.possiblePurposeTypes, purposes));
  }

  /// The sliders in page order: ascension first, then the talents in [talentPurposes] order.
  Map<Purpose, LevelSlider> slidersOf(WidgetTester tester) {
    final sliders = tester.widgetList<LevelSlider>(find.byType(LevelSlider, skipOffstage: false)).toList();
    return Map.fromIterables([Purpose.ascension, ...talentPurposes], sliders);
  }

  Future<void> addBookmark({
    required CharacterId characterId,
    required MaterialId materialId,
    required Purpose purpose,
    required int upperLevel,
  }) {
    return db.addMaterialBookmarks([
      buildMaterialBookmark(
        materialId: materialId,
        characterId: characterId,
        purposeType: purpose,
        upperLevel: upperLevel,
      ),
    ]);
  }

  // Regression: since #375 the ascension materials have been resolved against
  // the variant, which lacks `primary` and `local` and overrides `secondary`.
  group("ascension materials of a character group", () {
    for (final variantId in [variantAId, variantBId]) {
      testWidgets("come from the group while $variantId is selected", (tester) async {
        await pumpPage(tester, lastSelectedVariant: variantId);

        expect(
          materialItemsOf(tester, const [Purpose.ascension]).map((e) => e.item.id),
          unorderedEquals([primaryId, groupSecondaryId, localId]),
        );
      });
    }

    testWidgets("are bookmarked under the group ID", (tester) async {
      await pumpPage(tester);

      expect(
        materialItemsOf(tester, const [Purpose.ascension]).map((e) => e.usage!.characterId),
        allOf(isNotEmpty, everyElement(groupId)),
      );
    });
  });

  group("talent materials of a character group", () {
    testWidgets("come from the selected variant", (tester) async {
      await pumpPage(tester, lastSelectedVariant: variantBId);

      expect(
        materialItemsOf(tester, talentPurposes).map((e) => e.item.id),
        unorderedEquals([variantBSecondaryId, variantBBossId]),
      );
    });

    testWidgets("are bookmarked under the variant ID", (tester) async {
      await pumpPage(tester, lastSelectedVariant: variantBId);

      expect(
        materialItemsOf(tester, talentPurposes).map((e) => e.usage!.characterId),
        allOf(isNotEmpty, everyElement(variantBId)),
      );
    });
  });

  // Regression: the initial ranges were looked up by the group ID alone, so
  // talent bookmarks (saved under the variant ID) never matched.
  group("initial slider ranges of a character group", () {
    testWidgets("start from the ascension bookmarks saved under the group ID", (tester) async {
      await addBookmark(characterId: groupId, materialId: primaryId, purpose: Purpose.ascension, upperLevel: 3);
      await addBookmark(characterId: groupId, materialId: primaryId, purpose: Purpose.ascension, upperLevel: 4);

      await pumpPage(tester);

      expect(slidersOf(tester)[Purpose.ascension]!.values, _range(2, 4));
    });

    testWidgets("start from the talent bookmarks saved under the variant ID", (tester) async {
      await addBookmark(characterId: variantAId, materialId: variantASecondaryId, purpose: Purpose.normalAttack, upperLevel: 4);

      await pumpPage(tester, lastSelectedVariant: variantAId);

      final sliders = slidersOf(tester);
      expect(sliders[Purpose.normalAttack]!.values, _range(3, 4));
      expect(sliders[Purpose.normalAttack]!.active, isTrue);
      // Talents without bookmarks start closed once any talent is bookmarked.
      expect(sliders[Purpose.elementalSkill]!.active, isFalse);
      expect(sliders[Purpose.elementalBurst]!.active, isFalse);
    });

    testWidgets("ignore the talent bookmarks of another variant", (tester) async {
      await addBookmark(characterId: variantBId, materialId: variantBSecondaryId, purpose: Purpose.normalAttack, upperLevel: 4);

      await pumpPage(tester, lastSelectedVariant: variantAId);

      final sliders = slidersOf(tester);
      expect(sliders[Purpose.normalAttack]!.values, _range(1, 5));
      expect(sliders[Purpose.normalAttack]!.active, isTrue);
    });
  });

  // Regression: the removal after a sync only looked at the variant ID, so the
  // bookmarks of group-targeted purposes (saved under the group ID) survived it.
  group("obsolete bookmarks of a character group after a sync", () {
    const syncedLevels = {
      Purpose.ascension: 4,
      Purpose.normalAttack: 4,
      Purpose.elementalSkill: 1,
      Purpose.elementalBurst: 1,
    };

    Future<List<MaterialId?>> remainingMaterialIds() async {
      final items = await db.select(db.bookmarkMaterialItemTable).get();
      return items.map((e) => e.materialId).toList();
    }

    testWidgets("are removed for ascension saved under the group ID", (tester) async {
      await addBookmark(characterId: groupId, materialId: primaryId, purpose: Purpose.ascension, upperLevel: 4);
      await addBookmark(characterId: groupId, materialId: localId, purpose: Purpose.ascension, upperLevel: 5);

      await pumpPage(tester, lastSelectedVariant: variantAId, syncedLevels: syncedLevels);

      expect(await remainingMaterialIds(), [localId]);
    });

    testWidgets("are removed for ascension saved under the variant ID before the fix", (tester) async {
      await addBookmark(characterId: variantAId, materialId: primaryId, purpose: Purpose.ascension, upperLevel: 4);

      await pumpPage(tester, lastSelectedVariant: variantAId, syncedLevels: syncedLevels);

      expect(await remainingMaterialIds(), isEmpty);
    });

    testWidgets("are removed for talents saved under the selected variant ID", (tester) async {
      await addBookmark(characterId: variantAId, materialId: variantASecondaryId, purpose: Purpose.normalAttack, upperLevel: 4);

      await pumpPage(tester, lastSelectedVariant: variantAId, syncedLevels: syncedLevels);

      expect(await remainingMaterialIds(), isEmpty);
    });

    testWidgets("are kept for talents of another variant", (tester) async {
      await addBookmark(characterId: variantBId, materialId: variantBSecondaryId, purpose: Purpose.normalAttack, upperLevel: 4);

      await pumpPage(tester, lastSelectedVariant: variantAId, syncedLevels: syncedLevels);

      expect(await remainingMaterialIds(), [variantBSecondaryId]);
    });
  });
}

/// Serves a character state fresh enough for the sync on opening the page to
/// reuse it instead of calling HoYoLAB.
class _FreshCharacterStateRepository extends SingleCharacterStateRepository {
  _FreshCharacterStateRepository(this.levels);

  final Map<Purpose, int> levels;

  @override
  Future<CharacterState?> build(String variantId) async {
    return CharacterState(
      levels: levels,
      equippedWeaponId: null,
      weaponLevels: const {},
      lastUpdatedAt: clock.now(),
    );
  }
}

const _ascensionIngredients = [
  Ingredient.byType(type: "primary", craftLevel: 1, quantity: 1),
  Ingredient.byType(type: "secondary", craftLevel: 1, quantity: 1),
  Ingredient.byType(type: "local", quantity: 1),
];

const _talentIngredients = [
  Ingredient.byType(type: "secondary", craftLevel: 1, quantity: 1),
  Ingredient.byType(type: "talentBoss", quantity: 1),
];

List<Override> _prefOverrides({required Map<String, String> lastSelectedVariants}) {
  return [
    overridePref(PrefKeys.lastSelectedCharacterVariants, lastSelectedVariants),
    overridePref(PrefKeys.autoRemoveBookmarks, true),
    overridePref(PrefKeys.syncCharaState, true),
    overridePref(PrefKeys.syncBagLackNums, false),
    overridePref(PrefKeys.showFarmCount, false),
    overridePref(PrefKeys.showItemNameOnCard, false),
    overridePref(PrefKeys.adventureRank, 60),
    overridePref(PrefKeys.condensedMultiplier, 2.0),
    overridePref(PrefKeys.dailyResetServer, GameServer.asia),
  ];
}

/// [LevelRangeValues] has no `==`, so ranges are compared field by field.
Matcher _range(int start, int end) {
  return isA<LevelRangeValues>()
      .having((e) => e.start, "start", start)
      .having((e) => e.end, "end", end);
}
