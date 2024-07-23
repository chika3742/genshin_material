import "package:freezed_annotation/freezed_annotation.dart";

import "common.dart";
import "localized_text.dart";

part "artifact.freezed.dart";
part "artifact.g.dart";

@freezed
class ArtifactSet with _$ArtifactSet {
  const factory ArtifactSet({
    required String id,
    required LocalizedText name,
    required int maxRarity,
    required List<ArtifactPiece> consistsOf,
    required List<ArtifactSetBonus> bonuses,
  }) = _ArtifactSet;

  factory ArtifactSet.fromJson(Map<String, dynamic> json) =>
      _$ArtifactSetFromJson(json);
}

@freezed
class ArtifactPiece with _$ArtifactPiece, ImageGetter {
  const ArtifactPiece._();

  const factory ArtifactPiece({
    required String id,
    required ArtifactPieceTypeId type,
    required String imageUrl,
    required LocalizedText name,
  }) = _ArtifactPiece;

  factory ArtifactPiece.fromJson(Map<String, dynamic> json) =>
      _$ArtifactPieceFromJson(json);
}

@freezed
class ArtifactSetBonus with _$ArtifactSetBonus {
  const factory ArtifactSetBonus({
    required String type,
    required LocalizedText description,
  }) = _ArtifactSetBonus;

  factory ArtifactSetBonus.fromJson(Map<String, dynamic> json) =>
      _$ArtifactSetBonusFromJson(json);
}

@freezed
class ArtifactsMeta with _$ArtifactsMeta {
  const factory ArtifactsMeta({
    required Map<ArtifactStatId, LocalizedText> stats,
    required Map<ArtifactPieceTypeId, ArtifactPieceType> pieceTypes,
    required List<ArtifactStatId> possibleSubStats,
  }) = _ArtifactsMeta;

  factory ArtifactsMeta.fromJson(Map<String, dynamic> json) =>
      _$ArtifactsMetaFromJson(json);
}

@freezed
class ArtifactPieceType with _$ArtifactPieceType {
  const factory ArtifactPieceType({
    required LocalizedText desc,
    required List<ArtifactStatId> possibleMainStats,
  }) = _ArtifactPieceType;

  factory ArtifactPieceType.fromJson(Map<String, dynamic> json) =>
      _$ArtifactPieceTypeFromJson(json);
}

@freezed
class ArtifactStat with _$ArtifactStat {
  const factory ArtifactStat({
    required ArtifactStatId id,
    required LocalizedText desc,
  }) = _ArtifactStat;

  factory ArtifactStat.fromJson(Map<String, dynamic> json) =>
      _$ArtifactStatFromJson(json);
}
