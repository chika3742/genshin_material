// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_ingredients.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterIngredients {
  List<ExpItem> get expItems;
  Map<Purpose, CharacterIngredientsLevels> get purposes;

  /// Serializes this CharacterIngredients to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CharacterIngredients &&
            const DeepCollectionEquality().equals(other.expItems, expItems) &&
            const DeepCollectionEquality().equals(other.purposes, purposes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(expItems),
      const DeepCollectionEquality().hash(purposes));

  @override
  String toString() {
    return 'CharacterIngredients(expItems: $expItems, purposes: $purposes)';
  }
}

/// @nodoc
@JsonSerializable()
class _CharacterIngredients extends CharacterIngredients {
  const _CharacterIngredients(
      {required final List<ExpItem> expItems,
      required final Map<Purpose, CharacterIngredientsLevels> purposes})
      : _expItems = expItems,
        _purposes = purposes,
        super._();
  factory _CharacterIngredients.fromJson(Map<String, dynamic> json) =>
      _$CharacterIngredientsFromJson(json);

  final List<ExpItem> _expItems;
  @override
  List<ExpItem> get expItems {
    if (_expItems is EqualUnmodifiableListView) return _expItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expItems);
  }

  final Map<Purpose, CharacterIngredientsLevels> _purposes;
  @override
  Map<Purpose, CharacterIngredientsLevels> get purposes {
    if (_purposes is EqualUnmodifiableMapView) return _purposes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_purposes);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CharacterIngredientsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CharacterIngredients &&
            const DeepCollectionEquality().equals(other._expItems, _expItems) &&
            const DeepCollectionEquality().equals(other._purposes, _purposes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_expItems),
      const DeepCollectionEquality().hash(_purposes));

  @override
  String toString() {
    return 'CharacterIngredients(expItems: $expItems, purposes: $purposes)';
  }
}

/// @nodoc
mixin _$ExpItem {
  String get itemId;
  int get expPerItem;

  /// Serializes this ExpItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExpItem &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.expPerItem, expPerItem) ||
                other.expPerItem == expPerItem));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemId, expPerItem);

  @override
  String toString() {
    return 'ExpItem(itemId: $itemId, expPerItem: $expPerItem)';
  }
}

/// @nodoc
@JsonSerializable()
class _ExpItem implements ExpItem {
  const _ExpItem({required this.itemId, required this.expPerItem});
  factory _ExpItem.fromJson(Map<String, dynamic> json) =>
      _$ExpItemFromJson(json);

  @override
  final String itemId;
  @override
  final int expPerItem;

  @override
  Map<String, dynamic> toJson() {
    return _$ExpItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExpItem &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.expPerItem, expPerItem) ||
                other.expPerItem == expPerItem));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemId, expPerItem);

  @override
  String toString() {
    return 'ExpItem(itemId: $itemId, expPerItem: $expPerItem)';
  }
}

/// @nodoc
mixin _$CharacterIngredientsLevels {
  Map<int, List<Ingredient>> get levels;

  /// Serializes this CharacterIngredientsLevels to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CharacterIngredientsLevels &&
            const DeepCollectionEquality().equals(other.levels, levels));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(levels));

  @override
  String toString() {
    return 'CharacterIngredientsLevels(levels: $levels)';
  }
}

/// @nodoc
@JsonSerializable()
class _CharacterIngredientsLevels implements CharacterIngredientsLevels {
  const _CharacterIngredientsLevels(
      {required final Map<int, List<Ingredient>> levels})
      : _levels = levels;
  factory _CharacterIngredientsLevels.fromJson(Map<String, dynamic> json) =>
      _$CharacterIngredientsLevelsFromJson(json);

  final Map<int, List<Ingredient>> _levels;
  @override
  Map<int, List<Ingredient>> get levels {
    if (_levels is EqualUnmodifiableMapView) return _levels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_levels);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CharacterIngredientsLevelsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CharacterIngredientsLevels &&
            const DeepCollectionEquality().equals(other._levels, _levels));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_levels));

  @override
  String toString() {
    return 'CharacterIngredientsLevels(levels: $levels)';
  }
}

// dart format on
