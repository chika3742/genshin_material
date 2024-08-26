// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListedCharacterImpl _$$ListedCharacterImplFromJson(
        Map<String, dynamic> json) =>
    _$ListedCharacterImpl(
      id: json['id'] as String,
      hyvIds: (json['hyvIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      jaPronunciation: json['jaPronunciation'] as String,
      imageUrl: json['imageUrl'] as String,
      smallImageUrl: json['smallImageUrl'] as String,
      rarity: (json['rarity'] as num).toInt(),
      weaponType: json['weaponType'] as String,
      element: json['element'] as String,
      talents: (json['talents'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, CharacterTalent.fromJson(e as Map<String, dynamic>)),
      ),
      materials: Map<String, String>.from(json['materials'] as Map),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ListedCharacterImplToJson(
        _$ListedCharacterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hyvIds': instance.hyvIds,
      'name': instance.name,
      'jaPronunciation': instance.jaPronunciation,
      'imageUrl': instance.imageUrl,
      'smallImageUrl': instance.smallImageUrl,
      'rarity': instance.rarity,
      'weaponType': instance.weaponType,
      'element': instance.element,
      'talents': instance.talents,
      'materials': instance.materials,
      'runtimeType': instance.$type,
    };

_$CharacterGroupImpl _$$CharacterGroupImplFromJson(Map<String, dynamic> json) =>
    _$CharacterGroupImpl(
      id: json['id'] as String,
      hyvIds: (json['hyvIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      jaPronunciation: json['jaPronunciation'] as String,
      imageUrl: json['imageUrl'] as String,
      smallImageUrl: json['smallImageUrl'] as String,
      rarity: (json['rarity'] as num).toInt(),
      weaponType: json['weaponType'] as String,
      variantIds: (json['variantIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      materials: Map<String, String>.from(json['materials'] as Map),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CharacterGroupImplToJson(
        _$CharacterGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hyvIds': instance.hyvIds,
      'name': instance.name,
      'jaPronunciation': instance.jaPronunciation,
      'imageUrl': instance.imageUrl,
      'smallImageUrl': instance.smallImageUrl,
      'rarity': instance.rarity,
      'weaponType': instance.weaponType,
      'variantIds': instance.variantIds,
      'materials': instance.materials,
      'runtimeType': instance.$type,
    };

_$CharacterVariantImpl _$$CharacterVariantImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterVariantImpl(
      id: json['id'] as String,
      parentId: json['parentId'] as String,
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      jaPronunciation: json['jaPronunciation'] as String,
      smallImageUrl: json['smallImageUrl'] as String,
      element: json['element'] as String,
      weaponType: json['weaponType'] as String,
      talents: (json['talents'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, CharacterTalent.fromJson(e as Map<String, dynamic>)),
      ),
      materials: Map<String, String>.from(json['materials'] as Map),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CharacterVariantImplToJson(
        _$CharacterVariantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'name': instance.name,
      'jaPronunciation': instance.jaPronunciation,
      'smallImageUrl': instance.smallImageUrl,
      'element': instance.element,
      'weaponType': instance.weaponType,
      'talents': instance.talents,
      'materials': instance.materials,
      'runtimeType': instance.$type,
    };

_$CharacterTalentImpl _$$CharacterTalentImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterTalentImpl(
      idList: (json['idList'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CharacterTalentImplToJson(
        _$CharacterTalentImpl instance) =>
    <String, dynamic>{
      'idList': instance.idList,
      'name': instance.name,
    };
