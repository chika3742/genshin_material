import "dart:convert";
import "dart:io";

import "package:freezed_annotation/freezed_annotation.dart";
import "package:path/path.dart" as path;

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

  Future<bool> fetchIntoCache() async {
    version = await AssetUpdater(assetDir).getCurrentVersion();

    if (version == null) {
      return false;
    }

    final weaponsMeta = WeaponsMeta.fromJson(
      await loadDataAsset<Map<String, dynamic>>("weapons-meta.json"),
    );
    final materialsMeta = MaterialsMeta.fromJson(
      await loadDataAsset<Map<String, dynamic>>("materials-meta.json"),
    );
    final artifactsMeta = ArtifactsMeta.fromJson(
      await loadDataAsset<Map<String, dynamic>>("artifacts-meta.json"),
    );

    data = AssetData(
      characters: (await loadDataAsset<Map<String, dynamic>>("characters.json")).map((key, value) {
        return MapEntry(
          key,
          Character.fromJson(value),
        );
      }),
      characterIngredients: CharacterIngredients.fromJson(
        await loadDataAsset<Map<String, dynamic>>("character-ingredients.json"),
      ),
      weapons: (await loadDataAsset<Map<String, dynamic>>("weapons.json")).map((key, value) {
        return MapEntry(
          key,
          Weapon.fromJson(value),
        );
      }),
      weaponIngredients: WeaponIngredients.fromJson(
        await loadDataAsset<Map<String, dynamic>>("weapon-ingredients.json"),
      ),
      weaponSubStats: weaponsMeta.subStats,
      weaponTypes: weaponsMeta.types,
      elements: (await loadDataAsset<Map<String, dynamic>>("elements.json")).map((key, value) {
        return MapEntry(
          key,
          Element.fromJson(value),
        );
      }),
      materials: (await loadDataAsset<Map<String, dynamic>>("materials.json")).map((key, value) {
        return MapEntry(
          key,
          Material.fromJson(value),
        );
      }),
      materialCategories: materialsMeta.categories,
      materialSortOrder: materialsMeta.sortOrder,
      dailyMaterials: materialsMeta.daily,
      specialCharactersUsingMaterials: materialsMeta.specialCharactersUsingMaterials,
      artifactSets: (await loadDataAsset<Map<String, dynamic>>("artifact-sets.json")).map((key, value) {
        return MapEntry(
          key,
          ArtifactSet.fromJson(value),
        );
      }),
      artifactPieceTypes: artifactsMeta.pieceTypes,
      artifactStats: artifactsMeta.stats,
      artifactPossibleSubStats: artifactsMeta.possibleSubStats,
      artifactPieceSetMap: artifactsMeta.pieceSetMap,
      artifactTags: artifactsMeta.tags.categories,
    );

    return true;
  }

  /// Reads data asset file and parses JSON.
  Future<RootT> loadDataAsset<RootT>(String filename) async {
    final filePath = path.join(assetDir, "data/$filename");
    final jsonString = await File(filePath).readAsString();
    final parsed = jsonDecode(jsonString);
    // assert root type
    if (parsed is! RootT) {
      throw DataParsingException(
        assetName: filename,
        message: "Root type is not $RootT.",
      );
    }
    return parsed;
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
    required Map<WeaponType, WeaponTypeInfo> weaponTypes,
    required Map<TeyvatElement, Element> elements,
    required Map<MaterialId, Material> materials,
    required Map<MaterialCategoryType, LocalizedText> materialCategories,
    required Map<String, int> materialSortOrder,
    required DailyMaterials dailyMaterials,
    required Map<ArtifactSetId, ArtifactSet> artifactSets,
    required Map<ArtifactPieceTypeId, ArtifactPieceType> artifactPieceTypes,
    required Map<MaterialId, List<CharacterId>> specialCharactersUsingMaterials,
    required Map<ArtifactStatId, LocalizedText> artifactStats,
    required List<ArtifactStatId> artifactPossibleSubStats,
    required Map<ArtifactPieceId, ArtifactSetId> artifactPieceSetMap,
    required List<ArtifactTagCategory> artifactTags,
  }) = _AssetData;
}
