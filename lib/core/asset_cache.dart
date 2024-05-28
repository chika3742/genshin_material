import "dart:io";

import "package:freezed_annotation/freezed_annotation.dart";
import "package:path/path.dart" as path;
import "package:yaml/yaml.dart";

import "../models/artifact.dart";
import "../models/asset_release_version.dart";
import "../models/character.dart";
import "../models/character_ingredients.dart";
import "../models/common.dart";
import "../models/element.dart";
import "../models/localized_text.dart";
import "../models/material.dart";
import "../models/weapon.dart";
import "../models/weapon_ingredients.dart";
import "../utils/unwrap_yaml_value.dart";
import "asset_updater.dart";
import "data_parsing_exception.dart";

part "asset_cache.freezed.dart";

class AssetDataCache {
  String assetDir;

  AssetDataCache(this.assetDir);

  AssetReleaseVersion? version;
  AssetData? data;

  Future<void> fetchIntoCache() async {
    version = await AssetUpdater((await getLocalAssetDirectory()).path).getCurrentVersion();

    if (version == null) {
      return;
    }

    final weaponsMeta = WeaponsMeta.fromJson(
      await loadDataAsset<Map<String, dynamic>>("weapons-meta.yaml"),
    );
    final materialsMeta = MaterialsMeta.fromJson(
      await loadDataAsset<Map<String, dynamic>>("materials-meta.yaml"),
    );
    final artifactsMeta = ArtifactsMeta.fromJson(
      await loadDataAsset<Map<String, dynamic>>("artifacts-meta.yaml"),
    );

    data = AssetData(
      characters: (await loadDataAsset<List>("characters.yaml"))
          .map((e) => Character.fromJson(e)).toList(),
      characterIngredients: CharacterIngredients.fromJson(
        await loadDataAsset<Map<String, dynamic>>("character-ingredients.yaml"),
      ),
      weapons: (await loadDataAsset<List>("weapons.yaml"))
          .map((e) => Weapon.fromJson(e)).toList(),
      weaponIngredients: WeaponIngredients.fromJson(
        await loadDataAsset<Map<String, dynamic>>("weapon-ingredients.yaml"),
      ),
      weaponSubStats: weaponsMeta.subStats,
      weaponTypes: weaponsMeta.types,
      elements: (await loadDataAsset<Map<String, dynamic>>("elements.yaml")).map((key, value) {
        return MapEntry(
          key,
          Element.fromJson(value),
        );
      }),
      materials: (await loadDataAsset<List>("materials.yaml"))
          .map((e) => Material.fromJson(e)).toList(),
      materialCategories: materialsMeta.categories,
      materialSortOrder: materialsMeta.sortOrder,
      dailyMaterials: materialsMeta.daily,
      artifactSets: (await loadDataAsset<List>("artifact-sets.yaml"))
          .map((e) => ArtifactSet.fromJson(e)).toList(),
      artifactPieceTypes: artifactsMeta.pieceTypes,
    );
  }

  /// Reads data asset file and parses YAML into JSON.
  Future<RootT> loadDataAsset<RootT>(String filename) async {
    final filePath = path.join(assetDir, "data/$filename");
    final yamlString = await File(filePath).readAsString();
    final unwrapped = unwrapYamlValue(loadYaml(yamlString));
    // assert root type
    if (unwrapped is! RootT) {
      throw DataParsingException(
        assetName: filename,
        message: "Root type is not $RootT.",
      );
    }
    return unwrapped;
  }
}

@Freezed(copyWith: false)
class AssetData with _$AssetData {
  const factory AssetData({
    required List<Character> characters,
    required CharacterIngredients characterIngredients,
    required List<Weapon> weapons,
    required WeaponIngredients weaponIngredients,
    required Map<WeaponSubStat, LocalizedText> weaponSubStats,
    required Map<WeaponType, LocalizedText> weaponTypes,
    required Map<TeyvatElement, Element> elements,
    required List<Material> materials,
    required Map<MaterialCategoryType, LocalizedText> materialCategories,
    required Map<String, int> materialSortOrder,
    required DailyMaterials dailyMaterials,
    required List<ArtifactSet> artifactSets,
    required Map<ArtifactPieceType, LocalizedText> artifactPieceTypes,
  }) = _AssetData;
}
