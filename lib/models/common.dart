import "../i18n/strings.g.dart";

enum TalentType {
  normalAttack,
  elementalSkill,
  elementalBurst,
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
  elementalBurst,
}
