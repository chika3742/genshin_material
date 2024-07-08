import "package:drift/drift.dart" hide JsonKey;
import "package:freezed_annotation/freezed_annotation.dart";

import "../core/asset_cache.dart";
import "../database.dart";
import "../utils/hash.dart";
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

  int? _sum;
  Material? _material;
  int? _sortPriority;

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
    if (_sortPriority != null) {
      return _sortPriority!;
    }

    if (isExp) {
      return -1;
    }

    final sortOrderMap = assetData.materialSortOrder;
    return _sortPriority = sortOrderMap["id:$id"] ?? sortOrderMap["category:${getMaterial(assetData).category}"] ?? 0;
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

  List<MaterialBookmarkCompanion> toCompanions(MaterialUsage usage) {
    return levels.map((level) {
      final companion = MaterialBookmarkCompanion.insert(
        materialId: Value.absentIfNull(id),
        characterId: usage.characterId,
        weaponId: Value(usage.weaponId),
        purposeType: level.purposeType,
        quantity: switch (level) {
          _MaterialBookmarkFrame(:final quantity) => quantity,
          MaterialBookmarkFrameExp(:final exp) => exp,
        },
        upperLevel: level.level,
        hash: combineMaterialBookmarkElements(
          usage.characterId,
          level.purposeType,
          usage.weaponId,
          id,
          level.level,
        ),
      );

      return companion;
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
class MaterialUsage with _$MaterialUsage {
  const factory MaterialUsage({
    required String characterId,
    String? weaponId,
  }) = _MaterialUsage;
}
