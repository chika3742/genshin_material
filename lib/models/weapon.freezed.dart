// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weapon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeaponData _$WeaponDataFromJson(Map<String, dynamic> json) {
  return _WeaponData.fromJson(json);
}

/// @nodoc
mixin _$WeaponData {
  Map<String, LocalizedText> get types => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeaponDataCopyWith<WeaponData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeaponDataCopyWith<$Res> {
  factory $WeaponDataCopyWith(
          WeaponData value, $Res Function(WeaponData) then) =
      _$WeaponDataCopyWithImpl<$Res, WeaponData>;
  @useResult
  $Res call({Map<String, LocalizedText> types});
}

/// @nodoc
class _$WeaponDataCopyWithImpl<$Res, $Val extends WeaponData>
    implements $WeaponDataCopyWith<$Res> {
  _$WeaponDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? types = null,
  }) {
    return _then(_value.copyWith(
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalizedText>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeaponDataImplCopyWith<$Res>
    implements $WeaponDataCopyWith<$Res> {
  factory _$$WeaponDataImplCopyWith(
          _$WeaponDataImpl value, $Res Function(_$WeaponDataImpl) then) =
      __$$WeaponDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, LocalizedText> types});
}

/// @nodoc
class __$$WeaponDataImplCopyWithImpl<$Res>
    extends _$WeaponDataCopyWithImpl<$Res, _$WeaponDataImpl>
    implements _$$WeaponDataImplCopyWith<$Res> {
  __$$WeaponDataImplCopyWithImpl(
      _$WeaponDataImpl _value, $Res Function(_$WeaponDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? types = null,
  }) {
    return _then(_$WeaponDataImpl(
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalizedText>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeaponDataImpl implements _WeaponData {
  const _$WeaponDataImpl({required final Map<String, LocalizedText> types})
      : _types = types;

  factory _$WeaponDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeaponDataImplFromJson(json);

  final Map<String, LocalizedText> _types;
  @override
  Map<String, LocalizedText> get types {
    if (_types is EqualUnmodifiableMapView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_types);
  }

  @override
  String toString() {
    return 'WeaponData(types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponDataImpl &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeaponDataImplCopyWith<_$WeaponDataImpl> get copyWith =>
      __$$WeaponDataImplCopyWithImpl<_$WeaponDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeaponDataImplToJson(
      this,
    );
  }
}

abstract class _WeaponData implements WeaponData {
  const factory _WeaponData({required final Map<String, LocalizedText> types}) =
      _$WeaponDataImpl;

  factory _WeaponData.fromJson(Map<String, dynamic> json) =
      _$WeaponDataImpl.fromJson;

  @override
  Map<String, LocalizedText> get types;
  @override
  @JsonKey(ignore: true)
  _$$WeaponDataImplCopyWith<_$WeaponDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
