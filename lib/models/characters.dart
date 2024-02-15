import "package:freezed_annotation/freezed_annotation.dart";

import "common.dart";
import "localized_text.dart";

part "characters.freezed.dart";
part "characters.g.dart";

typedef Characters = List<Character>;

@Freezed(fallbackUnion: "default")
sealed class Character with _$Character {
  const factory Character({
    required String id,
    required String rid,
    required LocalizedText name,
    required String jaPronunciation,
    required int rarity,
    required WeaponType weaponType,
    required TeyvatElement element,
    required CharacterMaterialDefinitions materials,
  }) = _Character;

  const factory Character.group({
    required String id,
    required LocalizedText name,
    required String jaPronunciation,
    required int rarity,
    required WeaponType weaponType,
    required List<String> variantIds,
    required CharacterMaterialDefinitions materials,
  }) = CharacterGroup;

  const factory Character.unlisted({
    required String id,
    required String rid,
    required String parentId,
    required LocalizedText name,
    required String jaPronunciation,
    required int rarity,
    required WeaponType weaponType,
    required TeyvatElement element,
    required CharacterMaterialDefinitions materials,
  }) = UnlistedCharacter;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
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
