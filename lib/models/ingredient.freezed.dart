// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$IngredientByTypeImpl implements IngredientByType {
  const _$IngredientByTypeImpl(
      {required this.type,
      required this.quantity,
      this.craftLevel,
      final Map<String, String?>? specificCharacters,
      final String? $type})
      : _specificCharacters = specificCharacters,
        $type = $type ?? 'byType';

  factory _$IngredientByTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientByTypeImplFromJson(json);

  @override
  final String type;
  @override
  final int quantity;
  @override
  final int? craftLevel;
  final Map<String, String?>? _specificCharacters;
  @override
  Map<String, String?>? get specificCharacters {
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
  String toString() {
    return 'Ingredient.byType(type: $type, quantity: $quantity, craftLevel: $craftLevel, specificCharacters: $specificCharacters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientByTypeImpl &&
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
  Map<String, dynamic> toJson() {
    return _$$IngredientByTypeImplToJson(
      this,
    );
  }
}

abstract class IngredientByType implements Ingredient {
  const factory IngredientByType(
      {required final String type,
      required final int quantity,
      final int? craftLevel,
      final Map<String, String?>? specificCharacters}) = _$IngredientByTypeImpl;

  factory IngredientByType.fromJson(Map<String, dynamic> json) =
      _$IngredientByTypeImpl.fromJson;

  String get type;
  int get quantity;
  int? get craftLevel;
  Map<String, String?>? get specificCharacters;
}

/// @nodoc
@JsonSerializable()
class _$IngredientExpImpl implements IngredientExp {
  const _$IngredientExpImpl({required this.exp, final String? $type})
      : $type = $type ?? 'exp';

  factory _$IngredientExpImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientExpImplFromJson(json);

  @override
  final int exp;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Ingredient.exp(exp: $exp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientExpImpl &&
            (identical(other.exp, exp) || other.exp == exp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, exp);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientExpImplToJson(
      this,
    );
  }
}

abstract class IngredientExp implements Ingredient {
  const factory IngredientExp({required final int exp}) = _$IngredientExpImpl;

  factory IngredientExp.fromJson(Map<String, dynamic> json) =
      _$IngredientExpImpl.fromJson;

  int get exp;
}

/// @nodoc
@JsonSerializable()
class _$IngredientWithFixedIdImpl implements IngredientWithFixedId {
  const _$IngredientWithFixedIdImpl(
      {required this.itemId, required this.quantity, final String? $type})
      : $type = $type ?? 'fixed';

  factory _$IngredientWithFixedIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientWithFixedIdImplFromJson(json);

  @override
  final String itemId;
  @override
  final int quantity;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Ingredient.fixed(itemId: $itemId, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientWithFixedIdImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemId, quantity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientWithFixedIdImplToJson(
      this,
    );
  }
}

abstract class IngredientWithFixedId implements Ingredient {
  const factory IngredientWithFixedId(
      {required final String itemId,
      required final int quantity}) = _$IngredientWithFixedIdImpl;

  factory IngredientWithFixedId.fromJson(Map<String, dynamic> json) =
      _$IngredientWithFixedIdImpl.fromJson;

  String get itemId;
  int get quantity;
}
