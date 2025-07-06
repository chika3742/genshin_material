// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artifact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArtifactSet _$ArtifactSetFromJson(Map<String, dynamic> json) => _ArtifactSet(
      id: json['id'] as String,
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      maxRarity: (json['maxRarity'] as num).toInt(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      consistsOf: (json['consistsOf'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, ArtifactPiece.fromJson(e as Map<String, dynamic>)),
      ),
      bonuses: (json['bonuses'] as List<dynamic>)
          .map((e) => ArtifactSetBonus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArtifactSetToJson(_ArtifactSet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'maxRarity': instance.maxRarity,
      'tags': instance.tags,
      'consistsOf': instance.consistsOf,
      'bonuses': instance.bonuses,
    };

_ArtifactPiece _$ArtifactPieceFromJson(Map<String, dynamic> json) =>
    _ArtifactPiece(
      id: json['id'] as String,
      type: json['type'] as String,
      imageUrl: json['imageUrl'] as String,
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArtifactPieceToJson(_ArtifactPiece instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
    };

_ArtifactSetBonus _$ArtifactSetBonusFromJson(Map<String, dynamic> json) =>
    _ArtifactSetBonus(
      type: json['type'] as String,
      description:
          LocalizedText.fromJson(json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArtifactSetBonusToJson(_ArtifactSetBonus instance) =>
    <String, dynamic>{
      'type': instance.type,
      'description': instance.description,
    };

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
      pieceSetMap: Map<String, String>.from(json['pieceSetMap'] as Map),
      tags: ArtifactTagCategoriesInternal.fromJson(
          json['tags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArtifactsMetaToJson(_ArtifactsMeta instance) =>
    <String, dynamic>{
      'stats': instance.stats,
      'pieceTypes': instance.pieceTypes,
      'possibleSubStats': instance.possibleSubStats,
      'pieceSetMap': instance.pieceSetMap,
      'tags': instance.tags,
    };

_ArtifactPieceType _$ArtifactPieceTypeFromJson(Map<String, dynamic> json) =>
    _ArtifactPieceType(
      id: json['id'] as String,
      desc: LocalizedText.fromJson(json['desc'] as Map<String, dynamic>),
      possibleMainStats: (json['possibleMainStats'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ArtifactPieceTypeToJson(_ArtifactPieceType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'desc': instance.desc,
      'possibleMainStats': instance.possibleMainStats,
    };

_ArtifactStat _$ArtifactStatFromJson(Map<String, dynamic> json) =>
    _ArtifactStat(
      id: json['id'] as String,
      desc: LocalizedText.fromJson(json['desc'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArtifactStatToJson(_ArtifactStat instance) =>
    <String, dynamic>{
      'id': instance.id,
      'desc': instance.desc,
    };

_ArtifactTagCategoriesInternal _$ArtifactTagCategoriesInternalFromJson(
        Map<String, dynamic> json) =>
    _ArtifactTagCategoriesInternal(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => ArtifactTagCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArtifactTagCategoriesInternalToJson(
        _ArtifactTagCategoriesInternal instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

_ArtifactTagCategory _$ArtifactTagCategoryFromJson(Map<String, dynamic> json) =>
    _ArtifactTagCategory(
      desc: LocalizedText.fromJson(json['desc'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => ArtifactTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArtifactTagCategoryToJson(
        _ArtifactTagCategory instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'items': instance.items,
    };

_ArtifactTag _$ArtifactTagFromJson(Map<String, dynamic> json) => _ArtifactTag(
      id: json['id'] as String,
      desc: LocalizedText.fromJson(json['desc'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArtifactTagToJson(_ArtifactTag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'desc': instance.desc,
    };
