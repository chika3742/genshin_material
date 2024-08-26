// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_bookmark_frame.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaterialBookmarkFrame {
  String? get materialId => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  Purpose get purposeType => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String materialId, int level, int quantity, Purpose purposeType)
        $default, {
    required TResult Function(
            String? materialId, int level, int exp, Purpose purposeType)
        exp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String materialId, int level, int quantity, Purpose purposeType)?
        $default, {
    TResult? Function(
            String? materialId, int level, int exp, Purpose purposeType)?
        exp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String materialId, int level, int quantity, Purpose purposeType)?
        $default, {
    TResult Function(
            String? materialId, int level, int exp, Purpose purposeType)?
        exp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MaterialBookmarkFrame value) $default, {
    required TResult Function(MaterialBookmarkFrameExp value) exp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MaterialBookmarkFrame value)? $default, {
    TResult? Function(MaterialBookmarkFrameExp value)? exp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MaterialBookmarkFrame value)? $default, {
    TResult Function(MaterialBookmarkFrameExp value)? exp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of MaterialBookmarkFrame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialBookmarkFrameCopyWith<MaterialBookmarkFrame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialBookmarkFrameCopyWith<$Res> {
  factory $MaterialBookmarkFrameCopyWith(MaterialBookmarkFrame value,
          $Res Function(MaterialBookmarkFrame) then) =
      _$MaterialBookmarkFrameCopyWithImpl<$Res, MaterialBookmarkFrame>;
  @useResult
  $Res call({String materialId, int level, Purpose purposeType});
}

/// @nodoc
class _$MaterialBookmarkFrameCopyWithImpl<$Res,
        $Val extends MaterialBookmarkFrame>
    implements $MaterialBookmarkFrameCopyWith<$Res> {
  _$MaterialBookmarkFrameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialBookmarkFrame
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialId = null,
    Object? level = null,
    Object? purposeType = null,
  }) {
    return _then(_value.copyWith(
      materialId: null == materialId
          ? _value.materialId!
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$MaterialBookmarkFrameImplCopyWith<$Res>
    implements $MaterialBookmarkFrameCopyWith<$Res> {
  factory _$$MaterialBookmarkFrameImplCopyWith(
          _$MaterialBookmarkFrameImpl value,
          $Res Function(_$MaterialBookmarkFrameImpl) then) =
      __$$MaterialBookmarkFrameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String materialId, int level, int quantity, Purpose purposeType});
}

/// @nodoc
class __$$MaterialBookmarkFrameImplCopyWithImpl<$Res>
    extends _$MaterialBookmarkFrameCopyWithImpl<$Res,
        _$MaterialBookmarkFrameImpl>
    implements _$$MaterialBookmarkFrameImplCopyWith<$Res> {
  __$$MaterialBookmarkFrameImplCopyWithImpl(_$MaterialBookmarkFrameImpl _value,
      $Res Function(_$MaterialBookmarkFrameImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialBookmarkFrame
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialId = null,
    Object? level = null,
    Object? quantity = null,
    Object? purposeType = null,
  }) {
    return _then(_$MaterialBookmarkFrameImpl(
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$MaterialBookmarkFrameImpl implements _MaterialBookmarkFrame {
  const _$MaterialBookmarkFrameImpl(
      {required this.materialId,
      required this.level,
      required this.quantity,
      required this.purposeType});

  @override
  final String materialId;
  @override
  final int level;
  @override
  final int quantity;
  @override
  final Purpose purposeType;

  @override
  String toString() {
    return 'MaterialBookmarkFrame(materialId: $materialId, level: $level, quantity: $quantity, purposeType: $purposeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialBookmarkFrameImpl &&
            (identical(other.materialId, materialId) ||
                other.materialId == materialId) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.purposeType, purposeType) ||
                other.purposeType == purposeType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, materialId, level, quantity, purposeType);

  /// Create a copy of MaterialBookmarkFrame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialBookmarkFrameImplCopyWith<_$MaterialBookmarkFrameImpl>
      get copyWith => __$$MaterialBookmarkFrameImplCopyWithImpl<
          _$MaterialBookmarkFrameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String materialId, int level, int quantity, Purpose purposeType)
        $default, {
    required TResult Function(
            String? materialId, int level, int exp, Purpose purposeType)
        exp,
  }) {
    return $default(materialId, level, quantity, purposeType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String materialId, int level, int quantity, Purpose purposeType)?
        $default, {
    TResult? Function(
            String? materialId, int level, int exp, Purpose purposeType)?
        exp,
  }) {
    return $default?.call(materialId, level, quantity, purposeType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String materialId, int level, int quantity, Purpose purposeType)?
        $default, {
    TResult Function(
            String? materialId, int level, int exp, Purpose purposeType)?
        exp,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(materialId, level, quantity, purposeType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MaterialBookmarkFrame value) $default, {
    required TResult Function(MaterialBookmarkFrameExp value) exp,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MaterialBookmarkFrame value)? $default, {
    TResult? Function(MaterialBookmarkFrameExp value)? exp,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MaterialBookmarkFrame value)? $default, {
    TResult Function(MaterialBookmarkFrameExp value)? exp,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _MaterialBookmarkFrame implements MaterialBookmarkFrame {
  const factory _MaterialBookmarkFrame(
      {required final String materialId,
      required final int level,
      required final int quantity,
      required final Purpose purposeType}) = _$MaterialBookmarkFrameImpl;

  @override
  String get materialId;
  @override
  int get level;
  int get quantity;
  @override
  Purpose get purposeType;

  /// Create a copy of MaterialBookmarkFrame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialBookmarkFrameImplCopyWith<_$MaterialBookmarkFrameImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MaterialBookmarkFrameExpImplCopyWith<$Res>
    implements $MaterialBookmarkFrameCopyWith<$Res> {
  factory _$$MaterialBookmarkFrameExpImplCopyWith(
          _$MaterialBookmarkFrameExpImpl value,
          $Res Function(_$MaterialBookmarkFrameExpImpl) then) =
      __$$MaterialBookmarkFrameExpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? materialId, int level, int exp, Purpose purposeType});
}

/// @nodoc
class __$$MaterialBookmarkFrameExpImplCopyWithImpl<$Res>
    extends _$MaterialBookmarkFrameCopyWithImpl<$Res,
        _$MaterialBookmarkFrameExpImpl>
    implements _$$MaterialBookmarkFrameExpImplCopyWith<$Res> {
  __$$MaterialBookmarkFrameExpImplCopyWithImpl(
      _$MaterialBookmarkFrameExpImpl _value,
      $Res Function(_$MaterialBookmarkFrameExpImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialBookmarkFrame
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialId = freezed,
    Object? level = null,
    Object? exp = null,
    Object? purposeType = null,
  }) {
    return _then(_$MaterialBookmarkFrameExpImpl(
      materialId: freezed == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String?,
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

class _$MaterialBookmarkFrameExpImpl implements MaterialBookmarkFrameExp {
  const _$MaterialBookmarkFrameExpImpl(
      {this.materialId = null,
      required this.level,
      required this.exp,
      this.purposeType = Purpose.ascension});

  @override
  @JsonKey()
  final String? materialId;
  @override
  final int level;
  @override
  final int exp;
  @override
  @JsonKey()
  final Purpose purposeType;

  @override
  String toString() {
    return 'MaterialBookmarkFrame.exp(materialId: $materialId, level: $level, exp: $exp, purposeType: $purposeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialBookmarkFrameExpImpl &&
            (identical(other.materialId, materialId) ||
                other.materialId == materialId) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.exp, exp) || other.exp == exp) &&
            (identical(other.purposeType, purposeType) ||
                other.purposeType == purposeType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, materialId, level, exp, purposeType);

  /// Create a copy of MaterialBookmarkFrame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialBookmarkFrameExpImplCopyWith<_$MaterialBookmarkFrameExpImpl>
      get copyWith => __$$MaterialBookmarkFrameExpImplCopyWithImpl<
          _$MaterialBookmarkFrameExpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String materialId, int level, int quantity, Purpose purposeType)
        $default, {
    required TResult Function(
            String? materialId, int level, int exp, Purpose purposeType)
        exp,
  }) {
    return exp(materialId, level, this.exp, purposeType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String materialId, int level, int quantity, Purpose purposeType)?
        $default, {
    TResult? Function(
            String? materialId, int level, int exp, Purpose purposeType)?
        exp,
  }) {
    return exp?.call(materialId, level, this.exp, purposeType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String materialId, int level, int quantity, Purpose purposeType)?
        $default, {
    TResult Function(
            String? materialId, int level, int exp, Purpose purposeType)?
        exp,
    required TResult orElse(),
  }) {
    if (exp != null) {
      return exp(materialId, level, this.exp, purposeType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MaterialBookmarkFrame value) $default, {
    required TResult Function(MaterialBookmarkFrameExp value) exp,
  }) {
    return exp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MaterialBookmarkFrame value)? $default, {
    TResult? Function(MaterialBookmarkFrameExp value)? exp,
  }) {
    return exp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MaterialBookmarkFrame value)? $default, {
    TResult Function(MaterialBookmarkFrameExp value)? exp,
    required TResult orElse(),
  }) {
    if (exp != null) {
      return exp(this);
    }
    return orElse();
  }
}

abstract class MaterialBookmarkFrameExp implements MaterialBookmarkFrame {
  const factory MaterialBookmarkFrameExp(
      {final String? materialId,
      required final int level,
      required final int exp,
      final Purpose purposeType}) = _$MaterialBookmarkFrameExpImpl;

  @override
  String? get materialId;
  @override
  int get level;
  int get exp;
  @override
  Purpose get purposeType;

  /// Create a copy of MaterialBookmarkFrame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialBookmarkFrameExpImplCopyWith<_$MaterialBookmarkFrameExpImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaterialUsage {
  String get characterId => throw _privateConstructorUsedError;
  String? get weaponId => throw _privateConstructorUsedError;

  /// Create a copy of MaterialUsage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialUsageCopyWith<MaterialUsage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialUsageCopyWith<$Res> {
  factory $MaterialUsageCopyWith(
          MaterialUsage value, $Res Function(MaterialUsage) then) =
      _$MaterialUsageCopyWithImpl<$Res, MaterialUsage>;
  @useResult
  $Res call({String characterId, String? weaponId});
}

/// @nodoc
class _$MaterialUsageCopyWithImpl<$Res, $Val extends MaterialUsage>
    implements $MaterialUsageCopyWith<$Res> {
  _$MaterialUsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialUsage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterId = null,
    Object? weaponId = freezed,
  }) {
    return _then(_value.copyWith(
      characterId: null == characterId
          ? _value.characterId
          : characterId // ignore: cast_nullable_to_non_nullable
              as String,
      weaponId: freezed == weaponId
          ? _value.weaponId
          : weaponId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialUsageImplCopyWith<$Res>
    implements $MaterialUsageCopyWith<$Res> {
  factory _$$MaterialUsageImplCopyWith(
          _$MaterialUsageImpl value, $Res Function(_$MaterialUsageImpl) then) =
      __$$MaterialUsageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String characterId, String? weaponId});
}

/// @nodoc
class __$$MaterialUsageImplCopyWithImpl<$Res>
    extends _$MaterialUsageCopyWithImpl<$Res, _$MaterialUsageImpl>
    implements _$$MaterialUsageImplCopyWith<$Res> {
  __$$MaterialUsageImplCopyWithImpl(
      _$MaterialUsageImpl _value, $Res Function(_$MaterialUsageImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialUsage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterId = null,
    Object? weaponId = freezed,
  }) {
    return _then(_$MaterialUsageImpl(
      characterId: null == characterId
          ? _value.characterId
          : characterId // ignore: cast_nullable_to_non_nullable
              as String,
      weaponId: freezed == weaponId
          ? _value.weaponId
          : weaponId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MaterialUsageImpl implements _MaterialUsage {
  const _$MaterialUsageImpl({required this.characterId, this.weaponId});

  @override
  final String characterId;
  @override
  final String? weaponId;

  @override
  String toString() {
    return 'MaterialUsage(characterId: $characterId, weaponId: $weaponId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialUsageImpl &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.weaponId, weaponId) ||
                other.weaponId == weaponId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, characterId, weaponId);

  /// Create a copy of MaterialUsage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialUsageImplCopyWith<_$MaterialUsageImpl> get copyWith =>
      __$$MaterialUsageImplCopyWithImpl<_$MaterialUsageImpl>(this, _$identity);
}

abstract class _MaterialUsage implements MaterialUsage {
  const factory _MaterialUsage(
      {required final String characterId,
      final String? weaponId}) = _$MaterialUsageImpl;

  @override
  String get characterId;
  @override
  String? get weaponId;

  /// Create a copy of MaterialUsage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialUsageImplCopyWith<_$MaterialUsageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
