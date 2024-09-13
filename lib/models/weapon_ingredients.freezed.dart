// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weapon_ingredients.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeaponIngredients _$WeaponIngredientsFromJson(Map<String, dynamic> json) {
  return _WeaponIngredients.fromJson(json);
}

/// @nodoc
mixin _$WeaponIngredients {
  List<ExpItem> get expItems => throw _privateConstructorUsedError;
  Map<int, WeaponIngredientsLevels> get rarities =>
      throw _privateConstructorUsedError;

  /// Serializes this WeaponIngredients to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$WeaponIngredientsImpl implements _WeaponIngredients {
  const _$WeaponIngredientsImpl(
      {required final List<ExpItem> expItems,
      required final Map<int, WeaponIngredientsLevels> rarities})
      : _expItems = expItems,
        _rarities = rarities;

  factory _$WeaponIngredientsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeaponIngredientsImplFromJson(json);

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
  String toString() {
    return 'WeaponIngredients(expItems: $expItems, rarities: $rarities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponIngredientsImpl &&
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
  Map<String, dynamic> toJson() {
    return _$$WeaponIngredientsImplToJson(
      this,
    );
  }
}

abstract class _WeaponIngredients implements WeaponIngredients {
  const factory _WeaponIngredients(
          {required final List<ExpItem> expItems,
          required final Map<int, WeaponIngredientsLevels> rarities}) =
      _$WeaponIngredientsImpl;

  factory _WeaponIngredients.fromJson(Map<String, dynamic> json) =
      _$WeaponIngredientsImpl.fromJson;

  @override
  List<ExpItem> get expItems;
  @override
  Map<int, WeaponIngredientsLevels> get rarities;
}

WeaponIngredientsLevels _$WeaponIngredientsLevelsFromJson(
    Map<String, dynamic> json) {
  return _WeaponIngredientsLevels.fromJson(json);
}

/// @nodoc
mixin _$WeaponIngredientsLevels {
  Map<int, List<Ingredient>> get levels => throw _privateConstructorUsedError;

  /// Serializes this WeaponIngredientsLevels to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$WeaponIngredientsLevelsImpl implements _WeaponIngredientsLevels {
  const _$WeaponIngredientsLevelsImpl(
      {required final Map<int, List<Ingredient>> levels})
      : _levels = levels;

  factory _$WeaponIngredientsLevelsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeaponIngredientsLevelsImplFromJson(json);

  final Map<int, List<Ingredient>> _levels;
  @override
  Map<int, List<Ingredient>> get levels {
    if (_levels is EqualUnmodifiableMapView) return _levels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_levels);
  }

  @override
  String toString() {
    return 'WeaponIngredientsLevels(levels: $levels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponIngredientsLevelsImpl &&
            const DeepCollectionEquality().equals(other._levels, _levels));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_levels));

  @override
  Map<String, dynamic> toJson() {
    return _$$WeaponIngredientsLevelsImplToJson(
      this,
    );
  }
}

abstract class _WeaponIngredientsLevels implements WeaponIngredientsLevels {
  const factory _WeaponIngredientsLevels(
          {required final Map<int, List<Ingredient>> levels}) =
      _$WeaponIngredientsLevelsImpl;

  factory _WeaponIngredientsLevels.fromJson(Map<String, dynamic> json) =
      _$WeaponIngredientsLevelsImpl.fromJson;

  @override
  Map<int, List<Ingredient>> get levels;
}
