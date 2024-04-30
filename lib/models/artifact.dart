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
    required List<ArtifactBonus> bonuses,
  }) = _ArtifactSet;

  factory ArtifactSet.fromJson(Map<String, dynamic> json) =>
      _$ArtifactSetFromJson(json);
}

@freezed
class ArtifactPiece with _$ArtifactPiece, ImageGetter {
  const ArtifactPiece._();

  const factory ArtifactPiece({
    required String id,
    required ArtifactPieceType type,
    required String imageUrl,
    required LocalizedText name,
  }) = _ArtifactPiece;

  factory ArtifactPiece.fromJson(Map<String, dynamic> json) =>
      _$ArtifactPieceFromJson(json);
}

@freezed
class ArtifactBonus with _$ArtifactBonus {
  const factory ArtifactBonus({
    required String type,
    required LocalizedText description,
  }) = _ArtifactBonus;

  factory ArtifactBonus.fromJson(Map<String, dynamic> json) =>
      _$ArtifactBonusFromJson(json);
}

@freezed
class ArtifactsMeta with _$ArtifactsMeta {
  const factory ArtifactsMeta({
    required Map<ArtifactPieceType, LocalizedText> pieceTypes,
  }) = _ArtifactsMeta;

  factory ArtifactsMeta.fromJson(Map<String, dynamic> json) =>
      _$ArtifactsMetaFromJson(json);
}
