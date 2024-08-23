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
  int? get rarity => throw _privateConstructorUsedError;
  String? get element => throw _privateConstructorUsedError;
  String? get weaponType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CharacterFilterStateCopyWith<CharacterFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterFilterStateCopyWith<$Res> {
  factory $CharacterFilterStateCopyWith(CharacterFilterState value,
          $Res Function(CharacterFilterState) then) =
      _$CharacterFilterStateCopyWithImpl<$Res, CharacterFilterState>;
  @useResult
  $Res call({int? rarity, String? element, String? weaponType});
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rarity = freezed,
    Object? element = freezed,
    Object? weaponType = freezed,
  }) {
    return _then(_value.copyWith(
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
  $Res call({int? rarity, String? element, String? weaponType});
}

/// @nodoc
class __$$CharacterFilterStateImplCopyWithImpl<$Res>
    extends _$CharacterFilterStateCopyWithImpl<$Res, _$CharacterFilterStateImpl>
    implements _$$CharacterFilterStateImplCopyWith<$Res> {
  __$$CharacterFilterStateImplCopyWithImpl(_$CharacterFilterStateImpl _value,
      $Res Function(_$CharacterFilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rarity = freezed,
    Object? element = freezed,
    Object? weaponType = freezed,
  }) {
    return _then(_$CharacterFilterStateImpl(
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
  const _$CharacterFilterStateImpl({this.rarity, this.element, this.weaponType})
      : super._();

  @override
  final int? rarity;
  @override
  final String? element;
  @override
  final String? weaponType;

  @override
  String toString() {
    return 'CharacterFilterState(rarity: $rarity, element: $element, weaponType: $weaponType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterFilterStateImpl &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.element, element) || other.element == element) &&
            (identical(other.weaponType, weaponType) ||
                other.weaponType == weaponType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rarity, element, weaponType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterFilterStateImplCopyWith<_$CharacterFilterStateImpl>
      get copyWith =>
          __$$CharacterFilterStateImplCopyWithImpl<_$CharacterFilterStateImpl>(
              this, _$identity);
}

abstract class _CharacterFilterState extends CharacterFilterState {
  const factory _CharacterFilterState(
      {final int? rarity,
      final String? element,
      final String? weaponType}) = _$CharacterFilterStateImpl;
  const _CharacterFilterState._() : super._();

  @override
  int? get rarity;
  @override
  String? get element;
  @override
  String? get weaponType;
  @override
  @JsonKey(ignore: true)
  _$$CharacterFilterStateImplCopyWith<_$CharacterFilterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ArtifactFilterState {
  List<String> get tags => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
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
  @override
  @JsonKey(ignore: true)
  _$$ArtifactFilterStateImplCopyWith<_$ArtifactFilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
