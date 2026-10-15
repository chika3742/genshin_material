import "package:collection/collection.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:fractional_indexing/fractional_indexing.dart";
import "package:genshin_material/core/asset_cache.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_game_api.dart";
import "package:genshin_material/db/database.dart";
import "package:genshin_material/db/extensions/bookmark_db_extension.dart";
import "package:genshin_material/models/character.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/ingredients.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/providers/database_provider.dart";
import "package:genshin_material/providers/hoyolab_api.dart";
import "package:genshin_material/providers/hoyolab_game_server.dart";
import "package:genshin_material/view_models/bookmarks/bookmark_bag_counts.dart";

import "../../utils/asset_data.dart";
import "../../utils/db.dart";
import "../../utils/fake_hoyolab_game_api.dart";
import "../../utils/hoyolab_game_server.dart";
import "../../utils/in_memory_pref.dart";
import "../../utils/provider_container.dart";
import "../../utils/test_data.dart";

/// One more than a batch holds, so that the last one is left out.
const _overflowCount = maxBatchComputeItems + 1;

/// `char_1` to `char_9`, each with a single variant of the same ID.
final _characterIds = [for (var i = 1; i <= _overflowCount; i++) CharacterId("char_$i")];
final _weaponIds = <WeaponId>[for (var i = 1; i <= _overflowCount; i++) "weapon_$i"];
const _disabledCharaId = CharacterId("char_disabled");
const WeaponId _disabledWeaponId = "weapon_disabled";

/// A character with two variants, told apart in a request by their element.
const _groupId = CharacterId("group_1");
const _groupVariantId1 = VariantId("group_1_anemo");
const _groupVariantId2 = VariantId("group_1_geo");
final _variant1Talents = {
  "normal": CharacterTalent(idList: [100], name: LocalizedText.untranslatable(text: "")),
};
final _variant2Talents = {
  "normal": CharacterTalent(idList: [101], name: LocalizedText.untranslatable(text: "")),
};

const MaterialId _materialId = "mat_1";
const _materialHyvId = 4001;

