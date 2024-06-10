// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListedCharacterImpl _$$ListedCharacterImplFromJson(
        Map<String, dynamic> json) =>
    _$ListedCharacterImpl(
      id: json['id'] as String,
      rid: json['rid'] as String,
      hyvId: json['hyvId'] as int,
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      jaPronunciation: json['jaPronunciation'] as String,
      imageUrl: json['imageUrl'] as String,
      smallImageUrl: json['smallImageUrl'] as String,
      rarity: json['rarity'] as int,
      weaponType: json['weaponType'] as String,
      element: json['element'] as String,
      talents: (json['talents'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, LocalizedText.fromJson(e as Map<String, dynamic>)),
      ),
      materials: Map<String, String>.from(json['materials'] as Map),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ListedCharacterImplToJson(
        _$ListedCharacterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rid': instance.rid,
      'hyvId': instance.hyvId,
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
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      jaPronunciation: json['jaPronunciation'] as String,
      imageUrl: json['imageUrl'] as String,
      rarity: json['rarity'] as int,
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
      'name': instance.name,
      'jaPronunciation': instance.jaPronunciation,
      'imageUrl': instance.imageUrl,
      'rarity': instance.rarity,
      'weaponType': instance.weaponType,
      'variantIds': instance.variantIds,
      'materials': instance.materials,
      'runtimeType': instance.$type,
    };

_$UnlistedCharacterImpl _$$UnlistedCharacterImplFromJson(
        Map<String, dynamic> json) =>
    _$UnlistedCharacterImpl(
      id: json['id'] as String,
      rid: json['rid'] as String,
      hyvId: json['hyvId'] as int,
      parentId: json['parentId'] as String,
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      jaPronunciation: json['jaPronunciation'] as String,
      smallImageUrl: json['smallImageUrl'] as String,
      rarity: json['rarity'] as int,
      weaponType: json['weaponType'] as String,
      element: json['element'] as String,
      talents: (json['talents'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, LocalizedText.fromJson(e as Map<String, dynamic>)),
      ),
      materials: Map<String, String>.from(json['materials'] as Map),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnlistedCharacterImplToJson(
        _$UnlistedCharacterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rid': instance.rid,
      'hyvId': instance.hyvId,
      'parentId': instance.parentId,
      'name': instance.name,
      'jaPronunciation': instance.jaPronunciation,
      'smallImageUrl': instance.smallImageUrl,
      'rarity': instance.rarity,
      'weaponType': instance.weaponType,
      'element': instance.element,
      'talents': instance.talents,
      'materials': instance.materials,
      'runtimeType': instance.$type,
    };
