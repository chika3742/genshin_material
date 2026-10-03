import "package:freezed_annotation/freezed_annotation.dart";

import "../../models/character.dart";
import "../../models/common.dart";
import "../../models/localized_text.dart";

part "character.g.dart";
part "character.freezed.dart";

@Freezed(fallbackUnion: "default", toJson: false)
sealed class CharacterAsset with _$CharacterAsset {
  const CharacterAsset._();

  const factory CharacterAsset({
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
  }) = _CharacterAssetDefault;

  const factory CharacterAsset.group({
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
  }) = _CharacterAssetGroup;

  const factory CharacterAsset.variant({
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
  }) = _CharacterAssetVariant;

  Character _toCharacter({
    required List<int> hyvIds,
    required List<CharacterVariant> variants,
    required String imageUrl,
  }) => Character(
    id: CharacterId(id),
    hyvIds: hyvIds,
    name: name,
    variants: variants,
    jaPronunciation: jaPronunciation,
    imageUrl: imageUrl,
    smallImageUrl: smallImageUrl,
    rarity: rarity,
    weaponType: weaponType,
    materials: materials,
  );

  CharacterVariant _toVariant({
    required CharacterId characterId,
    required bool disableSync,
    required TeyvatElement element,
    required Talents talents,
  }) => CharacterVariant(
    id: VariantId(id),
    characterId: characterId,
    disableSync: disableSync,
    name: name,
    jaPronunciation: jaPronunciation,
    smallImageUrl: smallImageUrl,
    rarity: rarity,
    weaponType: weaponType,
    element: element,
    talents: talents,
    materials: materials,
  );

  factory CharacterAsset.fromJson(Map<String, dynamic> json) =>
      _$CharacterAssetFromJson(json);

  static (Map<CharacterId, Character>, Map<VariantId, CharacterVariant>) toDomain(Map<String, CharacterAsset> asset) {
    final characters = <CharacterId, Character>{};
    final variants = <VariantId, CharacterVariant>{};

    for (final e in asset.values) {
      switch (e) {
        case final _CharacterAssetDefault e:
          final variant = e._toVariant(
            characterId: CharacterId(e.id),
            disableSync: e.disableSync,
            element: e.element,
            talents: e.talents,
          );
          characters[CharacterId(e.id)] = e._toCharacter(
            hyvIds: e.hyvIds,
            variants: [variant],
            imageUrl: e.imageUrl,
          );
          variants[VariantId(e.id)] = variant;

        case final _CharacterAssetGroup e:
          final characterId = CharacterId(e.id);
          final groupVariants = [
            for (final vid in e.variantIds)
              switch (asset[vid]) {
                // asset[vid] is variant and its parentId points to this group
                final _CharacterAssetVariant v when v.parentId == e.id => v._toVariant(
                  characterId: characterId,
                  disableSync: v.disableSync,
                  element: v.element,
                  talents: v.talents,
                ),
                _ => throw FormatException("Invalid variant \"$vid\" in group \"${e.id}\""),
              },
          ];
          characters[characterId] = e._toCharacter(
            hyvIds: e.hyvIds,
            variants: groupVariants,
            imageUrl: e.imageUrl,
          );
          variants.addEntries(groupVariants.map((v) => MapEntry(v.id, v)));

        case _CharacterAssetVariant():
          // do nothing (handled in _CharacterAssetGroup case)
      }
    }

    // verify orphans not left
    final orphans = asset.values
        .whereType<_CharacterAssetVariant>()
        .where((v) => !variants.containsKey(VariantId(v.id)));
    if (orphans.isNotEmpty) {
      throw FormatException("Orphan variants: ${orphans.map((v) => v.id).join(", ")}");
    }

    return (characters, variants);
  }
}
