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
  Purpose get purposeType => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int level, int quantity, Purpose purposeType) $default, {
    required TResult Function(int level, int exp, Purpose purposeType) exp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int level, int quantity, Purpose purposeType)? $default, {
    TResult? Function(int level, int exp, Purpose purposeType)? exp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int level, int quantity, Purpose purposeType)? $default, {
    TResult Function(int level, int exp, Purpose purposeType)? exp,
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
  $Res call({int level, Purpose purposeType});
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
    Object? purposeType = null,
  }) {
    return _then(_value.copyWith(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      purposeType: null == purposeType
          ? _value.purposeType
          : purposeType // ignore: cast_nullable_to_non_nullable
              as Purpose,
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
  $Res call({int level, int quantity, Purpose purposeType});
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
    Object? purposeType = null,
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
      purposeType: null == purposeType
          ? _value.purposeType
          : purposeType // ignore: cast_nullable_to_non_nullable
              as Purpose,
    ));
  }
}

/// @nodoc

class _$BookmarkableMaterialLevelImpl implements _BookmarkableMaterialLevel {
  const _$BookmarkableMaterialLevelImpl(
      {required this.level, required this.quantity, required this.purposeType});

  @override
  final int level;
  @override
  final int quantity;
  @override
  final Purpose purposeType;

  @override
  String toString() {
    return 'BookmarkableMaterialLevel(level: $level, quantity: $quantity, purposeType: $purposeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkableMaterialLevelImpl &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.purposeType, purposeType) ||
                other.purposeType == purposeType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, level, quantity, purposeType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkableMaterialLevelImplCopyWith<_$BookmarkableMaterialLevelImpl>
      get copyWith => __$$BookmarkableMaterialLevelImplCopyWithImpl<
          _$BookmarkableMaterialLevelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int level, int quantity, Purpose purposeType) $default, {
    required TResult Function(int level, int exp, Purpose purposeType) exp,
  }) {
    return $default(level, quantity, purposeType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int level, int quantity, Purpose purposeType)? $default, {
    TResult? Function(int level, int exp, Purpose purposeType)? exp,
  }) {
    return $default?.call(level, quantity, purposeType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int level, int quantity, Purpose purposeType)? $default, {
    TResult Function(int level, int exp, Purpose purposeType)? exp,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(level, quantity, purposeType);
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
      required final int quantity,
      required final Purpose purposeType}) = _$BookmarkableMaterialLevelImpl;

  @override
  int get level;
  int get quantity;
  @override
  Purpose get purposeType;
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
  $Res call({int level, int exp, Purpose purposeType});
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
    Object? purposeType = null,
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
      purposeType: null == purposeType
          ? _value.purposeType
          : purposeType // ignore: cast_nullable_to_non_nullable
              as Purpose,
    ));
  }
}

/// @nodoc

