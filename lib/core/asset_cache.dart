import "package:freezed_annotation/freezed_annotation.dart";

import "../models/artifact.dart";
import "../models/asset_release_version.dart";
import "../models/character.dart";
import "../models/common.dart";
import "../models/drop_rates.dart";
import "../models/element.dart";
import "../models/furnishing_set.dart";
import "../models/ingredients.dart";
import "../models/localized_text.dart";
import "../models/material.dart";
import "../models/weapon.dart";
import "asset_loader.dart";

part "asset_cache.freezed.dart";

class AssetDataCacheProvider {
  String assetDir;

  AssetDataCacheProvider(this.assetDir);

  AssetReleaseVersion? version;
  AssetData? data;

  Future<void> load() async {
    final loader = AssetLoader(assetDir: assetDir);
    version = await loader.getCurrentVersion();

    if (version == null) {
      throw StateError("No available asset is installed.");
    }

    final weaponsMeta = WeaponsMeta.fromJson(
      await loader.loadJson<Map<String, dynamic>>("weapons-meta.json"),
    );
    final materialsMeta = MaterialsMeta.fromJson(
      await loader.loadJson<Map<String, dynamic>>("materials-meta.json"),
    );
    final artifactsMeta = ArtifactsMeta.fromJson(
      await loader.loadJson<Map<String, dynamic>>("artifacts-meta.json"),
    );
    final furnishingSetMeta = FurnishingSetMeta.fromJson(
      await loader.loadJson<Map<String, dynamic>>("furnishings-meta.json"),
    );

    data = AssetData(
      assetDir: assetDir,
      version: version!,
      characters: _parseMap(
        await loader.loadJson<Map<String, dynamic>>("characters.json"),
        Character.fromJson,
      ),
      characterIngredients: IngredientConfigurations.fromJson(
        await loader.loadJson<Map<String, dynamic>>("character-ingredients.json"),
      ),
      weapons: _parseMap(
        await loader.loadJson<Map<String, dynamic>>("weapons.json"),
        Weapon.fromJson,
      ),
      weaponIngredients: IngredientConfigurations.fromJson(
        await loader.loadJson<Map<String, dynamic>>("weapon-ingredients.json"),
      ),
      weaponSubStats: weaponsMeta.subStats,
      weaponTypes: weaponsMeta.types,
      elements: _parseMap(
        await loader.loadJson<Map<String, dynamic>>("elements.json"),
        Element.fromJson,
      ),
      materials: _parseMap(
        await loader.loadJson<Map<String, dynamic>>("materials.json"),
        Material.fromJson,
      ),
      materialCategories: materialsMeta.categories,
      materialSortOrder: materialsMeta.sortOrder,
      dailyMaterials: materialsMeta.daily,
      specialCharactersUsingMaterials: materialsMeta.specialCharactersUsingMaterials,
      artifactSets: _parseMap(
        await loader.loadJson<Map<String, dynamic>>("artifact-sets.json"),
        ArtifactSet.fromJson,
      ),
      artifactPieces: _parseMap(
        await loader.loadJson<Map<String, dynamic>>("artifact-pieces.json"),
        ArtifactPiece.fromJson,
      ),
      artifactPieceTypes: artifactsMeta.pieceTypes,
      stats: artifactsMeta.stats,
      artifactPossibleSubStats: artifactsMeta.possibleSubStats,
      artifactTags: artifactsMeta.tags.categories,
      furnishings: _parseMap(
        await loader.loadJson<Map<String, dynamic>>("furnishings.json"),
        Furnishing.fromJson,
      ),
      furnishingSets: _parseMap(
        await loader.loadJson<Map<String, dynamic>>("furnishing-sets.json"),
        FurnishingSet.fromJson,
      ),
      furnishingSetTypes: furnishingSetMeta.setTypes,
      dropRates: (await loader.loadJson<List<dynamic>>("drop-rates.json"))
          .map((e) => DropRateEntry.fromJson(e)).toList(),
    );
  }

  Map<K, V> _parseMap<K, V>(Map<K, dynamic> map, V Function(Map<K, dynamic>) fromJson) {
    return map.map((key, value) {
      return MapEntry(
        key,
        fromJson(value),
      );
    });
  }
}

@Freezed(copyWith: false)
sealed class AssetData with _$AssetData {
  const factory AssetData({
    required String assetDir,
    required AssetReleaseVersion version,
    required Map<CharacterId, Character> characters,
    required IngredientConfigurations characterIngredients,
    required Map<WeaponId, Weapon> weapons,
    required IngredientConfigurations weaponIngredients,
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
    required Map<StatId, LocalizedText> stats,
    required List<StatId> artifactPossibleSubStats,
    required Map<ArtifactPieceId, ArtifactPiece> artifactPieces,
    required List<ArtifactTagCategory> artifactTags,
    required Map<FurnishingSetId, FurnishingSet> furnishingSets,
    required Map<FurnishingId, Furnishing> furnishings,
    required Map<FurnishingSetTypeId, LocalizedText> furnishingSetTypes,
    required List<DropRateEntry> dropRates,
  }) = _AssetData;
}
