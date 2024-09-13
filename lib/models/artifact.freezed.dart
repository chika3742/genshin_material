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

  /// Serializes this ArtifactSet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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

  /// Serializes this ArtifactPiece to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
}

ArtifactSetBonus _$ArtifactSetBonusFromJson(Map<String, dynamic> json) {
  return _ArtifactSetBonus.fromJson(json);
}

/// @nodoc
mixin _$ArtifactSetBonus {
  String get type => throw _privateConstructorUsedError;
  LocalizedText get description => throw _privateConstructorUsedError;

  /// Serializes this ArtifactSetBonus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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

  /// Serializes this ArtifactsMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
}

ArtifactPieceType _$ArtifactPieceTypeFromJson(Map<String, dynamic> json) {
  return _ArtifactPieceType.fromJson(json);
}

/// @nodoc
mixin _$ArtifactPieceType {
  String get id => throw _privateConstructorUsedError;
  LocalizedText get desc => throw _privateConstructorUsedError;
  List<String> get possibleMainStats => throw _privateConstructorUsedError;

  /// Serializes this ArtifactPieceType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
}

ArtifactStat _$ArtifactStatFromJson(Map<String, dynamic> json) {
  return _ArtifactStat.fromJson(json);
}

/// @nodoc
mixin _$ArtifactStat {
  String get id => throw _privateConstructorUsedError;
  LocalizedText get desc => throw _privateConstructorUsedError;

  /// Serializes this ArtifactStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
}

ArtifactTagCategoriesInternal _$ArtifactTagCategoriesInternalFromJson(
    Map<String, dynamic> json) {
  return _ArtifactTagCategoriesInternal.fromJson(json);
}

/// @nodoc
mixin _$ArtifactTagCategoriesInternal {
  List<ArtifactTagCategory> get categories =>
      throw _privateConstructorUsedError;

  /// Serializes this ArtifactTagCategoriesInternal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
}

ArtifactTagCategory _$ArtifactTagCategoryFromJson(Map<String, dynamic> json) {
  return _ArtifactTagCategory.fromJson(json);
}

/// @nodoc
mixin _$ArtifactTagCategory {
  LocalizedText get desc => throw _privateConstructorUsedError;
  List<ArtifactTag> get items => throw _privateConstructorUsedError;

  /// Serializes this ArtifactTagCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
}

ArtifactTag _$ArtifactTagFromJson(Map<String, dynamic> json) {
  return _ArtifactTag.fromJson(json);
}

/// @nodoc
mixin _$ArtifactTag {
  String get id => throw _privateConstructorUsedError;
  LocalizedText get desc => throw _privateConstructorUsedError;

  /// Serializes this ArtifactTag to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
}
