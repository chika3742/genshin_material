import "dart:async";

import "package:async/async.dart";
import "package:clock/clock.dart";
import "package:drift/drift.dart" show Value;
import "package:flutter_riverpod/experimental/mutation.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/asset_cache.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/data/repositories/character_state_repository.dart";
import "package:genshin_material/data/repositories/single_character_state_repository.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/in_game_character_state_db_extension.dart";
import "package:genshin_material/models/character.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/providers/hoyolab_api.dart";

import "../../../utils/asset_data.dart";
import "../../../utils/async.dart";
import "../../../utils/db.dart";
import "../../../utils/fake_hoyolab_game_api.dart";
import "../../../utils/hoyolab_game_server.dart";
import "../../../utils/in_memory_pref.dart";
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

  ProviderContainer createContainer({String? uid = _uid, FakeHoyolabGameApi? api, DateTime? lastFetchAll}) {
    return createTestContainer(
      assetData: _buildAssetData(),
      db: db,
      overrides: [
        ...overrideHoyolabGameServerPrefs(uid: uid),
        overridePref(PrefKeys.lastCharacterFetchAll, lastFetchAll),
        if (api != null) hoyolabGameApiProvider.overrideWith((ref) async => api),
      ],
    );
  }

  Future<void> insertState({
    String uid = _uid,
    int characterId = charaHyvId,
    int elementId = anemoHyvId,
    Map<Purpose, int> purposes = const {Purpose.ascension: 40},
    int equippedWeaponId = weaponHyvId,
    Map<Purpose, int> weaponPurposes = const {Purpose.ascension: 50},
    DateTime? lastUpdated,
  }) {
    return db.setCharacterState(InGameCharacterStateCompanion.insert(
      uid: uid,
      characterId: characterId,
      elementId: elementId,
      purposes: purposes,
      equippedWeaponId: equippedWeaponId,
      weaponPurposes: weaponPurposes,
      lastUpdated: Value(lastUpdated ?? _now),
    ));
  }

  /// Emits each settled value of the repository, so a test can wait for the
  /// rebuild that follows a database write.
  StreamQueue<Map<String, CharacterState>?> listenStates(ProviderContainer container) {
    final controller = StreamController<Map<String, CharacterState>?>();
    addTearDown(controller.close);
    container.listen(characterStateRepositoryProvider, (_, next) {
      if (next case AsyncData(:final value)) {
        controller.add(value);
      }
    }, fireImmediately: true);
    return createStreamQueue(controller.stream);
  }

  Future<Map<String, CharacterState>?> readStates(ProviderContainer container) {
    return listenStates(container).next;
  }

  Future<List<InGameCharacterState>> readRows() => db.select(db.inGameCharacterStateTable).get();

  group("build", () {
    test("returns null when no uid is stored", () async {
      expect(await readStates(createContainer(uid: null)), isNull);
    });

    test("returns an empty map when nothing is synced", () async {
      expect(await readStates(createContainer()), isEmpty);
    });

    test("maps a listed character to its local IDs", () async {
      await insertState(
        purposes: {Purpose.ascension: 40, Purpose.normalAttack: 6},
        equippedWeaponId: weaponHyvId,
        weaponPurposes: {Purpose.ascension: 50},
        lastUpdated: _now,
      );

      final states = await readStates(createContainer());

      expect(states, {
        "test_chara": CharacterState(
          levels: {Purpose.ascension: 40, Purpose.normalAttack: 6},
          equippedWeaponId: testWeaponId,
          weaponLevels: {Purpose.ascension: 50},
          lastUpdatedAt: _now,
        ),
      });
    });

    test("keys each element of a group by its variant ID", () async {
      await insertState(characterId: groupHyvId1, elementId: anemoHyvId);
      await insertState(characterId: groupHyvId1, elementId: geoHyvId);

      final states = await readStates(createContainer());

      expect(states!.keys, unorderedEquals(["test_group_anemo", "test_group_geo"]));
    });

    test("skips a character missing from the asset data", () async {
      await insertState(characterId: charaHyvId);
      await insertState(characterId: unknownCharaHyvId);

      final states = await readStates(createContainer());

      expect(states!.keys, ["test_chara"]);
    });

    test("leaves the weapon ID null when the weapon is missing from the asset data", () async {
      await insertState(equippedWeaponId: unknownWeaponHyvId);

      final states = await readStates(createContainer());

      expect(states!["test_chara"]!.equippedWeaponId, isNull);
    });

    test("ignores the rows of another uid", () async {
      await insertState(uid: _uid, characterId: charaHyvId);
      await insertState(uid: "uid_2", characterId: groupHyvId1);

      final states = await readStates(createContainer());

      expect(states!.keys, ["test_chara"]);
    });

    test("reflects a row written after the first build", () async {
      final queue = listenStates(createContainer());
      expect(await queue.next, isEmpty);

      await insertState();

      expect((await queue.next)!.keys, ["test_chara"]);
    });
  });

  group("executeFetchAll", () {
    Future<void> fetchAll(ProviderContainer container, {DateTime? at}) {
      return withClock(Clock.fixed(at ?? _now), () {
        return CharacterStateRepository.executeFetchAll(container);
      });
    }

    test("writes the characters of every page until an empty one", () async {
      final api = FakeHoyolabGameApi(pages: {
        1: [buildTestAvatar(id: charaHyvId), buildTestAvatar(id: groupHyvId1, elementAttrId: anemoHyvId)],
        2: [buildTestAvatar(id: unknownCharaHyvId)],
      });

      await fetchAll(createContainer(api: api));

      expect(
        (await readRows()).map((e) => e.characterId),
        unorderedEquals([charaHyvId, groupHyvId1, unknownCharaHyvId]),
      );
      expect(api.avatarListCalls.map((e) => e.page), [1, 2, 3]);
    });

    test("requests the list without filters", () async {
      final api = FakeHoyolabGameApi();

      await fetchAll(createContainer(api: api));

      expect(api.avatarListCalls.single.elementIds, isEmpty);
      expect(api.avatarListCalls.single.weaponCatIds, isEmpty);
    });

    test("stores the rows under the linked uid with a single timestamp", () async {
      final api = FakeHoyolabGameApi(pages: {
        1: [buildTestAvatar(id: charaHyvId), buildTestAvatar(id: groupHyvId1)],
      });

      await fetchAll(createContainer(api: api), at: _now);

      final rows = await readRows();
      expect(rows.map((e) => e.uid), everyElement(_uid));
      expect(rows.map((e) => e.lastUpdated), everyElement(_now));
    });

    test("overwrites an existing row", () async {
      await insertState(purposes: {Purpose.ascension: 40});
      final api = FakeHoyolabGameApi(pages: {
        1: [buildTestAvatar(id: charaHyvId, elementAttrId: anemoHyvId, currentLevel: 80)],
      });

      await fetchAll(createContainer(api: api));

      expect((await readRows()).single.purposes[Purpose.ascension], 80);
    });

    // HoYoLAB returns the Traveler only in the element currently resonated
    // with, so the rows of the other elements must survive.
    test("keeps a row missing from the result", () async {
      await insertState(characterId: groupHyvId1, elementId: geoHyvId);
      final api = FakeHoyolabGameApi(pages: {
        1: [buildTestAvatar(id: groupHyvId1, elementAttrId: anemoHyvId)],
      });

      await fetchAll(createContainer(api: api));

      expect(
        (await readRows()).map((e) => e.elementId),
        unorderedEquals([anemoHyvId, geoHyvId]),
      );
    });

    // Kept so that the character shows up once the asset data catches up,
    // without fetching again.
    test("stores a character missing from the asset data without exposing it", () async {
      final api = FakeHoyolabGameApi(pages: {
        1: [buildTestAvatar(id: unknownCharaHyvId)],
      });
      final container = createContainer(api: api);

      await fetchAll(container);

      expect((await readRows()).single.characterId, unknownCharaHyvId);
      expect(await readStates(container), isEmpty);
    });

    test("lets the per-character fetch reuse the stored state", () async {
      final api = FakeHoyolabGameApi(pages: {
        1: [buildTestAvatar(id: charaHyvId, elementAttrId: anemoHyvId)],
      });
      final container = createContainer(api: api);
      final mutation = SingleCharacterStateRepository.fetchMutation(testCharaId);
      container.listen(mutation, (_, _) {});

      await fetchAll(container, at: _now);
      api.avatarListCalls.clear();
      await withClock(Clock.fixed(_now.add(const Duration(seconds: 30))), () {
        return SingleCharacterStateRepository.executeFetch(container, VariantId(testCharaId));
      });

      expect(container.read(mutation), isA<MutationSuccess<FetchResult>>()
          .having((e) => e.value, "value", isA<FetchSuccess>().having((e) => e.isFresh, "isFresh", isFalse)));
      expect(api.avatarListCalls, isEmpty);
    });

    test("reports an API failure through the mutation and leaves the rows untouched", () async {
      await insertState(purposes: {Purpose.ascension: 40});
      final error = Exception("network");
      final container = createContainer(api: FakeHoyolabGameApi(error: error));
      container.listen(CharacterStateRepository.fetchAllMutation, (_, _) {});

      await expectLater(fetchAll(container), throwsA(error));

      expect(
        container.read(CharacterStateRepository.fetchAllMutation),
        isA<MutationError<void>>().having((e) => e.error, "error", error),
      );
      expect((await readRows()).single.purposes, {Purpose.ascension: 40});
    });

    group("cooldown", () {
      test("runs when it has never run", () async {
        final api = FakeHoyolabGameApi();

        await fetchAll(createContainer(api: api));

        expect(api.avatarListCalls, isNotEmpty);
      });

      test("runs once the cooldown has passed", () async {
        final api = FakeHoyolabGameApi();

        await fetchAll(createContainer(api: api, lastFetchAll: _now.subtract(characterFetchAllCooldown * 2)));

        expect(api.avatarListCalls, isNotEmpty);
      });

      test("refuses to run during the cooldown", () async {
        final api = FakeHoyolabGameApi();

        await expectLater(fetchAll(createContainer(api: api, lastFetchAll: _now)), throwsStateError);
        expect(api.avatarListCalls, isEmpty);
      });
    });
  });

  group("isFetchAllCharactersAvailable", () {
    // testWidgets runs under a fake async zone, so tester.pump fires the
    // provider's Timer, and withClock makes clock.now() follow the same time.
    testWidgets("becomes available when the cooldown ends", (tester) async {
      await withClock(tester.binding.clock, () async {
        final container = createContainer(lastFetchAll: clock.now());
        container.listen(isFetchAllCharactersAvailableProvider, (_, _) {});
        expect(container.read(isFetchAllCharactersAvailableProvider), isFalse);

        await tester.pump(characterFetchAllCooldown - const Duration(seconds: 1));
        expect(container.read(isFetchAllCharactersAvailableProvider), isFalse);

        await tester.pump(const Duration(seconds: 1));
        expect(container.read(isFetchAllCharactersAvailableProvider), isTrue);
      });
    });
  });
}
