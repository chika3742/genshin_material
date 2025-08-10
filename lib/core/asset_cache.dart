import "package:freezed_annotation/freezed_annotation.dart";

import "../models/artifact.dart";
import "../models/asset_release_version.dart";
import "../models/character.dart";
import "../models/common.dart";
import "../models/element.dart";
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

    data = AssetData(
      assetDir: assetDir,
      version: version!,
      characters: (await loader.loadJson<Map<String, dynamic>>("characters.json")).map((key, value) {
        return MapEntry(
          key,
          Character.fromJson(value),
        );
      }),
      characterIngredients: IngredientConfigurations.fromJson(
        await loader.loadJson<Map<String, dynamic>>("character-ingredients.json"),
      ),
      weapons: (await loader.loadJson<Map<String, dynamic>>("weapons.json")).map((key, value) {
        return MapEntry(
          key,
          Weapon.fromJson(value),
        );
      }),
      weaponIngredients: IngredientConfigurations.fromJson(
        await loader.loadJson<Map<String, dynamic>>("weapon-ingredients.json"),
      ),
      weaponSubStats: weaponsMeta.subStats,
      weaponTypes: weaponsMeta.types,
      elements: (await loader.loadJson<Map<String, dynamic>>("elements.json")).map((key, value) {
        return MapEntry(
          key,
          Element.fromJson(value),
        );
      }),
      materials: (await loader.loadJson<Map<String, dynamic>>("materials.json")).map((key, value) {
        return MapEntry(
          key,
          Material.fromJson(value),
        );
      }),
      materialCategories: materialsMeta.categories,
      materialSortOrder: materialsMeta.sortOrder,
      dailyMaterials: materialsMeta.daily,
      specialCharactersUsingMaterials: materialsMeta.specialCharactersUsingMaterials,
      artifactSets: (await loader.loadJson<Map<String, dynamic>>("artifact-sets.json")).map((key, value) {
        return MapEntry(
          key,
          ArtifactSet.fromJson(value),
        );
      }),
      artifactPieceTypes: artifactsMeta.pieceTypes,
      stats: artifactsMeta.stats,
      artifactPossibleSubStats: artifactsMeta.possibleSubStats,
      artifactPieceSetMap: artifactsMeta.pieceSetMap,
      artifactTags: artifactsMeta.tags.categories,
    );
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
    required Map<ArtifactPieceId, ArtifactSetId> artifactPieceSetMap,
    required List<ArtifactTagCategory> artifactTags,
  }) = _AssetData;
}
