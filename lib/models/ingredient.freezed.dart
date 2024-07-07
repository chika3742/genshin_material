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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type, int quantity, int? craftLevel,
            Map<String, String?>? specificCharacters)
        byType,
    required TResult Function(int exp) exp,
    required TResult Function(String itemId, int quantity) fixed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type, int quantity, int? craftLevel,
            Map<String, String?>? specificCharacters)?
        byType,
    TResult? Function(int exp)? exp,
    TResult? Function(String itemId, int quantity)? fixed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type, int quantity, int? craftLevel,
            Map<String, String?>? specificCharacters)?
        byType,
    TResult Function(int exp)? exp,
    TResult Function(String itemId, int quantity)? fixed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IngredientByType value) byType,
    required TResult Function(IngredientExp value) exp,
    required TResult Function(IngredientWithFixedId value) fixed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IngredientByType value)? byType,
    TResult? Function(IngredientExp value)? exp,
    TResult? Function(IngredientWithFixedId value)? fixed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IngredientByType value)? byType,
    TResult Function(IngredientExp value)? exp,
    TResult Function(IngredientWithFixedId value)? fixed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientCopyWith<$Res> {
  factory $IngredientCopyWith(
          Ingredient value, $Res Function(Ingredient) then) =
      _$IngredientCopyWithImpl<$Res, Ingredient>;
}

/// @nodoc
class _$IngredientCopyWithImpl<$Res, $Val extends Ingredient>
    implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IngredientByTypeImplCopyWith<$Res> {
  factory _$$IngredientByTypeImplCopyWith(_$IngredientByTypeImpl value,
          $Res Function(_$IngredientByTypeImpl) then) =
      __$$IngredientByTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String type,
      int quantity,
      int? craftLevel,
      Map<String, String?>? specificCharacters});
}

/// @nodoc
class __$$IngredientByTypeImplCopyWithImpl<$Res>
    extends _$IngredientCopyWithImpl<$Res, _$IngredientByTypeImpl>
    implements _$$IngredientByTypeImplCopyWith<$Res> {
  __$$IngredientByTypeImplCopyWithImpl(_$IngredientByTypeImpl _value,
      $Res Function(_$IngredientByTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? quantity = null,
    Object? craftLevel = freezed,
    Object? specificCharacters = freezed,
  }) {
    return _then(_$IngredientByTypeImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      craftLevel: freezed == craftLevel
          ? _value.craftLevel
          : craftLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      specificCharacters: freezed == specificCharacters
          ? _value._specificCharacters
          : specificCharacters // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>?,
    ));
  }
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, quantity, craftLevel,
      const DeepCollectionEquality().hash(_specificCharacters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientByTypeImplCopyWith<_$IngredientByTypeImpl> get copyWith =>
      __$$IngredientByTypeImplCopyWithImpl<_$IngredientByTypeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type, int quantity, int? craftLevel,
            Map<String, String?>? specificCharacters)
        byType,
    required TResult Function(int exp) exp,
    required TResult Function(String itemId, int quantity) fixed,
  }) {
    return byType(type, quantity, craftLevel, specificCharacters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type, int quantity, int? craftLevel,
            Map<String, String?>? specificCharacters)?
        byType,
    TResult? Function(int exp)? exp,
    TResult? Function(String itemId, int quantity)? fixed,
  }) {
    return byType?.call(type, quantity, craftLevel, specificCharacters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type, int quantity, int? craftLevel,
            Map<String, String?>? specificCharacters)?
        byType,
    TResult Function(int exp)? exp,
    TResult Function(String itemId, int quantity)? fixed,
    required TResult orElse(),
  }) {
    if (byType != null) {
      return byType(type, quantity, craftLevel, specificCharacters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IngredientByType value) byType,
    required TResult Function(IngredientExp value) exp,
    required TResult Function(IngredientWithFixedId value) fixed,
  }) {
    return byType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IngredientByType value)? byType,
    TResult? Function(IngredientExp value)? exp,
    TResult? Function(IngredientWithFixedId value)? fixed,
  }) {
    return byType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IngredientByType value)? byType,
    TResult Function(IngredientExp value)? exp,
    TResult Function(IngredientWithFixedId value)? fixed,
    required TResult orElse(),
  }) {
    if (byType != null) {
      return byType(this);
    }
    return orElse();
  }

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
  @JsonKey(ignore: true)
  _$$IngredientByTypeImplCopyWith<_$IngredientByTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IngredientExpImplCopyWith<$Res> {
  factory _$$IngredientExpImplCopyWith(
          _$IngredientExpImpl value, $Res Function(_$IngredientExpImpl) then) =
      __$$IngredientExpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int exp});
}

