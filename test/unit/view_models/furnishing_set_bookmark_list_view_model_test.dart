import "dart:async";

import "package:drift/drift.dart" show Value;
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/furnishing_db_extension.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/furnishing_set.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/view_models/bookmarks/furnishing_set_bookmark_list_view_model.dart";

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

  FurnishingSet buildSet(FurnishingSetId id) {
    return FurnishingSet(
      id: id,
      hyvId: 0,
      name: LocalizedText.untranslatable(text: id),
      jaPronunciation: "",
      imageUrl: "",
      type: "",
      favoriteCharacterHyvIds: [],
      consistsOf: [],
    );
  }

  final sets = {
    for (final id in ["set_1", "set_2", "set_3"]) id: buildSet(id),
  };

  ProviderContainer createContainer() {
    final container = createTestContainer(
      assetData: buildTestAssetData(furnishingSets: sets),
      db: db,
    );
    container.listen(furnishingSetBookmarkListViewModelProvider, (_, _) {});
    return container;
  }

  Future<List<FurnishingSet>> readSets(ProviderContainer container) {
    return container.read(furnishingSetBookmarkListViewModelProvider.future);
  }

  /// Completes with the next emission satisfying [predicate]. `.future` only
  /// yields the value the provider already holds, so a re-emission has to be
  /// listened for. An emission that never arrives fails the test by timing out.
  Future<List<FurnishingSet>> nextEmissionWhere(
    ProviderContainer container,
    bool Function(List<FurnishingSet> emitted) predicate,
  ) {
    final completer = Completer<List<FurnishingSet>>();
    final subscription = container.listen(
      furnishingSetBookmarkListViewModelProvider,
      (_, next) {
        final value = next.value;
        if (!completer.isCompleted && value != null && predicate(value)) {
          completer.complete(value);
        }
      },
    );
    addTearDown(subscription.close);
    return completer.future;
  }

  /// Bookmarks [setId] with an explicit timestamp, because the column default
  /// has second granularity and would not order two quick inserts reliably.
  Future<void> bookmarkAt(FurnishingSetId setId, DateTime createdAt) {
    return db.into(db.furnishingSetBookmarkTable).insert(
      FurnishingSetBookmarkCompanion.insert(
        setId: setId,
        createdAt: Value(createdAt),
      ),
    );
  }

  group("build", () {
    test("resolves the bookmarked ids against the asset data", () async {
      await db.setFurnishingSetBookmark("set_2", true);
      final container = createContainer();

      final result = await readSets(container);

      expect(result.single.id, "set_2");
      expect(result.single, same(sets["set_2"]));
    });

    test("emits an empty list when nothing is bookmarked", () async {
      final container = createContainer();

      expect(await readSets(container), isEmpty);
    });

    test("keeps the bookmarks in ascending creation order", () async {
      await bookmarkAt("set_3", DateTime(2024, 1, 3));
      await bookmarkAt("set_1", DateTime(2024, 1, 1));
      await bookmarkAt("set_2", DateTime(2024, 1, 2));
      final container = createContainer();

      final result = await readSets(container);

      expect(result.map((e) => e.id).toList(), ["set_1", "set_2", "set_3"]);
    });

    test("does not emit a set that is not bookmarked", () async {
      await db.setFurnishingSetBookmark("set_1", true);
      final container = createContainer();

      final result = await readSets(container);

      expect(result.map((e) => e.id), isNot(contains("set_2")));
    });
  });

  group("removeBookmark", () {
    test("removes only the given set", () async {
      await db.setFurnishingSetBookmark("set_1", true);
      await db.setFurnishingSetBookmark("set_2", true);
      final container = createContainer();
      await readSets(container);
      final notifier =
          container.read(furnishingSetBookmarkListViewModelProvider.notifier);

      await notifier.removeBookmark("set_1");

      final remaining = await db.select(db.furnishingSetBookmarkTable).get();
      expect(remaining.map((e) => e.setId), ["set_2"]);
    });

    test("restores the removed bookmark through the undo callback", () async {
      final createdAt = DateTime(2024, 5, 6);
      await bookmarkAt("set_1", createdAt);
      final container = createContainer();
      await readSets(container);
      final notifier =
          container.read(furnishingSetBookmarkListViewModelProvider.notifier);

      final undo = await notifier.removeBookmark("set_1");
      expect(await db.select(db.furnishingSetBookmarkTable).get(), isEmpty);
      await undo();

      final restored =
          (await db.select(db.furnishingSetBookmarkTable).get()).single;
      expect(restored.setId, "set_1");
      expect(restored.createdAt, createdAt);
    });

    test("makes the removed set disappear from the emitted list", () async {
      await bookmarkAt("set_1", DateTime(2024, 1, 1));
      await bookmarkAt("set_2", DateTime(2024, 1, 2));
      final container = createContainer();
      expect((await readSets(container)).map((e) => e.id), ["set_1", "set_2"]);
      final notifier =
          container.read(furnishingSetBookmarkListViewModelProvider.notifier);
      final next = nextEmissionWhere(container, (emitted) => emitted.length == 1);

      await notifier.removeBookmark("set_1");

      expect(await next, [sets["set_2"]]);
    });
  });
}
