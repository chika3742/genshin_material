import "package:freezed_annotation/freezed_annotation.dart";

import "../core/asset_cache.dart";
import "../database.dart";
import "../utils/hash.dart";
import "bookmark.dart";
import "common.dart";
import "material.dart";

part "material_bookmark_frame.freezed.dart";

class MaterialCardMaterial {
  final String? id;
  final List<MaterialBookmarkFrame> levels;

  MaterialCardMaterial({
    this.id,
    required this.levels,
  });

  factory MaterialCardMaterial.fromBookmarks(List<BookmarkMaterialDetails> details) {
    assert(details.isNotEmpty);

    return MaterialCardMaterial(
      id: details.first.materialId,
      levels: details.map((e) {
        if (e.materialId != null) {
          return MaterialBookmarkFrame(
            materialId: e.materialId!,
            level: e.upperLevel,
            quantity: e.quantity,
            purposeType: e.purposeType,
          );
        } else {
          return MaterialBookmarkFrame.exp(
            level: e.upperLevel,
            exp: e.quantity,
            purposeType: e.purposeType,
          );
        }
      }).toList(),
    );
  }

  int? _sum;
  Material? _material;

  /// Sum of all quantities (non-exp items) or exps.
  int get sum => _sum ??= levels.fold<int>(
        0,
        (prev, level) =>
            prev +
            switch (level) {
              _MaterialBookmarkFrame(:final quantity) => quantity,
              MaterialBookmarkFrameExp(:final exp) => exp,
            },
      );

  bool get isExp => levels.every((e) => e is MaterialBookmarkFrameExp);

  Material getMaterial(AssetData assetData) {
    if (_material != null) {
      return _material!;
    }

    final result = assetData.materials[id];
    if (result == null) {
      throw "Material not found for id: $id";
    }
    return _material = result;
  }

  int getSortPriority(AssetData assetData) {
    return isExp ? 0 : getMaterial(assetData).getSortPriority(assetData);
  }

  List<String> getHashList(MaterialUsage usage) {
    return levels.map((level) {
      return combineMaterialBookmarkElements(
        usage.characterId,
        level.purposeType,
        usage.weaponId,
        id,
        level.level,
      );
    }).toList();
  }

  List<MaterialBookmarkInsertable> toCompanions(MaterialUsage usage) {
    return levels.map((level) {
      return MaterialBookmarkInsertable(
        characterId: usage.characterId,
        materialId: id,
        weaponId: usage.weaponId,
        purposeType: level.purposeType,
        quantity: switch (level) {
          _MaterialBookmarkFrame(:final quantity) => quantity,
          MaterialBookmarkFrameExp(:final exp) => exp,
        },
        upperLevel: level.level,
      );
    }).toList();
  }
}

@freezed
sealed class MaterialBookmarkFrame with _$MaterialBookmarkFrame {
  const factory MaterialBookmarkFrame({
    required String materialId,
    required int level,
    required int quantity,
    required Purpose purposeType,
  }) = _MaterialBookmarkFrame;

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
