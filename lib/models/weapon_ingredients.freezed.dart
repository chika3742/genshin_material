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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeaponIngredientsCopyWith<WeaponIngredients> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeaponIngredientsCopyWith<$Res> {
  factory $WeaponIngredientsCopyWith(
          WeaponIngredients value, $Res Function(WeaponIngredients) then) =
      _$WeaponIngredientsCopyWithImpl<$Res, WeaponIngredients>;
  @useResult
  $Res call(
      {List<ExpItem> expItems, Map<int, WeaponIngredientsLevels> rarities});
}

/// @nodoc
class _$WeaponIngredientsCopyWithImpl<$Res, $Val extends WeaponIngredients>
    implements $WeaponIngredientsCopyWith<$Res> {
  _$WeaponIngredientsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expItems = null,
    Object? rarities = null,
  }) {
    return _then(_value.copyWith(
      expItems: null == expItems
          ? _value.expItems
          : expItems // ignore: cast_nullable_to_non_nullable
              as List<ExpItem>,
      rarities: null == rarities
          ? _value.rarities
          : rarities // ignore: cast_nullable_to_non_nullable
              as Map<int, WeaponIngredientsLevels>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeaponIngredientsImplCopyWith<$Res>
    implements $WeaponIngredientsCopyWith<$Res> {
  factory _$$WeaponIngredientsImplCopyWith(_$WeaponIngredientsImpl value,
          $Res Function(_$WeaponIngredientsImpl) then) =
      __$$WeaponIngredientsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ExpItem> expItems, Map<int, WeaponIngredientsLevels> rarities});
}

/// @nodoc
class __$$WeaponIngredientsImplCopyWithImpl<$Res>
    extends _$WeaponIngredientsCopyWithImpl<$Res, _$WeaponIngredientsImpl>
    implements _$$WeaponIngredientsImplCopyWith<$Res> {
  __$$WeaponIngredientsImplCopyWithImpl(_$WeaponIngredientsImpl _value,
      $Res Function(_$WeaponIngredientsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expItems = null,
    Object? rarities = null,
  }) {
    return _then(_$WeaponIngredientsImpl(
      expItems: null == expItems
          ? _value._expItems
          : expItems // ignore: cast_nullable_to_non_nullable
              as List<ExpItem>,
      rarities: null == rarities
          ? _value._rarities
          : rarities // ignore: cast_nullable_to_non_nullable
              as Map<int, WeaponIngredientsLevels>,
    ));
  }
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_expItems),
      const DeepCollectionEquality().hash(_rarities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeaponIngredientsImplCopyWith<_$WeaponIngredientsImpl> get copyWith =>
      __$$WeaponIngredientsImplCopyWithImpl<_$WeaponIngredientsImpl>(
          this, _$identity);

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
  @override
  @JsonKey(ignore: true)
  _$$WeaponIngredientsImplCopyWith<_$WeaponIngredientsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeaponIngredientsLevels _$WeaponIngredientsLevelsFromJson(
    Map<String, dynamic> json) {
  return _WeaponIngredientsLevels.fromJson(json);
}

/// @nodoc
mixin _$WeaponIngredientsLevels {
  Map<int, List<Ingredient>> get levels => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeaponIngredientsLevelsCopyWith<WeaponIngredientsLevels> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeaponIngredientsLevelsCopyWith<$Res> {
  factory $WeaponIngredientsLevelsCopyWith(WeaponIngredientsLevels value,
          $Res Function(WeaponIngredientsLevels) then) =
      _$WeaponIngredientsLevelsCopyWithImpl<$Res, WeaponIngredientsLevels>;
  @useResult
  $Res call({Map<int, List<Ingredient>> levels});
}

/// @nodoc
class _$WeaponIngredientsLevelsCopyWithImpl<$Res,
        $Val extends WeaponIngredientsLevels>
    implements $WeaponIngredientsLevelsCopyWith<$Res> {
  _$WeaponIngredientsLevelsCopyWithImpl(this._value, this._then);

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
              as Map<int, List<Ingredient>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeaponIngredientsLevelsImplCopyWith<$Res>
    implements $WeaponIngredientsLevelsCopyWith<$Res> {
  factory _$$WeaponIngredientsLevelsImplCopyWith(
          _$WeaponIngredientsLevelsImpl value,
          $Res Function(_$WeaponIngredientsLevelsImpl) then) =
      __$$WeaponIngredientsLevelsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<int, List<Ingredient>> levels});
}

/// @nodoc
class __$$WeaponIngredientsLevelsImplCopyWithImpl<$Res>
    extends _$WeaponIngredientsLevelsCopyWithImpl<$Res,
        _$WeaponIngredientsLevelsImpl>
    implements _$$WeaponIngredientsLevelsImplCopyWith<$Res> {
  __$$WeaponIngredientsLevelsImplCopyWithImpl(
      _$WeaponIngredientsLevelsImpl _value,
      $Res Function(_$WeaponIngredientsLevelsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levels = null,
  }) {
    return _then(_$WeaponIngredientsLevelsImpl(
      levels: null == levels
          ? _value._levels
          : levels // ignore: cast_nullable_to_non_nullable
              as Map<int, List<Ingredient>>,
    ));
  }
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

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_levels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeaponIngredientsLevelsImplCopyWith<_$WeaponIngredientsLevelsImpl>
      get copyWith => __$$WeaponIngredientsLevelsImplCopyWithImpl<
          _$WeaponIngredientsLevelsImpl>(this, _$identity);

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
  @override
  @JsonKey(ignore: true)
  _$$WeaponIngredientsLevelsImplCopyWith<_$WeaponIngredientsLevelsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
