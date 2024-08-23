// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artifact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtifactSet _$ArtifactSetFromJson(Map<String, dynamic> json) {
  return _ArtifactSet.fromJson(json);
}

/// @nodoc
mixin _$ArtifactSet {
  String get id => throw _privateConstructorUsedError;
  LocalizedText get name => throw _privateConstructorUsedError;
  int get maxRarity => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  Map<String, ArtifactPiece> get consistsOf =>
      throw _privateConstructorUsedError;
  List<ArtifactSetBonus> get bonuses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtifactSetCopyWith<ArtifactSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactSetCopyWith<$Res> {
  factory $ArtifactSetCopyWith(
          ArtifactSet value, $Res Function(ArtifactSet) then) =
      _$ArtifactSetCopyWithImpl<$Res, ArtifactSet>;
  @useResult
  $Res call(
      {String id,
      LocalizedText name,
      int maxRarity,
      List<String>? tags,
      Map<String, ArtifactPiece> consistsOf,
      List<ArtifactSetBonus> bonuses});

  $LocalizedTextCopyWith<$Res> get name;
}

/// @nodoc
class _$ArtifactSetCopyWithImpl<$Res, $Val extends ArtifactSet>
    implements $ArtifactSetCopyWith<$Res> {
  _$ArtifactSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? maxRarity = null,
    Object? tags = freezed,
    Object? consistsOf = null,
    Object? bonuses = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
      maxRarity: null == maxRarity
          ? _value.maxRarity
          : maxRarity // ignore: cast_nullable_to_non_nullable
              as int,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      consistsOf: null == consistsOf
          ? _value.consistsOf
          : consistsOf // ignore: cast_nullable_to_non_nullable
              as Map<String, ArtifactPiece>,
      bonuses: null == bonuses
          ? _value.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<ArtifactSetBonus>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalizedTextCopyWith<$Res> get name {
    return $LocalizedTextCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtifactSetImplCopyWith<$Res>
    implements $ArtifactSetCopyWith<$Res> {
  factory _$$ArtifactSetImplCopyWith(
          _$ArtifactSetImpl value, $Res Function(_$ArtifactSetImpl) then) =
      __$$ArtifactSetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      LocalizedText name,
      int maxRarity,
      List<String>? tags,
      Map<String, ArtifactPiece> consistsOf,
      List<ArtifactSetBonus> bonuses});

  @override
  $LocalizedTextCopyWith<$Res> get name;
}

/// @nodoc
class __$$ArtifactSetImplCopyWithImpl<$Res>
    extends _$ArtifactSetCopyWithImpl<$Res, _$ArtifactSetImpl>
    implements _$$ArtifactSetImplCopyWith<$Res> {
  __$$ArtifactSetImplCopyWithImpl(
      _$ArtifactSetImpl _value, $Res Function(_$ArtifactSetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? maxRarity = null,
    Object? tags = freezed,
    Object? consistsOf = null,
    Object? bonuses = null,
  }) {
    return _then(_$ArtifactSetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
      maxRarity: null == maxRarity
          ? _value.maxRarity
          : maxRarity // ignore: cast_nullable_to_non_nullable
              as int,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      consistsOf: null == consistsOf
          ? _value._consistsOf
          : consistsOf // ignore: cast_nullable_to_non_nullable
              as Map<String, ArtifactPiece>,
      bonuses: null == bonuses
          ? _value._bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<ArtifactSetBonus>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtifactSetImpl implements _ArtifactSet {
  const _$ArtifactSetImpl(
      {required this.id,
      required this.name,
      required this.maxRarity,
      final List<String>? tags,
      required final Map<String, ArtifactPiece> consistsOf,
      required final List<ArtifactSetBonus> bonuses})
      : _tags = tags,
        _consistsOf = consistsOf,
        _bonuses = bonuses;

  factory _$ArtifactSetImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtifactSetImplFromJson(json);

  @override
  final String id;
  @override
  final LocalizedText name;
  @override
  final int maxRarity;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, ArtifactPiece> _consistsOf;
  @override
  Map<String, ArtifactPiece> get consistsOf {
    if (_consistsOf is EqualUnmodifiableMapView) return _consistsOf;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_consistsOf);
  }

  final List<ArtifactSetBonus> _bonuses;
  @override
  List<ArtifactSetBonus> get bonuses {
    if (_bonuses is EqualUnmodifiableListView) return _bonuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonuses);
  }

  @override
  String toString() {
    return 'ArtifactSet(id: $id, name: $name, maxRarity: $maxRarity, tags: $tags, consistsOf: $consistsOf, bonuses: $bonuses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtifactSetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.maxRarity, maxRarity) ||
                other.maxRarity == maxRarity) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._consistsOf, _consistsOf) &&
            const DeepCollectionEquality().equals(other._bonuses, _bonuses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      maxRarity,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_consistsOf),
      const DeepCollectionEquality().hash(_bonuses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtifactSetImplCopyWith<_$ArtifactSetImpl> get copyWith =>
      __$$ArtifactSetImplCopyWithImpl<_$ArtifactSetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtifactSetImplToJson(
      this,
    );
  }
}

abstract class _ArtifactSet implements ArtifactSet {
  const factory _ArtifactSet(
      {required final String id,
      required final LocalizedText name,
      required final int maxRarity,
      final List<String>? tags,
      required final Map<String, ArtifactPiece> consistsOf,
      required final List<ArtifactSetBonus> bonuses}) = _$ArtifactSetImpl;

  factory _ArtifactSet.fromJson(Map<String, dynamic> json) =
      _$ArtifactSetImpl.fromJson;

  @override
  String get id;
  @override
  LocalizedText get name;
  @override
  int get maxRarity;
  @override
  List<String>? get tags;
  @override
  Map<String, ArtifactPiece> get consistsOf;
  @override
  List<ArtifactSetBonus> get bonuses;
  @override
  @JsonKey(ignore: true)
  _$$ArtifactSetImplCopyWith<_$ArtifactSetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArtifactPiece _$ArtifactPieceFromJson(Map<String, dynamic> json) {
  return _ArtifactPiece.fromJson(json);
}

/// @nodoc
mixin _$ArtifactPiece {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  LocalizedText get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtifactPieceCopyWith<ArtifactPiece> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactPieceCopyWith<$Res> {
  factory $ArtifactPieceCopyWith(
          ArtifactPiece value, $Res Function(ArtifactPiece) then) =
      _$ArtifactPieceCopyWithImpl<$Res, ArtifactPiece>;
  @useResult
  $Res call({String id, String type, String imageUrl, LocalizedText name});

  $LocalizedTextCopyWith<$Res> get name;
}

/// @nodoc
class _$ArtifactPieceCopyWithImpl<$Res, $Val extends ArtifactPiece>
    implements $ArtifactPieceCopyWith<$Res> {
  _$ArtifactPieceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? imageUrl = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalizedTextCopyWith<$Res> get name {
    return $LocalizedTextCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtifactPieceImplCopyWith<$Res>
    implements $ArtifactPieceCopyWith<$Res> {
  factory _$$ArtifactPieceImplCopyWith(
          _$ArtifactPieceImpl value, $Res Function(_$ArtifactPieceImpl) then) =
      __$$ArtifactPieceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String type, String imageUrl, LocalizedText name});

  @override
  $LocalizedTextCopyWith<$Res> get name;
}

/// @nodoc
class __$$ArtifactPieceImplCopyWithImpl<$Res>
    extends _$ArtifactPieceCopyWithImpl<$Res, _$ArtifactPieceImpl>
    implements _$$ArtifactPieceImplCopyWith<$Res> {
  __$$ArtifactPieceImplCopyWithImpl(
      _$ArtifactPieceImpl _value, $Res Function(_$ArtifactPieceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? imageUrl = null,
    Object? name = null,
  }) {
    return _then(_$ArtifactPieceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtifactPieceImpl extends _ArtifactPiece {
  const _$ArtifactPieceImpl(
      {required this.id,
      required this.type,
      required this.imageUrl,
      required this.name})
      : super._();

  factory _$ArtifactPieceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtifactPieceImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String imageUrl;
  @override
  final LocalizedText name;

  @override
  String toString() {
    return 'ArtifactPiece(id: $id, type: $type, imageUrl: $imageUrl, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtifactPieceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, imageUrl, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtifactPieceImplCopyWith<_$ArtifactPieceImpl> get copyWith =>
      __$$ArtifactPieceImplCopyWithImpl<_$ArtifactPieceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtifactPieceImplToJson(
      this,
    );
  }
}

abstract class _ArtifactPiece extends ArtifactPiece {
  const factory _ArtifactPiece(
      {required final String id,
      required final String type,
      required final String imageUrl,
      required final LocalizedText name}) = _$ArtifactPieceImpl;
  const _ArtifactPiece._() : super._();

  factory _ArtifactPiece.fromJson(Map<String, dynamic> json) =
      _$ArtifactPieceImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get imageUrl;
  @override
  LocalizedText get name;
  @override
  @JsonKey(ignore: true)
  _$$ArtifactPieceImplCopyWith<_$ArtifactPieceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArtifactSetBonus _$ArtifactSetBonusFromJson(Map<String, dynamic> json) {
  return _ArtifactSetBonus.fromJson(json);
}

/// @nodoc
mixin _$ArtifactSetBonus {
  String get type => throw _privateConstructorUsedError;
  LocalizedText get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtifactSetBonusCopyWith<ArtifactSetBonus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactSetBonusCopyWith<$Res> {
  factory $ArtifactSetBonusCopyWith(
          ArtifactSetBonus value, $Res Function(ArtifactSetBonus) then) =
      _$ArtifactSetBonusCopyWithImpl<$Res, ArtifactSetBonus>;
  @useResult
  $Res call({String type, LocalizedText description});

  $LocalizedTextCopyWith<$Res> get description;
}

/// @nodoc
class _$ArtifactSetBonusCopyWithImpl<$Res, $Val extends ArtifactSetBonus>
    implements $ArtifactSetBonusCopyWith<$Res> {
  _$ArtifactSetBonusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalizedTextCopyWith<$Res> get description {
    return $LocalizedTextCopyWith<$Res>(_value.description, (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtifactSetBonusImplCopyWith<$Res>
    implements $ArtifactSetBonusCopyWith<$Res> {
  factory _$$ArtifactSetBonusImplCopyWith(_$ArtifactSetBonusImpl value,
          $Res Function(_$ArtifactSetBonusImpl) then) =
      __$$ArtifactSetBonusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, LocalizedText description});

  @override
  $LocalizedTextCopyWith<$Res> get description;
}

/// @nodoc
class __$$ArtifactSetBonusImplCopyWithImpl<$Res>
    extends _$ArtifactSetBonusCopyWithImpl<$Res, _$ArtifactSetBonusImpl>
    implements _$$ArtifactSetBonusImplCopyWith<$Res> {
  __$$ArtifactSetBonusImplCopyWithImpl(_$ArtifactSetBonusImpl _value,
      $Res Function(_$ArtifactSetBonusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? description = null,
  }) {
    return _then(_$ArtifactSetBonusImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtifactSetBonusImpl implements _ArtifactSetBonus {
  const _$ArtifactSetBonusImpl({required this.type, required this.description});

  factory _$ArtifactSetBonusImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtifactSetBonusImplFromJson(json);

  @override
  final String type;
  @override
  final LocalizedText description;

  @override
  String toString() {
    return 'ArtifactSetBonus(type: $type, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtifactSetBonusImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtifactSetBonusImplCopyWith<_$ArtifactSetBonusImpl> get copyWith =>
      __$$ArtifactSetBonusImplCopyWithImpl<_$ArtifactSetBonusImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtifactSetBonusImplToJson(
      this,
    );
  }
}

abstract class _ArtifactSetBonus implements ArtifactSetBonus {
  const factory _ArtifactSetBonus(
      {required final String type,
      required final LocalizedText description}) = _$ArtifactSetBonusImpl;

  factory _ArtifactSetBonus.fromJson(Map<String, dynamic> json) =
      _$ArtifactSetBonusImpl.fromJson;

  @override
  String get type;
  @override
  LocalizedText get description;
  @override
  @JsonKey(ignore: true)
  _$$ArtifactSetBonusImplCopyWith<_$ArtifactSetBonusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArtifactsMeta _$ArtifactsMetaFromJson(Map<String, dynamic> json) {
  return _ArtifactsMeta.fromJson(json);
}

/// @nodoc
mixin _$ArtifactsMeta {
  Map<String, LocalizedText> get stats => throw _privateConstructorUsedError;
  Map<String, ArtifactPieceType> get pieceTypes =>
      throw _privateConstructorUsedError;
  List<String> get possibleSubStats => throw _privateConstructorUsedError;
  Map<String, String> get pieceSetMap => throw _privateConstructorUsedError;
  ArtifactTagCategoriesInternal get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtifactsMetaCopyWith<ArtifactsMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactsMetaCopyWith<$Res> {
  factory $ArtifactsMetaCopyWith(
          ArtifactsMeta value, $Res Function(ArtifactsMeta) then) =
      _$ArtifactsMetaCopyWithImpl<$Res, ArtifactsMeta>;
  @useResult
  $Res call(
      {Map<String, LocalizedText> stats,
      Map<String, ArtifactPieceType> pieceTypes,
      List<String> possibleSubStats,
      Map<String, String> pieceSetMap,
      ArtifactTagCategoriesInternal tags});

  $ArtifactTagCategoriesInternalCopyWith<$Res> get tags;
}

/// @nodoc
class _$ArtifactsMetaCopyWithImpl<$Res, $Val extends ArtifactsMeta>
    implements $ArtifactsMetaCopyWith<$Res> {
  _$ArtifactsMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = null,
    Object? pieceTypes = null,
    Object? possibleSubStats = null,
    Object? pieceSetMap = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalizedText>,
      pieceTypes: null == pieceTypes
          ? _value.pieceTypes
          : pieceTypes // ignore: cast_nullable_to_non_nullable
              as Map<String, ArtifactPieceType>,
      possibleSubStats: null == possibleSubStats
          ? _value.possibleSubStats
          : possibleSubStats // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pieceSetMap: null == pieceSetMap
          ? _value.pieceSetMap
          : pieceSetMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as ArtifactTagCategoriesInternal,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArtifactTagCategoriesInternalCopyWith<$Res> get tags {
    return $ArtifactTagCategoriesInternalCopyWith<$Res>(_value.tags, (value) {
      return _then(_value.copyWith(tags: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtifactsMetaImplCopyWith<$Res>
    implements $ArtifactsMetaCopyWith<$Res> {
  factory _$$ArtifactsMetaImplCopyWith(
          _$ArtifactsMetaImpl value, $Res Function(_$ArtifactsMetaImpl) then) =
      __$$ArtifactsMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, LocalizedText> stats,
      Map<String, ArtifactPieceType> pieceTypes,
      List<String> possibleSubStats,
      Map<String, String> pieceSetMap,
      ArtifactTagCategoriesInternal tags});

  @override
  $ArtifactTagCategoriesInternalCopyWith<$Res> get tags;
}

/// @nodoc
class __$$ArtifactsMetaImplCopyWithImpl<$Res>
    extends _$ArtifactsMetaCopyWithImpl<$Res, _$ArtifactsMetaImpl>
    implements _$$ArtifactsMetaImplCopyWith<$Res> {
  __$$ArtifactsMetaImplCopyWithImpl(
      _$ArtifactsMetaImpl _value, $Res Function(_$ArtifactsMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = null,
    Object? pieceTypes = null,
    Object? possibleSubStats = null,
    Object? pieceSetMap = null,
    Object? tags = null,
  }) {
    return _then(_$ArtifactsMetaImpl(
      stats: null == stats
          ? _value._stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalizedText>,
      pieceTypes: null == pieceTypes
          ? _value._pieceTypes
          : pieceTypes // ignore: cast_nullable_to_non_nullable
              as Map<String, ArtifactPieceType>,
      possibleSubStats: null == possibleSubStats
          ? _value._possibleSubStats
          : possibleSubStats // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pieceSetMap: null == pieceSetMap
          ? _value._pieceSetMap
          : pieceSetMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as ArtifactTagCategoriesInternal,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtifactsMetaImpl implements _ArtifactsMeta {
  const _$ArtifactsMetaImpl(
      {required final Map<String, LocalizedText> stats,
      required final Map<String, ArtifactPieceType> pieceTypes,
      required final List<String> possibleSubStats,
      required final Map<String, String> pieceSetMap,
      required this.tags})
      : _stats = stats,
        _pieceTypes = pieceTypes,
        _possibleSubStats = possibleSubStats,
        _pieceSetMap = pieceSetMap;

  factory _$ArtifactsMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtifactsMetaImplFromJson(json);

  final Map<String, LocalizedText> _stats;
  @override
  Map<String, LocalizedText> get stats {
    if (_stats is EqualUnmodifiableMapView) return _stats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stats);
  }

  final Map<String, ArtifactPieceType> _pieceTypes;
  @override
  Map<String, ArtifactPieceType> get pieceTypes {
    if (_pieceTypes is EqualUnmodifiableMapView) return _pieceTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pieceTypes);
  }

  final List<String> _possibleSubStats;
  @override
  List<String> get possibleSubStats {
    if (_possibleSubStats is EqualUnmodifiableListView)
      return _possibleSubStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_possibleSubStats);
  }

  final Map<String, String> _pieceSetMap;
  @override
  Map<String, String> get pieceSetMap {
    if (_pieceSetMap is EqualUnmodifiableMapView) return _pieceSetMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pieceSetMap);
  }

  @override
  final ArtifactTagCategoriesInternal tags;

  @override
  String toString() {
    return 'ArtifactsMeta(stats: $stats, pieceTypes: $pieceTypes, possibleSubStats: $possibleSubStats, pieceSetMap: $pieceSetMap, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtifactsMetaImpl &&
            const DeepCollectionEquality().equals(other._stats, _stats) &&
            const DeepCollectionEquality()
                .equals(other._pieceTypes, _pieceTypes) &&
            const DeepCollectionEquality()
                .equals(other._possibleSubStats, _possibleSubStats) &&
            const DeepCollectionEquality()
                .equals(other._pieceSetMap, _pieceSetMap) &&
            (identical(other.tags, tags) || other.tags == tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_stats),
      const DeepCollectionEquality().hash(_pieceTypes),
      const DeepCollectionEquality().hash(_possibleSubStats),
      const DeepCollectionEquality().hash(_pieceSetMap),
      tags);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtifactsMetaImplCopyWith<_$ArtifactsMetaImpl> get copyWith =>
      __$$ArtifactsMetaImplCopyWithImpl<_$ArtifactsMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtifactsMetaImplToJson(
      this,
    );
  }
}

abstract class _ArtifactsMeta implements ArtifactsMeta {
  const factory _ArtifactsMeta(
      {required final Map<String, LocalizedText> stats,
      required final Map<String, ArtifactPieceType> pieceTypes,
      required final List<String> possibleSubStats,
      required final Map<String, String> pieceSetMap,
      required final ArtifactTagCategoriesInternal tags}) = _$ArtifactsMetaImpl;

  factory _ArtifactsMeta.fromJson(Map<String, dynamic> json) =
      _$ArtifactsMetaImpl.fromJson;

  @override
  Map<String, LocalizedText> get stats;
  @override
  Map<String, ArtifactPieceType> get pieceTypes;
  @override
  List<String> get possibleSubStats;
  @override
  Map<String, String> get pieceSetMap;
  @override
  ArtifactTagCategoriesInternal get tags;
  @override
  @JsonKey(ignore: true)
  _$$ArtifactsMetaImplCopyWith<_$ArtifactsMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArtifactPieceType _$ArtifactPieceTypeFromJson(Map<String, dynamic> json) {
  return _ArtifactPieceType.fromJson(json);
}

/// @nodoc
mixin _$ArtifactPieceType {
  String get id => throw _privateConstructorUsedError;
  LocalizedText get desc => throw _privateConstructorUsedError;
  List<String> get possibleMainStats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtifactPieceTypeCopyWith<ArtifactPieceType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactPieceTypeCopyWith<$Res> {
  factory $ArtifactPieceTypeCopyWith(
          ArtifactPieceType value, $Res Function(ArtifactPieceType) then) =
      _$ArtifactPieceTypeCopyWithImpl<$Res, ArtifactPieceType>;
  @useResult
  $Res call({String id, LocalizedText desc, List<String> possibleMainStats});

  $LocalizedTextCopyWith<$Res> get desc;
}

/// @nodoc
class _$ArtifactPieceTypeCopyWithImpl<$Res, $Val extends ArtifactPieceType>
    implements $ArtifactPieceTypeCopyWith<$Res> {
  _$ArtifactPieceTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? desc = null,
    Object? possibleMainStats = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
      possibleMainStats: null == possibleMainStats
          ? _value.possibleMainStats
          : possibleMainStats // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalizedTextCopyWith<$Res> get desc {
    return $LocalizedTextCopyWith<$Res>(_value.desc, (value) {
      return _then(_value.copyWith(desc: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtifactPieceTypeImplCopyWith<$Res>
    implements $ArtifactPieceTypeCopyWith<$Res> {
  factory _$$ArtifactPieceTypeImplCopyWith(_$ArtifactPieceTypeImpl value,
          $Res Function(_$ArtifactPieceTypeImpl) then) =
      __$$ArtifactPieceTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, LocalizedText desc, List<String> possibleMainStats});

  @override
  $LocalizedTextCopyWith<$Res> get desc;
}

/// @nodoc
class __$$ArtifactPieceTypeImplCopyWithImpl<$Res>
    extends _$ArtifactPieceTypeCopyWithImpl<$Res, _$ArtifactPieceTypeImpl>
    implements _$$ArtifactPieceTypeImplCopyWith<$Res> {
  __$$ArtifactPieceTypeImplCopyWithImpl(_$ArtifactPieceTypeImpl _value,
      $Res Function(_$ArtifactPieceTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? desc = null,
    Object? possibleMainStats = null,
  }) {
    return _then(_$ArtifactPieceTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
      possibleMainStats: null == possibleMainStats
          ? _value._possibleMainStats
          : possibleMainStats // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtifactPieceTypeImpl implements _ArtifactPieceType {
  const _$ArtifactPieceTypeImpl(
      {required this.id,
      required this.desc,
      required final List<String> possibleMainStats})
      : _possibleMainStats = possibleMainStats;

  factory _$ArtifactPieceTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtifactPieceTypeImplFromJson(json);

  @override
  final String id;
  @override
  final LocalizedText desc;
  final List<String> _possibleMainStats;
  @override
  List<String> get possibleMainStats {
    if (_possibleMainStats is EqualUnmodifiableListView)
      return _possibleMainStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_possibleMainStats);
  }

  @override
  String toString() {
    return 'ArtifactPieceType(id: $id, desc: $desc, possibleMainStats: $possibleMainStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtifactPieceTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            const DeepCollectionEquality()
                .equals(other._possibleMainStats, _possibleMainStats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, desc,
      const DeepCollectionEquality().hash(_possibleMainStats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtifactPieceTypeImplCopyWith<_$ArtifactPieceTypeImpl> get copyWith =>
      __$$ArtifactPieceTypeImplCopyWithImpl<_$ArtifactPieceTypeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtifactPieceTypeImplToJson(
      this,
    );
  }
}

abstract class _ArtifactPieceType implements ArtifactPieceType {
  const factory _ArtifactPieceType(
      {required final String id,
      required final LocalizedText desc,
      required final List<String> possibleMainStats}) = _$ArtifactPieceTypeImpl;

  factory _ArtifactPieceType.fromJson(Map<String, dynamic> json) =
      _$ArtifactPieceTypeImpl.fromJson;

  @override
  String get id;
  @override
  LocalizedText get desc;
  @override
  List<String> get possibleMainStats;
  @override
  @JsonKey(ignore: true)
  _$$ArtifactPieceTypeImplCopyWith<_$ArtifactPieceTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArtifactStat _$ArtifactStatFromJson(Map<String, dynamic> json) {
  return _ArtifactStat.fromJson(json);
}

/// @nodoc
mixin _$ArtifactStat {
  String get id => throw _privateConstructorUsedError;
  LocalizedText get desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtifactStatCopyWith<ArtifactStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactStatCopyWith<$Res> {
  factory $ArtifactStatCopyWith(
          ArtifactStat value, $Res Function(ArtifactStat) then) =
      _$ArtifactStatCopyWithImpl<$Res, ArtifactStat>;
  @useResult
  $Res call({String id, LocalizedText desc});

  $LocalizedTextCopyWith<$Res> get desc;
}

/// @nodoc
class _$ArtifactStatCopyWithImpl<$Res, $Val extends ArtifactStat>
    implements $ArtifactStatCopyWith<$Res> {
  _$ArtifactStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? desc = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalizedTextCopyWith<$Res> get desc {
    return $LocalizedTextCopyWith<$Res>(_value.desc, (value) {
      return _then(_value.copyWith(desc: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtifactStatImplCopyWith<$Res>
    implements $ArtifactStatCopyWith<$Res> {
  factory _$$ArtifactStatImplCopyWith(
          _$ArtifactStatImpl value, $Res Function(_$ArtifactStatImpl) then) =
      __$$ArtifactStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, LocalizedText desc});

  @override
  $LocalizedTextCopyWith<$Res> get desc;
}

/// @nodoc
class __$$ArtifactStatImplCopyWithImpl<$Res>
    extends _$ArtifactStatCopyWithImpl<$Res, _$ArtifactStatImpl>
    implements _$$ArtifactStatImplCopyWith<$Res> {
  __$$ArtifactStatImplCopyWithImpl(
      _$ArtifactStatImpl _value, $Res Function(_$ArtifactStatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? desc = null,
  }) {
    return _then(_$ArtifactStatImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtifactStatImpl implements _ArtifactStat {
  const _$ArtifactStatImpl({required this.id, required this.desc});

  factory _$ArtifactStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtifactStatImplFromJson(json);

  @override
  final String id;
  @override
  final LocalizedText desc;

  @override
  String toString() {
    return 'ArtifactStat(id: $id, desc: $desc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtifactStatImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.desc, desc) || other.desc == desc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, desc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtifactStatImplCopyWith<_$ArtifactStatImpl> get copyWith =>
      __$$ArtifactStatImplCopyWithImpl<_$ArtifactStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtifactStatImplToJson(
      this,
    );
  }
}

abstract class _ArtifactStat implements ArtifactStat {
  const factory _ArtifactStat(
      {required final String id,
      required final LocalizedText desc}) = _$ArtifactStatImpl;

  factory _ArtifactStat.fromJson(Map<String, dynamic> json) =
      _$ArtifactStatImpl.fromJson;

  @override
  String get id;
  @override
  LocalizedText get desc;
  @override
  @JsonKey(ignore: true)
  _$$ArtifactStatImplCopyWith<_$ArtifactStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArtifactTagCategoriesInternal _$ArtifactTagCategoriesInternalFromJson(
    Map<String, dynamic> json) {
  return _ArtifactTagCategoriesInternal.fromJson(json);
}

/// @nodoc
mixin _$ArtifactTagCategoriesInternal {
  List<ArtifactTagCategory> get categories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtifactTagCategoriesInternalCopyWith<ArtifactTagCategoriesInternal>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactTagCategoriesInternalCopyWith<$Res> {
  factory $ArtifactTagCategoriesInternalCopyWith(
          ArtifactTagCategoriesInternal value,
          $Res Function(ArtifactTagCategoriesInternal) then) =
      _$ArtifactTagCategoriesInternalCopyWithImpl<$Res,
          ArtifactTagCategoriesInternal>;
  @useResult
  $Res call({List<ArtifactTagCategory> categories});
}

/// @nodoc
class _$ArtifactTagCategoriesInternalCopyWithImpl<$Res,
        $Val extends ArtifactTagCategoriesInternal>
    implements $ArtifactTagCategoriesInternalCopyWith<$Res> {
  _$ArtifactTagCategoriesInternalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ArtifactTagCategory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtifactTagCategoriesInternalImplCopyWith<$Res>
    implements $ArtifactTagCategoriesInternalCopyWith<$Res> {
  factory _$$ArtifactTagCategoriesInternalImplCopyWith(
          _$ArtifactTagCategoriesInternalImpl value,
          $Res Function(_$ArtifactTagCategoriesInternalImpl) then) =
      __$$ArtifactTagCategoriesInternalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ArtifactTagCategory> categories});
}

/// @nodoc
class __$$ArtifactTagCategoriesInternalImplCopyWithImpl<$Res>
    extends _$ArtifactTagCategoriesInternalCopyWithImpl<$Res,
        _$ArtifactTagCategoriesInternalImpl>
    implements _$$ArtifactTagCategoriesInternalImplCopyWith<$Res> {
  __$$ArtifactTagCategoriesInternalImplCopyWithImpl(
      _$ArtifactTagCategoriesInternalImpl _value,
      $Res Function(_$ArtifactTagCategoriesInternalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$ArtifactTagCategoriesInternalImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ArtifactTagCategory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtifactTagCategoriesInternalImpl
    implements _ArtifactTagCategoriesInternal {
  const _$ArtifactTagCategoriesInternalImpl(
      {required final List<ArtifactTagCategory> categories})
      : _categories = categories;

  factory _$ArtifactTagCategoriesInternalImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ArtifactTagCategoriesInternalImplFromJson(json);

  final List<ArtifactTagCategory> _categories;
  @override
  List<ArtifactTagCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'ArtifactTagCategoriesInternal(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtifactTagCategoriesInternalImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtifactTagCategoriesInternalImplCopyWith<
          _$ArtifactTagCategoriesInternalImpl>
      get copyWith => __$$ArtifactTagCategoriesInternalImplCopyWithImpl<
          _$ArtifactTagCategoriesInternalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtifactTagCategoriesInternalImplToJson(
      this,
    );
  }
}

abstract class _ArtifactTagCategoriesInternal
    implements ArtifactTagCategoriesInternal {
  const factory _ArtifactTagCategoriesInternal(
          {required final List<ArtifactTagCategory> categories}) =
      _$ArtifactTagCategoriesInternalImpl;

  factory _ArtifactTagCategoriesInternal.fromJson(Map<String, dynamic> json) =
      _$ArtifactTagCategoriesInternalImpl.fromJson;

  @override
  List<ArtifactTagCategory> get categories;
  @override
  @JsonKey(ignore: true)
  _$$ArtifactTagCategoriesInternalImplCopyWith<
          _$ArtifactTagCategoriesInternalImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ArtifactTagCategory _$ArtifactTagCategoryFromJson(Map<String, dynamic> json) {
  return _ArtifactTagCategory.fromJson(json);
}

/// @nodoc
mixin _$ArtifactTagCategory {
  LocalizedText get desc => throw _privateConstructorUsedError;
  List<ArtifactTag> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtifactTagCategoryCopyWith<ArtifactTagCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactTagCategoryCopyWith<$Res> {
  factory $ArtifactTagCategoryCopyWith(
          ArtifactTagCategory value, $Res Function(ArtifactTagCategory) then) =
      _$ArtifactTagCategoryCopyWithImpl<$Res, ArtifactTagCategory>;
  @useResult
  $Res call({LocalizedText desc, List<ArtifactTag> items});

  $LocalizedTextCopyWith<$Res> get desc;
}

/// @nodoc
class _$ArtifactTagCategoryCopyWithImpl<$Res, $Val extends ArtifactTagCategory>
    implements $ArtifactTagCategoryCopyWith<$Res> {
  _$ArtifactTagCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? desc = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ArtifactTag>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalizedTextCopyWith<$Res> get desc {
    return $LocalizedTextCopyWith<$Res>(_value.desc, (value) {
      return _then(_value.copyWith(desc: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtifactTagCategoryImplCopyWith<$Res>
    implements $ArtifactTagCategoryCopyWith<$Res> {
  factory _$$ArtifactTagCategoryImplCopyWith(_$ArtifactTagCategoryImpl value,
          $Res Function(_$ArtifactTagCategoryImpl) then) =
      __$$ArtifactTagCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LocalizedText desc, List<ArtifactTag> items});

  @override
  $LocalizedTextCopyWith<$Res> get desc;
}

/// @nodoc
class __$$ArtifactTagCategoryImplCopyWithImpl<$Res>
    extends _$ArtifactTagCategoryCopyWithImpl<$Res, _$ArtifactTagCategoryImpl>
    implements _$$ArtifactTagCategoryImplCopyWith<$Res> {
  __$$ArtifactTagCategoryImplCopyWithImpl(_$ArtifactTagCategoryImpl _value,
      $Res Function(_$ArtifactTagCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? desc = null,
    Object? items = null,
  }) {
    return _then(_$ArtifactTagCategoryImpl(
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ArtifactTag>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtifactTagCategoryImpl implements _ArtifactTagCategory {
  const _$ArtifactTagCategoryImpl(
      {required this.desc, required final List<ArtifactTag> items})
      : _items = items;

  factory _$ArtifactTagCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtifactTagCategoryImplFromJson(json);

  @override
  final LocalizedText desc;
  final List<ArtifactTag> _items;
  @override
  List<ArtifactTag> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ArtifactTagCategory(desc: $desc, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtifactTagCategoryImpl &&
            (identical(other.desc, desc) || other.desc == desc) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, desc, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtifactTagCategoryImplCopyWith<_$ArtifactTagCategoryImpl> get copyWith =>
      __$$ArtifactTagCategoryImplCopyWithImpl<_$ArtifactTagCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtifactTagCategoryImplToJson(
      this,
    );
  }
}

abstract class _ArtifactTagCategory implements ArtifactTagCategory {
  const factory _ArtifactTagCategory(
      {required final LocalizedText desc,
      required final List<ArtifactTag> items}) = _$ArtifactTagCategoryImpl;

  factory _ArtifactTagCategory.fromJson(Map<String, dynamic> json) =
      _$ArtifactTagCategoryImpl.fromJson;

  @override
  LocalizedText get desc;
  @override
  List<ArtifactTag> get items;
  @override
  @JsonKey(ignore: true)
  _$$ArtifactTagCategoryImplCopyWith<_$ArtifactTagCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArtifactTag _$ArtifactTagFromJson(Map<String, dynamic> json) {
  return _ArtifactTag.fromJson(json);
}

/// @nodoc
mixin _$ArtifactTag {
  String get id => throw _privateConstructorUsedError;
  LocalizedText get desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtifactTagCopyWith<ArtifactTag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactTagCopyWith<$Res> {
  factory $ArtifactTagCopyWith(
          ArtifactTag value, $Res Function(ArtifactTag) then) =
      _$ArtifactTagCopyWithImpl<$Res, ArtifactTag>;
  @useResult
  $Res call({String id, LocalizedText desc});

  $LocalizedTextCopyWith<$Res> get desc;
}

/// @nodoc
class _$ArtifactTagCopyWithImpl<$Res, $Val extends ArtifactTag>
    implements $ArtifactTagCopyWith<$Res> {
  _$ArtifactTagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? desc = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalizedTextCopyWith<$Res> get desc {
    return $LocalizedTextCopyWith<$Res>(_value.desc, (value) {
      return _then(_value.copyWith(desc: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtifactTagImplCopyWith<$Res>
    implements $ArtifactTagCopyWith<$Res> {
  factory _$$ArtifactTagImplCopyWith(
          _$ArtifactTagImpl value, $Res Function(_$ArtifactTagImpl) then) =
      __$$ArtifactTagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, LocalizedText desc});

  @override
  $LocalizedTextCopyWith<$Res> get desc;
}

/// @nodoc
class __$$ArtifactTagImplCopyWithImpl<$Res>
    extends _$ArtifactTagCopyWithImpl<$Res, _$ArtifactTagImpl>
    implements _$$ArtifactTagImplCopyWith<$Res> {
  __$$ArtifactTagImplCopyWithImpl(
      _$ArtifactTagImpl _value, $Res Function(_$ArtifactTagImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? desc = null,
  }) {
    return _then(_$ArtifactTagImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtifactTagImpl implements _ArtifactTag {
  const _$ArtifactTagImpl({required this.id, required this.desc});

  factory _$ArtifactTagImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtifactTagImplFromJson(json);

  @override
  final String id;
  @override
  final LocalizedText desc;

  @override
  String toString() {
    return 'ArtifactTag(id: $id, desc: $desc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtifactTagImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.desc, desc) || other.desc == desc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, desc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtifactTagImplCopyWith<_$ArtifactTagImpl> get copyWith =>
      __$$ArtifactTagImplCopyWithImpl<_$ArtifactTagImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtifactTagImplToJson(
      this,
    );
  }
}

abstract class _ArtifactTag implements ArtifactTag {
  const factory _ArtifactTag(
      {required final String id,
      required final LocalizedText desc}) = _$ArtifactTagImpl;

  factory _ArtifactTag.fromJson(Map<String, dynamic> json) =
      _$ArtifactTagImpl.fromJson;

  @override
  String get id;
  @override
  LocalizedText get desc;
  @override
  @JsonKey(ignore: true)
  _$$ArtifactTagImplCopyWith<_$ArtifactTagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
