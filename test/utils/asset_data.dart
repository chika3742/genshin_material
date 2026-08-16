import "package:genshin_material/core/asset_cache.dart";
import "package:genshin_material/models/asset_release_version.dart";
import "package:genshin_material/models/character.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/furnishing_set.dart";
import "package:genshin_material/models/ingredients.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/models/material.dart";

AssetData buildTestAssetData({
  Map<String, Character> characters = const {},
  Map<String, Material> materials = const {},
  Map<String, int> materialSortOrder = const {},
  Map<String, FurnishingSet> furnishingSets = const {},
  Map<String, Furnishing> furnishings = const {},
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
    characterIngredients: IngredientConfigurations(
      expItems: [],
      rarities: {},
      sliders: [],
      ingredientTables: {},
    ),
    weapons: {},
    weaponIngredients: IngredientConfigurations(
      expItems: [],
      rarities: {},
      sliders: [],
      ingredientTables: {},
    ),
    weaponSubStats: {},
    weaponTypes: {},
    elements: {},
    materials: materials,
    materialCategories: {},
    materialSortOrder: materialSortOrder,
    dailyMaterials: DailyMaterials(talent: {}, weapon: {}),
    specialCharactersUsingMaterials: {},
    artifactSets: {},
    artifactPieceTypes: {},
    stats: {},
    artifactPossibleSubStats: [],
    artifactPieces: {},
    artifactTags: [],
    furnishingSets: furnishingSets,
    furnishings: furnishings,
    furnishingSetTypes: {},
    dropRates: [],
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
