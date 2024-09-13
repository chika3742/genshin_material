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

Weapon _$WeaponFromJson(Map<String, dynamic> json) {
  return _Weapon.fromJson(json);
}

/// @nodoc
mixin _$Weapon {
  String get id => throw _privateConstructorUsedError;
  int get hyvId => throw _privateConstructorUsedError;
  LocalizedText get name => throw _privateConstructorUsedError;
  String get jaPronunciation => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get rarity => throw _privateConstructorUsedError;
  String? get subStat => throw _privateConstructorUsedError;
  LocalizedText? get weaponAffixDesc => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  Map<String, String> get materials => throw _privateConstructorUsedError;
  ItemSource? get source => throw _privateConstructorUsedError;

  /// Serializes this Weapon to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$WeaponImpl extends _Weapon {
  const _$WeaponImpl(
      {required this.id,
      required this.hyvId,
      required this.name,
      required this.jaPronunciation,
      required this.imageUrl,
      required this.rarity,
      required this.subStat,
      required this.weaponAffixDesc,
      required this.type,
      required final Map<String, String> materials,
      this.source})
      : _materials = materials,
        super._();

  factory _$WeaponImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeaponImplFromJson(json);

  @override
  final String id;
  @override
  final int hyvId;
  @override
  final LocalizedText name;
  @override
  final String jaPronunciation;
  @override
  final String imageUrl;
  @override
  final int rarity;
  @override
  final String? subStat;
  @override
  final LocalizedText? weaponAffixDesc;
  @override
  final String type;
  final Map<String, String> _materials;
  @override
  Map<String, String> get materials {
    if (_materials is EqualUnmodifiableMapView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materials);
  }

  @override
  final ItemSource? source;

  @override
  String toString() {
    return 'Weapon(id: $id, hyvId: $hyvId, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, rarity: $rarity, subStat: $subStat, weaponAffixDesc: $weaponAffixDesc, type: $type, materials: $materials, source: $source)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WeaponImplToJson(
      this,
    );
  }
}

abstract class _Weapon extends Weapon {
  const factory _Weapon(
      {required final String id,
      required final int hyvId,
      required final LocalizedText name,
      required final String jaPronunciation,
      required final String imageUrl,
      required final int rarity,
      required final String? subStat,
      required final LocalizedText? weaponAffixDesc,
      required final String type,
      required final Map<String, String> materials,
      final ItemSource? source}) = _$WeaponImpl;
  const _Weapon._() : super._();

  factory _Weapon.fromJson(Map<String, dynamic> json) = _$WeaponImpl.fromJson;

  @override
  String get id;
  @override
  int get hyvId;
  @override
  LocalizedText get name;
  @override
  String get jaPronunciation;
  @override
  String get imageUrl;
  @override
  int get rarity;
  @override
  String? get subStat;
  @override
  LocalizedText? get weaponAffixDesc;
  @override
  String get type;
  @override
  Map<String, String> get materials;
  @override
  ItemSource? get source;
}

WeaponsMeta _$WeaponsMetaFromJson(Map<String, dynamic> json) {
  return _WeaponsMeta.fromJson(json);
}

/// @nodoc
mixin _$WeaponsMeta {
  Map<String, LocalizedText> get subStats => throw _privateConstructorUsedError;
  Map<String, WeaponTypeInfo> get types => throw _privateConstructorUsedError;

  /// Serializes this WeaponsMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$WeaponsMetaImpl implements _WeaponsMeta {
  const _$WeaponsMetaImpl(
      {required final Map<String, LocalizedText> subStats,
      required final Map<String, WeaponTypeInfo> types})
      : _subStats = subStats,
        _types = types;

  factory _$WeaponsMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeaponsMetaImplFromJson(json);

  final Map<String, LocalizedText> _subStats;
  @override
  Map<String, LocalizedText> get subStats {
    if (_subStats is EqualUnmodifiableMapView) return _subStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_subStats);
  }

  final Map<String, WeaponTypeInfo> _types;
  @override
  Map<String, WeaponTypeInfo> get types {
    if (_types is EqualUnmodifiableMapView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_types);
  }

  @override
  String toString() {
    return 'WeaponsMeta(subStats: $subStats, types: $types)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WeaponsMetaImplToJson(
      this,
    );
  }
}

abstract class _WeaponsMeta implements WeaponsMeta {
  const factory _WeaponsMeta(
      {required final Map<String, LocalizedText> subStats,
      required final Map<String, WeaponTypeInfo> types}) = _$WeaponsMetaImpl;

  factory _WeaponsMeta.fromJson(Map<String, dynamic> json) =
      _$WeaponsMetaImpl.fromJson;

  @override
  Map<String, LocalizedText> get subStats;
  @override
  Map<String, WeaponTypeInfo> get types;
}

WeaponTypeInfo _$WeaponTypeInfoFromJson(Map<String, dynamic> json) {
  return _WeaponTypeInfo.fromJson(json);
}

/// @nodoc
mixin _$WeaponTypeInfo {
  int get hyvId => throw _privateConstructorUsedError;
  LocalizedText get name => throw _privateConstructorUsedError;

  /// Serializes this WeaponTypeInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$WeaponTypeInfoImpl implements _WeaponTypeInfo {
  const _$WeaponTypeInfoImpl({required this.hyvId, required this.name});

  factory _$WeaponTypeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeaponTypeInfoImplFromJson(json);

  @override
  final int hyvId;
  @override
  final LocalizedText name;

  @override
  String toString() {
    return 'WeaponTypeInfo(hyvId: $hyvId, name: $name)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WeaponTypeInfoImplToJson(
      this,
    );
  }
}

abstract class _WeaponTypeInfo implements WeaponTypeInfo {
  const factory _WeaponTypeInfo(
      {required final int hyvId,
      required final LocalizedText name}) = _$WeaponTypeInfoImpl;

  factory _WeaponTypeInfo.fromJson(Map<String, dynamic> json) =
      _$WeaponTypeInfoImpl.fromJson;

  @override
  int get hyvId;
  @override
  LocalizedText get name;
}
