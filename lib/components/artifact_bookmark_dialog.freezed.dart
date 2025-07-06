// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artifact_bookmark_dialog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArtifactBookmarkDialogState {
  CharacterId? get characterId;
  ArtifactSetId? get firstSetId;
  ArtifactSetId? get secondSetId;
  ArtifactPieceId? get pieceId;
  Map<ArtifactPieceTypeId, StatId?> get mainStats;
  List<StatId> get subStats;

  /// Create a copy of ArtifactBookmarkDialogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ArtifactBookmarkDialogStateCopyWith<ArtifactBookmarkDialogState>
      get copyWith => _$ArtifactBookmarkDialogStateCopyWithImpl<
              ArtifactBookmarkDialogState>(
          this as ArtifactBookmarkDialogState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ArtifactBookmarkDialogState &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.firstSetId, firstSetId) ||
                other.firstSetId == firstSetId) &&
            (identical(other.secondSetId, secondSetId) ||
                other.secondSetId == secondSetId) &&
            (identical(other.pieceId, pieceId) || other.pieceId == pieceId) &&
            const DeepCollectionEquality().equals(other.mainStats, mainStats) &&
            const DeepCollectionEquality().equals(other.subStats, subStats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      characterId,
      firstSetId,
      secondSetId,
      pieceId,
      const DeepCollectionEquality().hash(mainStats),
      const DeepCollectionEquality().hash(subStats));

  @override
  String toString() {
    return 'ArtifactBookmarkDialogState(characterId: $characterId, firstSetId: $firstSetId, secondSetId: $secondSetId, pieceId: $pieceId, mainStats: $mainStats, subStats: $subStats)';
  }
}

/// @nodoc
abstract mixin class $ArtifactBookmarkDialogStateCopyWith<$Res> {
  factory $ArtifactBookmarkDialogStateCopyWith(
          ArtifactBookmarkDialogState value,
          $Res Function(ArtifactBookmarkDialogState) _then) =
      _$ArtifactBookmarkDialogStateCopyWithImpl;
  @useResult
  $Res call(
      {CharacterId? characterId,
      ArtifactSetId? firstSetId,
      ArtifactSetId? secondSetId,
      ArtifactPieceId? pieceId,
      Map<ArtifactPieceTypeId, StatId?> mainStats,
      List<StatId> subStats});
}

/// @nodoc
class _$ArtifactBookmarkDialogStateCopyWithImpl<$Res>
    implements $ArtifactBookmarkDialogStateCopyWith<$Res> {
  _$ArtifactBookmarkDialogStateCopyWithImpl(this._self, this._then);

  final ArtifactBookmarkDialogState _self;
  final $Res Function(ArtifactBookmarkDialogState) _then;

  /// Create a copy of ArtifactBookmarkDialogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterId = freezed,
    Object? firstSetId = freezed,
    Object? secondSetId = freezed,
    Object? pieceId = freezed,
    Object? mainStats = null,
    Object? subStats = null,
  }) {
    return _then(_self.copyWith(
      characterId: freezed == characterId
          ? _self.characterId
          : characterId // ignore: cast_nullable_to_non_nullable
              as CharacterId?,
      firstSetId: freezed == firstSetId
          ? _self.firstSetId
          : firstSetId // ignore: cast_nullable_to_non_nullable
              as ArtifactSetId?,
      secondSetId: freezed == secondSetId
          ? _self.secondSetId
          : secondSetId // ignore: cast_nullable_to_non_nullable
              as ArtifactSetId?,
      pieceId: freezed == pieceId
          ? _self.pieceId
          : pieceId // ignore: cast_nullable_to_non_nullable
              as ArtifactPieceId?,
      mainStats: null == mainStats
          ? _self.mainStats
          : mainStats // ignore: cast_nullable_to_non_nullable
              as Map<ArtifactPieceTypeId, StatId?>,
      subStats: null == subStats
          ? _self.subStats
          : subStats // ignore: cast_nullable_to_non_nullable
              as List<StatId>,
    ));
  }
}

/// @nodoc

class _ArtifactBookmarkDialogState implements ArtifactBookmarkDialogState {
  const _ArtifactBookmarkDialogState(
      {this.characterId,
      this.firstSetId,
      this.secondSetId,
      this.pieceId,
      final Map<ArtifactPieceTypeId, StatId?> mainStats = const {},
      final List<StatId> subStats = const []})
      : _mainStats = mainStats,
        _subStats = subStats;

