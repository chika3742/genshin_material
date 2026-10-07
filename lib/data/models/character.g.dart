// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterAssetDefault _$CharacterAssetDefaultFromJson(
  Map<String, dynamic> json,
) => _CharacterAssetDefault(
  id: json['id'] as String,
  disableSync: json['disableSync'] as bool? ?? false,
  hyvIds: (json['hyvIds'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  name: LocalizedText.fromJson(json['name']),
  jaPronunciation: json['jaPronunciation'] as String,
  imageUrl: json['imageUrl'] as String,
  smallImageUrl: json['smallImageUrl'] as String,
  rarity: (json['rarity'] as num).toInt(),
  weaponType: json['weaponType'] as String,
  element: json['element'] as String,
  talents: (json['talents'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, CharacterTalent.fromJson(e as Map<String, dynamic>)),
  ),
  materials: (json['materials'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, MaterialRef.fromJson(e as String)),
  ),
  $type: json['runtimeType'] as String?,
);

_CharacterAssetGroup _$CharacterAssetGroupFromJson(Map<String, dynamic> json) =>
    _CharacterAssetGroup(
      id: json['id'] as String,
      hyvIds: (json['hyvIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      name: LocalizedText.fromJson(json['name']),
      jaPronunciation: json['jaPronunciation'] as String,
      imageUrl: json['imageUrl'] as String,
      smallImageUrl: json['smallImageUrl'] as String,
      rarity: (json['rarity'] as num).toInt(),
      weaponType: json['weaponType'] as String,
      variantIds: (json['variantIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      materials: (json['materials'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, MaterialRef.fromJson(e as String)),
      ),
      $type: json['runtimeType'] as String?,
    );

_CharacterAssetVariant _$CharacterAssetVariantFromJson(
  Map<String, dynamic> json,
) => _CharacterAssetVariant(
  id: json['id'] as String,
  disableSync: json['disableSync'] as bool? ?? false,
  parentId: json['parentId'] as String,
  name: LocalizedText.fromJson(json['name']),
  jaPronunciation: json['jaPronunciation'] as String,
  smallImageUrl: json['smallImageUrl'] as String,
  rarity: (json['rarity'] as num).toInt(),
  element: json['element'] as String,
  weaponType: json['weaponType'] as String,
  talents: (json['talents'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, CharacterTalent.fromJson(e as Map<String, dynamic>)),
  ),
  materials: (json['materials'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, MaterialRef.fromJson(e as String)),
  ),
  $type: json['runtimeType'] as String?,
);
