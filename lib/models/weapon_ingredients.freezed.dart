// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weapon_ingredients.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeaponIngredients {
  List<ExpItem> get expItems;
  Map<int, WeaponIngredientsLevels> get rarities;

  /// Serializes this WeaponIngredients to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeaponIngredients &&
            const DeepCollectionEquality().equals(other.expItems, expItems) &&
            const DeepCollectionEquality().equals(other.rarities, rarities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(expItems),
      const DeepCollectionEquality().hash(rarities));

  @override
  String toString() {
    return 'WeaponIngredients(expItems: $expItems, rarities: $rarities)';
  }
}

/// @nodoc
@JsonSerializable()
class _WeaponIngredients implements WeaponIngredients {
  const _WeaponIngredients(
      {required final List<ExpItem> expItems,
      required final Map<int, WeaponIngredientsLevels> rarities})
      : _expItems = expItems,
        _rarities = rarities;
  factory _WeaponIngredients.fromJson(Map<String, dynamic> json) =>
      _$WeaponIngredientsFromJson(json);

  final List<ExpItem> _expItems;
  @override
  List<ExpItem> get expItems {
    if (_expItems is EqualUnmodifiableListView) return _expItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expItems);
  }

  final Map<int, WeaponIngredientsLevels> _rarities;
  @override
  Map<int, WeaponIngredientsLevels> get rarities {
    if (_rarities is EqualUnmodifiableMapView) return _rarities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rarities);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$WeaponIngredientsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeaponIngredients &&
            const DeepCollectionEquality().equals(other._expItems, _expItems) &&
            const DeepCollectionEquality().equals(other._rarities, _rarities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_expItems),
      const DeepCollectionEquality().hash(_rarities));

  @override
  String toString() {
    return 'WeaponIngredients(expItems: $expItems, rarities: $rarities)';
  }
}

/// @nodoc
mixin _$WeaponIngredientsLevels {
  Map<int, List<Ingredient>> get levels;

  /// Serializes this WeaponIngredientsLevels to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeaponIngredientsLevels &&
            const DeepCollectionEquality().equals(other.levels, levels));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(levels));

  @override
  String toString() {
    return 'WeaponIngredientsLevels(levels: $levels)';
  }
}

/// @nodoc
@JsonSerializable()
class _WeaponIngredientsLevels implements WeaponIngredientsLevels {
  const _WeaponIngredientsLevels(
      {required final Map<int, List<Ingredient>> levels})
      : _levels = levels;
  factory _WeaponIngredientsLevels.fromJson(Map<String, dynamic> json) =>
      _$WeaponIngredientsLevelsFromJson(json);

  final Map<int, List<Ingredient>> _levels;
  @override
  Map<int, List<Ingredient>> get levels {
    if (_levels is EqualUnmodifiableMapView) return _levels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_levels);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$WeaponIngredientsLevelsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeaponIngredientsLevels &&
            const DeepCollectionEquality().equals(other._levels, _levels));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_levels));

  @override
  String toString() {
    return 'WeaponIngredientsLevels(levels: $levels)';
  }
}

// dart format on
