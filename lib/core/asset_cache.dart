import "dart:io";

import "package:path/path.dart" as path;
import "package:yaml/yaml.dart";

import "../models/asset_release_version.dart";
import "../models/character.dart";
import "../models/character_ingredients.dart";
import "../models/common.dart";
import "../models/element.dart";
import "../models/material.dart";
import "../utils/unwrap_yaml_value.dart";
import "asset_updater.dart";
import "data_parsing_exception.dart";

class AssetDataCache {
  static final instance = AssetDataCache();

  String? assetDir;

  AssetReleaseVersion? version;
  List<Character>? characters;
  CharacterIngredients? characterIngredients;
  Map<TeyvatElement, Element>? elements;
  List<Material>? materials;
  List<MaterialCategory>? materialCategories;
  Map<String, int>? materialSortOrder;

  Future<void> init() async {
    assetDir ??= (await getLocalAssetDirectory()).path;
  }

  Future<void> fetchIntoCache() async {
    version = await AssetUpdater((await getLocalAssetDirectory()).path).getCurrentVersion();

    if (version == null) {
      return;
    }

    characters = (await loadDataAsset<List>("characters.yaml"))
        .map((e) => Character.fromJson(e)).toList();
    characterIngredients = CharacterIngredients.fromJson(
      await loadDataAsset<Map<String, dynamic>>("character-ingredients.yaml"),
    );
    elements = (await loadDataAsset<Map>("elements.yaml")).map((key, value) {
      return MapEntry(
        TeyvatElement.values.firstWhere((e) => e.name == key),
        Element.fromJson(value),
      );
    });
    final materialData = MaterialData.fromJson(
      await loadDataAsset<Map<String, dynamic>>("materials.yaml"),
    );
    materials = materialData.items;
    materialCategories = materialData.categories;
    materialSortOrder = materialData.sortOrder;
  }

  /// Reads data asset file and parses YAML into JSON.
  Future<RootT> loadDataAsset<RootT>(String filename) async {
    if (assetDir == null) {
      throw "Call init() first.";
    }

    final filePath = path.join(assetDir!, "data/$filename");
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
