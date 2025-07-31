import "dart:io";

import "package:freezed_annotation/freezed_annotation.dart";
import "package:path/path.dart" as path;

import "../main.dart";
import "common.dart";
import "localized_text.dart";

part "character.freezed.dart";
part "character.g.dart";

typedef CharacterList = List<Character>;

typedef Talents = Map<TalentType, CharacterTalent>;

mixin CharacterWithLargeImage on Character {
  @override
  String get id;
  List<int> get hyvIds;
  @override
  LocalizedText get name;
  String get imageUrl;
  @override
  int get rarity;
  @override
  WeaponType get weaponType;
  @override
  MaterialDefinitions get materials;

  File getImageFile(String localAssetPath) =>
      File(disableImages ? getBlankImagePath(localAssetPath) : path.join(localAssetPath, imageUrl));
}

mixin CharacterOrVariant on Character {
  TeyvatElement get element;
  Talents get talents;
}

@Freezed(fallbackUnion: "default")
sealed class Character with _$Character, CharacterOrWeapon {
  const Character._();

  @With<CharacterWithLargeImage>()
  @With<CharacterOrVariant>()
  const factory Character({
    required String id,
    required List<int> hyvIds,
    required LocalizedText name,
    required String jaPronunciation,
    required String imageUrl,
    required String smallImageUrl,
    required int rarity,
    required WeaponType weaponType,
    required TeyvatElement element,
    required Talents talents,
    required MaterialDefinitions materials,
  }) = ListedCharacter;

  @With<CharacterWithLargeImage>()
  const factory Character.group({
    required String id,
    required List<int> hyvIds,
    required LocalizedText name,
    required String jaPronunciation,
    required String imageUrl,
    required String smallImageUrl,
    required int rarity,
    required WeaponType weaponType,
    required List<String> variantIds,
    required MaterialDefinitions materials,
  }) = CharacterGroup;

  @With<CharacterOrVariant>()
  const factory Character.variant({
    required String id,
    required String parentId,
    required LocalizedText name,
    required String jaPronunciation,
    required String smallImageUrl,
    required int rarity,
    required TeyvatElement element,
    required WeaponType weaponType,
    required Talents talents,
    required MaterialDefinitions materials,
  }) = CharacterVariant;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  File getSmallImageFile(String localAssetPath) =>
      File(disableImages ? getBlankImagePath(localAssetPath) : path.join(localAssetPath, smallImageUrl));
}

@freezed
sealed class CharacterTalent with _$CharacterTalent {
  const factory CharacterTalent({
    required List<int> idList,
    required LocalizedText name,
  }) = _CharacterTalent;

  factory CharacterTalent.fromJson(Map<String, dynamic> json) =>
      _$CharacterTalentFromJson(json);
}
