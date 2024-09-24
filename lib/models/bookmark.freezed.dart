// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookmarkWithDetails {
  Bookmark get metadata => throw _privateConstructorUsedError;
}

/// @nodoc

class _$BookmarkWithMaterialDetailsImpl implements BookmarkWithMaterialDetails {
  const _$BookmarkWithMaterialDetailsImpl(
      {required this.metadata, required this.materialDetails});

  @override
  final Bookmark metadata;
  @override
  final BookmarkMaterialDetails materialDetails;

  @override
  String toString() {
    return 'BookmarkWithDetails.material(metadata: $metadata, materialDetails: $materialDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkWithMaterialDetailsImpl &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality()
                .equals(other.materialDetails, materialDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, metadata,
      const DeepCollectionEquality().hash(materialDetails));
}

abstract class BookmarkWithMaterialDetails implements BookmarkWithDetails {
  const factory BookmarkWithMaterialDetails(
          {required final Bookmark metadata,
          required final BookmarkMaterialDetails materialDetails}) =
      _$BookmarkWithMaterialDetailsImpl;

  @override
  Bookmark get metadata;
  BookmarkMaterialDetails get materialDetails;
}

/// @nodoc

class _$BookmarkWithArtifactSetDetailsImpl
    implements BookmarkWithArtifactSetDetails {
  const _$BookmarkWithArtifactSetDetailsImpl(
      {required this.metadata, required this.artifactSetDetails});

  @override
  final Bookmark metadata;
  @override
  final BookmarkArtifactSetDetails artifactSetDetails;

  @override
  String toString() {
    return 'BookmarkWithDetails.artifactSet(metadata: $metadata, artifactSetDetails: $artifactSetDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkWithArtifactSetDetailsImpl &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality()
                .equals(other.artifactSetDetails, artifactSetDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, metadata,
      const DeepCollectionEquality().hash(artifactSetDetails));
}

abstract class BookmarkWithArtifactSetDetails implements BookmarkWithDetails {
  const factory BookmarkWithArtifactSetDetails(
          {required final Bookmark metadata,
          required final BookmarkArtifactSetDetails artifactSetDetails}) =
      _$BookmarkWithArtifactSetDetailsImpl;

  @override
  Bookmark get metadata;
  BookmarkArtifactSetDetails get artifactSetDetails;
}

/// @nodoc

class _$BookmarkWithArtifactPieceDetailsImpl
    implements BookmarkWithArtifactPieceDetails {
  const _$BookmarkWithArtifactPieceDetailsImpl(
      {required this.metadata, required this.artifactPieceDetails});

  @override
  final Bookmark metadata;
  @override
  final BookmarkArtifactPieceDetails artifactPieceDetails;

  @override
  String toString() {
    return 'BookmarkWithDetails.artifactPiece(metadata: $metadata, artifactPieceDetails: $artifactPieceDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkWithArtifactPieceDetailsImpl &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality()
                .equals(other.artifactPieceDetails, artifactPieceDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, metadata,
      const DeepCollectionEquality().hash(artifactPieceDetails));
}

abstract class BookmarkWithArtifactPieceDetails implements BookmarkWithDetails {
  const factory BookmarkWithArtifactPieceDetails(
          {required final Bookmark metadata,
          required final BookmarkArtifactPieceDetails artifactPieceDetails}) =
      _$BookmarkWithArtifactPieceDetailsImpl;

  @override
  Bookmark get metadata;
  BookmarkArtifactPieceDetails get artifactPieceDetails;
}

/// @nodoc
mixin _$BookmarkCompanionWorkaround {
  String get characterId => throw _privateConstructorUsedError;
  BookmarkType get type => throw _privateConstructorUsedError;
  String get groupHash => throw _privateConstructorUsedError;

  /// Create a copy of BookmarkCompanionWorkaround
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookmarkCompanionWorkaroundCopyWith<BookmarkCompanionWorkaround>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkCompanionWorkaroundCopyWith<$Res> {
  factory $BookmarkCompanionWorkaroundCopyWith(
          BookmarkCompanionWorkaround value,
          $Res Function(BookmarkCompanionWorkaround) then) =
      _$BookmarkCompanionWorkaroundCopyWithImpl<$Res,
          BookmarkCompanionWorkaround>;
  @useResult
  $Res call({String characterId, BookmarkType type, String groupHash});
}

/// @nodoc
class _$BookmarkCompanionWorkaroundCopyWithImpl<$Res,
        $Val extends BookmarkCompanionWorkaround>
    implements $BookmarkCompanionWorkaroundCopyWith<$Res> {
  _$BookmarkCompanionWorkaroundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookmarkCompanionWorkaround
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterId = null,
    Object? type = null,
    Object? groupHash = null,
  }) {
    return _then(_value.copyWith(
      characterId: null == characterId
          ? _value.characterId
          : characterId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BookmarkType,
      groupHash: null == groupHash
          ? _value.groupHash
          : groupHash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookmarkCompanionWorkaroundImplCopyWith<$Res>
    implements $BookmarkCompanionWorkaroundCopyWith<$Res> {
  factory _$$BookmarkCompanionWorkaroundImplCopyWith(
          _$BookmarkCompanionWorkaroundImpl value,
          $Res Function(_$BookmarkCompanionWorkaroundImpl) then) =
      __$$BookmarkCompanionWorkaroundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String characterId, BookmarkType type, String groupHash});
}

/// @nodoc
class __$$BookmarkCompanionWorkaroundImplCopyWithImpl<$Res>
    extends _$BookmarkCompanionWorkaroundCopyWithImpl<$Res,
        _$BookmarkCompanionWorkaroundImpl>
    implements _$$BookmarkCompanionWorkaroundImplCopyWith<$Res> {
  __$$BookmarkCompanionWorkaroundImplCopyWithImpl(
      _$BookmarkCompanionWorkaroundImpl _value,
      $Res Function(_$BookmarkCompanionWorkaroundImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookmarkCompanionWorkaround
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterId = null,
    Object? type = null,
    Object? groupHash = null,
  }) {
    return _then(_$BookmarkCompanionWorkaroundImpl(
      characterId: null == characterId
          ? _value.characterId
          : characterId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BookmarkType,
      groupHash: null == groupHash
          ? _value.groupHash
          : groupHash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BookmarkCompanionWorkaroundImpl extends _BookmarkCompanionWorkaround {
  const _$BookmarkCompanionWorkaroundImpl(
      {required this.characterId, required this.type, required this.groupHash})
      : super._();

  @override
  final String characterId;
  @override
  final BookmarkType type;
  @override
  final String groupHash;

  @override
  String toString() {
    return 'BookmarkCompanionWorkaround(characterId: $characterId, type: $type, groupHash: $groupHash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkCompanionWorkaroundImpl &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.groupHash, groupHash) ||
                other.groupHash == groupHash));
  }

  @override
  int get hashCode => Object.hash(runtimeType, characterId, type, groupHash);

  /// Create a copy of BookmarkCompanionWorkaround
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkCompanionWorkaroundImplCopyWith<_$BookmarkCompanionWorkaroundImpl>
      get copyWith => __$$BookmarkCompanionWorkaroundImplCopyWithImpl<
          _$BookmarkCompanionWorkaroundImpl>(this, _$identity);
}

abstract class _BookmarkCompanionWorkaround
    extends BookmarkCompanionWorkaround {
  const factory _BookmarkCompanionWorkaround(
      {required final String characterId,
      required final BookmarkType type,
      required final String groupHash}) = _$BookmarkCompanionWorkaroundImpl;
  const _BookmarkCompanionWorkaround._() : super._();

  @override
  String get characterId;
  @override
  BookmarkType get type;
  @override
  String get groupHash;

  /// Create a copy of BookmarkCompanionWorkaround
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookmarkCompanionWorkaroundImplCopyWith<_$BookmarkCompanionWorkaroundImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BookmarkMaterialDetailsCompanionWithoutParent {
  Value<String?> get weaponId => throw _privateConstructorUsedError;
  Value<String?> get materialId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get upperLevel => throw _privateConstructorUsedError;
  Purpose get purposeType => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;
}

/// @nodoc

class _$BookmarkMaterialDetailsCompanionWithoutParentImpl
    extends _BookmarkMaterialDetailsCompanionWithoutParent {
  const _$BookmarkMaterialDetailsCompanionWithoutParentImpl(
      {this.weaponId = const Value.absent(),
      this.materialId = const Value.absent(),
      required this.quantity,
      required this.upperLevel,
      required this.purposeType,
      required this.hash})
      : super._();

  @override
  @JsonKey()
  final Value<String?> weaponId;
  @override
  @JsonKey()
  final Value<String?> materialId;
  @override
  final int quantity;
  @override
  final int upperLevel;
  @override
  final Purpose purposeType;
  @override
  final String hash;

  @override
  String toString() {
    return 'BookmarkMaterialDetailsCompanionWithoutParent(weaponId: $weaponId, materialId: $materialId, quantity: $quantity, upperLevel: $upperLevel, purposeType: $purposeType, hash: $hash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkMaterialDetailsCompanionWithoutParentImpl &&
            (identical(other.weaponId, weaponId) ||
                other.weaponId == weaponId) &&
            (identical(other.materialId, materialId) ||
                other.materialId == materialId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.upperLevel, upperLevel) ||
                other.upperLevel == upperLevel) &&
            (identical(other.purposeType, purposeType) ||
                other.purposeType == purposeType) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weaponId, materialId, quantity,
      upperLevel, purposeType, hash);
}

abstract class _BookmarkMaterialDetailsCompanionWithoutParent
    extends BookmarkMaterialDetailsCompanionWithoutParent {
  const factory _BookmarkMaterialDetailsCompanionWithoutParent(
          {final Value<String?> weaponId,
          final Value<String?> materialId,
          required final int quantity,
          required final int upperLevel,
          required final Purpose purposeType,
          required final String hash}) =
      _$BookmarkMaterialDetailsCompanionWithoutParentImpl;
  const _BookmarkMaterialDetailsCompanionWithoutParent._() : super._();

  @override
  Value<String?> get weaponId;
  @override
  Value<String?> get materialId;
  @override
  int get quantity;
  @override
  int get upperLevel;
  @override
  Purpose get purposeType;
  @override
  String get hash;
}

/// @nodoc
mixin _$BookmarkArtifactSetDetailsCompanionWithoutParent {
  List<String> get sets => throw _privateConstructorUsedError;
  Map<String, String?> get mainStats => throw _privateConstructorUsedError;
  List<String> get subStats => throw _privateConstructorUsedError;
}

/// @nodoc

class _$BookmarkArtifactSetDetailsCompanionWithoutParentImpl
    extends _BookmarkArtifactSetDetailsCompanionWithoutParent {
  const _$BookmarkArtifactSetDetailsCompanionWithoutParentImpl(
      {required final List<String> sets,
      required final Map<String, String?> mainStats,
      required final List<String> subStats})
      : _sets = sets,
        _mainStats = mainStats,
        _subStats = subStats,
        super._();

  final List<String> _sets;
  @override
  List<String> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  final Map<String, String?> _mainStats;
  @override
  Map<String, String?> get mainStats {
    if (_mainStats is EqualUnmodifiableMapView) return _mainStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_mainStats);
  }

  final List<String> _subStats;
  @override
  List<String> get subStats {
    if (_subStats is EqualUnmodifiableListView) return _subStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subStats);
  }

  @override
  String toString() {
    return 'BookmarkArtifactSetDetailsCompanionWithoutParent(sets: $sets, mainStats: $mainStats, subStats: $subStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkArtifactSetDetailsCompanionWithoutParentImpl &&
            const DeepCollectionEquality().equals(other._sets, _sets) &&
            const DeepCollectionEquality()
                .equals(other._mainStats, _mainStats) &&
            const DeepCollectionEquality().equals(other._subStats, _subStats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sets),
      const DeepCollectionEquality().hash(_mainStats),
      const DeepCollectionEquality().hash(_subStats));
}

abstract class _BookmarkArtifactSetDetailsCompanionWithoutParent
    extends BookmarkArtifactSetDetailsCompanionWithoutParent {
  const factory _BookmarkArtifactSetDetailsCompanionWithoutParent(
          {required final List<String> sets,
          required final Map<String, String?> mainStats,
          required final List<String> subStats}) =
      _$BookmarkArtifactSetDetailsCompanionWithoutParentImpl;
  const _BookmarkArtifactSetDetailsCompanionWithoutParent._() : super._();

  @override
  List<String> get sets;
  @override
  Map<String, String?> get mainStats;
  @override
  List<String> get subStats;
}

/// @nodoc
mixin _$BookmarkArtifactPieceDetailsCompanionWithoutParent {
  String get piece => throw _privateConstructorUsedError;
  Value<String?> get mainStat => throw _privateConstructorUsedError;
  List<String> get subStats => throw _privateConstructorUsedError;
}

/// @nodoc

class _$BookmarkArtifactPieceDetailsCompanionWithoutParentImpl
    extends _BookmarkArtifactPieceDetailsCompanionWithoutParent {
  const _$BookmarkArtifactPieceDetailsCompanionWithoutParentImpl(
      {required this.piece,
      this.mainStat = const Value.absent(),
      required final List<String> subStats})
      : _subStats = subStats,
        super._();

  @override
  final String piece;
  @override
  @JsonKey()
  final Value<String?> mainStat;
  final List<String> _subStats;
  @override
  List<String> get subStats {
    if (_subStats is EqualUnmodifiableListView) return _subStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subStats);
  }

  @override
  String toString() {
    return 'BookmarkArtifactPieceDetailsCompanionWithoutParent(piece: $piece, mainStat: $mainStat, subStats: $subStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkArtifactPieceDetailsCompanionWithoutParentImpl &&
            (identical(other.piece, piece) || other.piece == piece) &&
            (identical(other.mainStat, mainStat) ||
                other.mainStat == mainStat) &&
            const DeepCollectionEquality().equals(other._subStats, _subStats));
  }

  @override
  int get hashCode => Object.hash(runtimeType, piece, mainStat,
      const DeepCollectionEquality().hash(_subStats));
}

abstract class _BookmarkArtifactPieceDetailsCompanionWithoutParent
    extends BookmarkArtifactPieceDetailsCompanionWithoutParent {
  const factory _BookmarkArtifactPieceDetailsCompanionWithoutParent(
          {required final String piece,
          final Value<String?> mainStat,
          required final List<String> subStats}) =
      _$BookmarkArtifactPieceDetailsCompanionWithoutParentImpl;
  const _BookmarkArtifactPieceDetailsCompanionWithoutParent._() : super._();

  @override
  String get piece;
  @override
  Value<String?> get mainStat;
  @override
  List<String> get subStats;
}

/// @nodoc
mixin _$BookmarkCompanionWithDetails {
  BookmarkCompanionWorkaround get metadata =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$BookmarkCompanionWithMaterialDetailsImpl
    implements BookmarkCompanionWithMaterialDetails {
  const _$BookmarkCompanionWithMaterialDetailsImpl(
      {required this.metadata, required this.materialDetails});

  @override
  final BookmarkCompanionWorkaround metadata;
  @override
  final BookmarkMaterialDetailsCompanionWithoutParent materialDetails;

  @override
  String toString() {
    return 'BookmarkCompanionWithDetails.material(metadata: $metadata, materialDetails: $materialDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkCompanionWithMaterialDetailsImpl &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.materialDetails, materialDetails) ||
                other.materialDetails == materialDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, metadata, materialDetails);
}

abstract class BookmarkCompanionWithMaterialDetails
    implements BookmarkCompanionWithDetails {
  const factory BookmarkCompanionWithMaterialDetails(
      {required final BookmarkCompanionWorkaround metadata,
      required final BookmarkMaterialDetailsCompanionWithoutParent
          materialDetails}) = _$BookmarkCompanionWithMaterialDetailsImpl;

  @override
  BookmarkCompanionWorkaround get metadata;
  BookmarkMaterialDetailsCompanionWithoutParent get materialDetails;
}

/// @nodoc

class _$BookmarkCompanionWithArtifactSetDetailsImpl
    implements BookmarkCompanionWithArtifactSetDetails {
  const _$BookmarkCompanionWithArtifactSetDetailsImpl(
      {required this.metadata, required this.artifactSetDetails});

  @override
  final BookmarkCompanionWorkaround metadata;
  @override
  final BookmarkArtifactSetDetailsCompanionWithoutParent artifactSetDetails;

  @override
  String toString() {
    return 'BookmarkCompanionWithDetails.artifactSet(metadata: $metadata, artifactSetDetails: $artifactSetDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkCompanionWithArtifactSetDetailsImpl &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.artifactSetDetails, artifactSetDetails) ||
                other.artifactSetDetails == artifactSetDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, metadata, artifactSetDetails);
}

abstract class BookmarkCompanionWithArtifactSetDetails
    implements BookmarkCompanionWithDetails {
  const factory BookmarkCompanionWithArtifactSetDetails(
      {required final BookmarkCompanionWorkaround metadata,
      required final BookmarkArtifactSetDetailsCompanionWithoutParent
          artifactSetDetails}) = _$BookmarkCompanionWithArtifactSetDetailsImpl;

  @override
  BookmarkCompanionWorkaround get metadata;
  BookmarkArtifactSetDetailsCompanionWithoutParent get artifactSetDetails;
}

/// @nodoc

class _$BookmarkCompanionWithArtifactPieceDetailsImpl
    implements BookmarkCompanionWithArtifactPieceDetails {
  const _$BookmarkCompanionWithArtifactPieceDetailsImpl(
      {required this.metadata, required this.artifactPieceDetails});

  @override
  final BookmarkCompanionWorkaround metadata;
  @override
  final BookmarkArtifactPieceDetailsCompanionWithoutParent artifactPieceDetails;

  @override
  String toString() {
    return 'BookmarkCompanionWithDetails.artifactPiece(metadata: $metadata, artifactPieceDetails: $artifactPieceDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkCompanionWithArtifactPieceDetailsImpl &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.artifactPieceDetails, artifactPieceDetails) ||
                other.artifactPieceDetails == artifactPieceDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, metadata, artifactPieceDetails);
}

abstract class BookmarkCompanionWithArtifactPieceDetails
    implements BookmarkCompanionWithDetails {
  const factory BookmarkCompanionWithArtifactPieceDetails(
          {required final BookmarkCompanionWorkaround metadata,
          required final BookmarkArtifactPieceDetailsCompanionWithoutParent
              artifactPieceDetails}) =
      _$BookmarkCompanionWithArtifactPieceDetailsImpl;

  @override
  BookmarkCompanionWorkaround get metadata;
  BookmarkArtifactPieceDetailsCompanionWithoutParent get artifactPieceDetails;
}

/// @nodoc
mixin _$BookmarkGroup {
  String get hash => throw _privateConstructorUsedError;
  BookmarkType get type => throw _privateConstructorUsedError;
  String get characterId => throw _privateConstructorUsedError;
  LevelRangeValues? get levelRange => throw _privateConstructorUsedError;
  List<BookmarkWithDetails> get bookmarks => throw _privateConstructorUsedError;
}

/// @nodoc

class _$BookmarkGroupImpl extends _BookmarkGroup {
  const _$BookmarkGroupImpl(
      {required this.hash,
      required this.type,
      required this.characterId,
      this.levelRange,
      required final List<BookmarkWithDetails> bookmarks})
      : _bookmarks = bookmarks,
        super._();

  @override
  final String hash;
  @override
  final BookmarkType type;
  @override
  final String characterId;
  @override
  final LevelRangeValues? levelRange;
  final List<BookmarkWithDetails> _bookmarks;
  @override
  List<BookmarkWithDetails> get bookmarks {
    if (_bookmarks is EqualUnmodifiableListView) return _bookmarks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookmarks);
  }

  @override
  String toString() {
    return 'BookmarkGroup(hash: $hash, type: $type, characterId: $characterId, levelRange: $levelRange, bookmarks: $bookmarks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkGroupImpl &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.levelRange, levelRange) ||
                other.levelRange == levelRange) &&
            const DeepCollectionEquality()
                .equals(other._bookmarks, _bookmarks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hash, type, characterId,
      levelRange, const DeepCollectionEquality().hash(_bookmarks));
}

abstract class _BookmarkGroup extends BookmarkGroup {
  const factory _BookmarkGroup(
          {required final String hash,
          required final BookmarkType type,
          required final String characterId,
          final LevelRangeValues? levelRange,
          required final List<BookmarkWithDetails> bookmarks}) =
      _$BookmarkGroupImpl;
  const _BookmarkGroup._() : super._();

  @override
  String get hash;
  @override
  BookmarkType get type;
  @override
  String get characterId;
  @override
  LevelRangeValues? get levelRange;
  @override
  List<BookmarkWithDetails> get bookmarks;
}
