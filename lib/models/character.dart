import "dart:io";

import "package:freezed_annotation/freezed_annotation.dart";
import "package:path/path.dart" as path;

import "../i18n/strings.g.dart";
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
    required CharacterMaterialDefinitions materials,
  }) = UnlistedCharacter;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  String get localizedName {
    final lang = LocaleSettings.currentLocale.languageCode;
    final s = name.locales[lang];
    if (s == null) {
      throw "No $lang localization found";
    }
    return s;
  }
}

@Freezed(fallbackUnion: "default")
sealed class CharacterMaterialDefinitions with _$CharacterMaterialDefinitions {
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

  const factory CharacterMaterialDefinitions.travelerTalent({
    required MaterialIdPerType talentPrimary,
    required MaterialIdPerType talentSecondary,
    required MaterialIdPerType talentBoss,
  }) = TravelerTalentMaterialDefinitions;

  factory CharacterMaterialDefinitions.fromJson(Map<String, dynamic> json) =>
      _$CharacterMaterialDefinitionsFromJson(json);
}

@Freezed(fallbackUnion: "default")
sealed class MaterialIdPerType with _$MaterialIdPerType {
  const factory MaterialIdPerType({
    required Map<TalentType, String> types,
  }) = _MaterialIdPerType;

  const factory MaterialIdPerType.byLevel({
    required Map<TalentType, MaterialIdPerLevel> types,
  }) = MaterialIdPerLevelPerType;

  factory MaterialIdPerType.fromJson(Map<String, dynamic> json) =>
      _$MaterialIdPerTypeFromJson(json);
}

@freezed
sealed class MaterialIdPerLevel with _$MaterialIdPerLevel {
  const factory MaterialIdPerLevel({
    required Map<int, String> levels,
  }) = _MaterialIdPerLevel;

  factory MaterialIdPerLevel.fromJson(Map<String, dynamic> json) =>
      _$MaterialIdPerLevelFromJson(json);
}
