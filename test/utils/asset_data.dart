import "package:genshin_material/core/asset_cache.dart";
import "package:genshin_material/models/asset_release_version.dart";
import "package:genshin_material/models/character.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/drop_rates.dart";
import "package:genshin_material/models/furnishing_set.dart";
import "package:genshin_material/models/ingredients.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/models/material.dart";
import "package:genshin_material/models/weapon.dart";

const _emptyIngredientConfigurations = IngredientConfigurations(
  expItems: [],
  rarities: {},
  sliders: [],
  ingredientTables: {},
);

AssetData buildTestAssetData({
  Map<CharacterId, Character> characters = const {},
  Map<MaterialId, Material> materials = const {},
  Map<String, int> materialSortOrder = const {},
  Map<FurnishingSetId, FurnishingSet> furnishingSets = const {},
  Map<FurnishingId, Furnishing> furnishings = const {},
  Map<WeaponId, Weapon> weapons = const {},
  IngredientConfigurations characterIngredients = _emptyIngredientConfigurations,
  IngredientConfigurations weaponIngredients = _emptyIngredientConfigurations,
  List<DropRateEntry> dropRates = const [],
  Map<MaterialId, List<CharacterId>> specialCharactersUsingMaterials = const {},
}) {
  return AssetData(
    assetDir: "",
    version: AssetReleaseVersion(
      createdAt: DateTime(2024),
      dataVersion: "test",
      channel: AssetChannel.dev,
      distUrl: "",
      schemaVersion: 0,
    ),
    characters: characters,
    characterIngredients: characterIngredients,
    weapons: weapons,
    weaponIngredients: weaponIngredients,
    weaponSubStats: {},
    weaponTypes: {},
    elements: {},
    materials: materials,
    materialCategories: {},
    materialSortOrder: materialSortOrder,
    dailyMaterials: DailyMaterials(talent: {}, weapon: {}),
    specialCharactersUsingMaterials: specialCharactersUsingMaterials,
    artifactSets: {},
    artifactPieceTypes: {},
    stats: {},
    artifactPossibleSubStats: [],
    artifactPieces: {},
    artifactTags: [],
    furnishingSets: furnishingSets,
    furnishings: furnishings,
    furnishingSetTypes: {},
    dropRates: dropRates,
  );
}

Material buildTestMaterial({
  String id = "",
  String category = "",
  List<DayOfWeek>? availableDays,
}) {
  return Material(
    id: id,
    hyvId: 0,
    name: LocalizedText(locales: {}),
    jaPronunciation: "",
    imageUrl: "",
    rarity: 1,
    category: category,
    availableDays: availableDays,
  );
}

Character buildTestCharacter({
  String id = "",
  LocalizedText? name,
}) {
  return Character(
      id: id,
      hyvIds: [],
      name: name ?? LocalizedText(locales: {}),
      jaPronunciation: "",
      imageUrl: "",
      smallImageUrl: "",
      rarity: 5,
      weaponType: "",
      element: "",
      talents: {},
      materials: {},
  );
}

Weapon buildTestWeapon({
  WeaponId id = "",
  int rarity = 5,
  MaterialDefinitions? materials,
  LocalizedText? name,
  WeaponType type = "",
  WeaponSubStat? subStat,
}) {
  return Weapon(
    id: id,
    hyvId: 0,
    name: name ?? LocalizedText(locales: {}),
    jaPronunciation: "",
    imageUrl: "",
    rarity: rarity,
    subStat: subStat,
    weaponAffixDesc: null,
    type: type,
    materials: materials,
  );
}

/// Builds an [IngredientConfigurations] holding a single ingredient table,
/// wired to [rarity] and [purpose].
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
