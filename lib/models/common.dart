import "dart:io";

import "package:path/path.dart" as path;

import "../i18n/strings.g.dart";

typedef MaterialUsageType = String;

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

enum BookmarkState {
  none,
  partial,
  bookmarked,
}
