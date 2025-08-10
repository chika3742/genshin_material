// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_cache.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssetData {
  String get assetDir;
  AssetReleaseVersion get version;
  Map<CharacterId, Character> get characters;
  IngredientConfigurations get characterIngredients;
  Map<WeaponId, Weapon> get weapons;
  IngredientConfigurations get weaponIngredients;
  Map<WeaponSubStat, LocalizedText> get weaponSubStats;
  Map<WeaponType, WeaponTypeInfo> get weaponTypes;
  Map<TeyvatElement, Element> get elements;
  Map<MaterialId, Material> get materials;
  Map<MaterialCategoryType, LocalizedText> get materialCategories;
  Map<String, int> get materialSortOrder;
  DailyMaterials get dailyMaterials;
  Map<ArtifactSetId, ArtifactSet> get artifactSets;
  Map<ArtifactPieceTypeId, ArtifactPieceType> get artifactPieceTypes;
  Map<MaterialId, List<CharacterId>> get specialCharactersUsingMaterials;
  Map<StatId, LocalizedText> get stats;
  List<StatId> get artifactPossibleSubStats;
  Map<ArtifactPieceId, ArtifactSetId> get artifactPieceSetMap;
  List<ArtifactTagCategory> get artifactTags;
  Map<FurnishingSetId, FurnishingSet> get furnishingSets;
  Map<FurnishingId, Furnishing> get furnishings;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssetData &&
            (identical(other.assetDir, assetDir) ||
                other.assetDir == assetDir) &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality()
                .equals(other.characters, characters) &&
            (identical(other.characterIngredients, characterIngredients) ||
                other.characterIngredients == characterIngredients) &&
            const DeepCollectionEquality().equals(other.weapons, weapons) &&
            (identical(other.weaponIngredients, weaponIngredients) ||
                other.weaponIngredients == weaponIngredients) &&
            const DeepCollectionEquality()
                .equals(other.weaponSubStats, weaponSubStats) &&
            const DeepCollectionEquality()
                .equals(other.weaponTypes, weaponTypes) &&
            const DeepCollectionEquality().equals(other.elements, elements) &&
            const DeepCollectionEquality().equals(other.materials, materials) &&
            const DeepCollectionEquality()
                .equals(other.materialCategories, materialCategories) &&
            const DeepCollectionEquality()
                .equals(other.materialSortOrder, materialSortOrder) &&
            (identical(other.dailyMaterials, dailyMaterials) ||
                other.dailyMaterials == dailyMaterials) &&
            const DeepCollectionEquality()
                .equals(other.artifactSets, artifactSets) &&
            const DeepCollectionEquality()
                .equals(other.artifactPieceTypes, artifactPieceTypes) &&
            const DeepCollectionEquality().equals(
                other.specialCharactersUsingMaterials,
                specialCharactersUsingMaterials) &&
            const DeepCollectionEquality().equals(other.stats, stats) &&
            const DeepCollectionEquality().equals(
                other.artifactPossibleSubStats, artifactPossibleSubStats) &&
            const DeepCollectionEquality()
                .equals(other.artifactPieceSetMap, artifactPieceSetMap) &&
            const DeepCollectionEquality()
                .equals(other.artifactTags, artifactTags) &&
            const DeepCollectionEquality()
                .equals(other.furnishingSets, furnishingSets) &&
            const DeepCollectionEquality()
                .equals(other.furnishings, furnishings));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        assetDir,
        version,
        const DeepCollectionEquality().hash(characters),
        characterIngredients,
        const DeepCollectionEquality().hash(weapons),
        weaponIngredients,
        const DeepCollectionEquality().hash(weaponSubStats),
        const DeepCollectionEquality().hash(weaponTypes),
        const DeepCollectionEquality().hash(elements),
        const DeepCollectionEquality().hash(materials),
        const DeepCollectionEquality().hash(materialCategories),
        const DeepCollectionEquality().hash(materialSortOrder),
        dailyMaterials,
        const DeepCollectionEquality().hash(artifactSets),
        const DeepCollectionEquality().hash(artifactPieceTypes),
        const DeepCollectionEquality().hash(specialCharactersUsingMaterials),
        const DeepCollectionEquality().hash(stats),
        const DeepCollectionEquality().hash(artifactPossibleSubStats),
        const DeepCollectionEquality().hash(artifactPieceSetMap),
        const DeepCollectionEquality().hash(artifactTags),
        const DeepCollectionEquality().hash(furnishingSets),
        const DeepCollectionEquality().hash(furnishings)
      ]);

  @override
  String toString() {
    return 'AssetData(assetDir: $assetDir, version: $version, characters: $characters, characterIngredients: $characterIngredients, weapons: $weapons, weaponIngredients: $weaponIngredients, weaponSubStats: $weaponSubStats, weaponTypes: $weaponTypes, elements: $elements, materials: $materials, materialCategories: $materialCategories, materialSortOrder: $materialSortOrder, dailyMaterials: $dailyMaterials, artifactSets: $artifactSets, artifactPieceTypes: $artifactPieceTypes, specialCharactersUsingMaterials: $specialCharactersUsingMaterials, stats: $stats, artifactPossibleSubStats: $artifactPossibleSubStats, artifactPieceSetMap: $artifactPieceSetMap, artifactTags: $artifactTags, furnishingSets: $furnishingSets, furnishings: $furnishings)';
  }
}

