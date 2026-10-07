import "package:clock/clock.dart";
import "package:drift/drift.dart" show Value;
import "package:flutter_riverpod/experimental/mutation.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/asset_cache.dart";
import "package:genshin_material/data/models/hoyolab_api.dart";
import "package:genshin_material/data/repositories/character_state_repository.dart";
import "package:genshin_material/data/repositories/single_character_state_repository.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/in_game_character_state_db_extension.dart";
import "package:genshin_material/models/character.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/providers/hoyolab_api.dart";

import "../../../utils/asset_data.dart";
import "../../../utils/db.dart";
import "../../../utils/fake_hoyolab_game_api.dart";
import "../../../utils/hoyolab_game_server.dart";
import "../../../utils/provider_container.dart";
import "../../../utils/test_data.dart";

const _uid = "uid_1";

final _now = DateTime(2026, 1, 1, 12);

AssetData _buildAssetData() {
  return buildTestAssetData(
    characters: createTestCharacters(),
    weapons: createTestWeapons(),
    elements: createTestElements(),
    weaponTypes: createTestWeaponTypes(),
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

  ProviderContainer createContainer({FakeHoyolabGameApi? api}) {
    return createTestContainer(
      assetData: _buildAssetData(),
      db: db,
      overrides: [
        ...overrideHoyolabGameServerPrefs(uid: _uid),
        hoyolabGameApiProvider.overrideWith((ref) async => api ?? FakeHoyolabGameApi()),
      ],
    );
  }

  Future<void> insertState({
    int characterId = charaHyvId,
    int elementId = anemoHyvId,
    Map<Purpose, int> purposes = const {Purpose.ascension: 40},
    DateTime? lastUpdated,
  }) {
    return db.setCharacterState(InGameCharacterStateCompanion.insert(
      uid: _uid,
      characterId: characterId,
      elementId: elementId,
      purposes: purposes,
      equippedWeaponId: weaponHyvId,
      weaponPurposes: const {Purpose.ascension: 50},
      lastUpdated: Value(lastUpdated ?? _now),
    ));
  }

  Future<List<InGameCharacterState>> readRows() => db.select(db.inGameCharacterStateTable).get();

  /// Runs a fetch of [variantId] at [at] and returns the resulting mutation
  /// state. The mutation is listened to beforehand so that its state outlives
  /// the run.
  Future<MutationState<FetchResult>> fetch(
    ProviderContainer container,
    VariantId variantId, {
    DateTime? at,
  }) async {
    final mutation = SingleCharacterStateRepository.fetchMutation(variantId);
    container.listen(mutation, (_, _) {});
    await withClock(Clock.fixed(at ?? _now), () {
      return SingleCharacterStateRepository.executeFetch(container, variantId);
    });
    return container.read(mutation);
  }

  Matcher succeededWith(Matcher result) {
    return isA<MutationSuccess<FetchResult>>().having((e) => e.value, "value", result);
  }

  group("build", () {
    test("returns the state of the variant", () async {
      await insertState(characterId: groupHyvId1, elementId: geoHyvId, purposes: {Purpose.ascension: 70});
      final container = createContainer();
      container.listen(singleCharacterStateRepositoryProvider(testVariantId2), (_, _) {});

      final state = await container.read(singleCharacterStateRepositoryProvider(testVariantId2).future);

      expect(state!.levels, {Purpose.ascension: 70});
    });

    test("returns null when the variant has no state", () async {
      await insertState(characterId: groupHyvId1, elementId: geoHyvId);
      final container = createContainer();
      container.listen(singleCharacterStateRepositoryProvider(testVariantId1), (_, _) {});

      expect(await container.read(singleCharacterStateRepositoryProvider(testVariantId1).future), isNull);
    });
  });

  group("executeFetch", () {
    test("fetches the character, stores it and returns its levels", () async {
      final api = FakeHoyolabGameApi(pages: {
        1: [
          buildTestAvatar(
            id: charaHyvId,
            elementAttrId: anemoHyvId,
            currentLevel: 80,
            skills: const [
              AvatarSkill(groupId: 1, maxLevel: 10, currentLevel: 6),
              AvatarSkill(groupId: 2, maxLevel: 10, currentLevel: 7),
              AvatarSkill(groupId: 3, maxLevel: 10, currentLevel: 8),
            ],
            weaponId: weaponHyvId,
            weaponLevel: 70,
          ),
        ],
      });

      final state = await fetch(createContainer(api: api), VariantId(testCharaId));

      final levels = {
        Purpose.ascension: 80,
        Purpose.normalAttack: 6,
        Purpose.elementalSkill: 7,
        Purpose.elementalBurst: 8,
      };
      expect(state, succeededWith(isA<FetchSuccess>()
          .having((e) => e.isFresh, "isFresh", isTrue)
          .having((e) => e.state, "state", CharacterState(
            levels: levels,
            equippedWeaponId: testWeaponId,
            weaponLevels: {Purpose.ascension: 70},
            lastUpdatedAt: _now,
          ))));
      final row = (await readRows()).single;
      expect(row.characterId, charaHyvId);
      expect(row.purposes, levels);
      expect(row.lastUpdated, _now);
    });

    test("filters the list by the element and weapon type of the variant", () async {
      final api = FakeHoyolabGameApi();

      await fetch(createContainer(api: api), testVariantId2);

      expect(api.avatarListCalls.first.elementIds, [geoHyvId]);
      expect(api.avatarListCalls.first.weaponCatIds, [claymoreHyvId]);
    });

    test("finds a variant by any of the hyvIds of its group", () async {
      final api = FakeHoyolabGameApi(pages: {
        1: [buildTestAvatar(id: groupHyvId2, elementAttrId: geoHyvId)],
      });

      final state = await fetch(createContainer(api: api), testVariantId2);

      expect(state, succeededWith(isA<FetchSuccess>()));
      expect((await readRows()).single.characterId, groupHyvId2);
    });

    test("reports a character that is not found and stores nothing", () async {
      final api = FakeHoyolabGameApi(pages: {
        1: [buildTestAvatar(id: groupHyvId1, elementAttrId: anemoHyvId)],
      });

      final state = await fetch(createContainer(api: api), VariantId(testCharaId));

      expect(state, succeededWith(isA<FetchCharacterNotFound>()));
      expect(api.avatarListCalls.map((e) => e.page), [1, 2]);
      expect(await readRows(), isEmpty);
    });

    test("returns the stored state without calling the API while it is fresh", () async {
      await insertState(purposes: {Purpose.ascension: 40}, lastUpdated: _now);
      final api = FakeHoyolabGameApi();

      final state = await fetch(
        createContainer(api: api),
        VariantId(testCharaId),
        at: _now.add(const Duration(seconds: 89)),
      );

      expect(state, succeededWith(isA<FetchSuccess>()
          .having((e) => e.isFresh, "isFresh", isFalse)
          .having((e) => e.state.levels, "levels", {Purpose.ascension: 40})));
      expect(api.avatarListCalls, isEmpty);
    });

    test("fetches again once the stored state is stale", () async {
      await insertState(lastUpdated: _now);
      final api = FakeHoyolabGameApi(pages: {
        1: [buildTestAvatar(id: charaHyvId, elementAttrId: anemoHyvId)],
      });

      final state = await fetch(
        createContainer(api: api),
        VariantId(testCharaId),
        at: _now.add(const Duration(seconds: 91)),
      );

      expect(state, succeededWith(isA<FetchSuccess>().having((e) => e.isFresh, "isFresh", isTrue)));
      expect(api.avatarListCalls, isNotEmpty);
    });

    test("reports an API failure through the mutation", () async {
      final error = Exception("network");
      final container = createContainer(api: FakeHoyolabGameApi(error: error));

      await expectLater(fetch(container, VariantId(testCharaId)), throwsA(error));

      expect(
        container.read(SingleCharacterStateRepository.fetchMutation(VariantId(testCharaId))),
        isA<MutationError<FetchResult>>().having((e) => e.error, "error", error),
      );
    });

    test("keeps the mutation of each variant separate", () async {
      final api = FakeHoyolabGameApi(pages: {
        1: [buildTestAvatar(id: charaHyvId, elementAttrId: anemoHyvId)],
      });
      final container = createContainer(api: api);
      final other = SingleCharacterStateRepository.fetchMutation(testVariantId1);
      container.listen(other, (_, _) {});

      await fetch(container, VariantId(testCharaId));

      expect(container.read(other), isA<MutationIdle<FetchResult>>());
    });

    test("reports a variant ID missing from the asset data as an error", () async {
      final container = createContainer();

      await expectLater(fetch(container, const VariantId("test_unknown")), throwsArgumentError);

      expect(
        container.read(SingleCharacterStateRepository.fetchMutation(const VariantId("test_unknown"))),
        isA<MutationError<FetchResult>>().having((e) => e.error, "error", isArgumentError),
      );
    });
  });
}
