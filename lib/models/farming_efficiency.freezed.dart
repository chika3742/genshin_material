// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

import "package:collection/collection.dart";

part of 'farming_efficiency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DomainEfficiency {
  String get domainId;
  LocalizedText get domainName;
  List<String> get availableDays;
  double get efficiencyScore;
  List<MaterialEfficiency> get materials;
  int get totalBookmarkedQuantity;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DomainEfficiency &&
            (identical(other.domainId, domainId) || other.domainId == domainId) &&
            (identical(other.domainName, domainName) || other.domainName == domainName) &&
            const DeepCollectionEquality().equals(other.availableDays, availableDays) &&
            (identical(other.efficiencyScore, efficiencyScore) || other.efficiencyScore == efficiencyScore) &&
            const DeepCollectionEquality().equals(other.materials, materials) &&
            (identical(other.totalBookmarkedQuantity, totalBookmarkedQuantity) || other.totalBookmarkedQuantity == totalBookmarkedQuantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      domainId,
      domainName,
      const DeepCollectionEquality().hash(availableDays),
      efficiencyScore,
      const DeepCollectionEquality().hash(materials),
      totalBookmarkedQuantity);

  @override
  String toString() {
    return 'DomainEfficiency(domainId: $domainId, domainName: $domainName, availableDays: $availableDays, efficiencyScore: $efficiencyScore, materials: $materials, totalBookmarkedQuantity: $totalBookmarkedQuantity)';
  }
}

/// @nodoc
class _DomainEfficiency extends DomainEfficiency {
  const _DomainEfficiency({
    required this.domainId,
    required this.domainName,
    required final List<String> availableDays,
    required this.efficiencyScore,
    required final List<MaterialEfficiency> materials,
    required this.totalBookmarkedQuantity,
  })  : _availableDays = availableDays,
        _materials = materials,
        super._();

  @override
  final String domainId;
  @override
  final LocalizedText domainName;
  final List<String> _availableDays;
  @override
  List<String> get availableDays {
    if (_availableDays is EqualUnmodifiableListView) return _availableDays;
    return EqualUnmodifiableListView(_availableDays);
  }

  @override
  final double efficiencyScore;
  final List<MaterialEfficiency> _materials;
  @override
  List<MaterialEfficiency> get materials {
    if (_materials is EqualUnmodifiableListView) return _materials;
    return EqualUnmodifiableListView(_materials);
  }

  @override
  final int totalBookmarkedQuantity;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DomainEfficiency &&
            (identical(other.domainId, domainId) || other.domainId == domainId) &&
            (identical(other.domainName, domainName) || other.domainName == domainName) &&
            const DeepCollectionEquality().equals(other._availableDays, _availableDays) &&
            (identical(other.efficiencyScore, efficiencyScore) || other.efficiencyScore == efficiencyScore) &&
            const DeepCollectionEquality().equals(other._materials, _materials) &&
            (identical(other.totalBookmarkedQuantity, totalBookmarkedQuantity) || other.totalBookmarkedQuantity == totalBookmarkedQuantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      domainId,
      domainName,
      const DeepCollectionEquality().hash(_availableDays),
      efficiencyScore,
      const DeepCollectionEquality().hash(_materials),
      totalBookmarkedQuantity);

  @override
  String toString() {
    return 'DomainEfficiency(domainId: $domainId, domainName: $domainName, availableDays: $availableDays, efficiencyScore: $efficiencyScore, materials: $materials, totalBookmarkedQuantity: $totalBookmarkedQuantity)';
  }
}

/// @nodoc
mixin _$MaterialEfficiency {
  MaterialId get materialId;
  LocalizedText get materialName;
  int get bookmarkedQuantity;
  int get rarity;
  double get weightedScore;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MaterialEfficiency &&
            (identical(other.materialId, materialId) || other.materialId == materialId) &&
            (identical(other.materialName, materialName) || other.materialName == materialName) &&
            (identical(other.bookmarkedQuantity, bookmarkedQuantity) || other.bookmarkedQuantity == bookmarkedQuantity) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.weightedScore, weightedScore) || other.weightedScore == weightedScore));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialId, materialName, bookmarkedQuantity, rarity, weightedScore);

  @override
  String toString() {
    return 'MaterialEfficiency(materialId: $materialId, materialName: $materialName, bookmarkedQuantity: $bookmarkedQuantity, rarity: $rarity, weightedScore: $weightedScore)';
  }
}

