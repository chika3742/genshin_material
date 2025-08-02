// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterDetailsPageState {
  Map<Purpose, LevelRangeValues> get rangeValues;
  Map<Purpose, bool> get checkedTalentTypes;
  Map<Purpose, GlobalKey> get talentSectionKeys;
  Map<String, int> get lackNums;
  String? get equippedWeaponId;

  /// Create a copy of _CharacterDetailsPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CharacterDetailsPageStateCopyWith<_CharacterDetailsPageState>
      get copyWith =>
          __$CharacterDetailsPageStateCopyWithImpl<_CharacterDetailsPageState>(
              this as _CharacterDetailsPageState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CharacterDetailsPageState &&
            const DeepCollectionEquality()
                .equals(other.rangeValues, rangeValues) &&
            const DeepCollectionEquality()
                .equals(other.checkedTalentTypes, checkedTalentTypes) &&
            const DeepCollectionEquality()
                .equals(other.talentSectionKeys, talentSectionKeys) &&
            const DeepCollectionEquality().equals(other.lackNums, lackNums) &&
            (identical(other.equippedWeaponId, equippedWeaponId) ||
                other.equippedWeaponId == equippedWeaponId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(rangeValues),
      const DeepCollectionEquality().hash(checkedTalentTypes),
      const DeepCollectionEquality().hash(talentSectionKeys),
      const DeepCollectionEquality().hash(lackNums),
      equippedWeaponId);

  @override
  String toString() {
    return '_CharacterDetailsPageState(rangeValues: $rangeValues, checkedTalentTypes: $checkedTalentTypes, talentSectionKeys: $talentSectionKeys, lackNums: $lackNums, equippedWeaponId: $equippedWeaponId)';
  }
}

/// @nodoc
abstract mixin class _$CharacterDetailsPageStateCopyWith<$Res> {
  factory _$CharacterDetailsPageStateCopyWith(_CharacterDetailsPageState value,
          $Res Function(_CharacterDetailsPageState) _then) =
      __$CharacterDetailsPageStateCopyWithImpl;
  @useResult
  $Res call(
      {Map<Purpose, LevelRangeValues> rangeValues,
      Map<Purpose, bool> checkedTalentTypes,
      Map<Purpose, GlobalKey> talentSectionKeys,
      Map<String, int> lackNums,
      String? equippedWeaponId});
}

