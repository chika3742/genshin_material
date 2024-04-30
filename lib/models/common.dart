import "dart:io";

import "package:path/path.dart" as path;

typedef MaterialUsageType = String;

typedef MaterialDefinitions = Map<MaterialUsageType, String>;

typedef WeaponType = String;

typedef WeaponSubStat = String;

typedef TeyvatElement = String;

typedef TalentType = String;

typedef MaterialCategoryType = String;

typedef ArtifactPieceType = String;

mixin ImageGetter {
  String get imageUrl;

  File getImageFile(String localAssetPath) =>
      File(path.join(localAssetPath, imageUrl));
}

enum Purpose {
  ascension,
  normalAttack,
  elementalSkill,
  elementalBurst;

  factory Purpose.fromTalentType(TalentType type) {
    return Purpose.values.firstWhere((e) => e.name == type);
  }
}

enum BookmarkState {
  none,
  partial,
  bookmarked,
}

mixin WithMaterialDefinitions {
  MaterialDefinitions get materials;
}

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}
