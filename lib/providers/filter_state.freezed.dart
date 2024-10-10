// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CharacterFilterState {
  PossessionStatus? get possessionStatus => throw _privateConstructorUsedError;
  int? get rarity => throw _privateConstructorUsedError;
  String? get element => throw _privateConstructorUsedError;
  String? get weaponType => throw _privateConstructorUsedError;

  /// Create a copy of CharacterFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterFilterStateCopyWith<CharacterFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterFilterStateCopyWith<$Res> {
  factory $CharacterFilterStateCopyWith(CharacterFilterState value,
          $Res Function(CharacterFilterState) then) =
      _$CharacterFilterStateCopyWithImpl<$Res, CharacterFilterState>;
  @useResult
  $Res call(
      {PossessionStatus? possessionStatus,
      int? rarity,
      String? element,
      String? weaponType});
}

/// @nodoc
class _$CharacterFilterStateCopyWithImpl<$Res,
        $Val extends CharacterFilterState>
    implements $CharacterFilterStateCopyWith<$Res> {
  _$CharacterFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? possessionStatus = freezed,
    Object? rarity = freezed,
    Object? element = freezed,
    Object? weaponType = freezed,
  }) {
    return _then(_value.copyWith(
      possessionStatus: freezed == possessionStatus
          ? _value.possessionStatus
          : possessionStatus // ignore: cast_nullable_to_non_nullable
              as PossessionStatus?,
      rarity: freezed == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int?,
      element: freezed == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as String?,
      weaponType: freezed == weaponType
          ? _value.weaponType
          : weaponType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CharacterFilterStateImplCopyWith<$Res>
    implements $CharacterFilterStateCopyWith<$Res> {
  factory _$$CharacterFilterStateImplCopyWith(_$CharacterFilterStateImpl value,
          $Res Function(_$CharacterFilterStateImpl) then) =
      __$$CharacterFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PossessionStatus? possessionStatus,
      int? rarity,
      String? element,
      String? weaponType});
}

/// @nodoc
class __$$CharacterFilterStateImplCopyWithImpl<$Res>
    extends _$CharacterFilterStateCopyWithImpl<$Res, _$CharacterFilterStateImpl>
    implements _$$CharacterFilterStateImplCopyWith<$Res> {
  __$$CharacterFilterStateImplCopyWithImpl(_$CharacterFilterStateImpl _value,
      $Res Function(_$CharacterFilterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CharacterFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? possessionStatus = freezed,
    Object? rarity = freezed,
    Object? element = freezed,
    Object? weaponType = freezed,
  }) {
    return _then(_$CharacterFilterStateImpl(
      possessionStatus: freezed == possessionStatus
          ? _value.possessionStatus
          : possessionStatus // ignore: cast_nullable_to_non_nullable
              as PossessionStatus?,
      rarity: freezed == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int?,
      element: freezed == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as String?,
      weaponType: freezed == weaponType
          ? _value.weaponType
          : weaponType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CharacterFilterStateImpl extends _CharacterFilterState {
  const _$CharacterFilterStateImpl(
      {this.possessionStatus, this.rarity, this.element, this.weaponType})
      : super._();

  @override
  final PossessionStatus? possessionStatus;
  @override
  final int? rarity;
  @override
  final String? element;
  @override
  final String? weaponType;

  @override
  String toString() {
    return 'CharacterFilterState(possessionStatus: $possessionStatus, rarity: $rarity, element: $element, weaponType: $weaponType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterFilterStateImpl &&
            (identical(other.possessionStatus, possessionStatus) ||
                other.possessionStatus == possessionStatus) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.element, element) || other.element == element) &&
            (identical(other.weaponType, weaponType) ||
                other.weaponType == weaponType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, possessionStatus, rarity, element, weaponType);

  /// Create a copy of CharacterFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterFilterStateImplCopyWith<_$CharacterFilterStateImpl>
      get copyWith =>
          __$$CharacterFilterStateImplCopyWithImpl<_$CharacterFilterStateImpl>(
              this, _$identity);
}

abstract class _CharacterFilterState extends CharacterFilterState {
  const factory _CharacterFilterState(
      {final PossessionStatus? possessionStatus,
      final int? rarity,
      final String? element,
      final String? weaponType}) = _$CharacterFilterStateImpl;
  const _CharacterFilterState._() : super._();

  @override
  PossessionStatus? get possessionStatus;
  @override
  int? get rarity;
  @override
  String? get element;
  @override
  String? get weaponType;

  /// Create a copy of CharacterFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterFilterStateImplCopyWith<_$CharacterFilterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ArtifactFilterState {
  List<String> get tags => throw _privateConstructorUsedError;

  /// Create a copy of ArtifactFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtifactFilterStateCopyWith<ArtifactFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactFilterStateCopyWith<$Res> {
  factory $ArtifactFilterStateCopyWith(
          ArtifactFilterState value, $Res Function(ArtifactFilterState) then) =
      _$ArtifactFilterStateCopyWithImpl<$Res, ArtifactFilterState>;
  @useResult
  $Res call({List<String> tags});
}

/// @nodoc
class _$ArtifactFilterStateCopyWithImpl<$Res, $Val extends ArtifactFilterState>
    implements $ArtifactFilterStateCopyWith<$Res> {
  _$ArtifactFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArtifactFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtifactFilterStateImplCopyWith<$Res>
    implements $ArtifactFilterStateCopyWith<$Res> {
  factory _$$ArtifactFilterStateImplCopyWith(_$ArtifactFilterStateImpl value,
          $Res Function(_$ArtifactFilterStateImpl) then) =
      __$$ArtifactFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> tags});
}

/// @nodoc
class __$$ArtifactFilterStateImplCopyWithImpl<$Res>
    extends _$ArtifactFilterStateCopyWithImpl<$Res, _$ArtifactFilterStateImpl>
    implements _$$ArtifactFilterStateImplCopyWith<$Res> {
  __$$ArtifactFilterStateImplCopyWithImpl(_$ArtifactFilterStateImpl _value,
      $Res Function(_$ArtifactFilterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArtifactFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
  }) {
    return _then(_$ArtifactFilterStateImpl(
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$ArtifactFilterStateImpl implements _ArtifactFilterState {
  const _$ArtifactFilterStateImpl({final List<String> tags = const []})
      : _tags = tags;

  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'ArtifactFilterState(tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtifactFilterStateImpl &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tags));

  /// Create a copy of ArtifactFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtifactFilterStateImplCopyWith<_$ArtifactFilterStateImpl> get copyWith =>
      __$$ArtifactFilterStateImplCopyWithImpl<_$ArtifactFilterStateImpl>(
          this, _$identity);
}

abstract class _ArtifactFilterState implements ArtifactFilterState {
  const factory _ArtifactFilterState({final List<String> tags}) =
      _$ArtifactFilterStateImpl;

  @override
  List<String> get tags;

  /// Create a copy of ArtifactFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtifactFilterStateImplCopyWith<_$ArtifactFilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
