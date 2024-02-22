import "../i18n/strings.g.dart";

enum TalentType {
  normal,
  skill,
  burst,
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

enum PurposeType {
  ascension,
  normalAttack,
  elementalSkill,
  elementalBurst,
}
