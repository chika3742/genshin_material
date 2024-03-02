import "dart:io";

import "package:freezed_annotation/freezed_annotation.dart";
import "package:path/path.dart" as path;

import "common.dart";
import "localized_text.dart";

part "character.freezed.dart";
part "character.g.dart";

typedef CharacterList = List<Character>;

mixin CharacterWithLargeImage on Character {
  String get imageUrl;

  File getImageFile(String localAssetPath) =>
      File(path.join(localAssetPath, imageUrl));
}

mixin CharacterWithSmallImage on Character {
  String get smallImageUrl;
  TeyvatElement get element;
  Map<TalentType, LocalizedText> get talents;

  File getSmallImageFile(String localAssetPath) =>
      File(path.join(localAssetPath, smallImageUrl));
}

@Freezed(fallbackUnion: "default")
sealed class Character with _$Character {
  const Character._();

  @With<CharacterWithLargeImage>()
  @With<CharacterWithSmallImage>()
  const factory Character({
    required String id,
    required String rid,
    required LocalizedText name,
    required String jaPronunciation,
    required String imageUrl,
    required String smallImageUrl,
    required int rarity,
    required WeaponType weaponType,
    required TeyvatElement element,
    required Map<TalentType, LocalizedText> talents,
    required CharacterMaterialDefinitions materials,
  }) = ListedCharacter;

  @With<CharacterWithLargeImage>()
  const factory Character.group({
    required String id,
    required LocalizedText name,
    required String jaPronunciation,
    required String imageUrl,
    required int rarity,
    required WeaponType weaponType,
    required List<String> variantIds,
    required CharacterMaterialDefinitions materials,
  }) = CharacterGroup;

  @With<CharacterWithSmallImage>()
  const factory Character.unlisted({
    required String id,
    required String rid,
    required String parentId,
    required LocalizedText name,
    required String jaPronunciation,
    required String smallImageUrl,
    required int rarity,
    required WeaponType weaponType,
    required TeyvatElement element,
    required Map<TalentType, LocalizedText> talents,
    required CharacterMaterialDefinitions materials,
  }) = UnlistedCharacter;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}

@Freezed(fallbackUnion: "default")
sealed class CharacterMaterialDefinitions with _$CharacterMaterialDefinitions {
  const CharacterMaterialDefinitions._();

  const factory CharacterMaterialDefinitions({
    required String primary,
    required String elementalStone,
    required String local,
    required String secondary,
    required String talentPrimary,
    required String talentBoss,
  }) = _CharacterMaterialDefinitions;

  const factory CharacterMaterialDefinitions.travelerAscension({
    required String primary,
    required String local,
    required String secondary,
  }) = TravelerAscensionMaterialDefinitions;

  factory CharacterMaterialDefinitions.fromJson(Map<String, dynamic> json) =>
      _$CharacterMaterialDefinitionsFromJson(json);

  String withType(CharacterIngredientType type) {
    return toJson()[type.name] as String;
  }
}
