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
  Map<String, LocalizedText> get subStats => throw _privateConstructorUsedError;
  Map<String, LocalizedText> get types => throw _privateConstructorUsedError;
  List<Weapon> get items => throw _privateConstructorUsedError;

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
  $Res call(
      {Map<String, LocalizedText> subStats,
      Map<String, LocalizedText> types,
      List<Weapon> items});
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
    Object? subStats = null,
    Object? types = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      subStats: null == subStats
          ? _value.subStats
          : subStats // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalizedText>,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalizedText>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Weapon>,
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
  $Res call(
      {Map<String, LocalizedText> subStats,
      Map<String, LocalizedText> types,
      List<Weapon> items});
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
    Object? subStats = null,
    Object? types = null,
    Object? items = null,
  }) {
    return _then(_$WeaponDataImpl(
      subStats: null == subStats
          ? _value._subStats
          : subStats // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalizedText>,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalizedText>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Weapon>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeaponDataImpl implements _WeaponData {
  const _$WeaponDataImpl(
      {required final Map<String, LocalizedText> subStats,
      required final Map<String, LocalizedText> types,
      required final List<Weapon> items})
      : _subStats = subStats,
        _types = types,
        _items = items;

  factory _$WeaponDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeaponDataImplFromJson(json);

  final Map<String, LocalizedText> _subStats;
  @override
  Map<String, LocalizedText> get subStats {
    if (_subStats is EqualUnmodifiableMapView) return _subStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_subStats);
  }

  final Map<String, LocalizedText> _types;
  @override
  Map<String, LocalizedText> get types {
    if (_types is EqualUnmodifiableMapView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_types);
  }

  final List<Weapon> _items;
  @override
  List<Weapon> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'WeaponData(subStats: $subStats, types: $types, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponDataImpl &&
            const DeepCollectionEquality().equals(other._subStats, _subStats) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_subStats),
      const DeepCollectionEquality().hash(_types),
      const DeepCollectionEquality().hash(_items));

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
  const factory _WeaponData(
      {required final Map<String, LocalizedText> subStats,
      required final Map<String, LocalizedText> types,
      required final List<Weapon> items}) = _$WeaponDataImpl;

  factory _WeaponData.fromJson(Map<String, dynamic> json) =
      _$WeaponDataImpl.fromJson;

  @override
  Map<String, LocalizedText> get subStats;
  @override
  Map<String, LocalizedText> get types;
  @override
  List<Weapon> get items;
  @override
  @JsonKey(ignore: true)
  _$$WeaponDataImplCopyWith<_$WeaponDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Weapon _$WeaponFromJson(Map<String, dynamic> json) {
  return _Weapon.fromJson(json);
}

/// @nodoc
mixin _$Weapon {
  String get id => throw _privateConstructorUsedError;
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
    return 'Weapon(id: $id, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, rarity: $rarity, subStat: $subStat, type: $type, materials: $materials, whereToGet: $whereToGet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponImpl &&
            (identical(other.id, id) || other.id == id) &&
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
