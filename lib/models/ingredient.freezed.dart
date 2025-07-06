// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'byType':
      return IngredientByType.fromJson(json);
    case 'exp':
      return IngredientExp.fromJson(json);
    case 'fixed':
      return IngredientWithFixedId.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Ingredient',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Ingredient {
  /// Serializes this Ingredient to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Ingredient);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Ingredient()';
  }
}

/// @nodoc
@JsonSerializable()
class IngredientByType implements Ingredient {
  const IngredientByType(
      {required this.type,
      required this.quantity,
      this.craftLevel,
      final Map<CharacterId, MaterialId?>? specificCharacters,
      final String? $type})
      : _specificCharacters = specificCharacters,
        $type = $type ?? 'byType';
  factory IngredientByType.fromJson(Map<String, dynamic> json) =>
      _$IngredientByTypeFromJson(json);

  final String type;
  final int quantity;
  final int? craftLevel;
  final Map<CharacterId, MaterialId?>? _specificCharacters;
  Map<CharacterId, MaterialId?>? get specificCharacters {
    final value = _specificCharacters;
    if (value == null) return null;
    if (_specificCharacters is EqualUnmodifiableMapView)
      return _specificCharacters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$IngredientByTypeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IngredientByType &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.craftLevel, craftLevel) ||
                other.craftLevel == craftLevel) &&
            const DeepCollectionEquality()
                .equals(other._specificCharacters, _specificCharacters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, quantity, craftLevel,
      const DeepCollectionEquality().hash(_specificCharacters));

  @override
  String toString() {
    return 'Ingredient.byType(type: $type, quantity: $quantity, craftLevel: $craftLevel, specificCharacters: $specificCharacters)';
  }
}

/// @nodoc
@JsonSerializable()
class IngredientExp implements Ingredient {
  const IngredientExp({required this.exp, final String? $type})
      : $type = $type ?? 'exp';
  factory IngredientExp.fromJson(Map<String, dynamic> json) =>
      _$IngredientExpFromJson(json);

  final int exp;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$IngredientExpToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IngredientExp &&
            (identical(other.exp, exp) || other.exp == exp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, exp);

  @override
  String toString() {
    return 'Ingredient.exp(exp: $exp)';
  }
}

/// @nodoc
@JsonSerializable()
class IngredientWithFixedId implements Ingredient {
  const IngredientWithFixedId(
      {required this.itemId, required this.quantity, final String? $type})
      : $type = $type ?? 'fixed';
  factory IngredientWithFixedId.fromJson(Map<String, dynamic> json) =>
      _$IngredientWithFixedIdFromJson(json);

  final String itemId;
  final int quantity;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$IngredientWithFixedIdToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IngredientWithFixedId &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemId, quantity);

  @override
  String toString() {
    return 'Ingredient.fixed(itemId: $itemId, quantity: $quantity)';
  }
}

// dart format on
