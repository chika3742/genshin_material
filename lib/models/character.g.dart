// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListedCharacter _$ListedCharacterFromJson(Map<String, dynamic> json) =>
    ListedCharacter(
      id: json['id'] as String,
      disableSync: json['disableSync'] as bool? ?? false,
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

Map<String, dynamic> _$ListedCharacterToJson(ListedCharacter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'disableSync': instance.disableSync,
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

CharacterGroup _$CharacterGroupFromJson(Map<String, dynamic> json) =>
    CharacterGroup(
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

Map<String, dynamic> _$CharacterGroupToJson(CharacterGroup instance) =>
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

CharacterVariant _$CharacterVariantFromJson(Map<String, dynamic> json) =>
    CharacterVariant(
      id: json['id'] as String,
      disableSync: json['disableSync'] as bool? ?? false,
      parentId: json['parentId'] as String,
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      jaPronunciation: json['jaPronunciation'] as String,
      smallImageUrl: json['smallImageUrl'] as String,
      rarity: (json['rarity'] as num).toInt(),
      element: json['element'] as String,
      weaponType: json['weaponType'] as String,
      talents: (json['talents'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, CharacterTalent.fromJson(e as Map<String, dynamic>)),
      ),
      materials: Map<String, String>.from(json['materials'] as Map),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CharacterVariantToJson(CharacterVariant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'disableSync': instance.disableSync,
      'parentId': instance.parentId,
      'name': instance.name,
      'jaPronunciation': instance.jaPronunciation,
      'smallImageUrl': instance.smallImageUrl,
      'rarity': instance.rarity,
      'element': instance.element,
      'weaponType': instance.weaponType,
      'talents': instance.talents,
      'materials': instance.materials,
      'runtimeType': instance.$type,
    };

_CharacterTalent _$CharacterTalentFromJson(Map<String, dynamic> json) =>
    _CharacterTalent(
      idList: (json['idList'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharacterTalentToJson(_CharacterTalent instance) =>
    <String, dynamic>{
      'idList': instance.idList,
      'name': instance.name,
    };
