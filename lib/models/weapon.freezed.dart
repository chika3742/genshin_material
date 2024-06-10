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
  String get type => throw _privateConstructorUsedError;
  Map<String, String> get materials => throw _privateConstructorUsedError;
  WhereToGet? get whereToGet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeaponCopyWith<Weapon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeaponCopyWith<$Res> {
  factory $WeaponCopyWith(Weapon value, $Res Function(Weapon) then) =
      _$WeaponCopyWithImpl<$Res, Weapon>;
  @useResult
  $Res call(
      {String id,
      int hyvId,
      LocalizedText name,
      String jaPronunciation,
      String imageUrl,
      int rarity,
      String? subStat,
      String type,
      Map<String, String> materials,
      WhereToGet? whereToGet});

  $LocalizedTextCopyWith<$Res> get name;
  $WhereToGetCopyWith<$Res>? get whereToGet;
}

/// @nodoc
class _$WeaponCopyWithImpl<$Res, $Val extends Weapon>
    implements $WeaponCopyWith<$Res> {
  _$WeaponCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hyvId = null,
    Object? name = null,
    Object? jaPronunciation = null,
    Object? imageUrl = null,
    Object? rarity = null,
    Object? subStat = freezed,
    Object? type = null,
    Object? materials = null,
    Object? whereToGet = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hyvId: null == hyvId
          ? _value.hyvId
          : hyvId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
      jaPronunciation: null == jaPronunciation
          ? _value.jaPronunciation
          : jaPronunciation // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int,
      subStat: freezed == subStat
          ? _value.subStat
          : subStat // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      whereToGet: freezed == whereToGet
          ? _value.whereToGet
          : whereToGet // ignore: cast_nullable_to_non_nullable
              as WhereToGet?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalizedTextCopyWith<$Res> get name {
    return $LocalizedTextCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WhereToGetCopyWith<$Res>? get whereToGet {
    if (_value.whereToGet == null) {
      return null;
    }

    return $WhereToGetCopyWith<$Res>(_value.whereToGet!, (value) {
      return _then(_value.copyWith(whereToGet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeaponImplCopyWith<$Res> implements $WeaponCopyWith<$Res> {
  factory _$$WeaponImplCopyWith(
          _$WeaponImpl value, $Res Function(_$WeaponImpl) then) =
      __$$WeaponImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int hyvId,
      LocalizedText name,
      String jaPronunciation,
      String imageUrl,
      int rarity,
      String? subStat,
      String type,
      Map<String, String> materials,
      WhereToGet? whereToGet});

  @override
  $LocalizedTextCopyWith<$Res> get name;
  @override
  $WhereToGetCopyWith<$Res>? get whereToGet;
}

/// @nodoc
class __$$WeaponImplCopyWithImpl<$Res>
    extends _$WeaponCopyWithImpl<$Res, _$WeaponImpl>
    implements _$$WeaponImplCopyWith<$Res> {
  __$$WeaponImplCopyWithImpl(
      _$WeaponImpl _value, $Res Function(_$WeaponImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hyvId = null,
    Object? name = null,
    Object? jaPronunciation = null,
    Object? imageUrl = null,
    Object? rarity = null,
    Object? subStat = freezed,
    Object? type = null,
    Object? materials = null,
    Object? whereToGet = freezed,
  }) {
    return _then(_$WeaponImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hyvId: null == hyvId
          ? _value.hyvId
          : hyvId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
      jaPronunciation: null == jaPronunciation
          ? _value.jaPronunciation
          : jaPronunciation // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int,
      subStat: freezed == subStat
          ? _value.subStat
          : subStat // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      whereToGet: freezed == whereToGet
          ? _value.whereToGet
          : whereToGet // ignore: cast_nullable_to_non_nullable
              as WhereToGet?,
    ));
  }
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
      required this.type,
      required final Map<String, String> materials,
      this.whereToGet})
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
  final String type;
  final Map<String, String> _materials;
  @override
  Map<String, String> get materials {
    if (_materials is EqualUnmodifiableMapView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materials);
  }

  @override
  final WhereToGet? whereToGet;

  @override
  String toString() {
    return 'Weapon(id: $id, hyvId: $hyvId, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, rarity: $rarity, subStat: $subStat, type: $type, materials: $materials, whereToGet: $whereToGet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hyvId, hyvId) || other.hyvId == hyvId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.jaPronunciation, jaPronunciation) ||
                other.jaPronunciation == jaPronunciation) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.subStat, subStat) || other.subStat == subStat) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials) &&
            (identical(other.whereToGet, whereToGet) ||
                other.whereToGet == whereToGet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      hyvId,
      name,
      jaPronunciation,
      imageUrl,
      rarity,
      subStat,
      type,
      const DeepCollectionEquality().hash(_materials),
      whereToGet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeaponImplCopyWith<_$WeaponImpl> get copyWith =>
      __$$WeaponImplCopyWithImpl<_$WeaponImpl>(this, _$identity);

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
      required final String type,
      required final Map<String, String> materials,
      final WhereToGet? whereToGet}) = _$WeaponImpl;
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
  String get type;
  @override
  Map<String, String> get materials;
  @override
  WhereToGet? get whereToGet;
  @override
  @JsonKey(ignore: true)
  _$$WeaponImplCopyWith<_$WeaponImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeaponsMeta _$WeaponsMetaFromJson(Map<String, dynamic> json) {
  return _WeaponsMeta.fromJson(json);
}

