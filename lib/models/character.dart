
import "package:freezed_annotation/freezed_annotation.dart";

import "common.dart";
import "localized_text.dart";

part "character.freezed.dart";
part "character.g.dart";

typedef CharacterList = List<Character>;

typedef Talents = Map<TalentType, CharacterTalent>;

sealed class CharacterBase implements HasSmallImage {
  const CharacterBase();

  LocalizedText get name;
  String get jaPronunciation;
}

abstract class CharacterWithLargeImage extends CharacterBase with CharacterOrWeapon implements HasImage {
  List<int> get hyvIds;
  WeaponType get weaponType;
}

abstract class CharacterOrVariant extends CharacterBase with CharacterOrWeapon {
  WeaponType get weaponType;
  TeyvatElement get element;
  Talents get talents;
  bool get disableSync;
}

@Freezed(fallbackUnion: "default", toJson: false)
sealed class Character extends CharacterBase with CharacterOrWeapon, _$Character, Searchable {
  const Character._();

  @Implements<CharacterWithLargeImage>()
  @Implements<CharacterOrVariant>()
  const factory Character({
    required String id,
    @Default(false) bool disableSync,
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

  @Implements<CharacterWithLargeImage>()
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

  @Implements<CharacterOrVariant>()
  const factory Character.variant({
    required String id,
    @Default(false) bool disableSync,
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
}

@Freezed(toJson: false)
sealed class CharacterTalent with _$CharacterTalent {
  const factory CharacterTalent({
    required List<int> idList,
    required LocalizedText name,
  }) = _CharacterTalent;

  factory CharacterTalent.fromJson(Map<String, dynamic> json) =>
      _$CharacterTalentFromJson(json);
}