class _$BookmarkableMaterialLevelExpImpl
    implements BookmarkableMaterialLevelExp {
  const _$BookmarkableMaterialLevelExpImpl(
      {required this.level,
      required this.exp,
      this.purposeType = Purpose.ascension});

  @override
  final int level;
  @override
  final int exp;
  @override
  @JsonKey()
  final Purpose purposeType;

  @override
  String toString() {
    return 'BookmarkableMaterialLevel.exp(level: $level, exp: $exp, purposeType: $purposeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkableMaterialLevelExpImpl &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.exp, exp) || other.exp == exp) &&
            (identical(other.purposeType, purposeType) ||
                other.purposeType == purposeType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, level, exp, purposeType);

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
    TResult Function(int level, int quantity, Purpose purposeType) $default, {
    required TResult Function(int level, int exp, Purpose purposeType) exp,
  }) {
    return exp(level, this.exp, purposeType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int level, int quantity, Purpose purposeType)? $default, {
    TResult? Function(int level, int exp, Purpose purposeType)? exp,
  }) {
    return exp?.call(level, this.exp, purposeType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int level, int quantity, Purpose purposeType)? $default, {
    TResult Function(int level, int exp, Purpose purposeType)? exp,
    required TResult orElse(),
  }) {
    if (exp != null) {
      return exp(level, this.exp, purposeType);
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
      required final int exp,
      final Purpose purposeType}) = _$BookmarkableMaterialLevelExpImpl;

  @override
  int get level;
  int get exp;
  @override
  Purpose get purposeType;
  @override
  @JsonKey(ignore: true)
  _$$BookmarkableMaterialLevelExpImplCopyWith<
          _$BookmarkableMaterialLevelExpImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$IngredientsWithLevelAndPurpose {
  int get level => throw _privateConstructorUsedError;
  Purpose get purposeType => throw _privateConstructorUsedError;
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IngredientsWithLevelAndPurposeCopyWith<IngredientsWithLevelAndPurpose>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientsWithLevelAndPurposeCopyWith<$Res> {
  factory $IngredientsWithLevelAndPurposeCopyWith(
          IngredientsWithLevelAndPurpose value,
          $Res Function(IngredientsWithLevelAndPurpose) then) =
      _$IngredientsWithLevelAndPurposeCopyWithImpl<$Res,
          IngredientsWithLevelAndPurpose>;
  @useResult
  $Res call({int level, Purpose purposeType, List<Ingredient> ingredients});
}

/// @nodoc
class _$IngredientsWithLevelAndPurposeCopyWithImpl<$Res,
        $Val extends IngredientsWithLevelAndPurpose>
    implements $IngredientsWithLevelAndPurposeCopyWith<$Res> {
  _$IngredientsWithLevelAndPurposeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? purposeType = null,
    Object? ingredients = null,
  }) {
    return _then(_value.copyWith(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      purposeType: null == purposeType
          ? _value.purposeType
          : purposeType // ignore: cast_nullable_to_non_nullable
              as Purpose,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientsWithLevelAndPurposeImplCopyWith<$Res>
    implements $IngredientsWithLevelAndPurposeCopyWith<$Res> {
  factory _$$IngredientsWithLevelAndPurposeImplCopyWith(
          _$IngredientsWithLevelAndPurposeImpl value,
          $Res Function(_$IngredientsWithLevelAndPurposeImpl) then) =
      __$$IngredientsWithLevelAndPurposeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int level, Purpose purposeType, List<Ingredient> ingredients});
}

/// @nodoc
class __$$IngredientsWithLevelAndPurposeImplCopyWithImpl<$Res>
    extends _$IngredientsWithLevelAndPurposeCopyWithImpl<$Res,
        _$IngredientsWithLevelAndPurposeImpl>
    implements _$$IngredientsWithLevelAndPurposeImplCopyWith<$Res> {
  __$$IngredientsWithLevelAndPurposeImplCopyWithImpl(
      _$IngredientsWithLevelAndPurposeImpl _value,
      $Res Function(_$IngredientsWithLevelAndPurposeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? purposeType = null,
    Object? ingredients = null,
  }) {
    return _then(_$IngredientsWithLevelAndPurposeImpl(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      purposeType: null == purposeType
          ? _value.purposeType
          : purposeType // ignore: cast_nullable_to_non_nullable
              as Purpose,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ));
  }
}

/// @nodoc

class _$IngredientsWithLevelAndPurposeImpl
    implements _IngredientsWithLevelAndPurpose {
  const _$IngredientsWithLevelAndPurposeImpl(
      {required this.level,
      required this.purposeType,
      required final List<Ingredient> ingredients})
      : _ingredients = ingredients;

  @override
  final int level;
  @override
  final Purpose purposeType;
  final List<Ingredient> _ingredients;
  @override
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  String toString() {
    return 'IngredientsWithLevelAndPurpose(level: $level, purposeType: $purposeType, ingredients: $ingredients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientsWithLevelAndPurposeImpl &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.purposeType, purposeType) ||
                other.purposeType == purposeType) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @override
  int get hashCode => Object.hash(runtimeType, level, purposeType,
      const DeepCollectionEquality().hash(_ingredients));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientsWithLevelAndPurposeImplCopyWith<
          _$IngredientsWithLevelAndPurposeImpl>
      get copyWith => __$$IngredientsWithLevelAndPurposeImplCopyWithImpl<
          _$IngredientsWithLevelAndPurposeImpl>(this, _$identity);
}

abstract class _IngredientsWithLevelAndPurpose
    implements IngredientsWithLevelAndPurpose {
  const factory _IngredientsWithLevelAndPurpose(
          {required final int level,
          required final Purpose purposeType,
          required final List<Ingredient> ingredients}) =
      _$IngredientsWithLevelAndPurposeImpl;

  @override
  int get level;
  @override
  Purpose get purposeType;
  @override
  List<Ingredient> get ingredients;
  @override
  @JsonKey(ignore: true)
  _$$IngredientsWithLevelAndPurposeImplCopyWith<
          _$IngredientsWithLevelAndPurposeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Usage {
  String get characterId => throw _privateConstructorUsedError;
  MaterialBookmarkType get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characterId, MaterialBookmarkType type)
        material,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characterId, MaterialBookmarkType type)? material,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characterId, MaterialBookmarkType type)? material,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MaterialUsage value) material,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MaterialUsage value)? material,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MaterialUsage value)? material,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsageCopyWith<Usage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageCopyWith<$Res> {
  factory $UsageCopyWith(Usage value, $Res Function(Usage) then) =
      _$UsageCopyWithImpl<$Res, Usage>;
  @useResult
  $Res call({String characterId, MaterialBookmarkType type});
}

