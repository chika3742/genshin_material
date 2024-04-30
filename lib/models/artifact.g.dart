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
          .map((e) => ArtifactBonus.fromJson(e as Map<String, dynamic>))
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

_$ArtifactBonusImpl _$$ArtifactBonusImplFromJson(Map<String, dynamic> json) =>
    _$ArtifactBonusImpl(
      type: json['type'] as String,
      description:
          LocalizedText.fromJson(json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ArtifactBonusImplToJson(_$ArtifactBonusImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'description': instance.description,
    };

_$ArtifactsMetaImpl _$$ArtifactsMetaImplFromJson(Map<String, dynamic> json) =>
    _$ArtifactsMetaImpl(
      pieceTypes: (json['pieceTypes'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, LocalizedText.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$ArtifactsMetaImplToJson(_$ArtifactsMetaImpl instance) =>
    <String, dynamic>{
      'pieceTypes': instance.pieceTypes,
    };
