import "package:async/async.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/bookmark_db_extension.dart";
import "package:genshin_material/models/bookmark.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/material.dart";
import "package:genshin_material/providers/database_provider.dart";
import "package:genshin_material/view_models/bookmarks/material_grouped_bookmark_list_view_model.dart";

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

  /// Builds a container and waits for the bookmark stream to emit, because the
  /// view model reads `bookmarksProvider().value` and would otherwise build
  /// from an empty list.
  Future<ProviderContainer> createContainer({
    Map<MaterialId, Material> materials = const {},
    Map<String, int> materialSortOrder = const {},
  }) async {
    final container = createTestContainer(
      assetData: buildTestAssetData(
        materials: materials,
        materialSortOrder: materialSortOrder,
      ),
      db: db,
    );
    container.listen(bookmarksProvider(), (_, _) {});
    await container.read(bookmarksProvider().future);
    container.listen(materialGroupedBookmarkListViewModelProvider, (_, _) {});
    return container;
  }

  /// Waits until the bookmark table holds exactly [count] rows. A count that
  /// never arrives fails the test by timing out instead of racing a delay.
  Future<List<BookmarkWithMaterialDetails>> waitForBookmarkCount(
    StreamQueue<List<BookmarkWithMaterialDetails>> queue,
    int count,
  ) async {
    while (true) {
      final bookmarks = await queue.next;
      if (bookmarks.length == count) {
        return bookmarks;
      }
    }
  }

  group("build", () {
    test("groups the bookmarks by material id", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(materialId: "mat_a", upperLevel: 40),
        buildMaterialBookmark(materialId: "mat_a", upperLevel: 60),
        buildMaterialBookmark(materialId: "mat_b", upperLevel: 40),
      ]);
      final container = await createContainer(
        materials: {
          "mat_a": buildTestMaterial(id: "mat_a"),
          "mat_b": buildTestMaterial(id: "mat_b"),
        },
      );

      final state = container.read(materialGroupedBookmarkListViewModelProvider);

      expect(state.materials.keys, unorderedEquals(["mat_a", "mat_b"]));
      expect(state.materials["mat_a"], hasLength(2));
      expect(state.materials["mat_b"], hasLength(1));
    });

    test("keys a character EXP bookmark with \"false\"", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(materialId: null),
      ]);
      final container = await createContainer();

      final state = container.read(materialGroupedBookmarkListViewModelProvider);

      expect(state.materials.keys, ["false"]);
      expect(state.materials["false"], hasLength(1));
    });

    test("keys a weapon EXP bookmark with \"true\"", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(materialId: null, weaponId: "weapon_1"),
      ]);
      final container = await createContainer();

      final state = container.read(materialGroupedBookmarkListViewModelProvider);

      expect(state.materials.keys, ["true"]);
    });

    test("keeps character and weapon EXP bookmarks in separate groups", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(materialId: null),
        buildMaterialBookmark(materialId: null, weaponId: "weapon_1"),
      ]);
      final container = await createContainer();

      final state = container.read(materialGroupedBookmarkListViewModelProvider);

      expect(state.materials.keys, unorderedEquals(["false", "true"]));
      expect(state.materials["false"], hasLength(1));
      expect(state.materials["true"], hasLength(1));
    });

    test("orders the groups by the sort priority of their material", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(materialId: "mat_a"),
        buildMaterialBookmark(materialId: "mat_b"),
        buildMaterialBookmark(materialId: "mat_c"),
      ]);
      final container = await createContainer(
        materials: {
          "mat_a": buildTestMaterial(id: "mat_a"),
          "mat_b": buildTestMaterial(id: "mat_b"),
          "mat_c": buildTestMaterial(id: "mat_c"),
        },
        materialSortOrder: {"id:mat_a": 3, "id:mat_b": 1, "id:mat_c": 2},
      );

      final state = container.read(materialGroupedBookmarkListViewModelProvider);

      expect(state.materials.keys.toList(), ["mat_b", "mat_c", "mat_a"]);
    });

    test("returns no groups when there is no bookmark", () async {
      final container = await createContainer();

      final state = container.read(materialGroupedBookmarkListViewModelProvider);

      expect(state.materials, isEmpty);
    });
  });

  group("unbookmark", () {
    test("removes only the given bookmarks from the database", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(materialId: "mat_a"),
        buildMaterialBookmark(materialId: "mat_b"),
      ]);
      final container = await createContainer(
        materials: {
          "mat_a": buildTestMaterial(id: "mat_a"),
          "mat_b": buildTestMaterial(id: "mat_b"),
        },
      );
      final notifier =
          container.read(materialGroupedBookmarkListViewModelProvider.notifier);
      final target = container
          .read(materialGroupedBookmarkListViewModelProvider)
          .materials["mat_a"]!;

      await notifier.unbookmark(target);

      final remaining = await db.select(db.bookmarkMaterialItemTable).get();
      expect(remaining.map((e) => e.materialId), ["mat_b"]);
    });

    test("removes every given bookmark at once", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(materialId: "mat_a", upperLevel: 40),
        buildMaterialBookmark(materialId: "mat_a", upperLevel: 60),
      ]);
      final container = await createContainer(
        materials: {"mat_a": buildTestMaterial(id: "mat_a")},
      );
      final notifier =
          container.read(materialGroupedBookmarkListViewModelProvider.notifier);
      final target = container
          .read(materialGroupedBookmarkListViewModelProvider)
          .materials["mat_a"]!;

      await notifier.unbookmark(target);

      expect(await db.select(db.bookmarkMaterialItemTable).get(), isEmpty);
      // The group row goes away with its last item.
      expect(await db.select(db.bookmarkMaterialGroupTable).get(), isEmpty);
    });

    test("restores every field of a character bookmark through the undo callback",
        () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(
          characterId: "char_9",
          materialId: "mat_a",
          purposeType: Purpose.elementalBurst,
          upperLevel: 8,
          quantity: 42,
        ),
      ]);
      final container = await createContainer(
        materials: {"mat_a": buildTestMaterial(id: "mat_a")},
      );
      final notifier =
          container.read(materialGroupedBookmarkListViewModelProvider.notifier);
      final target = container
          .read(materialGroupedBookmarkListViewModelProvider)
          .materials["mat_a"]!;
      final queue = createStreamQueue(db.watchMaterialBookmarks());
      await waitForBookmarkCount(queue, 1);

      final undo = await notifier.unbookmark(target);
      await waitForBookmarkCount(queue, 0);
      // The undo callback is fire-and-forget, so wait for the re-inserted row
      // to reach the stream rather than awaiting the call itself.
      undo();
      final restored = (await waitForBookmarkCount(queue, 1)).single;

      expect(restored.group.characterId, "char_9");
      expect(restored.group.weaponId, isNull);
      expect(restored.group.purposeType, Purpose.elementalBurst);
      expect(restored.item.materialId, "mat_a");
      expect(restored.item.upperLevel, 8);
      expect(restored.item.quantity, 42);
    });

    test("restores the weapon id of a weapon bookmark through the undo callback",
        () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(
          characterId: "char_9",
          weaponId: "weapon_1",
          materialId: "mat_a",
          upperLevel: 60,
          quantity: 3,
        ),
      ]);
      final container = await createContainer(
        materials: {"mat_a": buildTestMaterial(id: "mat_a")},
      );
      final notifier =
          container.read(materialGroupedBookmarkListViewModelProvider.notifier);
      final target = container
          .read(materialGroupedBookmarkListViewModelProvider)
          .materials["mat_a"]!;
      final queue = createStreamQueue(db.watchMaterialBookmarks());
      await waitForBookmarkCount(queue, 1);

      final undo = await notifier.unbookmark(target);
      await waitForBookmarkCount(queue, 0);
      undo();
      final restored = (await waitForBookmarkCount(queue, 1)).single;

      expect(restored.group.weaponId, "weapon_1");
      expect(restored.group.characterId, "char_9");
      expect(restored.item.materialId, "mat_a");
      expect(restored.item.quantity, 3);
    });

    test("restores an EXP bookmark with a null material id", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(materialId: null, quantity: 1200),
      ]);
      final container = await createContainer();
      final notifier =
          container.read(materialGroupedBookmarkListViewModelProvider.notifier);
      final target = container
          .read(materialGroupedBookmarkListViewModelProvider)
          .materials["false"]!;
      final queue = createStreamQueue(db.watchMaterialBookmarks());
      await waitForBookmarkCount(queue, 1);

      final undo = await notifier.unbookmark(target);
      await waitForBookmarkCount(queue, 0);
      undo();
      final restored = (await waitForBookmarkCount(queue, 1)).single;

      expect(restored.item.materialId, isNull);
      expect(restored.item.quantity, 1200);
    });

    test("restores several bookmarks at once", () async {
      await db.addMaterialBookmarks([
        buildMaterialBookmark(materialId: "mat_a", upperLevel: 40),
        buildMaterialBookmark(materialId: "mat_a", upperLevel: 60),
      ]);
      final container = await createContainer(
        materials: {"mat_a": buildTestMaterial(id: "mat_a")},
      );
      final notifier =
          container.read(materialGroupedBookmarkListViewModelProvider.notifier);
      final target = container
          .read(materialGroupedBookmarkListViewModelProvider)
          .materials["mat_a"]!;
      final queue = createStreamQueue(db.watchMaterialBookmarks());
      await waitForBookmarkCount(queue, 2);

      final undo = await notifier.unbookmark(target);
      await waitForBookmarkCount(queue, 0);
      undo();
      final restored = await waitForBookmarkCount(queue, 2);

      expect(
        restored.map((e) => e.item.upperLevel),
        unorderedEquals([40, 60]),
      );
    });
  });
}
