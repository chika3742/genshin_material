// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artifact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtifactSetImpl _$$ArtifactSetImplFromJson(Map<String, dynamic> json) =>
    _$ArtifactSetImpl(
      id: json['id'] as String,
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      maxRarity: json['maxRarity'] as int,
      consistsOf: (json['consistsOf'] as List<dynamic>)
          .map((e) => ArtifactPiece.fromJson(e as Map<String, dynamic>))
          .toList(),
      bonuses: (json['bonuses'] as List<dynamic>)
          .map((e) => ArtifactSetBonus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ArtifactSetImplToJson(_$ArtifactSetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'maxRarity': instance.maxRarity,
      'consistsOf': instance.consistsOf,
      'bonuses': instance.bonuses,
    };

_$ArtifactPieceImpl _$$ArtifactPieceImplFromJson(Map<String, dynamic> json) =>
    _$ArtifactPieceImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      imageUrl: json['imageUrl'] as String,
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ArtifactPieceImplToJson(_$ArtifactPieceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
    };

_$ArtifactSetBonusImpl _$$ArtifactSetBonusImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtifactSetBonusImpl(
      type: json['type'] as String,
      description:
          LocalizedText.fromJson(json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ArtifactSetBonusImplToJson(
        _$ArtifactSetBonusImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'description': instance.description,
    };

_$ArtifactsMetaImpl _$$ArtifactsMetaImplFromJson(Map<String, dynamic> json) =>
    _$ArtifactsMetaImpl(
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
    );

Map<String, dynamic> _$$ArtifactsMetaImplToJson(_$ArtifactsMetaImpl instance) =>
    <String, dynamic>{
      'stats': instance.stats,
      'pieceTypes': instance.pieceTypes,
      'possibleSubStats': instance.possibleSubStats,
    };

_$ArtifactPieceTypeImpl _$$ArtifactPieceTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtifactPieceTypeImpl(
      desc: LocalizedText.fromJson(json['desc'] as Map<String, dynamic>),
      possibleMainStats: (json['possibleMainStats'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ArtifactPieceTypeImplToJson(
        _$ArtifactPieceTypeImpl instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'possibleMainStats': instance.possibleMainStats,
    };

_$ArtifactStatImpl _$$ArtifactStatImplFromJson(Map<String, dynamic> json) =>
    _$ArtifactStatImpl(
      id: json['id'] as String,
      desc: LocalizedText.fromJson(json['desc'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ArtifactStatImplToJson(_$ArtifactStatImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'desc': instance.desc,
    };