// character hyvIds: char_n -> 1000 + n (1001, 1002, ..., 1009)
// weapon hyvIds: weapon_n -> 3000 + n
AssetData _buildAssetData() {
  return buildTestAssetData(
    characters: {
      for (final (i, id) in _characterIds.indexed)
        id: buildTestCharacter(id: id, hyvIds: [1001 + i], element: testAnemo),
      _disabledCharaId: buildTestCharacter(
        id: _disabledCharaId,
        variants: [
          buildTestCharacterVariant(
            id: VariantId(_disabledCharaId),
            characterId: _disabledCharaId,
            disableSync: true,
          ),
        ],
      ),
      // A single hyvId, so that resolving the avatar ID needs no avatar list.
      _groupId: buildTestCharacter(
        id: _groupId,
        hyvIds: [2001],
        variants: [
          buildTestCharacterVariant(id: _groupVariantId1, characterId: _groupId, element: testAnemo, talents: _variant1Talents),
          buildTestCharacterVariant(id: _groupVariantId2, characterId: _groupId, element: testGeo, talents: _variant2Talents),
        ],
      ),
    },
    // Named, because the request carries the weapon name.
    weapons: {
      for (final (i, id) in _weaponIds.indexed)
        id: buildTestWeapon(id: id, hyvId: 3001 + i, name: LocalizedText.untranslatable(text: id)),
      _disabledWeaponId: buildTestWeapon(
        id: _disabledWeaponId,
        name: LocalizedText.untranslatable(text: _disabledWeaponId),
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

void _expectRequested(FakeHoyolabGameApi api, {List<int> avatarIds = const [], List<int> weaponIds = const [], List<int>? talentIds}) {
  final items = api.batchComputeCalls.single;
  expect(items, hasLength(lessThanOrEqualTo(maxBatchComputeItems)));
  expect(items.map((e) => e.avatarId).nonNulls.toList()..sort(), avatarIds, reason: "avatar IDs");
  expect(items.map((e) => e.weapon?.id).nonNulls.toList()..sort(), weaponIds, reason: "weapon IDs");
  if (talentIds != null) {
    expect(items.map((e) => e.skills?.firstOrNull?.id).nonNulls.toList()..sort(), talentIds, reason: "talent IDs");
  }
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
        ...overrideHoyolabGameServerPrefs(),
        hoyolabGameApiProvider.overrideWith((ref) async => api),
      ],
    );
  }

  /// Waits for the bookmark stream first, because the provider reads
  /// `bookmarksProvider().value` and would otherwise return null. Both stay
  /// listened to so that neither is disposed while loading.
  Future<BookmarkBagCountsResult?> readResult(ProviderContainer container) async {
    container.listen(bookmarksProvider(), (_, _) {});
    await container.read(bookmarksProvider().future);
    container.listen(bookmarkBagCountsProvider, (_, _) {});
    return container.read(bookmarkBagCountsProvider.future);
  }

  /// Adds one ascension bookmark per character, in order, so that their groups
  /// come after every existing group in that order. Returns the group hashes.
  Future<List<String>> addCharacterGroups(List<CharacterOrVariantId> characterIds, {Purpose purposeType = .ascension}) async {
    final bookmarks = [
      for (final id in characterIds) buildMaterialBookmark(characterId: id, materialId: _materialId, purposeType: purposeType),
    ];
    await db.addMaterialBookmarks(bookmarks);
    return bookmarks.map((e) => e.groupHash).toList();
  }

  /// Same as [addCharacterGroups] for weapons, all wielded by [wielder].
  Future<List<String>> addWeaponGroups(
    List<WeaponId> weaponIds, {
    CharacterOrVariantId wielder = const CharacterOrVariantId("char_1"),
  }) async {
    final bookmarks = [
      for (final id in weaponIds)
        buildMaterialBookmark(characterId: wielder, weaponId: id, materialId: _materialId),
    ];
    await db.addMaterialBookmarks(bookmarks);
    return bookmarks.map((e) => e.groupHash).toList();
  }

  /// Gives the group an order index past every other group, so that the order
  /// index order stops matching the insertion order.
  Future<void> moveGroupToEnd(String groupHash) async {
    final rows = await db.select(db.bookmarkMaterialGroupTable).get();
    final last = rows.map((e) => e.orderIndex).reduce((a, b) => a.compareTo(b) >= 0 ? a : b);
    await db.updateMaterialGroupOrderIndex(groupHash, FractionalIndexer.generateKeyBetween(last, null)!);
  }

  group("compute request", () {
    test("single character is sent when only one character is bookmarked", () async {
      final api = FakeHoyolabGameApi();
      final container = createContainer(api);

      await addCharacterGroups([_characterIds.first]);

      await readResult(container);
      _expectRequested(api, avatarIds: [1001]);
    });

    test("single weapon is sent when only one weapon is bookmarked", () async {
      final api = FakeHoyolabGameApi();
      final container = createContainer(api);

      await addWeaponGroups([_weaponIds.first]);

      await readResult(container);
      _expectRequested(api, weaponIds: [3001]);
    });

    test("2 chara and weapon pairs and 1 chara is sent when 3 charas and 2 weapons are bookmarked", () async {
      final api = FakeHoyolabGameApi();
      final container = createContainer(api);

      await addCharacterGroups(_characterIds.take(3).toList());
      await addWeaponGroups(_weaponIds.take(2).toList());

      await readResult(container);
      _expectRequested(api, avatarIds: [1001, 1002, 1003], weaponIds: [3001, 3002]);
    });

    test("sends only the first max characters and weapons and leaves the rest out of the targets", () async {
      final api = FakeHoyolabGameApi();
      final container = createContainer(api);

      final characterGroupHashes = await addCharacterGroups(_characterIds);
      final weaponGroupHashes = await addWeaponGroups(_weaponIds);

      final result = await readResult(container);
      _expectRequested(
        api,
        avatarIds: [for (int n = 0; n < maxBatchComputeItems; n++) 1001 + n],
        weaponIds: [for (int n = 0; n < maxBatchComputeItems; n++) 3001 + n],
      );
      expect(result?.targetGroupHashes, {
        ...characterGroupHashes.take(maxBatchComputeItems),
        ...weaponGroupHashes.take(maxBatchComputeItems),
      });
      expect(result?.countMismatch, isTrue);
    });

    test("picks the targets by order index rather than by insertion order", () async {
      final api = FakeHoyolabGameApi();
      final container = createContainer(api);

      final characterGroupHashes = await addCharacterGroups(_characterIds);
      final weaponGroupHashes = await addWeaponGroups(_weaponIds);

      await moveGroupToEnd(characterGroupHashes[2]);
      await moveGroupToEnd(weaponGroupHashes[3]);

      final result = await readResult(container);
      _expectRequested(
        api,
        avatarIds: [1001, 1002, 1004, 1005, 1006, 1007, 1008, 1009],
        weaponIds: [3001, 3002, 3003, 3005, 3006, 3007, 3008, 3009],
      );
      expect(result?.targetGroupHashes, {
        ...characterGroupHashes.where((h) => h != characterGroupHashes[2]),
        ...weaponGroupHashes.where((h) => h != weaponGroupHashes[3]),
      });
      expect(result?.countMismatch, isTrue);
    });

    test("sends a character or a weapon in several groups only once", () async {
      final api = FakeHoyolabGameApi();
      final container = createContainer(api);

      await addCharacterGroups([_characterIds.first], purposeType: .ascension);
      await addCharacterGroups([_characterIds.first], purposeType: .elementalSkill);
      await addWeaponGroups([_weaponIds.first], wielder: _characterIds[1]);
      await addWeaponGroups([_weaponIds.first], wielder: _characterIds[2]);

      await readResult(container);
      _expectRequested(
        api,
        avatarIds: [1001],
        weaponIds: [3001],
      );
    });

    // Characters need no counterpart: the dedup of the resolved variants is
    // covered in the variant resolution group.
    test("counts a weapon in several groups only once toward the request limit", () async {
      final api = FakeHoyolabGameApi();
      final container = createContainer(api);

      await addWeaponGroups([_weaponIds.first], wielder: _characterIds[1]);
      await addWeaponGroups(_weaponIds.take(maxBatchComputeItems).toList(), wielder: _characterIds[2]);

      final result = await readResult(container);
      _expectRequested(
        api,
        weaponIds: [for (var n = 0; n < maxBatchComputeItems; n++) 3001 + n],
      );
      expect(result!.countMismatch, isFalse);
    });

    test("does not send the wielder of a weapon group as a character", () async {
      final api = FakeHoyolabGameApi();
      final container = createContainer(api);

      await addWeaponGroups([_weaponIds.first], wielder: _characterIds[1]);
      await addWeaponGroups([_weaponIds.first], wielder: _characterIds[2]);

      await readResult(container);
      _expectRequested(
        api,
        weaponIds: [3001],
      );
    });
  });

  group("sync-disabled targets", () {
    test("does not send sync-disabled targets and does not consume slots", () async {
      final api = FakeHoyolabGameApi();
      final container = createContainer(api);

      await addCharacterGroups([_disabledCharaId, ..._characterIds]);
      await addWeaponGroups([_disabledWeaponId, ..._weaponIds]);

      final result = await readResult(container);
      _expectRequested(
        api,
        avatarIds: [1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008],
        weaponIds: [3001, 3002, 3003, 3004, 3005, 3006, 3007, 3008],
      );
      expect(result?.countMismatch, isTrue);
    });

    test("sends weapon even if the wielder is sync-disabled", () async {
      final api = FakeHoyolabGameApi();
      final container = createContainer(api);

      final groupHashes = await addWeaponGroups([_weaponIds.first], wielder: _disabledCharaId);

      final result = await readResult(container);
      _expectRequested(
        api,
        weaponIds: [3001],
      );
      expect(result!.targetGroupHashes, groupHashes.toSet());
    });
  });

  group("variant resolution", () {
    test("counts a bookmark under the group ID toward the request limit", () async {
      final api = FakeHoyolabGameApi();
      final container = createContainer(api);

      final groupHashes = await addCharacterGroups([_groupId, ..._characterIds]);

      final result = await readResult(container);
      _expectRequested(
        api,
        avatarIds: [1001, 1002, 1003, 1004, 1005, 1006, 1007, 2001],
      );
      expect(result!.targetGroupHashes, groupHashes.take(maxBatchComputeItems).toSet());
      expect(result.countMismatch, isTrue);
    });

    test("does not count a bookmark under the group ID toward the request limit when it merges into a variant, but still targets it", () async {
      final api = FakeHoyolabGameApi();
      final container = createContainer(api);

      final groupHashes = await addCharacterGroups([
        _groupId,
        _groupVariantId1,
        ..._characterIds.take(maxBatchComputeItems - 1),
      ]);

      final result = await readResult(container);
      _expectRequested(
        api,
        avatarIds: [1001, 1002, 1003, 1004, 1005, 1006, 1007, 2001],
      );
      expect(result!.targetGroupHashes, groupHashes.toSet());
      expect(result.countMismatch, isFalse);
    });
    
    test("sends the first variant when only the group ID is bookmarked", () async {
      final api = FakeHoyolabGameApi();
      final container = createContainer(api);

      await addCharacterGroups([_groupId]);

      await readResult(container);
      _expectRequested(
        api,
        avatarIds: [2001],
        talentIds: [100],
      );
    });
    
    test("merges a bookmark under the group ID into a bookmarked variant even if it is not the first one", () async {
      final api = FakeHoyolabGameApi();
      final container = createContainer(api);

      await addCharacterGroups([_groupId, _groupVariantId2]);

      await readResult(container);
      _expectRequested(
        api,
        avatarIds: [2001],
        talentIds: [101],
      );
    });
  });

  group("result", () {
    test("does not call API when no bookmarks", () async {
      final api = FakeHoyolabGameApi();
      final container = createContainer(api);

      final result = await readResult(container);
      expect(api.batchComputeCalls, isEmpty);
      expect(result!.countMismatch, isFalse);
      expect(result.targetGroupHashes, isEmpty);
    });

    test("does not call API when all bookmarks are sync-disabled", () async {
      final api = FakeHoyolabGameApi();
      final container = createContainer(api);

      await addCharacterGroups([_disabledCharaId]);
      await addWeaponGroups([_disabledWeaponId]);

      final result = await readResult(container);
      expect(api.batchComputeCalls, isEmpty);
      expect(result!.countMismatch, isTrue);
      expect(result.targetGroupHashes, isEmpty);
    });

    test("returns null when not linked", () async {
      final api = FakeHoyolabGameApi();
      final container = createContainer(api, linked: false);

      await addCharacterGroups(_characterIds);
      await addWeaponGroups(_weaponIds);

      final result = await readResult(container);
      expect(api.batchComputeCalls, isEmpty);
      expect(result, isNull);
    });

    test("returns null when bag count feature is disabled", () async {
      final api = FakeHoyolabGameApi();
      final container = createContainer(api, syncEnabled: false);

      await addCharacterGroups(_characterIds);
      await addWeaponGroups(_weaponIds);

      final result = await readResult(container);
      expect(api.batchComputeCalls, isEmpty);
      expect(result, isNull);
    });
  });
}
