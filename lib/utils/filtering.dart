import "../models/character.dart";
import "../models/common.dart";

Iterable<CharacterOrVariant> filterCharactersByWeaponType(Iterable<Character> characters, WeaponType? weaponType) {
  return characters.where(
        (e) =>
            e is CharacterOrVariant &&
            (weaponType == null || e.weaponType == weaponType),
      ).cast();
}
