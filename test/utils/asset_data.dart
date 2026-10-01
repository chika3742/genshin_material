import "package:genshin_material/core/asset_cache.dart";
import "package:genshin_material/models/artifact.dart";
import "package:genshin_material/models/asset_release_version.dart";
import "package:genshin_material/models/character.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/drop_rates.dart";
import "package:genshin_material/models/element.dart";
import "package:genshin_material/models/furnishing_set.dart";
import "package:genshin_material/models/ingredients.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/models/material.dart";
import "package:genshin_material/models/weapon.dart";

IngredientConfigurations _emptyIngredientConfigurations() {
  return const IngredientConfigurations(
    expItems: [],
    rarities: {},
    sliders: [],
    ingredientTables: {},
  );
}

AssetData buildTestAssetData({
  String assetDir = "",
  Map<CharacterId, Character> characters = const {},
  Map<WeaponId, Weapon> weapons = const {},
  Map<MaterialId, Material> materials = const {},
  Map<String, int> materialSortOrder = const {},
  Map<FurnishingSetId, FurnishingSet> furnishingSets = const {},
  Map<FurnishingId, Furnishing> furnishings = const {},
  Map<ArtifactSetId, ArtifactSet> artifactSets = const {},
  Map<ArtifactPieceId, ArtifactPiece> artifactPieces = const {},
  Map<ArtifactPieceTypeId, ArtifactPieceType> artifactPieceTypes = const {},
  IngredientConfigurations? characterIngredients,
  IngredientConfigurations? weaponIngredients,
  List<DropRateEntry> dropRates = const [],
  Map<MaterialId, List<CharacterId>> specialCharactersUsingMaterials = const {},
  Map<TeyvatElement, Element> elements = const {},
  Map<WeaponType, WeaponTypeInfo> weaponTypes = const {},
}) {
  return AssetData(
    assetDir: assetDir,
    version: AssetReleaseVersion(
      createdAt: DateTime(2024),
      dataVersion: "test",
      channel: AssetChannel.dev,
      distUrl: "",
      schemaVersion: 0,
    ),
    characters: characters,
    characterIngredients:
        characterIngredients ?? _emptyIngredientConfigurations(),
    weapons: weapons,
    weaponIngredients: weaponIngredients ?? _emptyIngredientConfigurations(),
    weaponSubStats: {},
    weaponTypes: weaponTypes,
    elements: elements,
    materials: materials,
    materialCategories: {},
    materialSortOrder: materialSortOrder,
    dailyMaterials: DailyMaterials(talent: {}, weapon: {}),
    specialCharactersUsingMaterials: specialCharactersUsingMaterials,
    artifactSets: artifactSets,
    artifactPieceTypes: artifactPieceTypes,
    stats: {},
    artifactPossibleSubStats: [],
    artifactPieces: artifactPieces,
    artifactTags: [],
    furnishingSets: furnishingSets,
    furnishings: furnishings,
    furnishingSetTypes: {},
    dropRates: dropRates,
    characterNameFontFamily: "",
  );
}

Material buildTestMaterial({
  String id = "",
  int hyvId = 0,
  String category = "",
  LocalizedText? name,
  String jaPronunciation = "",
  String imageUrl = "",
  int rarity = 1,
  String? groupId,
  int? craftLevel,
  List<DayOfWeek>? availableDays,
}) {
  return Material(
    id: id,
    hyvId: hyvId,
    name: name ?? LocalizedText(locales: {}),
    jaPronunciation: jaPronunciation,
    imageUrl: imageUrl,
    rarity: rarity,
    category: category,
    groupId: groupId,
    craftLevel: craftLevel,
    availableDays: availableDays,
  );
}

Character buildTestCharacter({
  String id = "",
  LocalizedText? name,
  String jaPronunciation = "",
  int rarity = 5,
  WeaponType weaponType = "",
  MaterialDefinitions materials = const {},
  List<int> hyvIds = const [],
  TeyvatElement element = "",
}) {
  return Character(
    id: id,
    hyvIds: hyvIds,
    name: name ?? LocalizedText(locales: {}),
    jaPronunciation: jaPronunciation,
    imageUrl: "",
    smallImageUrl: "",
    rarity: rarity,
    weaponType: weaponType,
    element: element,
    talents: {},
    materials: materials,
  );
}

Character buildTestCharacterGroup({
  String id = "",
  List<int> hyvIds = const [],
  List<CharacterId> variantIds = const [],
  LocalizedText? name,
  MaterialDefinitions materials = const {},
}) {
  return Character.group(
    id: id,
    hyvIds: hyvIds,
    name: name ?? LocalizedText(locales: {}),
    jaPronunciation: "",
    imageUrl: "",
    smallImageUrl: "",
    rarity: 5,
    weaponType: "",
    variantIds: variantIds,
    materials: materials,
  );
}

Character buildTestCharacterVariant({
  String id = "",
  CharacterId parentId = "",
  TeyvatElement element = "",
  WeaponType weaponType = "",
  LocalizedText? name,
  Talents talents = const {},
  MaterialDefinitions materials = const {},
}) {
  return Character.variant(
    id: id,
    parentId: parentId,
    name: name ?? LocalizedText(locales: {}),
    jaPronunciation: "",
    smallImageUrl: "",
    rarity: 5,
    element: element,
    weaponType: weaponType,
    talents: talents,
    materials: materials,
  );
}

Weapon buildTestWeapon({
  String id = "",
  LocalizedText? name,
  String jaPronunciation = "",
  int rarity = 5,
  MaterialDefinitions? materials,
  WeaponType type = "",
  WeaponSubStat? subStat,
  int hyvId = 0,
}) {
  return Weapon(
    id: id,
    hyvId: hyvId,
    name: name ?? LocalizedText(locales: {}),
    jaPronunciation: jaPronunciation,
    imageUrl: "",
    rarity: rarity,
    subStat: subStat,
    weaponAffixDesc: null,
    type: type,
    materials: materials,
  );
}

/// Builds an [IngredientConfigurations] holding a single ingredient table,
/// reachable via [rarity] and [purpose].
IngredientConfigurations buildIngredientConfigurations({
  required int rarity,
  required Purpose purpose,
  required Map<int, List<Ingredient>> levels,
  List<ExpItem> expItems = const [],
}) {
  return IngredientConfigurations(
    expItems: expItems,
    rarities: {
      rarity: IngredientPurposes(purposes: {purpose: "table"}),
    },
    sliders: [],
    ingredientTables: {
      "table": IngredientLevels(
        sliderTicks: levels.keys.toList()..sort(),
        levels: levels,
      ),
    },
  );
}
