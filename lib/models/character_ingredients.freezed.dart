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
  Map<Purpose, CharacterIngredientsLevels> get purposes =>
      throw _privateConstructorUsedError;

  /// Serializes this CharacterIngredients to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CharacterIngredients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      Map<Purpose, CharacterIngredientsLevels> purposes});
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

  /// Create a copy of CharacterIngredients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expItems = null,
    Object? purposes = null,
  }) {
    return _then(_value.copyWith(
      expItems: null == expItems
          ? _value.expItems
          : expItems // ignore: cast_nullable_to_non_nullable
              as List<ExpItem>,
      purposes: null == purposes
          ? _value.purposes
          : purposes // ignore: cast_nullable_to_non_nullable
              as Map<Purpose, CharacterIngredientsLevels>,
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
      Map<Purpose, CharacterIngredientsLevels> purposes});
}

/// @nodoc
class __$$CharacterIngredientsImplCopyWithImpl<$Res>
    extends _$CharacterIngredientsCopyWithImpl<$Res, _$CharacterIngredientsImpl>
    implements _$$CharacterIngredientsImplCopyWith<$Res> {
  __$$CharacterIngredientsImplCopyWithImpl(_$CharacterIngredientsImpl _value,
      $Res Function(_$CharacterIngredientsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CharacterIngredients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expItems = null,
    Object? purposes = null,
  }) {
    return _then(_$CharacterIngredientsImpl(
      expItems: null == expItems
          ? _value._expItems
          : expItems // ignore: cast_nullable_to_non_nullable
              as List<ExpItem>,
      purposes: null == purposes
          ? _value._purposes
          : purposes // ignore: cast_nullable_to_non_nullable
              as Map<Purpose, CharacterIngredientsLevels>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterIngredientsImpl extends _CharacterIngredients {
  const _$CharacterIngredientsImpl(
      {required final List<ExpItem> expItems,
      required final Map<Purpose, CharacterIngredientsLevels> purposes})
      : _expItems = expItems,
        _purposes = purposes,
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

  final Map<Purpose, CharacterIngredientsLevels> _purposes;
  @override
  Map<Purpose, CharacterIngredientsLevels> get purposes {
    if (_purposes is EqualUnmodifiableMapView) return _purposes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_purposes);
  }

  @override
  String toString() {
    return 'CharacterIngredients(expItems: $expItems, purposes: $purposes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterIngredientsImpl &&
            const DeepCollectionEquality().equals(other._expItems, _expItems) &&
            const DeepCollectionEquality().equals(other._purposes, _purposes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_expItems),
      const DeepCollectionEquality().hash(_purposes));

  /// Create a copy of CharacterIngredients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
          required final Map<Purpose, CharacterIngredientsLevels> purposes}) =
      _$CharacterIngredientsImpl;
  const _CharacterIngredients._() : super._();

  factory _CharacterIngredients.fromJson(Map<String, dynamic> json) =
      _$CharacterIngredientsImpl.fromJson;

  @override
  List<ExpItem> get expItems;
  @override
  Map<Purpose, CharacterIngredientsLevels> get purposes;

  /// Create a copy of CharacterIngredients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Serializes this ExpItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of ExpItem
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of ExpItem
  /// with the given fields replaced by the non-null parameter values.
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemId, expPerItem);

  /// Create a copy of ExpItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of ExpItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpItemImplCopyWith<_$ExpItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CharacterIngredientsLevels _$CharacterIngredientsLevelsFromJson(
    Map<String, dynamic> json) {
  return _CharacterIngredientsLevels.fromJson(json);
}

/// @nodoc
mixin _$CharacterIngredientsLevels {
  Map<int, List<Ingredient>> get levels => throw _privateConstructorUsedError;

  /// Serializes this CharacterIngredientsLevels to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CharacterIngredientsLevels
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
  $Res call({Map<int, List<Ingredient>> levels});
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

  /// Create a copy of CharacterIngredientsLevels
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levels = null,
  }) {
    return _then(_value.copyWith(
      levels: null == levels
          ? _value.levels
          : levels // ignore: cast_nullable_to_non_nullable
              as Map<int, List<Ingredient>>,
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
  $Res call({Map<int, List<Ingredient>> levels});
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

  /// Create a copy of CharacterIngredientsLevels
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levels = null,
  }) {
    return _then(_$CharacterIngredientsLevelsImpl(
      levels: null == levels
          ? _value._levels
          : levels // ignore: cast_nullable_to_non_nullable
              as Map<int, List<Ingredient>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterIngredientsLevelsImpl implements _CharacterIngredientsLevels {
  const _$CharacterIngredientsLevelsImpl(
      {required final Map<int, List<Ingredient>> levels})
      : _levels = levels;

  factory _$CharacterIngredientsLevelsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CharacterIngredientsLevelsImplFromJson(json);

  final Map<int, List<Ingredient>> _levels;
  @override
  Map<int, List<Ingredient>> get levels {
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_levels));

  /// Create a copy of CharacterIngredientsLevels
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
          {required final Map<int, List<Ingredient>> levels}) =
      _$CharacterIngredientsLevelsImpl;

  factory _CharacterIngredientsLevels.fromJson(Map<String, dynamic> json) =
      _$CharacterIngredientsLevelsImpl.fromJson;

  @override
  Map<int, List<Ingredient>> get levels;

  /// Create a copy of CharacterIngredientsLevels
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterIngredientsLevelsImplCopyWith<_$CharacterIngredientsLevelsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