/// @nodoc
class _$UsageCopyWithImpl<$Res, $Val extends Usage>
    implements $UsageCopyWith<$Res> {
  _$UsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterId = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      characterId: null == characterId
          ? _value.characterId
          : characterId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MaterialBookmarkType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialUsageImplCopyWith<$Res>
    implements $UsageCopyWith<$Res> {
  factory _$$MaterialUsageImplCopyWith(
          _$MaterialUsageImpl value, $Res Function(_$MaterialUsageImpl) then) =
      __$$MaterialUsageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String characterId, MaterialBookmarkType type});
}

/// @nodoc
class __$$MaterialUsageImplCopyWithImpl<$Res>
    extends _$UsageCopyWithImpl<$Res, _$MaterialUsageImpl>
    implements _$$MaterialUsageImplCopyWith<$Res> {
  __$$MaterialUsageImplCopyWithImpl(
      _$MaterialUsageImpl _value, $Res Function(_$MaterialUsageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterId = null,
    Object? type = null,
  }) {
    return _then(_$MaterialUsageImpl(
      characterId: null == characterId
          ? _value.characterId
          : characterId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MaterialBookmarkType,
    ));
  }
}

/// @nodoc

class _$MaterialUsageImpl implements MaterialUsage {
  const _$MaterialUsageImpl({required this.characterId, required this.type});

  @override
  final String characterId;
  @override
  final MaterialBookmarkType type;

  @override
  String toString() {
    return 'Usage.material(characterId: $characterId, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialUsageImpl &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, characterId, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialUsageImplCopyWith<_$MaterialUsageImpl> get copyWith =>
      __$$MaterialUsageImplCopyWithImpl<_$MaterialUsageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characterId, MaterialBookmarkType type)
        material,
  }) {
    return material(characterId, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characterId, MaterialBookmarkType type)? material,
  }) {
    return material?.call(characterId, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characterId, MaterialBookmarkType type)? material,
    required TResult orElse(),
  }) {
    if (material != null) {
      return material(characterId, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MaterialUsage value) material,
  }) {
    return material(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MaterialUsage value)? material,
  }) {
    return material?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MaterialUsage value)? material,
    required TResult orElse(),
  }) {
    if (material != null) {
      return material(this);
    }
    return orElse();
  }
}

abstract class MaterialUsage implements Usage {
  const factory MaterialUsage(
      {required final String characterId,
      required final MaterialBookmarkType type}) = _$MaterialUsageImpl;

  @override
  String get characterId;
  @override
  MaterialBookmarkType get type;
  @override
  @JsonKey(ignore: true)
  _$$MaterialUsageImplCopyWith<_$MaterialUsageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
