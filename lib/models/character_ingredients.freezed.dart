// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_ingredients.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CharacterIngredients _$CharacterIngredientsFromJson(Map<String, dynamic> json) {
  return _CharacterIngredients.fromJson(json);
}

/// @nodoc
mixin _$CharacterIngredients {
  List<ExpItem> get expItems => throw _privateConstructorUsedError;
  Map<PurposeType, CharacterIngredientsRarities> get purposeTypes =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterIngredientsCopyWith<CharacterIngredients> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterIngredientsCopyWith<$Res> {
  factory $CharacterIngredientsCopyWith(CharacterIngredients value,
          $Res Function(CharacterIngredients) then) =
      _$CharacterIngredientsCopyWithImpl<$Res, CharacterIngredients>;
  @useResult
  $Res call(
      {List<ExpItem> expItems,
      Map<PurposeType, CharacterIngredientsRarities> purposeTypes});
}

/// @nodoc
class _$CharacterIngredientsCopyWithImpl<$Res,
        $Val extends CharacterIngredients>
    implements $CharacterIngredientsCopyWith<$Res> {
  _$CharacterIngredientsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expItems = null,
    Object? purposeTypes = null,
  }) {
    return _then(_value.copyWith(
      expItems: null == expItems
          ? _value.expItems
          : expItems // ignore: cast_nullable_to_non_nullable
              as List<ExpItem>,
      purposeTypes: null == purposeTypes
          ? _value.purposeTypes
          : purposeTypes // ignore: cast_nullable_to_non_nullable
              as Map<PurposeType, CharacterIngredientsRarities>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CharacterIngredientsImplCopyWith<$Res>
    implements $CharacterIngredientsCopyWith<$Res> {
  factory _$$CharacterIngredientsImplCopyWith(_$CharacterIngredientsImpl value,
          $Res Function(_$CharacterIngredientsImpl) then) =
      __$$CharacterIngredientsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ExpItem> expItems,
      Map<PurposeType, CharacterIngredientsRarities> purposeTypes});
}

/// @nodoc
class __$$CharacterIngredientsImplCopyWithImpl<$Res>
    extends _$CharacterIngredientsCopyWithImpl<$Res, _$CharacterIngredientsImpl>
    implements _$$CharacterIngredientsImplCopyWith<$Res> {
  __$$CharacterIngredientsImplCopyWithImpl(_$CharacterIngredientsImpl _value,
      $Res Function(_$CharacterIngredientsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expItems = null,
    Object? purposeTypes = null,
  }) {
    return _then(_$CharacterIngredientsImpl(
      expItems: null == expItems
          ? _value._expItems
          : expItems // ignore: cast_nullable_to_non_nullable
              as List<ExpItem>,
      purposeTypes: null == purposeTypes
          ? _value._purposeTypes
          : purposeTypes // ignore: cast_nullable_to_non_nullable
              as Map<PurposeType, CharacterIngredientsRarities>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterIngredientsImpl extends _CharacterIngredients {
  const _$CharacterIngredientsImpl(
      {required final List<ExpItem> expItems,
      required final Map<PurposeType, CharacterIngredientsRarities>
          purposeTypes})
      : _expItems = expItems,
        _purposeTypes = purposeTypes,
        super._();

  factory _$CharacterIngredientsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterIngredientsImplFromJson(json);

  final List<ExpItem> _expItems;
  @override
  List<ExpItem> get expItems {
    if (_expItems is EqualUnmodifiableListView) return _expItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expItems);
  }

  final Map<PurposeType, CharacterIngredientsRarities> _purposeTypes;
  @override
  Map<PurposeType, CharacterIngredientsRarities> get purposeTypes {
    if (_purposeTypes is EqualUnmodifiableMapView) return _purposeTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_purposeTypes);
  }

  @override
  String toString() {
    return 'CharacterIngredients(expItems: $expItems, purposeTypes: $purposeTypes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterIngredientsImpl &&
            const DeepCollectionEquality().equals(other._expItems, _expItems) &&
            const DeepCollectionEquality()
                .equals(other._purposeTypes, _purposeTypes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_expItems),
      const DeepCollectionEquality().hash(_purposeTypes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterIngredientsImplCopyWith<_$CharacterIngredientsImpl>
      get copyWith =>
          __$$CharacterIngredientsImplCopyWithImpl<_$CharacterIngredientsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterIngredientsImplToJson(
      this,
    );
  }
}

abstract class _CharacterIngredients extends CharacterIngredients {
  const factory _CharacterIngredients(
      {required final List<ExpItem> expItems,
      required final Map<PurposeType, CharacterIngredientsRarities>
          purposeTypes}) = _$CharacterIngredientsImpl;
  const _CharacterIngredients._() : super._();

  factory _CharacterIngredients.fromJson(Map<String, dynamic> json) =
      _$CharacterIngredientsImpl.fromJson;

  @override
  List<ExpItem> get expItems;
  @override
  Map<PurposeType, CharacterIngredientsRarities> get purposeTypes;
  @override
  @JsonKey(ignore: true)
  _$$CharacterIngredientsImplCopyWith<_$CharacterIngredientsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ExpItem _$ExpItemFromJson(Map<String, dynamic> json) {
  return _ExpItem.fromJson(json);
}

/// @nodoc
mixin _$ExpItem {
  String get itemId => throw _privateConstructorUsedError;
  int get expPerItem => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpItemCopyWith<ExpItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpItemCopyWith<$Res> {
  factory $ExpItemCopyWith(ExpItem value, $Res Function(ExpItem) then) =
      _$ExpItemCopyWithImpl<$Res, ExpItem>;
  @useResult
  $Res call({String itemId, int expPerItem});
}

/// @nodoc
class _$ExpItemCopyWithImpl<$Res, $Val extends ExpItem>
    implements $ExpItemCopyWith<$Res> {
  _$ExpItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? expPerItem = null,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      expPerItem: null == expPerItem
          ? _value.expPerItem
          : expPerItem // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpItemImplCopyWith<$Res> implements $ExpItemCopyWith<$Res> {
  factory _$$ExpItemImplCopyWith(
          _$ExpItemImpl value, $Res Function(_$ExpItemImpl) then) =
      __$$ExpItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String itemId, int expPerItem});
}

/// @nodoc
class __$$ExpItemImplCopyWithImpl<$Res>
    extends _$ExpItemCopyWithImpl<$Res, _$ExpItemImpl>
    implements _$$ExpItemImplCopyWith<$Res> {
  __$$ExpItemImplCopyWithImpl(
      _$ExpItemImpl _value, $Res Function(_$ExpItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? expPerItem = null,
  }) {
    return _then(_$ExpItemImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      expPerItem: null == expPerItem
          ? _value.expPerItem
          : expPerItem // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpItemImpl implements _ExpItem {
  const _$ExpItemImpl({required this.itemId, required this.expPerItem});

  factory _$ExpItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpItemImplFromJson(json);

  @override
  final String itemId;
  @override
  final int expPerItem;

  @override
  String toString() {
    return 'ExpItem(itemId: $itemId, expPerItem: $expPerItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.expPerItem, expPerItem) ||
                other.expPerItem == expPerItem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, itemId, expPerItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpItemImplCopyWith<_$ExpItemImpl> get copyWith =>
      __$$ExpItemImplCopyWithImpl<_$ExpItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpItemImplToJson(
      this,
    );
  }
}

abstract class _ExpItem implements ExpItem {
  const factory _ExpItem(
      {required final String itemId,
      required final int expPerItem}) = _$ExpItemImpl;

  factory _ExpItem.fromJson(Map<String, dynamic> json) = _$ExpItemImpl.fromJson;

  @override
  String get itemId;
  @override
  int get expPerItem;
  @override
  @JsonKey(ignore: true)
  _$$ExpItemImplCopyWith<_$ExpItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CharacterIngredientsRarities _$CharacterIngredientsRaritiesFromJson(
    Map<String, dynamic> json) {
  return _CharacterIngredientsRarities.fromJson(json);
}

/// @nodoc
mixin _$CharacterIngredientsRarities {
  Map<int, CharacterIngredientsLevels> get rarities =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterIngredientsRaritiesCopyWith<CharacterIngredientsRarities>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterIngredientsRaritiesCopyWith<$Res> {
  factory $CharacterIngredientsRaritiesCopyWith(
          CharacterIngredientsRarities value,
          $Res Function(CharacterIngredientsRarities) then) =
      _$CharacterIngredientsRaritiesCopyWithImpl<$Res,
          CharacterIngredientsRarities>;
  @useResult
  $Res call({Map<int, CharacterIngredientsLevels> rarities});
}

/// @nodoc
class _$CharacterIngredientsRaritiesCopyWithImpl<$Res,
        $Val extends CharacterIngredientsRarities>
    implements $CharacterIngredientsRaritiesCopyWith<$Res> {
  _$CharacterIngredientsRaritiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rarities = null,
  }) {
    return _then(_value.copyWith(
      rarities: null == rarities
          ? _value.rarities
          : rarities // ignore: cast_nullable_to_non_nullable
              as Map<int, CharacterIngredientsLevels>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CharacterIngredientsRaritiesImplCopyWith<$Res>
    implements $CharacterIngredientsRaritiesCopyWith<$Res> {
  factory _$$CharacterIngredientsRaritiesImplCopyWith(
          _$CharacterIngredientsRaritiesImpl value,
          $Res Function(_$CharacterIngredientsRaritiesImpl) then) =
      __$$CharacterIngredientsRaritiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<int, CharacterIngredientsLevels> rarities});
}

/// @nodoc
class __$$CharacterIngredientsRaritiesImplCopyWithImpl<$Res>
    extends _$CharacterIngredientsRaritiesCopyWithImpl<$Res,
        _$CharacterIngredientsRaritiesImpl>
    implements _$$CharacterIngredientsRaritiesImplCopyWith<$Res> {
  __$$CharacterIngredientsRaritiesImplCopyWithImpl(
      _$CharacterIngredientsRaritiesImpl _value,
      $Res Function(_$CharacterIngredientsRaritiesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rarities = null,
  }) {
    return _then(_$CharacterIngredientsRaritiesImpl(
      rarities: null == rarities
          ? _value._rarities
          : rarities // ignore: cast_nullable_to_non_nullable
              as Map<int, CharacterIngredientsLevels>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterIngredientsRaritiesImpl
    implements _CharacterIngredientsRarities {
  const _$CharacterIngredientsRaritiesImpl(
      {required final Map<int, CharacterIngredientsLevels> rarities})
      : _rarities = rarities;

  factory _$CharacterIngredientsRaritiesImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CharacterIngredientsRaritiesImplFromJson(json);

  final Map<int, CharacterIngredientsLevels> _rarities;
  @override
  Map<int, CharacterIngredientsLevels> get rarities {
    if (_rarities is EqualUnmodifiableMapView) return _rarities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rarities);
  }

  @override
  String toString() {
    return 'CharacterIngredientsRarities(rarities: $rarities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterIngredientsRaritiesImpl &&
            const DeepCollectionEquality().equals(other._rarities, _rarities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rarities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterIngredientsRaritiesImplCopyWith<
          _$CharacterIngredientsRaritiesImpl>
      get copyWith => __$$CharacterIngredientsRaritiesImplCopyWithImpl<
          _$CharacterIngredientsRaritiesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterIngredientsRaritiesImplToJson(
      this,
    );
  }
}

abstract class _CharacterIngredientsRarities
    implements CharacterIngredientsRarities {
  const factory _CharacterIngredientsRarities(
          {required final Map<int, CharacterIngredientsLevels> rarities}) =
      _$CharacterIngredientsRaritiesImpl;

  factory _CharacterIngredientsRarities.fromJson(Map<String, dynamic> json) =
      _$CharacterIngredientsRaritiesImpl.fromJson;

  @override
  Map<int, CharacterIngredientsLevels> get rarities;
  @override
  @JsonKey(ignore: true)
  _$$CharacterIngredientsRaritiesImplCopyWith<
          _$CharacterIngredientsRaritiesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CharacterIngredientsLevels _$CharacterIngredientsLevelsFromJson(
    Map<String, dynamic> json) {
  return _CharacterIngredientsLevels.fromJson(json);
}

/// @nodoc
mixin _$CharacterIngredientsLevels {
  Map<int, List<CharacterIngredient>> get levels =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterIngredientsLevelsCopyWith<CharacterIngredientsLevels>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterIngredientsLevelsCopyWith<$Res> {
  factory $CharacterIngredientsLevelsCopyWith(CharacterIngredientsLevels value,
          $Res Function(CharacterIngredientsLevels) then) =
      _$CharacterIngredientsLevelsCopyWithImpl<$Res,
          CharacterIngredientsLevels>;
  @useResult
  $Res call({Map<int, List<CharacterIngredient>> levels});
}

/// @nodoc
class _$CharacterIngredientsLevelsCopyWithImpl<$Res,
        $Val extends CharacterIngredientsLevels>
    implements $CharacterIngredientsLevelsCopyWith<$Res> {
  _$CharacterIngredientsLevelsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levels = null,
  }) {
    return _then(_value.copyWith(
      levels: null == levels
          ? _value.levels
          : levels // ignore: cast_nullable_to_non_nullable
              as Map<int, List<CharacterIngredient>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CharacterIngredientsLevelsImplCopyWith<$Res>
    implements $CharacterIngredientsLevelsCopyWith<$Res> {
  factory _$$CharacterIngredientsLevelsImplCopyWith(
          _$CharacterIngredientsLevelsImpl value,
          $Res Function(_$CharacterIngredientsLevelsImpl) then) =
      __$$CharacterIngredientsLevelsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<int, List<CharacterIngredient>> levels});
}

/// @nodoc
class __$$CharacterIngredientsLevelsImplCopyWithImpl<$Res>
    extends _$CharacterIngredientsLevelsCopyWithImpl<$Res,
        _$CharacterIngredientsLevelsImpl>
    implements _$$CharacterIngredientsLevelsImplCopyWith<$Res> {
  __$$CharacterIngredientsLevelsImplCopyWithImpl(
      _$CharacterIngredientsLevelsImpl _value,
      $Res Function(_$CharacterIngredientsLevelsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levels = null,
  }) {
    return _then(_$CharacterIngredientsLevelsImpl(
      levels: null == levels
          ? _value._levels
          : levels // ignore: cast_nullable_to_non_nullable
              as Map<int, List<CharacterIngredient>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterIngredientsLevelsImpl implements _CharacterIngredientsLevels {
  const _$CharacterIngredientsLevelsImpl(
      {required final Map<int, List<CharacterIngredient>> levels})
      : _levels = levels;

  factory _$CharacterIngredientsLevelsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CharacterIngredientsLevelsImplFromJson(json);

  final Map<int, List<CharacterIngredient>> _levels;
  @override
  Map<int, List<CharacterIngredient>> get levels {
    if (_levels is EqualUnmodifiableMapView) return _levels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_levels);
  }

  @override
  String toString() {
    return 'CharacterIngredientsLevels(levels: $levels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterIngredientsLevelsImpl &&
            const DeepCollectionEquality().equals(other._levels, _levels));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_levels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterIngredientsLevelsImplCopyWith<_$CharacterIngredientsLevelsImpl>
      get copyWith => __$$CharacterIngredientsLevelsImplCopyWithImpl<
          _$CharacterIngredientsLevelsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterIngredientsLevelsImplToJson(
      this,
    );
  }
}

abstract class _CharacterIngredientsLevels
    implements CharacterIngredientsLevels {
  const factory _CharacterIngredientsLevels(
          {required final Map<int, List<CharacterIngredient>> levels}) =
      _$CharacterIngredientsLevelsImpl;

  factory _CharacterIngredientsLevels.fromJson(Map<String, dynamic> json) =
      _$CharacterIngredientsLevelsImpl.fromJson;

  @override
  Map<int, List<CharacterIngredient>> get levels;
  @override
  @JsonKey(ignore: true)
  _$$CharacterIngredientsLevelsImplCopyWith<_$CharacterIngredientsLevelsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CharacterIngredient _$CharacterIngredientFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'byType':
      return CharacterIngredientByType.fromJson(json);
    case 'exp':
      return CharacterIngredientExp.fromJson(json);
    case 'fixed':
      return CharacterIngredientWithFixedId.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'CharacterIngredient',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$CharacterIngredient {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CharacterIngredientType type, int quantity, int? craftLevel)
        byType,
    required TResult Function(int exp) exp,
    required TResult Function(String itemId, int quantity) fixed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CharacterIngredientType type, int quantity, int? craftLevel)?
        byType,
    TResult? Function(int exp)? exp,
    TResult? Function(String itemId, int quantity)? fixed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CharacterIngredientType type, int quantity, int? craftLevel)?
        byType,
    TResult Function(int exp)? exp,
    TResult Function(String itemId, int quantity)? fixed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CharacterIngredientByType value) byType,
    required TResult Function(CharacterIngredientExp value) exp,
    required TResult Function(CharacterIngredientWithFixedId value) fixed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CharacterIngredientByType value)? byType,
    TResult? Function(CharacterIngredientExp value)? exp,
    TResult? Function(CharacterIngredientWithFixedId value)? fixed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CharacterIngredientByType value)? byType,
    TResult Function(CharacterIngredientExp value)? exp,
    TResult Function(CharacterIngredientWithFixedId value)? fixed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterIngredientCopyWith<$Res> {
  factory $CharacterIngredientCopyWith(
          CharacterIngredient value, $Res Function(CharacterIngredient) then) =
      _$CharacterIngredientCopyWithImpl<$Res, CharacterIngredient>;
}

/// @nodoc
class _$CharacterIngredientCopyWithImpl<$Res, $Val extends CharacterIngredient>
    implements $CharacterIngredientCopyWith<$Res> {
  _$CharacterIngredientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CharacterIngredientByTypeImplCopyWith<$Res> {
  factory _$$CharacterIngredientByTypeImplCopyWith(
          _$CharacterIngredientByTypeImpl value,
          $Res Function(_$CharacterIngredientByTypeImpl) then) =
      __$$CharacterIngredientByTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CharacterIngredientType type, int quantity, int? craftLevel});
}

/// @nodoc
class __$$CharacterIngredientByTypeImplCopyWithImpl<$Res>
    extends _$CharacterIngredientCopyWithImpl<$Res,
        _$CharacterIngredientByTypeImpl>
    implements _$$CharacterIngredientByTypeImplCopyWith<$Res> {
  __$$CharacterIngredientByTypeImplCopyWithImpl(
      _$CharacterIngredientByTypeImpl _value,
      $Res Function(_$CharacterIngredientByTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? quantity = null,
    Object? craftLevel = freezed,
  }) {
    return _then(_$CharacterIngredientByTypeImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CharacterIngredientType,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      craftLevel: freezed == craftLevel
          ? _value.craftLevel
          : craftLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterIngredientByTypeImpl implements CharacterIngredientByType {
  const _$CharacterIngredientByTypeImpl(
      {required this.type,
      required this.quantity,
      this.craftLevel,
      final String? $type})
      : $type = $type ?? 'byType';

  factory _$CharacterIngredientByTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterIngredientByTypeImplFromJson(json);

  @override
  final CharacterIngredientType type;
  @override
  final int quantity;
  @override
  final int? craftLevel;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CharacterIngredient.byType(type: $type, quantity: $quantity, craftLevel: $craftLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterIngredientByTypeImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.craftLevel, craftLevel) ||
                other.craftLevel == craftLevel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, quantity, craftLevel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterIngredientByTypeImplCopyWith<_$CharacterIngredientByTypeImpl>
      get copyWith => __$$CharacterIngredientByTypeImplCopyWithImpl<
          _$CharacterIngredientByTypeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CharacterIngredientType type, int quantity, int? craftLevel)
        byType,
    required TResult Function(int exp) exp,
    required TResult Function(String itemId, int quantity) fixed,
  }) {
    return byType(type, quantity, craftLevel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CharacterIngredientType type, int quantity, int? craftLevel)?
        byType,
    TResult? Function(int exp)? exp,
    TResult? Function(String itemId, int quantity)? fixed,
  }) {
    return byType?.call(type, quantity, craftLevel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CharacterIngredientType type, int quantity, int? craftLevel)?
        byType,
    TResult Function(int exp)? exp,
    TResult Function(String itemId, int quantity)? fixed,
    required TResult orElse(),
  }) {
    if (byType != null) {
      return byType(type, quantity, craftLevel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CharacterIngredientByType value) byType,
    required TResult Function(CharacterIngredientExp value) exp,
    required TResult Function(CharacterIngredientWithFixedId value) fixed,
  }) {
    return byType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CharacterIngredientByType value)? byType,
    TResult? Function(CharacterIngredientExp value)? exp,
    TResult? Function(CharacterIngredientWithFixedId value)? fixed,
  }) {
    return byType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CharacterIngredientByType value)? byType,
    TResult Function(CharacterIngredientExp value)? exp,
    TResult Function(CharacterIngredientWithFixedId value)? fixed,
    required TResult orElse(),
  }) {
    if (byType != null) {
      return byType(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterIngredientByTypeImplToJson(
      this,
    );
  }
}

abstract class CharacterIngredientByType implements CharacterIngredient {
  const factory CharacterIngredientByType(
      {required final CharacterIngredientType type,
      required final int quantity,
      final int? craftLevel}) = _$CharacterIngredientByTypeImpl;

  factory CharacterIngredientByType.fromJson(Map<String, dynamic> json) =
      _$CharacterIngredientByTypeImpl.fromJson;

  CharacterIngredientType get type;
  int get quantity;
  int? get craftLevel;
  @JsonKey(ignore: true)
  _$$CharacterIngredientByTypeImplCopyWith<_$CharacterIngredientByTypeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CharacterIngredientExpImplCopyWith<$Res> {
  factory _$$CharacterIngredientExpImplCopyWith(
          _$CharacterIngredientExpImpl value,
          $Res Function(_$CharacterIngredientExpImpl) then) =
      __$$CharacterIngredientExpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int exp});
}

/// @nodoc
class __$$CharacterIngredientExpImplCopyWithImpl<$Res>
    extends _$CharacterIngredientCopyWithImpl<$Res,
        _$CharacterIngredientExpImpl>
    implements _$$CharacterIngredientExpImplCopyWith<$Res> {
  __$$CharacterIngredientExpImplCopyWithImpl(
      _$CharacterIngredientExpImpl _value,
      $Res Function(_$CharacterIngredientExpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exp = null,
  }) {
    return _then(_$CharacterIngredientExpImpl(
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterIngredientExpImpl implements CharacterIngredientExp {
  const _$CharacterIngredientExpImpl({required this.exp, final String? $type})
      : $type = $type ?? 'exp';

  factory _$CharacterIngredientExpImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterIngredientExpImplFromJson(json);

  @override
  final int exp;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CharacterIngredient.exp(exp: $exp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterIngredientExpImpl &&
            (identical(other.exp, exp) || other.exp == exp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, exp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterIngredientExpImplCopyWith<_$CharacterIngredientExpImpl>
      get copyWith => __$$CharacterIngredientExpImplCopyWithImpl<
          _$CharacterIngredientExpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CharacterIngredientType type, int quantity, int? craftLevel)
        byType,
    required TResult Function(int exp) exp,
    required TResult Function(String itemId, int quantity) fixed,
  }) {
    return exp(this.exp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CharacterIngredientType type, int quantity, int? craftLevel)?
        byType,
    TResult? Function(int exp)? exp,
    TResult? Function(String itemId, int quantity)? fixed,
  }) {
    return exp?.call(this.exp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CharacterIngredientType type, int quantity, int? craftLevel)?
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
    required TResult Function(CharacterIngredientByType value) byType,
    required TResult Function(CharacterIngredientExp value) exp,
    required TResult Function(CharacterIngredientWithFixedId value) fixed,
  }) {
    return exp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CharacterIngredientByType value)? byType,
    TResult? Function(CharacterIngredientExp value)? exp,
    TResult? Function(CharacterIngredientWithFixedId value)? fixed,
  }) {
    return exp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CharacterIngredientByType value)? byType,
    TResult Function(CharacterIngredientExp value)? exp,
    TResult Function(CharacterIngredientWithFixedId value)? fixed,
    required TResult orElse(),
  }) {
    if (exp != null) {
      return exp(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterIngredientExpImplToJson(
      this,
    );
  }
}

abstract class CharacterIngredientExp implements CharacterIngredient {
  const factory CharacterIngredientExp({required final int exp}) =
      _$CharacterIngredientExpImpl;

  factory CharacterIngredientExp.fromJson(Map<String, dynamic> json) =
      _$CharacterIngredientExpImpl.fromJson;

  int get exp;
  @JsonKey(ignore: true)
  _$$CharacterIngredientExpImplCopyWith<_$CharacterIngredientExpImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CharacterIngredientWithFixedIdImplCopyWith<$Res> {
  factory _$$CharacterIngredientWithFixedIdImplCopyWith(
          _$CharacterIngredientWithFixedIdImpl value,
          $Res Function(_$CharacterIngredientWithFixedIdImpl) then) =
      __$$CharacterIngredientWithFixedIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String itemId, int quantity});
}

/// @nodoc
class __$$CharacterIngredientWithFixedIdImplCopyWithImpl<$Res>
    extends _$CharacterIngredientCopyWithImpl<$Res,
        _$CharacterIngredientWithFixedIdImpl>
    implements _$$CharacterIngredientWithFixedIdImplCopyWith<$Res> {
  __$$CharacterIngredientWithFixedIdImplCopyWithImpl(
      _$CharacterIngredientWithFixedIdImpl _value,
      $Res Function(_$CharacterIngredientWithFixedIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? quantity = null,
  }) {
    return _then(_$CharacterIngredientWithFixedIdImpl(
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
class _$CharacterIngredientWithFixedIdImpl
    implements CharacterIngredientWithFixedId {
  const _$CharacterIngredientWithFixedIdImpl(
      {required this.itemId, required this.quantity, final String? $type})
      : $type = $type ?? 'fixed';

  factory _$CharacterIngredientWithFixedIdImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CharacterIngredientWithFixedIdImplFromJson(json);

  @override
  final String itemId;
  @override
  final int quantity;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CharacterIngredient.fixed(itemId: $itemId, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterIngredientWithFixedIdImpl &&
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
  _$$CharacterIngredientWithFixedIdImplCopyWith<
          _$CharacterIngredientWithFixedIdImpl>
      get copyWith => __$$CharacterIngredientWithFixedIdImplCopyWithImpl<
          _$CharacterIngredientWithFixedIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CharacterIngredientType type, int quantity, int? craftLevel)
        byType,
    required TResult Function(int exp) exp,
    required TResult Function(String itemId, int quantity) fixed,
  }) {
    return fixed(itemId, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CharacterIngredientType type, int quantity, int? craftLevel)?
        byType,
    TResult? Function(int exp)? exp,
    TResult? Function(String itemId, int quantity)? fixed,
  }) {
    return fixed?.call(itemId, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CharacterIngredientType type, int quantity, int? craftLevel)?
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
    required TResult Function(CharacterIngredientByType value) byType,
    required TResult Function(CharacterIngredientExp value) exp,
    required TResult Function(CharacterIngredientWithFixedId value) fixed,
  }) {
    return fixed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CharacterIngredientByType value)? byType,
    TResult? Function(CharacterIngredientExp value)? exp,
    TResult? Function(CharacterIngredientWithFixedId value)? fixed,
  }) {
    return fixed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CharacterIngredientByType value)? byType,
    TResult Function(CharacterIngredientExp value)? exp,
    TResult Function(CharacterIngredientWithFixedId value)? fixed,
    required TResult orElse(),
  }) {
    if (fixed != null) {
      return fixed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterIngredientWithFixedIdImplToJson(
      this,
    );
  }
}

abstract class CharacterIngredientWithFixedId implements CharacterIngredient {
  const factory CharacterIngredientWithFixedId(
      {required final String itemId,
      required final int quantity}) = _$CharacterIngredientWithFixedIdImpl;

  factory CharacterIngredientWithFixedId.fromJson(Map<String, dynamic> json) =
      _$CharacterIngredientWithFixedIdImpl.fromJson;

  String get itemId;
  int get quantity;
  @JsonKey(ignore: true)
  _$$CharacterIngredientWithFixedIdImplCopyWith<
          _$CharacterIngredientWithFixedIdImpl>
      get copyWith => throw _privateConstructorUsedError;
}