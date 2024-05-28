// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmarkable_material.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookmarkableMaterialLevel {
  int get level => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int level, int quantity) $default, {
    required TResult Function(int level, int exp) exp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int level, int quantity)? $default, {
    TResult? Function(int level, int exp)? exp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int level, int quantity)? $default, {
    TResult Function(int level, int exp)? exp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BookmarkableMaterialLevel value) $default, {
    required TResult Function(BookmarkableMaterialLevelExp value) exp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BookmarkableMaterialLevel value)? $default, {
    TResult? Function(BookmarkableMaterialLevelExp value)? exp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BookmarkableMaterialLevel value)? $default, {
    TResult Function(BookmarkableMaterialLevelExp value)? exp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookmarkableMaterialLevelCopyWith<BookmarkableMaterialLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkableMaterialLevelCopyWith<$Res> {
  factory $BookmarkableMaterialLevelCopyWith(BookmarkableMaterialLevel value,
          $Res Function(BookmarkableMaterialLevel) then) =
      _$BookmarkableMaterialLevelCopyWithImpl<$Res, BookmarkableMaterialLevel>;
  @useResult
  $Res call({int level});
}

/// @nodoc
class _$BookmarkableMaterialLevelCopyWithImpl<$Res,
        $Val extends BookmarkableMaterialLevel>
    implements $BookmarkableMaterialLevelCopyWith<$Res> {
  _$BookmarkableMaterialLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
  }) {
    return _then(_value.copyWith(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookmarkableMaterialLevelImplCopyWith<$Res>
    implements $BookmarkableMaterialLevelCopyWith<$Res> {
  factory _$$BookmarkableMaterialLevelImplCopyWith(
          _$BookmarkableMaterialLevelImpl value,
          $Res Function(_$BookmarkableMaterialLevelImpl) then) =
      __$$BookmarkableMaterialLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int level, int quantity});
}

/// @nodoc
class __$$BookmarkableMaterialLevelImplCopyWithImpl<$Res>
    extends _$BookmarkableMaterialLevelCopyWithImpl<$Res,
        _$BookmarkableMaterialLevelImpl>
    implements _$$BookmarkableMaterialLevelImplCopyWith<$Res> {
  __$$BookmarkableMaterialLevelImplCopyWithImpl(
      _$BookmarkableMaterialLevelImpl _value,
      $Res Function(_$BookmarkableMaterialLevelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? quantity = null,
  }) {
    return _then(_$BookmarkableMaterialLevelImpl(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BookmarkableMaterialLevelImpl implements _BookmarkableMaterialLevel {
  const _$BookmarkableMaterialLevelImpl(
      {required this.level, required this.quantity});

  @override
  final int level;
  @override
  final int quantity;

  @override
  String toString() {
    return 'BookmarkableMaterialLevel(level: $level, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkableMaterialLevelImpl &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, level, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkableMaterialLevelImplCopyWith<_$BookmarkableMaterialLevelImpl>
      get copyWith => __$$BookmarkableMaterialLevelImplCopyWithImpl<
          _$BookmarkableMaterialLevelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int level, int quantity) $default, {
    required TResult Function(int level, int exp) exp,
  }) {
    return $default(level, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int level, int quantity)? $default, {
    TResult? Function(int level, int exp)? exp,
  }) {
    return $default?.call(level, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int level, int quantity)? $default, {
    TResult Function(int level, int exp)? exp,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(level, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BookmarkableMaterialLevel value) $default, {
    required TResult Function(BookmarkableMaterialLevelExp value) exp,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BookmarkableMaterialLevel value)? $default, {
    TResult? Function(BookmarkableMaterialLevelExp value)? exp,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BookmarkableMaterialLevel value)? $default, {
    TResult Function(BookmarkableMaterialLevelExp value)? exp,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BookmarkableMaterialLevel implements BookmarkableMaterialLevel {
  const factory _BookmarkableMaterialLevel(
      {required final int level,
      required final int quantity}) = _$BookmarkableMaterialLevelImpl;

  @override
  int get level;
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$BookmarkableMaterialLevelImplCopyWith<_$BookmarkableMaterialLevelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookmarkableMaterialLevelExpImplCopyWith<$Res>
    implements $BookmarkableMaterialLevelCopyWith<$Res> {
  factory _$$BookmarkableMaterialLevelExpImplCopyWith(
          _$BookmarkableMaterialLevelExpImpl value,
          $Res Function(_$BookmarkableMaterialLevelExpImpl) then) =
      __$$BookmarkableMaterialLevelExpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int level, int exp});
}

/// @nodoc
class __$$BookmarkableMaterialLevelExpImplCopyWithImpl<$Res>
    extends _$BookmarkableMaterialLevelCopyWithImpl<$Res,
        _$BookmarkableMaterialLevelExpImpl>
    implements _$$BookmarkableMaterialLevelExpImplCopyWith<$Res> {
  __$$BookmarkableMaterialLevelExpImplCopyWithImpl(
      _$BookmarkableMaterialLevelExpImpl _value,
      $Res Function(_$BookmarkableMaterialLevelExpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? exp = null,
  }) {
    return _then(_$BookmarkableMaterialLevelExpImpl(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BookmarkableMaterialLevelExpImpl
    implements BookmarkableMaterialLevelExp {
  const _$BookmarkableMaterialLevelExpImpl(
      {required this.level, required this.exp});

  @override
  final int level;
  @override
  final int exp;

  @override
  String toString() {
    return 'BookmarkableMaterialLevel.exp(level: $level, exp: $exp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkableMaterialLevelExpImpl &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.exp, exp) || other.exp == exp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, level, exp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkableMaterialLevelExpImplCopyWith<
          _$BookmarkableMaterialLevelExpImpl>
      get copyWith => __$$BookmarkableMaterialLevelExpImplCopyWithImpl<
          _$BookmarkableMaterialLevelExpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int level, int quantity) $default, {
    required TResult Function(int level, int exp) exp,
  }) {
    return exp(level, this.exp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int level, int quantity)? $default, {
    TResult? Function(int level, int exp)? exp,
  }) {
    return exp?.call(level, this.exp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int level, int quantity)? $default, {
    TResult Function(int level, int exp)? exp,
    required TResult orElse(),
  }) {
    if (exp != null) {
      return exp(level, this.exp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BookmarkableMaterialLevel value) $default, {
    required TResult Function(BookmarkableMaterialLevelExp value) exp,
  }) {
    return exp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BookmarkableMaterialLevel value)? $default, {
    TResult? Function(BookmarkableMaterialLevelExp value)? exp,
  }) {
    return exp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BookmarkableMaterialLevel value)? $default, {
    TResult Function(BookmarkableMaterialLevelExp value)? exp,
    required TResult orElse(),
  }) {
    if (exp != null) {
      return exp(this);
    }
    return orElse();
  }
}

abstract class BookmarkableMaterialLevelExp
    implements BookmarkableMaterialLevel {
  const factory BookmarkableMaterialLevelExp(
      {required final int level,
      required final int exp}) = _$BookmarkableMaterialLevelExpImpl;

  @override
  int get level;
  int get exp;
  @override
  @JsonKey(ignore: true)
  _$$BookmarkableMaterialLevelExpImplCopyWith<
          _$BookmarkableMaterialLevelExpImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$IngredientsWithLevel {
  int get level => throw _privateConstructorUsedError;
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IngredientsWithLevelCopyWith<IngredientsWithLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientsWithLevelCopyWith<$Res> {
  factory $IngredientsWithLevelCopyWith(IngredientsWithLevel value,
          $Res Function(IngredientsWithLevel) then) =
      _$IngredientsWithLevelCopyWithImpl<$Res, IngredientsWithLevel>;
  @useResult
  $Res call({int level, List<Ingredient> ingredients});
}

/// @nodoc
class _$IngredientsWithLevelCopyWithImpl<$Res,
        $Val extends IngredientsWithLevel>
    implements $IngredientsWithLevelCopyWith<$Res> {
  _$IngredientsWithLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? ingredients = null,
  }) {
    return _then(_value.copyWith(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientsWithLevelImplCopyWith<$Res>
    implements $IngredientsWithLevelCopyWith<$Res> {
  factory _$$IngredientsWithLevelImplCopyWith(_$IngredientsWithLevelImpl value,
          $Res Function(_$IngredientsWithLevelImpl) then) =
      __$$IngredientsWithLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int level, List<Ingredient> ingredients});
}

/// @nodoc
class __$$IngredientsWithLevelImplCopyWithImpl<$Res>
    extends _$IngredientsWithLevelCopyWithImpl<$Res, _$IngredientsWithLevelImpl>
    implements _$$IngredientsWithLevelImplCopyWith<$Res> {
  __$$IngredientsWithLevelImplCopyWithImpl(_$IngredientsWithLevelImpl _value,
      $Res Function(_$IngredientsWithLevelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? ingredients = null,
  }) {
    return _then(_$IngredientsWithLevelImpl(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ));
  }
}

/// @nodoc

class _$IngredientsWithLevelImpl implements _IngredientsWithLevel {
  const _$IngredientsWithLevelImpl(
      {required this.level, required final List<Ingredient> ingredients})
      : _ingredients = ingredients;

  @override
  final int level;
  final List<Ingredient> _ingredients;
  @override
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  String toString() {
    return 'IngredientsWithLevel(level: $level, ingredients: $ingredients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientsWithLevelImpl &&
            (identical(other.level, level) || other.level == level) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, level, const DeepCollectionEquality().hash(_ingredients));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientsWithLevelImplCopyWith<_$IngredientsWithLevelImpl>
      get copyWith =>
          __$$IngredientsWithLevelImplCopyWithImpl<_$IngredientsWithLevelImpl>(
              this, _$identity);
}

abstract class _IngredientsWithLevel implements IngredientsWithLevel {
  const factory _IngredientsWithLevel(
          {required final int level,
          required final List<Ingredient> ingredients}) =
      _$IngredientsWithLevelImpl;

  @override
  int get level;
  @override
  List<Ingredient> get ingredients;
  @override
  @JsonKey(ignore: true)
  _$$IngredientsWithLevelImplCopyWith<_$IngredientsWithLevelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