/// @nodoc
class _MaterialEfficiency implements MaterialEfficiency {
  const _MaterialEfficiency({
    required this.materialId,
    required this.materialName,
    required this.bookmarkedQuantity,
    required this.rarity,
    required this.weightedScore,
  });

  @override
  final MaterialId materialId;
  @override
  final LocalizedText materialName;
  @override
  final int bookmarkedQuantity;
  @override
  final int rarity;
  @override
  final double weightedScore;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MaterialEfficiency &&
            (identical(other.materialId, materialId) || other.materialId == materialId) &&
            (identical(other.materialName, materialName) || other.materialName == materialName) &&
            (identical(other.bookmarkedQuantity, bookmarkedQuantity) || other.bookmarkedQuantity == bookmarkedQuantity) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.weightedScore, weightedScore) || other.weightedScore == weightedScore));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialId, materialName, bookmarkedQuantity, rarity, weightedScore);

  @override
  String toString() {
    return 'MaterialEfficiency(materialId: $materialId, materialName: $materialName, bookmarkedQuantity: $bookmarkedQuantity, rarity: $rarity, weightedScore: $weightedScore)';
  }
}

/// @nodoc
mixin _$FarmingEfficiencyAnalysis {
  List<DomainEfficiency> get talentDomains;
  List<DomainEfficiency> get weaponDomains;
  int get totalBookmarks;
  DateTime get analyzedAt;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FarmingEfficiencyAnalysis &&
            const DeepCollectionEquality().equals(other.talentDomains, talentDomains) &&
            const DeepCollectionEquality().equals(other.weaponDomains, weaponDomains) &&
            (identical(other.totalBookmarks, totalBookmarks) || other.totalBookmarks == totalBookmarks) &&
            (identical(other.analyzedAt, analyzedAt) || other.analyzedAt == analyzedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(talentDomains),
      const DeepCollectionEquality().hash(weaponDomains),
      totalBookmarks,
      analyzedAt);

  @override
  String toString() {
    return 'FarmingEfficiencyAnalysis(talentDomains: $talentDomains, weaponDomains: $weaponDomains, totalBookmarks: $totalBookmarks, analyzedAt: $analyzedAt)';
  }
}

/// @nodoc
class _FarmingEfficiencyAnalysis implements FarmingEfficiencyAnalysis {
  const _FarmingEfficiencyAnalysis({
    required final List<DomainEfficiency> talentDomains,
    required final List<DomainEfficiency> weaponDomains,
    required this.totalBookmarks,
    required this.analyzedAt,
  })  : _talentDomains = talentDomains,
        _weaponDomains = weaponDomains;

  final List<DomainEfficiency> _talentDomains;
  @override
  List<DomainEfficiency> get talentDomains {
    if (_talentDomains is EqualUnmodifiableListView) return _talentDomains;
    return EqualUnmodifiableListView(_talentDomains);
  }

  final List<DomainEfficiency> _weaponDomains;
  @override
  List<DomainEfficiency> get weaponDomains {
    if (_weaponDomains is EqualUnmodifiableListView) return _weaponDomains;
    return EqualUnmodifiableListView(_weaponDomains);
  }

  @override
  final int totalBookmarks;
  @override
  final DateTime analyzedAt;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FarmingEfficiencyAnalysis &&
            const DeepCollectionEquality().equals(other._talentDomains, _talentDomains) &&
            const DeepCollectionEquality().equals(other._weaponDomains, _weaponDomains) &&
            (identical(other.totalBookmarks, totalBookmarks) || other.totalBookmarks == totalBookmarks) &&
            (identical(other.analyzedAt, analyzedAt) || other.analyzedAt == analyzedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_talentDomains),
      const DeepCollectionEquality().hash(_weaponDomains),
      totalBookmarks,
      analyzedAt);

  @override
  String toString() {
    return 'FarmingEfficiencyAnalysis(talentDomains: $talentDomains, weaponDomains: $weaponDomains, totalBookmarks: $totalBookmarks, analyzedAt: $analyzedAt)';
  }
}
