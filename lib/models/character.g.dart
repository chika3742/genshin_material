// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListedCharacter _$ListedCharacterFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListedCharacter', json, ($checkedConvert) {
      final val = ListedCharacter(
        id: $checkedConvert('id', (v) => v as String),
        disableSync: $checkedConvert('disableSync', (v) => v as bool? ?? false),
        hyvIds: $checkedConvert(
          'hyvIds',
          (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
        ),
        name: $checkedConvert('name', (v) => LocalizedText.fromJson(v)),
        jaPronunciation: $checkedConvert('jaPronunciation', (v) => v as String),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String),
        smallImageUrl: $checkedConvert('smallImageUrl', (v) => v as String),
        rarity: $checkedConvert('rarity', (v) => (v as num).toInt()),
        weaponType: $checkedConvert('weaponType', (v) => v as String),
        element: $checkedConvert('element', (v) => v as String),
        talents: $checkedConvert(
          'talents',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) => MapEntry(
              k,
              CharacterTalent.fromJson(e as Map<String, dynamic>),
            ),
          ),
        ),
        materials: $checkedConvert(
          'materials',
          (v) => Map<String, String>.from(v as Map),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

CharacterGroup _$CharacterGroupFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CharacterGroup', json, ($checkedConvert) {
      final val = CharacterGroup(
        id: $checkedConvert('id', (v) => v as String),
        hyvIds: $checkedConvert(
          'hyvIds',
          (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
        ),
        name: $checkedConvert('name', (v) => LocalizedText.fromJson(v)),
        jaPronunciation: $checkedConvert('jaPronunciation', (v) => v as String),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String),
        smallImageUrl: $checkedConvert('smallImageUrl', (v) => v as String),
        rarity: $checkedConvert('rarity', (v) => (v as num).toInt()),
        weaponType: $checkedConvert('weaponType', (v) => v as String),
        variantIds: $checkedConvert(
          'variantIds',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        materials: $checkedConvert(
          'materials',
          (v) => Map<String, String>.from(v as Map),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

CharacterVariant _$CharacterVariantFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CharacterVariant', json, ($checkedConvert) {
      final val = CharacterVariant(
        id: $checkedConvert('id', (v) => v as String),
        disableSync: $checkedConvert('disableSync', (v) => v as bool? ?? false),
        parentId: $checkedConvert('parentId', (v) => v as String),
        name: $checkedConvert('name', (v) => LocalizedText.fromJson(v)),
        jaPronunciation: $checkedConvert('jaPronunciation', (v) => v as String),
        smallImageUrl: $checkedConvert('smallImageUrl', (v) => v as String),
        rarity: $checkedConvert('rarity', (v) => (v as num).toInt()),
        element: $checkedConvert('element', (v) => v as String),
        weaponType: $checkedConvert('weaponType', (v) => v as String),
        talents: $checkedConvert(
          'talents',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) => MapEntry(
              k,
              CharacterTalent.fromJson(e as Map<String, dynamic>),
            ),
          ),
        ),
        materials: $checkedConvert(
          'materials',
          (v) => Map<String, String>.from(v as Map),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

_CharacterTalent _$CharacterTalentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CharacterTalent', json, ($checkedConvert) {
      final val = _CharacterTalent(
        idList: $checkedConvert(
          'idList',
          (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
        ),
        name: $checkedConvert('name', (v) => LocalizedText.fromJson(v)),
      );
      return val;
    });
