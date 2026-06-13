// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artifact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArtifactSet _$ArtifactSetFromJson(Map<String, dynamic> json) => _ArtifactSet(
  id: json['id'] as String,
  name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
  jaPronunciation: json['jaPronunciation'] as String,
  maxRarity: (json['maxRarity'] as num).toInt(),
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  consistsOf: Map<String, String>.from(json['consistsOf'] as Map),
  bonuses: (json['bonuses'] as List<dynamic>)
      .map((e) => ArtifactSetBonus.fromJson(e as Map<String, dynamic>))
      .toList(),
);

_ArtifactPiece _$ArtifactPieceFromJson(Map<String, dynamic> json) =>
    _ArtifactPiece(
      id: json['id'] as String,
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      jaPronunciation: json['jaPronunciation'] as String,
      parentId: json['parentId'] as String,
      type: json['type'] as String,
      imageUrl: json['imageUrl'] as String,
    );

_ArtifactSetBonus _$ArtifactSetBonusFromJson(Map<String, dynamic> json) =>
    _ArtifactSetBonus(
      type: json['type'] as String,
      description: LocalizedText.fromJson(
        json['description'] as Map<String, dynamic>,
      ),
    );

_ArtifactsMeta _$ArtifactsMetaFromJson(Map<String, dynamic> json) =>
    _ArtifactsMeta(
      stats: (json['stats'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, LocalizedText.fromJson(e as Map<String, dynamic>)),
      ),
      pieceTypes: (json['pieceTypes'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, ArtifactPieceType.fromJson(e as Map<String, dynamic>)),
      ),
      possibleSubStats: (json['possibleSubStats'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tags: ArtifactTagCategoriesInternal.fromJson(
        json['tags'] as Map<String, dynamic>,
      ),
    );

_ArtifactPieceType _$ArtifactPieceTypeFromJson(Map<String, dynamic> json) =>
    _ArtifactPieceType(
      id: json['id'] as String,
      desc: LocalizedText.fromJson(json['desc'] as Map<String, dynamic>),
      possibleMainStats: (json['possibleMainStats'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

_ArtifactStat _$ArtifactStatFromJson(Map<String, dynamic> json) =>
    _ArtifactStat(
      id: json['id'] as String,
      desc: LocalizedText.fromJson(json['desc'] as Map<String, dynamic>),
    );

_ArtifactTagCategoriesInternal _$ArtifactTagCategoriesInternalFromJson(
  Map<String, dynamic> json,
) => _ArtifactTagCategoriesInternal(
  categories: (json['categories'] as List<dynamic>)
      .map((e) => ArtifactTagCategory.fromJson(e as Map<String, dynamic>))
      .toList(),
);

_ArtifactTagCategory _$ArtifactTagCategoryFromJson(Map<String, dynamic> json) =>
    _ArtifactTagCategory(
      desc: LocalizedText.fromJson(json['desc'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => ArtifactTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_ArtifactTag _$ArtifactTagFromJson(Map<String, dynamic> json) => _ArtifactTag(
  id: json['id'] as String,
  desc: LocalizedText.fromJson(json['desc'] as Map<String, dynamic>),
);
