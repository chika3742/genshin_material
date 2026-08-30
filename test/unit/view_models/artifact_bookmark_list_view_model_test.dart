import "package:drift/drift.dart" show OrderingTerm;
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/bookmark_db_extension.dart";
import "package:genshin_material/models/bookmark.dart";
import "package:genshin_material/view_models/bookmarks/artifact_bookmark_list_view_model.dart";

import "../../utils/asset_data.dart";
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

  ProviderContainer createContainer() {
    final container = createTestContainer(
      assetData: buildTestAssetData(),
      db: db,
    );
    container.listen(artifactBookmarkListViewModelProvider, (_, _) {});
    return container;
  }

  Future<List<ArtifactBookmarkItemState>> readItems(
    ProviderContainer container,
  ) {
    return container.read(artifactBookmarkListViewModelProvider.future);
  }

  Future<List<BookmarkArtifact>> readArtifactsById() {
    return (db.select(db.bookmarkArtifactTable)
      ..orderBy([(t) => OrderingTerm.asc(t.id)])).get();
  }

  Future<void> addPieceBookmark({
    String characterId = "char_1",
    String piece = "flower",
    String? mainStat = "hp",
    List<String> subStats = const ["atk"],
  }) {
    return db.addArtifactPieceBookmark(ArtifactPieceBookmarkInsertable(
      characterId: characterId,
      piece: piece,
      mainStat: mainStat,
      subStats: subStats,
    ));
  }

  Future<void> addSetBookmark({
    String characterId = "char_1",
    List<String> sets = const ["set_1"],
    Map<String, String?> mainStats = const {"flower": "hp"},
    List<String> subStats = const ["atk"],
  }) {
    return db.addArtifactSetBookmark(ArtifactSetBookmarkInsertable(
      characterId: characterId,
      sets: sets,
      mainStats: mainStats,
      subStats: subStats,
    ));
  }

  group("build", () {
    test("maps a row with a piece reference to a piece item state", () async {
      await addPieceBookmark(
        characterId: "char_9",
        piece: "plume",
        mainStat: "atk",
        subStats: ["crit_rate", "crit_dmg"],
      );
      final container = createContainer();

      final items = await readItems(container);

      final item = items.single as ArtifactPieceBookmarkItemState;
      expect(item.characterId, "char_9");
      expect(item.piece, "plume");
      expect(item.mainStat, "atk");
      expect(item.subStats, ["crit_rate", "crit_dmg"]);
    });

    test("keeps a null main stat on a piece item state", () async {
      await addPieceBookmark(mainStat: null);
      final container = createContainer();

      final items = await readItems(container);

      expect((items.single as ArtifactPieceBookmarkItemState).mainStat, isNull);
    });

    test("maps a row with a set reference to a set item state", () async {
      await addSetBookmark(
        characterId: "char_9",
        sets: ["set_1", "set_2"],
        mainStats: {"sands": "er", "goblet": null},
        subStats: ["crit_rate"],
      );
      final container = createContainer();

      final items = await readItems(container);

      final item = items.single as ArtifactSetBookmarkItemState;
      expect(item.characterId, "char_9");
      expect(item.sets, ["set_1", "set_2"]);
      expect(item.mainStats, {"sands": "er", "goblet": null});
      expect(item.subStats, ["crit_rate"]);
    });

    test("orders the items by their order index", () async {
      await addPieceBookmark(piece: "flower");
      await addSetBookmark(sets: ["set_1"]);
      await addPieceBookmark(piece: "plume");
      final container = createContainer();

      final items = await readItems(container);

      final orderIndexes = items.map((e) => e.orderIndex).toList();
      expect(orderIndexes, orderIndexes.toList()..sort());
      expect(items.map((e) => e.id).toList(), [1, 2, 3]);
    });

    test("throws a StateError for a row with neither reference", () async {
      await db.into(db.bookmarkArtifactTable).insert(
        BookmarkArtifactCompanion.insert(
          characterId: "char_1",
          subStats: [],
          orderIndex: "a0",
        ),
      );
      final container = createContainer();

      await expectLater(readItems(container), throwsStateError);
    });

    test("emits an empty list when there is no bookmark", () async {
      final container = createContainer();

      expect(await readItems(container), isEmpty);
    });
  });

  group("removeBookmark", () {
    test("removes only the given row", () async {
      await addPieceBookmark(piece: "flower");
      await addPieceBookmark(piece: "plume");
      final container = createContainer();
      final items = await readItems(container);
      final notifier =
          container.read(artifactBookmarkListViewModelProvider.notifier);

      await notifier.removeBookmark(items.first.id);

      final remaining = await readArtifactsById();
      expect(remaining.map((e) => e.id), [items.last.id]);
    });

    test("cascades to the piece table", () async {
      await addPieceBookmark();
      final container = createContainer();
      final items = await readItems(container);
      final notifier =
          container.read(artifactBookmarkListViewModelProvider.notifier);

      await notifier.removeBookmark(items.single.id);

      expect(await db.select(db.bookmarkArtifactPieceTable).get(), isEmpty);
    });

    test("cascades to the set table", () async {
      await addSetBookmark();
      final container = createContainer();
      final items = await readItems(container);
      final notifier =
          container.read(artifactBookmarkListViewModelProvider.notifier);

      await notifier.removeBookmark(items.single.id);

      expect(await db.select(db.bookmarkArtifactSetTable).get(), isEmpty);
    });

    test("does nothing for an unknown id", () async {
      await addPieceBookmark();
      final container = createContainer();
      await readItems(container);
      final notifier =
          container.read(artifactBookmarkListViewModelProvider.notifier);

      await notifier.removeBookmark(9999);

      expect(await readArtifactsById(), hasLength(1));
    });
  });

  group("reorder", () {
    /// Seeds three bookmarks and returns their item states in list order.
    Future<(ProviderContainer, List<ArtifactBookmarkItemState>)> seedThree() async {
      await addPieceBookmark(piece: "flower");
      await addPieceBookmark(piece: "plume");
      await addPieceBookmark(piece: "sands");
      final container = createContainer();
      return (container, await readItems(container));
    }

    Future<String> orderIndexOf(int id) async {
      final rows = await readArtifactsById();
      return rows.firstWhere((e) => e.id == id).orderIndex;
    }

    test("moves an item to the end and gives it the last order index", () async {
      final (container, before) = await seedThree();
      final notifier =
          container.read(artifactBookmarkListViewModelProvider.notifier);

      final reordering = notifier.reorder(0, 2);

      // The state is updated optimistically, before the write completes.
      expect(
        container
            .read(artifactBookmarkListViewModelProvider)
            .requireValue
            .map((e) => e.id)
            .toList(),
        [before[1].id, before[2].id, before[0].id],
      );
      await reordering;
      expect(
        (await orderIndexOf(before[0].id)).compareTo(before[2].orderIndex),
        greaterThan(0),
      );
    });

    test("moves an item to the front and gives it the first order index",
        () async {
      final (container, before) = await seedThree();
      final notifier =
          container.read(artifactBookmarkListViewModelProvider.notifier);

      final reordering = notifier.reorder(2, 0);

      expect(
        container
            .read(artifactBookmarkListViewModelProvider)
            .requireValue
            .map((e) => e.id)
            .toList(),
        [before[2].id, before[0].id, before[1].id],
      );
      await reordering;
      expect(
        (await orderIndexOf(before[2].id)).compareTo(before[0].orderIndex),
        lessThan(0),
      );
    });

    test("moves an item into the middle and gives it an order index between "
        "its new neighbours", () async {
      final (container, before) = await seedThree();
      final notifier =
          container.read(artifactBookmarkListViewModelProvider.notifier);

      final reordering = notifier.reorder(0, 1);

      expect(
        container
            .read(artifactBookmarkListViewModelProvider)
            .requireValue
            .map((e) => e.id)
            .toList(),
        [before[1].id, before[0].id, before[2].id],
      );
      await reordering;
      final newOrderIndex = await orderIndexOf(before[0].id);
      expect(newOrderIndex.compareTo(before[1].orderIndex), greaterThan(0));
      expect(newOrderIndex.compareTo(before[2].orderIndex), lessThan(0));
    });

    test("leaves the other rows untouched", () async {
      final (container, before) = await seedThree();
      final notifier =
          container.read(artifactBookmarkListViewModelProvider.notifier);

      await notifier.reorder(0, 2);

      expect(await orderIndexOf(before[1].id), before[1].orderIndex);
      expect(await orderIndexOf(before[2].id), before[2].orderIndex);
    });

    test("persists the new order so that the next emission keeps it", () async {
      final (container, before) = await seedThree();
      final notifier =
          container.read(artifactBookmarkListViewModelProvider.notifier);

      await notifier.reorder(0, 2);

      final rows = await readArtifactsById();
      rows.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
      expect(
        rows.map((e) => e.id).toList(),
        [before[1].id, before[2].id, before[0].id],
      );
    });

    test("does nothing while the state has no value yet", () async {
      await addPieceBookmark(piece: "flower");
      await addPieceBookmark(piece: "plume");
      final before = await readArtifactsById();
      // Nothing may be awaited between here and the call: the drift stream
      // emits its first value as soon as the test yields.
      final container = createContainer();
      final notifier =
          container.read(artifactBookmarkListViewModelProvider.notifier);
      expect(container.read(artifactBookmarkListViewModelProvider).hasValue,
          isFalse);

      await notifier.reorder(0, 1);

      expect(
        (await readArtifactsById()).map((e) => e.orderIndex),
        before.map((e) => e.orderIndex),
      );
    });
  });
}