/// @nodoc

class _AssetData implements AssetData {
  const _AssetData(
      {required this.assetDir,
      required this.version,
      required final Map<CharacterId, Character> characters,
      required this.characterIngredients,
      required final Map<WeaponId, Weapon> weapons,
      required this.weaponIngredients,
      required final Map<WeaponSubStat, LocalizedText> weaponSubStats,
      required final Map<WeaponType, WeaponTypeInfo> weaponTypes,
      required final Map<TeyvatElement, Element> elements,
      required final Map<MaterialId, Material> materials,
      required final Map<MaterialCategoryType, LocalizedText>
          materialCategories,
      required final Map<String, int> materialSortOrder,
      required this.dailyMaterials,
      required final Map<ArtifactSetId, ArtifactSet> artifactSets,
      required final Map<ArtifactPieceTypeId, ArtifactPieceType>
          artifactPieceTypes,
      required final Map<MaterialId, List<CharacterId>>
          specialCharactersUsingMaterials,
      required final Map<StatId, LocalizedText> stats,
      required final List<StatId> artifactPossibleSubStats,
      required final Map<ArtifactPieceId, ArtifactSetId> artifactPieceSetMap,
      required final List<ArtifactTagCategory> artifactTags,
      required final Map<FurnishingSetId, FurnishingSet> furnishingSets,
      required final Map<FurnishingId, Furnishing> furnishings})
      : _characters = characters,
        _weapons = weapons,
        _weaponSubStats = weaponSubStats,
        _weaponTypes = weaponTypes,
        _elements = elements,
        _materials = materials,
        _materialCategories = materialCategories,
        _materialSortOrder = materialSortOrder,
        _artifactSets = artifactSets,
        _artifactPieceTypes = artifactPieceTypes,
        _specialCharactersUsingMaterials = specialCharactersUsingMaterials,
        _stats = stats,
        _artifactPossibleSubStats = artifactPossibleSubStats,
        _artifactPieceSetMap = artifactPieceSetMap,
        _artifactTags = artifactTags,
        _furnishingSets = furnishingSets,
        _furnishings = furnishings;