/// @nodoc
mixin _$WeaponsMeta {
  Map<String, LocalizedText> get subStats => throw _privateConstructorUsedError;
  Map<String, WeaponTypeInfo> get types => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeaponsMetaCopyWith<WeaponsMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeaponsMetaCopyWith<$Res> {
  factory $WeaponsMetaCopyWith(
          WeaponsMeta value, $Res Function(WeaponsMeta) then) =
      _$WeaponsMetaCopyWithImpl<$Res, WeaponsMeta>;
  @useResult
  $Res call(
      {Map<String, LocalizedText> subStats, Map<String, WeaponTypeInfo> types});
}

/// @nodoc
class _$WeaponsMetaCopyWithImpl<$Res, $Val extends WeaponsMeta>
    implements $WeaponsMetaCopyWith<$Res> {
  _$WeaponsMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subStats = null,
    Object? types = null,
  }) {
    return _then(_value.copyWith(
      subStats: null == subStats
          ? _value.subStats
          : subStats // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalizedText>,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as Map<String, WeaponTypeInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeaponsMetaImplCopyWith<$Res>
    implements $WeaponsMetaCopyWith<$Res> {
  factory _$$WeaponsMetaImplCopyWith(
          _$WeaponsMetaImpl value, $Res Function(_$WeaponsMetaImpl) then) =
      __$$WeaponsMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, LocalizedText> subStats, Map<String, WeaponTypeInfo> types});
}

/// @nodoc
class __$$WeaponsMetaImplCopyWithImpl<$Res>
    extends _$WeaponsMetaCopyWithImpl<$Res, _$WeaponsMetaImpl>
    implements _$$WeaponsMetaImplCopyWith<$Res> {
  __$$WeaponsMetaImplCopyWithImpl(
      _$WeaponsMetaImpl _value, $Res Function(_$WeaponsMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subStats = null,
    Object? types = null,
  }) {
    return _then(_$WeaponsMetaImpl(
      subStats: null == subStats
          ? _value._subStats
          : subStats // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalizedText>,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as Map<String, WeaponTypeInfo>,
    ));
  }
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponsMetaImpl &&
            const DeepCollectionEquality().equals(other._subStats, _subStats) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_subStats),
      const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeaponsMetaImplCopyWith<_$WeaponsMetaImpl> get copyWith =>
      __$$WeaponsMetaImplCopyWithImpl<_$WeaponsMetaImpl>(this, _$identity);

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
  @override
  @JsonKey(ignore: true)
  _$$WeaponsMetaImplCopyWith<_$WeaponsMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeaponTypeInfo _$WeaponTypeInfoFromJson(Map<String, dynamic> json) {
  return _WeaponTypeInfo.fromJson(json);
}

/// @nodoc
mixin _$WeaponTypeInfo {
  int get hyvId => throw _privateConstructorUsedError;
  LocalizedText get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeaponTypeInfoCopyWith<WeaponTypeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeaponTypeInfoCopyWith<$Res> {
  factory $WeaponTypeInfoCopyWith(
          WeaponTypeInfo value, $Res Function(WeaponTypeInfo) then) =
      _$WeaponTypeInfoCopyWithImpl<$Res, WeaponTypeInfo>;
  @useResult
  $Res call({int hyvId, LocalizedText name});

  $LocalizedTextCopyWith<$Res> get name;
}

/// @nodoc
class _$WeaponTypeInfoCopyWithImpl<$Res, $Val extends WeaponTypeInfo>
    implements $WeaponTypeInfoCopyWith<$Res> {
  _$WeaponTypeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hyvId = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      hyvId: null == hyvId
          ? _value.hyvId
          : hyvId // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$WeaponTypeInfoImplCopyWith<$Res>
    implements $WeaponTypeInfoCopyWith<$Res> {
  factory _$$WeaponTypeInfoImplCopyWith(_$WeaponTypeInfoImpl value,
          $Res Function(_$WeaponTypeInfoImpl) then) =
      __$$WeaponTypeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hyvId, LocalizedText name});

  @override
  $LocalizedTextCopyWith<$Res> get name;
}

/// @nodoc
class __$$WeaponTypeInfoImplCopyWithImpl<$Res>
    extends _$WeaponTypeInfoCopyWithImpl<$Res, _$WeaponTypeInfoImpl>
    implements _$$WeaponTypeInfoImplCopyWith<$Res> {
  __$$WeaponTypeInfoImplCopyWithImpl(
      _$WeaponTypeInfoImpl _value, $Res Function(_$WeaponTypeInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hyvId = null,
    Object? name = null,
  }) {
    return _then(_$WeaponTypeInfoImpl(
      hyvId: null == hyvId
          ? _value.hyvId
          : hyvId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ));
  }
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponTypeInfoImpl &&
            (identical(other.hyvId, hyvId) || other.hyvId == hyvId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hyvId, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeaponTypeInfoImplCopyWith<_$WeaponTypeInfoImpl> get copyWith =>
      __$$WeaponTypeInfoImplCopyWithImpl<_$WeaponTypeInfoImpl>(
          this, _$identity);

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
  @override
  @JsonKey(ignore: true)
  _$$WeaponTypeInfoImplCopyWith<_$WeaponTypeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
