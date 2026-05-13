import "package:freezed_annotation/freezed_annotation.dart";

import "../core/asset_cache.dart";
import "bookmark.dart";
import "common.dart";
import "material.dart";

part "material_bookmark_frame.freezed.dart";

class MaterialCardMaterial {
  final String? id;
  final List<MaterialBookmarkFrame> levels;

  /// Sum of all quantities (non-exp items) or exps.
  final int sum;

  final bool isExp;

  MaterialCardMaterial({
    this.id,
    required List<MaterialBookmarkFrame> levels,
  }) : levels = List.unmodifiable(levels),
       sum = levels.fold<int>(
         0,
         (prev, level) => prev + switch (level) {
           MaterialBookmarkFrameNormal(:final quantity) => quantity,
           MaterialBookmarkFrameExp(:final exp) => exp,
         },
       ),
       isExp = levels.every((e) => e is MaterialBookmarkFrameExp) {
    assert(levels.isNotEmpty);
    assert(
      (id == null) == levels.every((l) => l is MaterialBookmarkFrameExp),
      "id must be null if and only if all levels are exp frames",
    );
  }

  factory MaterialCardMaterial.fromBookmarks(List<BookmarkWithMaterialDetails> bookmarks) {
    assert(bookmarks.isNotEmpty);

    return MaterialCardMaterial(
      id: bookmarks.first.item.materialId,
      levels: bookmarks.map((e) {
        if (e.item.materialId != null) {
          return MaterialBookmarkFrame(
            materialId: e.item.materialId!,
            level: e.item.upperLevel,
            quantity: e.item.quantity,
            purposeType: e.group.purposeType,
          );
        } else {
          return MaterialBookmarkFrame.exp(
            level: e.item.upperLevel,
            exp: e.item.quantity,
            purposeType: e.group.purposeType,
          );
        }
      }).toList(),
    );
  }

  Material getMaterial(AssetData assetData) => assetData.materials[id]!;

  int getSortPriority(AssetData assetData) {
    return isExp ? 0 : getMaterial(assetData).getSortPriority(assetData);
  }
}

@freezed
sealed class MaterialBookmarkFrame with _$MaterialBookmarkFrame {
  const factory MaterialBookmarkFrame({
    required String materialId,
    required int level,
    required int quantity,
    required Purpose purposeType,
  }) = MaterialBookmarkFrameNormal;

  const factory MaterialBookmarkFrame.exp({
    @Default(null) String? materialId,
    required int level,
    required int exp,
    @Default(Purpose.ascension) Purpose purposeType,
  }) = MaterialBookmarkFrameExp;
}

@freezed
sealed class MaterialUsage with _$MaterialUsage {
  const factory MaterialUsage({
    required String characterId,
    String? weaponId,
  }) = _MaterialUsage;
}