  @override
  final String assetDir;
  @override
  final AssetReleaseVersion version;
  final Map<CharacterId, Character> _characters;
  @override
  Map<CharacterId, Character> get characters {
    if (_characters is EqualUnmodifiableMapView) return _characters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_characters);
  }

  @override
  final IngredientConfigurations characterIngredients;
  final Map<WeaponId, Weapon> _weapons;
  @override
  Map<WeaponId, Weapon> get weapons {
    if (_weapons is EqualUnmodifiableMapView) return _weapons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_weapons);
  }

  @override
  final IngredientConfigurations weaponIngredients;
  final Map<WeaponSubStat, LocalizedText> _weaponSubStats;
  @override
  Map<WeaponSubStat, LocalizedText> get weaponSubStats {
    if (_weaponSubStats is EqualUnmodifiableMapView) return _weaponSubStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_weaponSubStats);
  }

  final Map<WeaponType, WeaponTypeInfo> _weaponTypes;
  @override
  Map<WeaponType, WeaponTypeInfo> get weaponTypes {
    if (_weaponTypes is EqualUnmodifiableMapView) return _weaponTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_weaponTypes);
  }

  final Map<TeyvatElement, Element> _elements;
  @override
  Map<TeyvatElement, Element> get elements {
    if (_elements is EqualUnmodifiableMapView) return _elements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_elements);
  }

  final Map<MaterialId, Material> _materials;
  @override
  Map<MaterialId, Material> get materials {
    if (_materials is EqualUnmodifiableMapView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materials);
  }

  final Map<MaterialCategoryType, LocalizedText> _materialCategories;
  @override
  Map<MaterialCategoryType, LocalizedText> get materialCategories {
    if (_materialCategories is EqualUnmodifiableMapView)
      return _materialCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materialCategories);
  }

  final Map<String, int> _materialSortOrder;
  @override
  Map<String, int> get materialSortOrder {
    if (_materialSortOrder is EqualUnmodifiableMapView)
      return _materialSortOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materialSortOrder);
  }

  @override
  final DailyMaterials dailyMaterials;
  final Map<ArtifactSetId, ArtifactSet> _artifactSets;
  @override
  Map<ArtifactSetId, ArtifactSet> get artifactSets {
    if (_artifactSets is EqualUnmodifiableMapView) return _artifactSets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_artifactSets);
  }

  final Map<ArtifactPieceTypeId, ArtifactPieceType> _artifactPieceTypes;
  @override
  Map<ArtifactPieceTypeId, ArtifactPieceType> get artifactPieceTypes {
    if (_artifactPieceTypes is EqualUnmodifiableMapView)
      return _artifactPieceTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_artifactPieceTypes);
  }

  final Map<MaterialId, List<CharacterId>> _specialCharactersUsingMaterials;
  @override
  Map<MaterialId, List<CharacterId>> get specialCharactersUsingMaterials {
    if (_specialCharactersUsingMaterials is EqualUnmodifiableMapView)
      return _specialCharactersUsingMaterials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_specialCharactersUsingMaterials);
  }

  final Map<StatId, LocalizedText> _stats;
  @override
  Map<StatId, LocalizedText> get stats {
    if (_stats is EqualUnmodifiableMapView) return _stats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stats);
  }

  final List<StatId> _artifactPossibleSubStats;
  @override
  List<StatId> get artifactPossibleSubStats {
    if (_artifactPossibleSubStats is EqualUnmodifiableListView)
      return _artifactPossibleSubStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artifactPossibleSubStats);
  }

  final Map<ArtifactPieceId, ArtifactSetId> _artifactPieceSetMap;
  @override
  Map<ArtifactPieceId, ArtifactSetId> get artifactPieceSetMap {
    if (_artifactPieceSetMap is EqualUnmodifiableMapView)
      return _artifactPieceSetMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_artifactPieceSetMap);
  }

  final List<ArtifactTagCategory> _artifactTags;
  @override
  List<ArtifactTagCategory> get artifactTags {
    if (_artifactTags is EqualUnmodifiableListView) return _artifactTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artifactTags);
  }

  final Map<FurnishingSetId, FurnishingSet> _furnishingSets;
  @override
  Map<FurnishingSetId, FurnishingSet> get furnishingSets {
    if (_furnishingSets is EqualUnmodifiableMapView) return _furnishingSets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_furnishingSets);
  }

  final Map<FurnishingId, Furnishing> _furnishings;
  @override
  Map<FurnishingId, Furnishing> get furnishings {
    if (_furnishings is EqualUnmodifiableMapView) return _furnishings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_furnishings);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssetData &&
            (identical(other.assetDir, assetDir) ||
                other.assetDir == assetDir) &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality()
                .equals(other._characters, _characters) &&
            (identical(other.characterIngredients, characterIngredients) ||
                other.characterIngredients == characterIngredients) &&
            const DeepCollectionEquality().equals(other._weapons, _weapons) &&
            (identical(other.weaponIngredients, weaponIngredients) ||
                other.weaponIngredients == weaponIngredients) &&
            const DeepCollectionEquality()
                .equals(other._weaponSubStats, _weaponSubStats) &&
            const DeepCollectionEquality()
                .equals(other._weaponTypes, _weaponTypes) &&
            const DeepCollectionEquality().equals(other._elements, _elements) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials) &&
            const DeepCollectionEquality()
                .equals(other._materialCategories, _materialCategories) &&
            const DeepCollectionEquality()
                .equals(other._materialSortOrder, _materialSortOrder) &&
            (identical(other.dailyMaterials, dailyMaterials) ||
                other.dailyMaterials == dailyMaterials) &&
            const DeepCollectionEquality()
                .equals(other._artifactSets, _artifactSets) &&
            const DeepCollectionEquality()
                .equals(other._artifactPieceTypes, _artifactPieceTypes) &&
            const DeepCollectionEquality().equals(
                other._specialCharactersUsingMaterials,
                _specialCharactersUsingMaterials) &&
            const DeepCollectionEquality().equals(other._stats, _stats) &&
            const DeepCollectionEquality().equals(
                other._artifactPossibleSubStats, _artifactPossibleSubStats) &&
            const DeepCollectionEquality()
                .equals(other._artifactPieceSetMap, _artifactPieceSetMap) &&
            const DeepCollectionEquality()
                .equals(other._artifactTags, _artifactTags) &&
            const DeepCollectionEquality()
                .equals(other._furnishingSets, _furnishingSets) &&
            const DeepCollectionEquality()
                .equals(other._furnishings, _furnishings));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        assetDir,
        version,
        const DeepCollectionEquality().hash(_characters),
        characterIngredients,
        const DeepCollectionEquality().hash(_weapons),
        weaponIngredients,
        const DeepCollectionEquality().hash(_weaponSubStats),
        const DeepCollectionEquality().hash(_weaponTypes),
        const DeepCollectionEquality().hash(_elements),
        const DeepCollectionEquality().hash(_materials),
        const DeepCollectionEquality().hash(_materialCategories),
        const DeepCollectionEquality().hash(_materialSortOrder),
        dailyMaterials,
        const DeepCollectionEquality().hash(_artifactSets),
        const DeepCollectionEquality().hash(_artifactPieceTypes),
        const DeepCollectionEquality().hash(_specialCharactersUsingMaterials),
        const DeepCollectionEquality().hash(_stats),
        const DeepCollectionEquality().hash(_artifactPossibleSubStats),
        const DeepCollectionEquality().hash(_artifactPieceSetMap),
        const DeepCollectionEquality().hash(_artifactTags),
        const DeepCollectionEquality().hash(_furnishingSets),
        const DeepCollectionEquality().hash(_furnishings)
      ]);

  @override
  String toString() {
    return 'AssetData(assetDir: $assetDir, version: $version, characters: $characters, characterIngredients: $characterIngredients, weapons: $weapons, weaponIngredients: $weaponIngredients, weaponSubStats: $weaponSubStats, weaponTypes: $weaponTypes, elements: $elements, materials: $materials, materialCategories: $materialCategories, materialSortOrder: $materialSortOrder, dailyMaterials: $dailyMaterials, artifactSets: $artifactSets, artifactPieceTypes: $artifactPieceTypes, specialCharactersUsingMaterials: $specialCharactersUsingMaterials, stats: $stats, artifactPossibleSubStats: $artifactPossibleSubStats, artifactPieceSetMap: $artifactPieceSetMap, artifactTags: $artifactTags, furnishingSets: $furnishingSets, furnishings: $furnishings)';
  }
}

// dart format on
