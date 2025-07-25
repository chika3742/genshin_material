import "package:freezed_annotation/freezed_annotation.dart";

import "../core/asset_cache.dart";
import "common.dart";
import "localized_text.dart";

part "artifact.freezed.dart";
part "artifact.g.dart";

@freezed
sealed class ArtifactSet with _$ArtifactSet {
  const factory ArtifactSet({
    required String id,
    required LocalizedText name,
    required int maxRarity,
    List<String>? tags,
    required Map<ArtifactPieceId, ArtifactPiece> consistsOf,
    required List<ArtifactSetBonus> bonuses,
  }) = _ArtifactSet;

  factory ArtifactSet.fromJson(Map<String, dynamic> json) =>
      _$ArtifactSetFromJson(json);
}

@freezed
sealed class ArtifactPiece with _$ArtifactPiece, ImageGetter {
  const ArtifactPiece._();

  const factory ArtifactPiece({
    required String id,
    required ArtifactPieceTypeId type,
    required String imageUrl,
    required LocalizedText name,
  }) = _ArtifactPiece;

  factory ArtifactPiece.fromJson(Map<String, dynamic> json) =>
      _$ArtifactPieceFromJson(json);

  static ArtifactPiece fromId(ArtifactPieceId id, AssetData assetData) {
    final setId = assetData.artifactPieceSetMap[id];
    if (setId == null) {
      throw StateError("No mapping found for artifact piece $id");
    }

    final set = assetData.artifactSets[setId];
    if (set == null) {
      throw StateError("No artifact set found for $setId");
    }

    final piece = set.consistsOf[id];
    if (piece == null) {
      throw StateError("No artifact piece found for $id");
    }

    return piece;
  }
}

@freezed
sealed class ArtifactSetBonus with _$ArtifactSetBonus {
  const factory ArtifactSetBonus({
    required String type,
    required LocalizedText description,
  }) = _ArtifactSetBonus;

  factory ArtifactSetBonus.fromJson(Map<String, dynamic> json) =>
      _$ArtifactSetBonusFromJson(json);
}

@freezed
sealed class ArtifactsMeta with _$ArtifactsMeta {
  const factory ArtifactsMeta({
    required Map<StatId, LocalizedText> stats,
    required Map<ArtifactPieceTypeId, ArtifactPieceType> pieceTypes,
    required List<StatId> possibleSubStats,
    required Map<ArtifactPieceId, ArtifactSetId> pieceSetMap,
    required ArtifactTagCategoriesInternal tags,
  }) = _ArtifactsMeta;

  factory ArtifactsMeta.fromJson(Map<String, dynamic> json) =>
      _$ArtifactsMetaFromJson(json);
}

@freezed
sealed class ArtifactPieceType with _$ArtifactPieceType {
  const factory ArtifactPieceType({
    required ArtifactPieceTypeId id,
    required LocalizedText desc,
    required List<StatId> possibleMainStats,
  }) = _ArtifactPieceType;

  factory ArtifactPieceType.fromJson(Map<String, dynamic> json) =>
      _$ArtifactPieceTypeFromJson(json);
}

@freezed
sealed class ArtifactStat with _$ArtifactStat {
  const factory ArtifactStat({
    required StatId id,
    required LocalizedText desc,
  }) = _ArtifactStat;

  factory ArtifactStat.fromJson(Map<String, dynamic> json) =>
      _$ArtifactStatFromJson(json);
}

@freezed
sealed class ArtifactTagCategoriesInternal with _$ArtifactTagCategoriesInternal {
  const factory ArtifactTagCategoriesInternal({
    required List<ArtifactTagCategory> categories,
  }) = _ArtifactTagCategoriesInternal;

  factory ArtifactTagCategoriesInternal.fromJson(Map<String, dynamic> json) =>
      _$ArtifactTagCategoriesInternalFromJson(json);
}

@freezed
sealed class ArtifactTagCategory with _$ArtifactTagCategory {
  const factory ArtifactTagCategory({
    required LocalizedText desc,
    required List<ArtifactTag> items,
  }) = _ArtifactTagCategory;

  factory ArtifactTagCategory.fromJson(Map<String, dynamic> json) =>
      _$ArtifactTagCategoryFromJson(json);
}

@freezed
sealed class ArtifactTag with _$ArtifactTag {
  const factory ArtifactTag({
    required String id,
    required LocalizedText desc,
  }) = _ArtifactTag;

  factory ArtifactTag.fromJson(Map<String, dynamic> json) =>
      _$ArtifactTagFromJson(json);
}
