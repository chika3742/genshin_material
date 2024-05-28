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

typedef CharacterId = String;
typedef WeaponId = String;
typedef MaterialId = String;
typedef ArtifactSetId = String;

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
      characters: Map.fromEntries(
        (await loadDataAsset<List>("characters.yaml"))
            .map((e) => MapEntry(e["id"], Character.fromJson(e))),
      ),
      characterIngredients: CharacterIngredients.fromJson(
        await loadDataAsset<Map<String, dynamic>>("character-ingredients.yaml"),
      ),
      weapons: Map.fromEntries(
        (await loadDataAsset<List>("weapons.yaml"))
            .map((e) => MapEntry(e["id"], Weapon.fromJson(e))),
      ),
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
      materials: Map.fromEntries(
        (await loadDataAsset<List>("materials.yaml"))
            .map((e) => MapEntry(e["id"], Material.fromJson(e))),
      ),
      materialCategories: materialsMeta.categories,
      materialSortOrder: materialsMeta.sortOrder,
      dailyMaterials: materialsMeta.daily,
      artifactSets: Map.fromEntries(
        (await loadDataAsset<List>("artifact-sets.yaml"))
            .map((e) => MapEntry(e["id"], ArtifactSet.fromJson(e))),
      ),
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
    required Map<CharacterId, Character> characters,
    required CharacterIngredients characterIngredients,
    required Map<WeaponId, Weapon> weapons,
    required WeaponIngredients weaponIngredients,
    required Map<WeaponSubStat, LocalizedText> weaponSubStats,
    required Map<WeaponType, LocalizedText> weaponTypes,
    required Map<TeyvatElement, Element> elements,
    required Map<MaterialId, Material> materials,
    required Map<MaterialCategoryType, LocalizedText> materialCategories,
    required Map<String, int> materialSortOrder,
    required DailyMaterials dailyMaterials,
    required Map<ArtifactSetId, ArtifactSet> artifactSets,
    required Map<ArtifactPieceType, LocalizedText> artifactPieceTypes,
  }) = _AssetData;
}