/// @nodoc
class __$$IngredientExpImplCopyWithImpl<$Res>
    extends _$IngredientCopyWithImpl<$Res, _$IngredientExpImpl>
    implements _$$IngredientExpImplCopyWith<$Res> {
  __$$IngredientExpImplCopyWithImpl(
      _$IngredientExpImpl _value, $Res Function(_$IngredientExpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exp = null,
  }) {
    return _then(_$IngredientExpImpl(
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, exp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientExpImplCopyWith<_$IngredientExpImpl> get copyWith =>
      __$$IngredientExpImplCopyWithImpl<_$IngredientExpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type, int quantity, int? craftLevel,
            Map<String, String?>? specificCharacters)
        byType,
    required TResult Function(int exp) exp,
    required TResult Function(String itemId, int quantity) fixed,
  }) {
    return exp(this.exp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type, int quantity, int? craftLevel,
            Map<String, String?>? specificCharacters)?
        byType,
    TResult? Function(int exp)? exp,
    TResult? Function(String itemId, int quantity)? fixed,
  }) {
    return exp?.call(this.exp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type, int quantity, int? craftLevel,
            Map<String, String?>? specificCharacters)?
        byType,
    TResult Function(int exp)? exp,
    TResult Function(String itemId, int quantity)? fixed,
    required TResult orElse(),
  }) {
    if (exp != null) {
      return exp(this.exp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IngredientByType value) byType,
    required TResult Function(IngredientExp value) exp,
    required TResult Function(IngredientWithFixedId value) fixed,
  }) {
    return exp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IngredientByType value)? byType,
    TResult? Function(IngredientExp value)? exp,
    TResult? Function(IngredientWithFixedId value)? fixed,
  }) {
    return exp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IngredientByType value)? byType,
    TResult Function(IngredientExp value)? exp,
    TResult Function(IngredientWithFixedId value)? fixed,
    required TResult orElse(),
  }) {
    if (exp != null) {
      return exp(this);
    }
    return orElse();
  }

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
  @JsonKey(ignore: true)
  _$$IngredientExpImplCopyWith<_$IngredientExpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IngredientWithFixedIdImplCopyWith<$Res> {
  factory _$$IngredientWithFixedIdImplCopyWith(
          _$IngredientWithFixedIdImpl value,
          $Res Function(_$IngredientWithFixedIdImpl) then) =
      __$$IngredientWithFixedIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String itemId, int quantity});
}

/// @nodoc
class __$$IngredientWithFixedIdImplCopyWithImpl<$Res>
    extends _$IngredientCopyWithImpl<$Res, _$IngredientWithFixedIdImpl>
    implements _$$IngredientWithFixedIdImplCopyWith<$Res> {
  __$$IngredientWithFixedIdImplCopyWithImpl(_$IngredientWithFixedIdImpl _value,
      $Res Function(_$IngredientWithFixedIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? quantity = null,
  }) {
    return _then(_$IngredientWithFixedIdImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, itemId, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientWithFixedIdImplCopyWith<_$IngredientWithFixedIdImpl>
      get copyWith => __$$IngredientWithFixedIdImplCopyWithImpl<
          _$IngredientWithFixedIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type, int quantity, int? craftLevel,
            Map<String, String?>? specificCharacters)
        byType,
    required TResult Function(int exp) exp,
    required TResult Function(String itemId, int quantity) fixed,
  }) {
    return fixed(itemId, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type, int quantity, int? craftLevel,
            Map<String, String?>? specificCharacters)?
        byType,
    TResult? Function(int exp)? exp,
    TResult? Function(String itemId, int quantity)? fixed,
  }) {
    return fixed?.call(itemId, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type, int quantity, int? craftLevel,
            Map<String, String?>? specificCharacters)?
        byType,
    TResult Function(int exp)? exp,
    TResult Function(String itemId, int quantity)? fixed,
    required TResult orElse(),
  }) {
    if (fixed != null) {
      return fixed(itemId, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IngredientByType value) byType,
    required TResult Function(IngredientExp value) exp,
    required TResult Function(IngredientWithFixedId value) fixed,
  }) {
    return fixed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IngredientByType value)? byType,
    TResult? Function(IngredientExp value)? exp,
    TResult? Function(IngredientWithFixedId value)? fixed,
  }) {
    return fixed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IngredientByType value)? byType,
    TResult Function(IngredientExp value)? exp,
    TResult Function(IngredientWithFixedId value)? fixed,
    required TResult orElse(),
  }) {
    if (fixed != null) {
      return fixed(this);
    }
    return orElse();
  }

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
  @JsonKey(ignore: true)
  _$$IngredientWithFixedIdImplCopyWith<_$IngredientWithFixedIdImpl>
      get copyWith => throw _privateConstructorUsedError;
}
