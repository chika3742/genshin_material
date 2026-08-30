import "package:async/async.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/bookmark_db_extension.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/providers/database_provider.dart";
import "package:genshin_material/view_models/bookmarks/purpose_grouped_bookmark_list_view_model.dart";

import "../../utils/asset_data.dart";
import "../../utils/async.dart";
import "../../utils/db.dart";
import "../../utils/provider_container.dart";

void main() {
  late AppDatabase db;

  setUp(() {
    db = createTestDatabase();
  });

  tearDown(() async {
    await db.close();
  });

  // `BookmarkGroup.fromBookmarks` resolves the character and its ingredient
  // table with `!`, so every character used in a test must be present with a
  // matching rarity and purpose.
  final assetData = buildTestAssetData(
    characters: {
      for (final id in ["char_1", "char_2", "char_3"])
        id: buildTestCharacter(id: id, rarity: 5),
    },
    materials: {
      "mat_a": buildTestMaterial(id: "mat_a"),
      "mat_b": buildTestMaterial(id: "mat_b"),
    },
    materialSortOrder: {"id:mat_a": 2, "id:mat_b": 1},
    characterIngredients: buildIngredientConfigurations(
      rarity: 5,
      purpose: Purpose.ascension,
      levels: {20: [], 40: [], 60: []},
    ),
  );

  /// Builds a container and waits for the bookmark stream to emit, because the
  /// view model reads `bookmarksProvider().value` and would otherwise build
  /// from an empty list. Both providers stay listened to so that the notifier
  /// survives the awaits inside a test.
  Future<ProviderContainer> createContainer() async {
    final container = createTestContainer(assetData: assetData, db: db);
    container.listen(bookmarksProvider(), (_, _) {});
    await container.read(bookmarksProvider().future);
    container.listen(purposeGroupedBookmarkListViewModelProvider, (_, _) {});
    return container;
  }

  /// Adds one ascension bookmark for each of [characterIds], in order, so that
  /// their groups get ascending order indexes.
  Future<void> addGroupsFor(List<CharacterId> characterIds) async {
    for (final characterId in characterIds) {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(characterId: characterId, materialId: "mat_a"),
      ]);
    }
  }

  StreamQueue<List<BookmarkMaterialGroup>> watchGroups() {
    return createStreamQueue(db.select(db.bookmarkMaterialGroupTable).watch());
  }

  /// Waits until the group identified by [groupHash] no longer carries
  /// [previous] as its order index, and returns the new one.
  Future<String> waitForNewOrderIndex(
    StreamQueue<List<BookmarkMaterialGroup>> queue,
    String groupHash,
    String previous,
  ) async {
    while (true) {
      final rows = await queue.next;
      final row = rows.firstWhere((e) => e.groupHash == groupHash);
      if (row.orderIndex != previous) {
        return row.orderIndex;
      }
    }
  }

  group("build", () {
    test("builds one group per group hash", () async {
      await addGroupsFor(["char_1", "char_2"]);
      final container = await createContainer();

      final state = container.read(purposeGroupedBookmarkListViewModelProvider);

      expect(state.groups, hasLength(2));
      expect(
        state.groups.map((e) => e.characterId),
        unorderedEquals(["char_1", "char_2"]),
      );
      expect(state.groups.every((e) => e.type == BookmarkType.material), isTrue);
    });

    test("keeps bookmarks of the same character and purpose in one group",
        () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(materialId: "mat_a"),
        buildMaterialBookmark(materialId: "mat_b"),
      ]);
      final container = await createContainer();

      final state = container.read(purposeGroupedBookmarkListViewModelProvider);

      expect(state.groups, hasLength(1));
      expect(state.groups.single.bookmarks, hasLength(2));
    });

    test("sorts the groups by their order index", () async {
      await addGroupsFor(["char_1", "char_2", "char_3"]);
      final container = await createContainer();

      final state = container.read(purposeGroupedBookmarkListViewModelProvider);

      expect(
        state.groups.map((e) => e.characterId).toList(),
        ["char_1", "char_2", "char_3"],
      );
      final orderIndexes = state.groups.map((e) => e.orderIndex).toList();
      expect(orderIndexes, orderIndexes.toList()..sort());
    });

    test("groups sortedBookmarks by group hash and then by material id",
        () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(materialId: "mat_a"),
        buildMaterialBookmark(materialId: "mat_b"),
        buildMaterialBookmark(characterId: "char_2", materialId: "mat_a"),
      ]);
      final container = await createContainer();

      final state = container.read(purposeGroupedBookmarkListViewModelProvider);

      expect(state.sortedBookmarks.keys, hasLength(2));
      final firstGroup = state.groups.first;
      // mat_b sorts before mat_a through `sortBookmarks`.
      expect(
        state.sortedBookmarks[firstGroup.hash]!.keys.toList(),
        ["mat_b", "mat_a"],
      );
      expect(state.sortedBookmarks[firstGroup.hash]!["mat_a"], hasLength(1));
      final secondGroup = state.groups.last;
      expect(state.sortedBookmarks[secondGroup.hash]!.keys.toList(), ["mat_a"]);
    });

    test("returns no group when there is no bookmark", () async {
      final container = await createContainer();

      final state = container.read(purposeGroupedBookmarkListViewModelProvider);

      expect(state.groups, isEmpty);
      expect(state.sortedBookmarks, isEmpty);
    });
  });

  group("reorder", () {
    test("moves a group to the end and gives it the last order index", () async {
      await addGroupsFor(["char_1", "char_2", "char_3"]);
      final container = await createContainer();
      final notifier =
          container.read(purposeGroupedBookmarkListViewModelProvider.notifier);
      final before = container.read(purposeGroupedBookmarkListViewModelProvider).groups;
      final moved = before.first;
      final queue = watchGroups();

      notifier.reorder(0, 2);

      // The state is updated optimistically, before the write completes.
      expect(
        container
            .read(purposeGroupedBookmarkListViewModelProvider)
            .groups
            .map((e) => e.characterId)
            .toList(),
        ["char_2", "char_3", "char_1"],
      );
      final newOrderIndex =
          await waitForNewOrderIndex(queue, moved.hash, moved.orderIndex);
      // Last position: after its new predecessor, with nothing after it.
      expect(newOrderIndex.compareTo(before[2].orderIndex), greaterThan(0));
    });

    test("moves a group to the front and gives it the first order index",
        () async {
      await addGroupsFor(["char_1", "char_2", "char_3"]);
      final container = await createContainer();
      final notifier =
          container.read(purposeGroupedBookmarkListViewModelProvider.notifier);
      final before = container.read(purposeGroupedBookmarkListViewModelProvider).groups;
      final moved = before.last;
      final queue = watchGroups();

      notifier.reorder(2, 0);

      expect(
        container
            .read(purposeGroupedBookmarkListViewModelProvider)
            .groups
            .map((e) => e.characterId)
            .toList(),
        ["char_3", "char_1", "char_2"],
      );
      final newOrderIndex =
          await waitForNewOrderIndex(queue, moved.hash, moved.orderIndex);
      expect(newOrderIndex.compareTo(before[0].orderIndex), lessThan(0));
    });

    test("moves a group into the middle and gives it an order index between "
        "its new neighbours", () async {
      await addGroupsFor(["char_1", "char_2", "char_3"]);
      final container = await createContainer();
      final notifier =
          container.read(purposeGroupedBookmarkListViewModelProvider.notifier);
      final before = container.read(purposeGroupedBookmarkListViewModelProvider).groups;
      final moved = before.first;
      final queue = watchGroups();

      notifier.reorder(0, 1);

      expect(
        container
            .read(purposeGroupedBookmarkListViewModelProvider)
            .groups
            .map((e) => e.characterId)
            .toList(),
        ["char_2", "char_1", "char_3"],
      );
      final newOrderIndex =
          await waitForNewOrderIndex(queue, moved.hash, moved.orderIndex);
      expect(newOrderIndex.compareTo(before[1].orderIndex), greaterThan(0));
      expect(newOrderIndex.compareTo(before[2].orderIndex), lessThan(0));
    });

    test("writes the new order index only for the moved group", () async {
      await addGroupsFor(["char_1", "char_2", "char_3"]);
      final container = await createContainer();
      final notifier =
          container.read(purposeGroupedBookmarkListViewModelProvider.notifier);
      final before = container.read(purposeGroupedBookmarkListViewModelProvider).groups;
      final moved = before.first;
      final queue = watchGroups();

      notifier.reorder(0, 2);
      await waitForNewOrderIndex(queue, moved.hash, moved.orderIndex);

      final rows = await db.select(db.bookmarkMaterialGroupTable).get();
      for (final untouched in before.skip(1)) {
        expect(
          rows.firstWhere((e) => e.groupHash == untouched.hash).orderIndex,
          untouched.orderIndex,
        );
      }
    });

    test("persists the new order so that a rebuild keeps it", () async {
      await addGroupsFor(["char_1", "char_2", "char_3"]);
      final container = await createContainer();
      final notifier =
          container.read(purposeGroupedBookmarkListViewModelProvider.notifier);
      final before = container.read(purposeGroupedBookmarkListViewModelProvider).groups;
      final moved = before.first;
      final queue = watchGroups();

      notifier.reorder(0, 2);
      await waitForNewOrderIndex(queue, moved.hash, moved.orderIndex);
      // The bookmark stream re-emits after the write, which rebuilds the state
      // from the database rather than from the optimistic list.
      await container.read(bookmarksProvider().future);

      expect(
        container
            .read(purposeGroupedBookmarkListViewModelProvider)
            .groups
            .map((e) => e.characterId)
            .toList(),
        ["char_2", "char_3", "char_1"],
      );
    });
  });
}