/// @nodoc
class __$CharacterDetailsPageStateCopyWithImpl<$Res>
    implements _$CharacterDetailsPageStateCopyWith<$Res> {
  __$CharacterDetailsPageStateCopyWithImpl(this._self, this._then);

  final _CharacterDetailsPageState _self;
  final $Res Function(_CharacterDetailsPageState) _then;

  /// Create a copy of _CharacterDetailsPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rangeValues = null,
    Object? checkedTalentTypes = null,
    Object? talentSectionKeys = null,
    Object? lackNums = null,
    Object? equippedWeaponId = freezed,
  }) {
    return _then(_self.copyWith(
      rangeValues: null == rangeValues
          ? _self.rangeValues
          : rangeValues // ignore: cast_nullable_to_non_nullable
              as Map<Purpose, LevelRangeValues>,
      checkedTalentTypes: null == checkedTalentTypes
          ? _self.checkedTalentTypes
          : checkedTalentTypes // ignore: cast_nullable_to_non_nullable
              as Map<Purpose, bool>,
      talentSectionKeys: null == talentSectionKeys
          ? _self.talentSectionKeys
          : talentSectionKeys // ignore: cast_nullable_to_non_nullable
              as Map<Purpose, GlobalKey>,
      lackNums: null == lackNums
          ? _self.lackNums
          : lackNums // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      equippedWeaponId: freezed == equippedWeaponId
          ? _self.equippedWeaponId
          : equippedWeaponId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class __CharacterDetailsPageState implements _CharacterDetailsPageState {
  const __CharacterDetailsPageState(
      {required final Map<Purpose, LevelRangeValues> rangeValues,
      required final Map<Purpose, bool> checkedTalentTypes,
      required final Map<Purpose, GlobalKey> talentSectionKeys,
      required final Map<String, int> lackNums,
      required this.equippedWeaponId})
      : _rangeValues = rangeValues,
        _checkedTalentTypes = checkedTalentTypes,
        _talentSectionKeys = talentSectionKeys,
        _lackNums = lackNums;

  final Map<Purpose, LevelRangeValues> _rangeValues;
  @override
  Map<Purpose, LevelRangeValues> get rangeValues {
    if (_rangeValues is EqualUnmodifiableMapView) return _rangeValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rangeValues);
  }

  final Map<Purpose, bool> _checkedTalentTypes;
  @override
  Map<Purpose, bool> get checkedTalentTypes {
    if (_checkedTalentTypes is EqualUnmodifiableMapView)
      return _checkedTalentTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_checkedTalentTypes);
  }

  final Map<Purpose, GlobalKey> _talentSectionKeys;
  @override
  Map<Purpose, GlobalKey> get talentSectionKeys {
    if (_talentSectionKeys is EqualUnmodifiableMapView)
      return _talentSectionKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_talentSectionKeys);
  }

  final Map<String, int> _lackNums;
  @override
  Map<String, int> get lackNums {
    if (_lackNums is EqualUnmodifiableMapView) return _lackNums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_lackNums);
  }

  @override
  final String? equippedWeaponId;

  /// Create a copy of _CharacterDetailsPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$_CharacterDetailsPageStateCopyWith<__CharacterDetailsPageState>
      get copyWith => __$_CharacterDetailsPageStateCopyWithImpl<
          __CharacterDetailsPageState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is __CharacterDetailsPageState &&
            const DeepCollectionEquality()
                .equals(other._rangeValues, _rangeValues) &&
            const DeepCollectionEquality()
                .equals(other._checkedTalentTypes, _checkedTalentTypes) &&
            const DeepCollectionEquality()
                .equals(other._talentSectionKeys, _talentSectionKeys) &&
            const DeepCollectionEquality().equals(other._lackNums, _lackNums) &&
            (identical(other.equippedWeaponId, equippedWeaponId) ||
                other.equippedWeaponId == equippedWeaponId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_rangeValues),
      const DeepCollectionEquality().hash(_checkedTalentTypes),
      const DeepCollectionEquality().hash(_talentSectionKeys),
      const DeepCollectionEquality().hash(_lackNums),
      equippedWeaponId);

  @override
  String toString() {
    return '_CharacterDetailsPageState(rangeValues: $rangeValues, checkedTalentTypes: $checkedTalentTypes, talentSectionKeys: $talentSectionKeys, lackNums: $lackNums, equippedWeaponId: $equippedWeaponId)';
  }
}

/// @nodoc
abstract mixin class _$_CharacterDetailsPageStateCopyWith<$Res>
    implements _$CharacterDetailsPageStateCopyWith<$Res> {
  factory _$_CharacterDetailsPageStateCopyWith(
          __CharacterDetailsPageState value,
          $Res Function(__CharacterDetailsPageState) _then) =
      __$_CharacterDetailsPageStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Map<Purpose, LevelRangeValues> rangeValues,
      Map<Purpose, bool> checkedTalentTypes,
      Map<Purpose, GlobalKey> talentSectionKeys,
      Map<String, int> lackNums,
      String? equippedWeaponId});
}

/// @nodoc
class __$_CharacterDetailsPageStateCopyWithImpl<$Res>
    implements _$_CharacterDetailsPageStateCopyWith<$Res> {
  __$_CharacterDetailsPageStateCopyWithImpl(this._self, this._then);

  final __CharacterDetailsPageState _self;
  final $Res Function(__CharacterDetailsPageState) _then;

  /// Create a copy of _CharacterDetailsPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? rangeValues = null,
    Object? checkedTalentTypes = null,
    Object? talentSectionKeys = null,
    Object? lackNums = null,
    Object? equippedWeaponId = freezed,
  }) {
    return _then(__CharacterDetailsPageState(
      rangeValues: null == rangeValues
          ? _self._rangeValues
          : rangeValues // ignore: cast_nullable_to_non_nullable
              as Map<Purpose, LevelRangeValues>,
      checkedTalentTypes: null == checkedTalentTypes
          ? _self._checkedTalentTypes
          : checkedTalentTypes // ignore: cast_nullable_to_non_nullable
              as Map<Purpose, bool>,
      talentSectionKeys: null == talentSectionKeys
          ? _self._talentSectionKeys
          : talentSectionKeys // ignore: cast_nullable_to_non_nullable
              as Map<Purpose, GlobalKey>,
      lackNums: null == lackNums
          ? _self._lackNums
          : lackNums // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      equippedWeaponId: freezed == equippedWeaponId
          ? _self.equippedWeaponId
          : equippedWeaponId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
