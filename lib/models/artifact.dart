import "package:freezed_annotation/freezed_annotation.dart";

import "../core/asset_cache.dart";
import "common.dart";
import "localized_text.dart";

part "artifact.freezed.dart";
part "artifact.g.dart";

sealed class ArtifactSetOrPiece implements Searchable {
  String get id;
  @override
  LocalizedText get name;
  @override
  String get jaPronunciation;

  const ArtifactSetOrPiece();
}

@freezed
sealed class ArtifactSet extends ArtifactSetOrPiece with _$ArtifactSet {
  const ArtifactSet._();

  const factory ArtifactSet({
    required String id,
    required LocalizedText name,
    required String jaPronunciation,
    required int maxRarity,
    List<String>? tags,
    required Map<ArtifactPieceTypeId, ArtifactPieceId> consistsOf,
    required List<ArtifactSetBonus> bonuses,
  }) = _ArtifactSet;

  factory ArtifactSet.fromJson(Map<String, dynamic> json) =>
      _$ArtifactSetFromJson(json);

  ArtifactPiece getFirstPiece(AssetData assetData) {
    final firstPieceId = consistsOf.values.first;
    return assetData.artifactPieces[firstPieceId]!;
  }
}

@freezed
sealed class ArtifactPiece extends ArtifactSetOrPiece with _$ArtifactPiece, ImageGetter {
  const ArtifactPiece._();

  const factory ArtifactPiece({
    required String id,
    required LocalizedText name,
    required String jaPronunciation,
    required String parentId,
    required ArtifactPieceTypeId type,
    required String imageUrl,
  }) = _ArtifactPiece;

  factory ArtifactPiece.fromJson(Map<String, dynamic> json) =>
      _$ArtifactPieceFromJson(json);
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
