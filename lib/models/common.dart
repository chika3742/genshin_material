import "dart:io";

import "package:path/path.dart" as path;

import "../i18n/strings.g.dart";

mixin ImageGetter {
  String get imageUrl;

  File getImageFile(String localAssetPath) =>
      File(path.join(localAssetPath, imageUrl));
}

enum TalentType {
  normalAttack,
  elementalSkill,
  elementalBurst;

  factory TalentType.fromPurpose(Purpose purpose) {
    return TalentType.values.firstWhere((e) => e.name == purpose.name);
  }
}

enum WeaponType {
  sword,
  claymore,
  polearm,
  bow,
  catalyst,
}

extension WeaponTypeText on WeaponType {
  String get text => tr.weaponTypes[name]!;
}

enum TeyvatElement {
  pyro,
  cryo,
  hydro,
  electro,
  anemo,
  geo,
  dendro,
}

enum Purpose {
  ascension,
  normalAttack,
  elementalSkill,
  elementalBurst;

  factory Purpose.fromTalentType(TalentType type) {
    return Purpose.values.firstWhere((e) => e.name == type.name);
  }
}

enum MaterialCategory {
  exp,
  gems,
  elementalStone,
  local,
  talentBook,
  talentBoss,
  common,
  others,
}

enum CharacterIngredientType {
  primary,
  secondary,
  elementalStone,
  local,
  talentPrimary,
  talentBoss,
}

enum BookmarkState {
  none,
  partial,
  bookmarked,
}
