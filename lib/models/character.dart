import "package:freezed_annotation/freezed_annotation.dart";

import "../core/asset_cache.dart";
import "common.dart";
import "localized_text.dart";

part "character.freezed.dart";
part "character.g.dart";

extension type const CharacterOrVariantId(String value) implements String {}
extension type const CharacterId(String value) implements CharacterOrVariantId {}
extension type const VariantId(String value) implements CharacterOrVariantId {}

typedef Talents = Map<TalentType, CharacterTalent>;

mixin CharacterSummary implements HasSmallImage {
  CharacterOrVariantId get id;
  LocalizedText get name;
  int get rarity;
  WeaponType get weaponType;
}

/// A character as shown in lists and on detail pages.
///
/// It may group multiple variants, but even when it does not, [variants]
/// always contains at least one element.
@freezed
sealed class Character with CharacterOrWeapon, CharacterSummary, _$Character, Searchable, HasImage {
  const Character._();

  @Assert("variants.isNotEmpty", "A character must have at least one variant")
  factory Character({
    required CharacterId id,
    required List<int> hyvIds,
    required LocalizedText name,
    required List<CharacterVariant> variants,
    required String jaPronunciation,
    required String imageUrl,
    required String smallImageUrl,
    required int rarity,
    required WeaponType weaponType,
    required MaterialDefinitions materials,
  }) = _Character;

  TeyvatElement? get element => variants.singleOrNull?.element;

  @override
  MaterialTargetType get targetType => .character;
}

/// A character as the unit of leveling, syncing, and equipping.
@freezed
sealed class CharacterVariant with CharacterOrWeapon, CharacterSummary, _$CharacterVariant {
  const CharacterVariant._();

  const factory CharacterVariant({
    required VariantId id,
    required CharacterId characterId,
    required bool disableSync,
    required LocalizedText name,
    required String jaPronunciation,
    required String smallImageUrl,
    required int rarity,
    required WeaponType weaponType,
    required TeyvatElement element,
    required Talents talents,
    required MaterialDefinitions materials,
  }) = _CharacterVariant;

  @override
  MaterialTargetType get targetType => .character;
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

extension CharacterLookupExtension on AssetData {
  /// Resolves an ID stored without its kind, such as a material bookmark's `characterId`.
  CharacterSummary? findCharacterOrVariant(String id) {
    final CharacterSummary? variant = variants[VariantId(id)];
    return variant ?? characters[CharacterId(id)];
  }

  Character characterOf(CharacterVariant variant) {
    return characters[variant.characterId]!;
  }
}
