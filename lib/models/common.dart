import "dart:io";

import "package:path/path.dart" as path;

const dataSchemaVersion = 1;

typedef CharacterId = String;
typedef WeaponId = String;
typedef MaterialId = String;
typedef ArtifactSetId = String;
typedef MaterialUsageType = String;
typedef MaterialDefinitions = Map<MaterialUsageType, String>;
typedef WeaponType = String;
typedef WeaponSubStat = String;
typedef TeyvatElement = String;
typedef TalentType = String;
typedef MaterialCategoryType = String;
typedef ArtifactPieceTypeId = String;
typedef StatId = String;
typedef ArtifactPieceId = String;

mixin ImageGetter {
  String get imageUrl;

  File getImageFile(String localAssetPath) =>
      File(path.join(localAssetPath, imageUrl));
}

mixin CharacterOrWeapon {
  String get id;
  MaterialDefinitions get materials;
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

enum DayOfWeek {
  monday(DateTime.monday),
  tuesday(DateTime.tuesday),
  wednesday(DateTime.wednesday),
  thursday(DateTime.thursday),
  friday(DateTime.friday),
  saturday(DateTime.saturday),
  sunday(DateTime.sunday);

  const DayOfWeek(this.value);

  final int value;
}

enum GameServer {
  america(Duration(hours: -5), "America"),
  europe(Duration(hours: 1), "Europe"),
  asia(Duration(hours: 8), "Asia, TW/HK/MO");

  const GameServer(this.serverTimeZoneOffset, this.description);

  final Duration serverTimeZoneOffset;
  final String description;
}

enum BookmarkType {
  material,
  artifactSet,
  artifactPiece,
  ;
}
