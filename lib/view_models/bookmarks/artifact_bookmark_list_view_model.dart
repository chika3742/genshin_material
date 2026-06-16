import "package:drift/drift.dart";
import "package:fractional_indexing/fractional_indexing.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../providers/database_provider.dart";

part "artifact_bookmark_list_view_model.g.dart";
part "artifact_bookmark_list_view_model.freezed.dart";

@riverpod
class ArtifactBookmarkListViewModel extends _$ArtifactBookmarkListViewModel {
  @override
  Stream<List<ArtifactBookmarkItemState>> build() {
    final db = ref.watch(appDatabaseProvider);

    return db.managers.bookmarkArtifactTable.withReferences((prefetch) => prefetch(
      bookmarkArtifactPieceTableRefs: true,
      bookmarkArtifactSetTableRefs: true,
    )).orderBy((o) => o.orderIndex.asc()).watch().map((data) => data.map((e) {
      final common = e.$1;
      final piece = e.$2.bookmarkArtifactPieceTableRefs.prefetchedData?.firstOrNull;
      final set = e.$2.bookmarkArtifactSetTableRefs.prefetchedData?.firstOrNull;
      if (piece != null) {
        return ArtifactBookmarkItemState.piece(
          id: common.id,
          characterId: common.characterId,
          orderIndex: common.orderIndex,
          piece: piece.piece,
          mainStat: piece.mainStat,
          subStats: common.subStats,
        );
      }
      if (set != null) {
        return ArtifactBookmarkItemState.set(
          id: common.id,
          characterId: common.characterId,
          orderIndex: common.orderIndex,
          sets: set.sets,
          mainStats: set.mainStats,
          subStats: common.subStats,
        );
      }
      throw StateError("Invalid row");
    }).toList());
  }

  Future<void> removeBookmark(int id) {
    final db = ref.read(appDatabaseProvider);
    return db.managers.bookmarkArtifactTable.filter((f) => f.id.equals(id))
        .delete();
  }

  Future<void> reorder(int oldIndex, int newIndex) async {
    if (!state.hasValue) {
      return;
    }

    final newState = [...state.requireValue];
    final item = newState.removeAt(oldIndex);
    newState.insert(newIndex, item);

    state = AsyncData(newState);

    final previousItem = newIndex - 1 >= 0 ? newState[newIndex - 1] : null;
    final nextItem = newIndex + 1 < newState.length ? newState[newIndex + 1] : null;
    final newOrderIndex = FractionalIndexer.generateKeyBetween(
      previousItem?.orderIndex,
      nextItem?.orderIndex,
    )!;

    final db = ref.read(appDatabaseProvider);
    await db.managers.bookmarkArtifactTable.filter((f) => f.id.equals(item.id))
        .update((o) => o(orderIndex: Value(newOrderIndex)));
  }
}

@freezed
sealed class ArtifactBookmarkItemState with _$ArtifactBookmarkItemState {
  const factory ArtifactBookmarkItemState.set({
    required int id,
    required String characterId,
    required String orderIndex,
    required List<String> sets,
    required Map<String, String?> mainStats,
    required List<String> subStats,
  }) = ArtifactSetBookmarkItemState;

  const factory ArtifactBookmarkItemState.piece({
    required int id,
    required String characterId,
    required String orderIndex,
    required String piece,
    required String? mainStat,
    required List<String> subStats,
  }) = ArtifactPieceBookmarkItemState;
}
