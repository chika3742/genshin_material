import "package:path/path.dart" as path;

import "../core/asset_cache.dart";
import "ingredients.dart";
import "localized_text.dart";
import "material.dart";

const dataSchemaVersion = 9;

typedef WeaponId = String;
typedef MaterialId = String;
typedef ArtifactSetId = String;
typedef MaterialUsageType = String;
typedef MaterialDefinitions = Map<MaterialUsageType, MaterialRef>;
typedef WeaponType = String;
typedef WeaponSubStat = String;
typedef TeyvatElement = String;
typedef TalentType = String;
typedef MaterialCategoryType = String;
typedef ArtifactPieceTypeId = String;
typedef StatId = String;
typedef ArtifactPieceId = String;
typedef FurnishingId = String;
typedef FurnishingSetId = String;
typedef FurnishingSetTypeId = String;

String getBlankImagePath(String localAssetPath) {
  return path.join(localAssetPath, "img", "blank.png");
}

mixin HasImage {
  String get imageUrl;
}

mixin HasSmallImage {
  String get smallImageUrl;
}

mixin Searchable {
  LocalizedText get name;
  String get jaPronunciation;
}

mixin CharacterOrWeapon {
  String get id;
  MaterialTargetType get targetType;
  int get rarity;
  MaterialDefinitions? get materials;
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

  /// Timezone offset from UTC
  final Duration serverTimeZoneOffset;
  final String description;
}

enum BookmarkType {
  material,
  artifactSet,
  artifactPiece,
  ;
}

enum MaterialTargetType {
  character,
  weapon;

  factory MaterialTargetType.fromWeaponNullity(Object? weaponId) =>
      weaponId == null ? .character : .weapon;

  List<ExpItem> getExpItemConf(AssetData assetData) {
    return switch (this) {
          .character => assetData.characterIngredients.expItems,
          .weapon => assetData.weaponIngredients.expItems,
    };
  }
}

sealed class MaterialRef {
  const MaterialRef();

  factory MaterialRef.fromJson(String json) => switch (json.split(":")) {
    ["group", final groupId] => MaterialGroupRef(groupId),
    ["id", final id] => MaterialIdRef(id),
    _ => throw FormatException("Invalid material definition: $json"),
  };

  bool matches(Material material);
}

final class MaterialIdRef extends MaterialRef {
  final String id;

  const MaterialIdRef(this.id);

  @override
  bool matches(Material material) => material.id == id;
}

final class MaterialGroupRef extends MaterialRef {
  final String groupId;

  const MaterialGroupRef(this.groupId);

  @override
  bool matches(Material material) => material.groupId == groupId;
}