  @override
  final CharacterId? characterId;
  @override
  final ArtifactSetId? firstSetId;
  @override
  final ArtifactSetId? secondSetId;
  @override
  final ArtifactPieceId? pieceId;
  final Map<ArtifactPieceTypeId, StatId?> _mainStats;
  @override
  @JsonKey()
  Map<ArtifactPieceTypeId, StatId?> get mainStats {
    if (_mainStats is EqualUnmodifiableMapView) return _mainStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_mainStats);
  }

  final List<StatId> _subStats;
  @override
  @JsonKey()
  List<StatId> get subStats {
    if (_subStats is EqualUnmodifiableListView) return _subStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subStats);
  }

  /// Create a copy of ArtifactBookmarkDialogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ArtifactBookmarkDialogStateCopyWith<_ArtifactBookmarkDialogState>
      get copyWith => __$ArtifactBookmarkDialogStateCopyWithImpl<
          _ArtifactBookmarkDialogState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ArtifactBookmarkDialogState &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.firstSetId, firstSetId) ||
                other.firstSetId == firstSetId) &&
            (identical(other.secondSetId, secondSetId) ||
                other.secondSetId == secondSetId) &&
            (identical(other.pieceId, pieceId) || other.pieceId == pieceId) &&
            const DeepCollectionEquality()
                .equals(other._mainStats, _mainStats) &&
            const DeepCollectionEquality().equals(other._subStats, _subStats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      characterId,
      firstSetId,
      secondSetId,
      pieceId,
      const DeepCollectionEquality().hash(_mainStats),
      const DeepCollectionEquality().hash(_subStats));

  @override
  String toString() {
    return 'ArtifactBookmarkDialogState(characterId: $characterId, firstSetId: $firstSetId, secondSetId: $secondSetId, pieceId: $pieceId, mainStats: $mainStats, subStats: $subStats)';
  }
}

/// @nodoc
abstract mixin class _$ArtifactBookmarkDialogStateCopyWith<$Res>
    implements $ArtifactBookmarkDialogStateCopyWith<$Res> {
  factory _$ArtifactBookmarkDialogStateCopyWith(
          _ArtifactBookmarkDialogState value,
          $Res Function(_ArtifactBookmarkDialogState) _then) =
      __$ArtifactBookmarkDialogStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CharacterId? characterId,
      ArtifactSetId? firstSetId,
      ArtifactSetId? secondSetId,
      ArtifactPieceId? pieceId,
      Map<ArtifactPieceTypeId, StatId?> mainStats,
      List<StatId> subStats});
}

/// @nodoc
class __$ArtifactBookmarkDialogStateCopyWithImpl<$Res>
    implements _$ArtifactBookmarkDialogStateCopyWith<$Res> {
  __$ArtifactBookmarkDialogStateCopyWithImpl(this._self, this._then);

  final _ArtifactBookmarkDialogState _self;
  final $Res Function(_ArtifactBookmarkDialogState) _then;

  /// Create a copy of ArtifactBookmarkDialogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? characterId = freezed,
    Object? firstSetId = freezed,
    Object? secondSetId = freezed,
    Object? pieceId = freezed,
    Object? mainStats = null,
    Object? subStats = null,
  }) {
    return _then(_ArtifactBookmarkDialogState(
      characterId: freezed == characterId
          ? _self.characterId
          : characterId // ignore: cast_nullable_to_non_nullable
              as CharacterId?,
      firstSetId: freezed == firstSetId
          ? _self.firstSetId
          : firstSetId // ignore: cast_nullable_to_non_nullable
              as ArtifactSetId?,
      secondSetId: freezed == secondSetId
          ? _self.secondSetId
          : secondSetId // ignore: cast_nullable_to_non_nullable
              as ArtifactSetId?,
      pieceId: freezed == pieceId
          ? _self.pieceId
          : pieceId // ignore: cast_nullable_to_non_nullable
              as ArtifactPieceId?,
      mainStats: null == mainStats
          ? _self._mainStats
          : mainStats // ignore: cast_nullable_to_non_nullable
              as Map<ArtifactPieceTypeId, StatId?>,
      subStats: null == subStats
          ? _self._subStats
          : subStats // ignore: cast_nullable_to_non_nullable
              as List<StatId>,
    ));
  }
}

// dart format on
