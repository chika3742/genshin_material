// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterGroupImpl _$$CharacterGroupImplFromJson(Map<String, dynamic> json) =>
    _$CharacterGroupImpl(
      id: json['id'] as String,
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      jaPronunciation: json['jaPronunciation'] as String,
      rarity: json['rarity'] as int,
      weaponType: $enumDecode(_$WeaponTypeEnumMap, json['weaponType']),
      variantIds: (json['variantIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CharacterGroupImplToJson(
        _$CharacterGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'jaPronunciation': instance.jaPronunciation,
      'rarity': instance.rarity,
      'weaponType': _$WeaponTypeEnumMap[instance.weaponType]!,
      'variantIds': instance.variantIds,
      'runtimeType': instance.$type,
    };

const _$WeaponTypeEnumMap = {
  WeaponType.sword: 'sword',
  WeaponType.claymore: 'claymore',
  WeaponType.polearm: 'polearm',
  WeaponType.bow: 'bow',
  WeaponType.catalyst: 'catalyst',
};

_$ListedCharacterImpl _$$ListedCharacterImplFromJson(
        Map<String, dynamic> json) =>
    _$ListedCharacterImpl(
      id: json['id'] as String,
      rid: json['rid'] as String,
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      jaPronunciation: json['jaPronunciation'] as String,
      rarity: json['rarity'] as int,
      weaponType: $enumDecode(_$WeaponTypeEnumMap, json['weaponType']),
      element: $enumDecode(_$TeyvatElementEnumMap, json['element']),
      materials: CharacterMaterialDefinitions.fromJson(
          json['materials'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ListedCharacterImplToJson(
        _$ListedCharacterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rid': instance.rid,
      'name': instance.name,
      'jaPronunciation': instance.jaPronunciation,
      'rarity': instance.rarity,
      'weaponType': _$WeaponTypeEnumMap[instance.weaponType]!,
      'element': _$TeyvatElementEnumMap[instance.element]!,
      'materials': instance.materials,
      'runtimeType': instance.$type,
    };

const _$TeyvatElementEnumMap = {
  TeyvatElement.pyro: 'pyro',
  TeyvatElement.cryo: 'cryo',
  TeyvatElement.hydro: 'hydro',
  TeyvatElement.electro: 'electro',
  TeyvatElement.anemo: 'anemo',
  TeyvatElement.geo: 'geo',
  TeyvatElement.dendro: 'dendro',
};

_$UnlistedCharacterImpl _$$UnlistedCharacterImplFromJson(
        Map<String, dynamic> json) =>
    _$UnlistedCharacterImpl(
      id: json['id'] as String,
      rid: json['rid'] as String,
      parentId: json['parentId'] as String,
      name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
      jaPronunciation: json['jaPronunciation'] as String,
      rarity: json['rarity'] as int,
      weaponType: $enumDecode(_$WeaponTypeEnumMap, json['weaponType']),
      element: $enumDecode(_$TeyvatElementEnumMap, json['element']),
      materials: CharacterMaterialDefinitions.fromJson(
          json['materials'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnlistedCharacterImplToJson(
        _$UnlistedCharacterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rid': instance.rid,
      'parentId': instance.parentId,
      'name': instance.name,
      'jaPronunciation': instance.jaPronunciation,
      'rarity': instance.rarity,
      'weaponType': _$WeaponTypeEnumMap[instance.weaponType]!,
      'element': _$TeyvatElementEnumMap[instance.element]!,
      'materials': instance.materials,
      'runtimeType': instance.$type,
    };

_$CharacterMaterialDefinitionsImpl _$$CharacterMaterialDefinitionsImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterMaterialDefinitionsImpl(
      primary: json['primary'] as String,
      elementalStone: json['elementalStone'] as String,
      local: json['local'] as String,
      secondary: json['secondary'] as String,
      talentPrimary: json['talentPrimary'] as String,
      talentBoss: json['talentBoss'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CharacterMaterialDefinitionsImplToJson(
        _$CharacterMaterialDefinitionsImpl instance) =>
    <String, dynamic>{
      'primary': instance.primary,
      'elementalStone': instance.elementalStone,
      'local': instance.local,
      'secondary': instance.secondary,
      'talentPrimary': instance.talentPrimary,
      'talentBoss': instance.talentBoss,
      'runtimeType': instance.$type,
    };

_$TravelerAscensionMaterialDefinitionsImpl
    _$$TravelerAscensionMaterialDefinitionsImplFromJson(
            Map<String, dynamic> json) =>
        _$TravelerAscensionMaterialDefinitionsImpl(
          primary: json['primary'] as String,
          local: json['local'] as String,
          secondary: json['secondary'] as String,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$TravelerAscensionMaterialDefinitionsImplToJson(
        _$TravelerAscensionMaterialDefinitionsImpl instance) =>
    <String, dynamic>{
      'primary': instance.primary,
      'local': instance.local,
      'secondary': instance.secondary,
      'runtimeType': instance.$type,
    };

_$TravelerTalentMaterialDefinitionsImpl
    _$$TravelerTalentMaterialDefinitionsImplFromJson(
            Map<String, dynamic> json) =>
        _$TravelerTalentMaterialDefinitionsImpl(
          talentPrimary: MaterialIdPerType.fromJson(
              json['talentPrimary'] as Map<String, dynamic>),
          talentSecondary: MaterialIdPerType.fromJson(
              json['talentSecondary'] as Map<String, dynamic>),
          talentBoss: MaterialIdPerType.fromJson(
              json['talentBoss'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$TravelerTalentMaterialDefinitionsImplToJson(
        _$TravelerTalentMaterialDefinitionsImpl instance) =>
    <String, dynamic>{
      'talentPrimary': instance.talentPrimary,
      'talentSecondary': instance.talentSecondary,
      'talentBoss': instance.talentBoss,
      'runtimeType': instance.$type,
    };

_$MaterialIdPerTypeImpl _$$MaterialIdPerTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialIdPerTypeImpl(
      types: (json['types'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$TalentTypeEnumMap, k), e as String),
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MaterialIdPerTypeImplToJson(
        _$MaterialIdPerTypeImpl instance) =>
    <String, dynamic>{
      'types':
          instance.types.map((k, e) => MapEntry(_$TalentTypeEnumMap[k]!, e)),
      'runtimeType': instance.$type,
    };

const _$TalentTypeEnumMap = {
  TalentType.normal: 'normal',
  TalentType.skill: 'skill',
  TalentType.burst: 'burst',
};

_$MaterialIdPerLevelPerTypeImpl _$$MaterialIdPerLevelPerTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialIdPerLevelPerTypeImpl(
      types: (json['types'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$TalentTypeEnumMap, k),
            MaterialIdPerLevel.fromJson(e as Map<String, dynamic>)),
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MaterialIdPerLevelPerTypeImplToJson(
        _$MaterialIdPerLevelPerTypeImpl instance) =>
    <String, dynamic>{
      'types':
          instance.types.map((k, e) => MapEntry(_$TalentTypeEnumMap[k]!, e)),
      'runtimeType': instance.$type,
    };

_$MaterialIdPerLevelImpl _$$MaterialIdPerLevelImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialIdPerLevelImpl(
      levels: (json['levels'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
    );

Map<String, dynamic> _$$MaterialIdPerLevelImplToJson(
        _$MaterialIdPerLevelImpl instance) =>
    <String, dynamic>{
      'levels': instance.levels.map((k, e) => MapEntry(k.toString(), e)),
    };
