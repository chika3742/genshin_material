// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Material _$MaterialFromJson(Map<String, dynamic> json) {
  return _Material.fromJson(json);
}

/// @nodoc
mixin _$Material {
  String get id => throw _privateConstructorUsedError;
  LocalizedText get name => throw _privateConstructorUsedError;
  String get jaPronunciation => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get rarity => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String? get groupId => throw _privateConstructorUsedError;
  int? get craftLevel => throw _privateConstructorUsedError;
  List<DayOfWeek>? get availableDays => throw _privateConstructorUsedError;
  MaterialSource? get source => throw _privateConstructorUsedError;

  /// Serializes this Material to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Material
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialCopyWith<Material> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialCopyWith<$Res> {
  factory $MaterialCopyWith(Material value, $Res Function(Material) then) =
      _$MaterialCopyWithImpl<$Res, Material>;
  @useResult
  $Res call(
      {String id,
      LocalizedText name,
      String jaPronunciation,
      String imageUrl,
      int rarity,
      String category,
      String? groupId,
      int? craftLevel,
      List<DayOfWeek>? availableDays,
      MaterialSource? source});

  $LocalizedTextCopyWith<$Res> get name;
  $MaterialSourceCopyWith<$Res>? get source;
}

/// @nodoc
class _$MaterialCopyWithImpl<$Res, $Val extends Material>
    implements $MaterialCopyWith<$Res> {
  _$MaterialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Material
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? jaPronunciation = null,
    Object? imageUrl = null,
    Object? rarity = null,
    Object? category = null,
    Object? groupId = freezed,
    Object? craftLevel = freezed,
    Object? availableDays = freezed,
    Object? source = freezed,
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      craftLevel: freezed == craftLevel
          ? _value.craftLevel
          : craftLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      availableDays: freezed == availableDays
          ? _value.availableDays
          : availableDays // ignore: cast_nullable_to_non_nullable
              as List<DayOfWeek>?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as MaterialSource?,
    ) as $Val);
  }

  /// Create a copy of Material
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedTextCopyWith<$Res> get name {
    return $LocalizedTextCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }

  /// Create a copy of Material
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialSourceCopyWith<$Res>? get source {
    if (_value.source == null) {
      return null;
    }

    return $MaterialSourceCopyWith<$Res>(_value.source!, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialImplCopyWith<$Res>
    implements $MaterialCopyWith<$Res> {
  factory _$$MaterialImplCopyWith(
          _$MaterialImpl value, $Res Function(_$MaterialImpl) then) =
      __$$MaterialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      LocalizedText name,
      String jaPronunciation,
      String imageUrl,
      int rarity,
      String category,
      String? groupId,
      int? craftLevel,
      List<DayOfWeek>? availableDays,
      MaterialSource? source});

  @override
  $LocalizedTextCopyWith<$Res> get name;
  @override
  $MaterialSourceCopyWith<$Res>? get source;
}

/// @nodoc
class __$$MaterialImplCopyWithImpl<$Res>
    extends _$MaterialCopyWithImpl<$Res, _$MaterialImpl>
    implements _$$MaterialImplCopyWith<$Res> {
  __$$MaterialImplCopyWithImpl(
      _$MaterialImpl _value, $Res Function(_$MaterialImpl) _then)
      : super(_value, _then);

  /// Create a copy of Material
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? jaPronunciation = null,
    Object? imageUrl = null,
    Object? rarity = null,
    Object? category = null,
    Object? groupId = freezed,
    Object? craftLevel = freezed,
    Object? availableDays = freezed,
    Object? source = freezed,
  }) {
    return _then(_$MaterialImpl(
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      craftLevel: freezed == craftLevel
          ? _value.craftLevel
          : craftLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      availableDays: freezed == availableDays
          ? _value._availableDays
          : availableDays // ignore: cast_nullable_to_non_nullable
              as List<DayOfWeek>?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as MaterialSource?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialImpl extends _Material {
  const _$MaterialImpl(
      {required this.id,
      required this.name,
      required this.jaPronunciation,
      required this.imageUrl,
      required this.rarity,
      required this.category,
      this.groupId,
      this.craftLevel,
      final List<DayOfWeek>? availableDays,
      this.source})
      : _availableDays = availableDays,
        super._();

  factory _$MaterialImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialImplFromJson(json);

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
  final String category;
  @override
  final String? groupId;
  @override
  final int? craftLevel;
  final List<DayOfWeek>? _availableDays;
  @override
  List<DayOfWeek>? get availableDays {
    final value = _availableDays;
    if (value == null) return null;
    if (_availableDays is EqualUnmodifiableListView) return _availableDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final MaterialSource? source;

  @override
  String toString() {
    return 'Material(id: $id, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, rarity: $rarity, category: $category, groupId: $groupId, craftLevel: $craftLevel, availableDays: $availableDays, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.jaPronunciation, jaPronunciation) ||
                other.jaPronunciation == jaPronunciation) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.craftLevel, craftLevel) ||
                other.craftLevel == craftLevel) &&
            const DeepCollectionEquality()
                .equals(other._availableDays, _availableDays) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      jaPronunciation,
      imageUrl,
      rarity,
      category,
      groupId,
      craftLevel,
      const DeepCollectionEquality().hash(_availableDays),
      source);

  /// Create a copy of Material
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialImplCopyWith<_$MaterialImpl> get copyWith =>
      __$$MaterialImplCopyWithImpl<_$MaterialImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialImplToJson(
      this,
    );
  }
}

abstract class _Material extends Material {
  const factory _Material(
      {required final String id,
      required final LocalizedText name,
      required final String jaPronunciation,
      required final String imageUrl,
      required final int rarity,
      required final String category,
      final String? groupId,
      final int? craftLevel,
      final List<DayOfWeek>? availableDays,
      final MaterialSource? source}) = _$MaterialImpl;
  const _Material._() : super._();

  factory _Material.fromJson(Map<String, dynamic> json) =
      _$MaterialImpl.fromJson;

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
  String get category;
  @override
  String? get groupId;
  @override
  int? get craftLevel;
  @override
  List<DayOfWeek>? get availableDays;
  @override
  MaterialSource? get source;

  /// Create a copy of Material
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialImplCopyWith<_$MaterialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MaterialSource _$MaterialSourceFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'teyvatMap':
      return TeyvatMapMaterialSource.fromJson(json);
    case 'domain':
      return DomainMaterialSource.fromJson(json);
    case 'weeklyBoss':
      return WeeklyBossMaterialSource.fromJson(json);
    case 'text':
      return TextMaterialSource.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'MaterialSource',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$MaterialSource {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String typeId) teyvatMap,
    required TResult Function(String domainId, String areaId) domain,
    required TResult Function(String bossId, String areaId) weeklyBoss,
    required TResult Function(String textId) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String typeId)? teyvatMap,
    TResult? Function(String domainId, String areaId)? domain,
    TResult? Function(String bossId, String areaId)? weeklyBoss,
    TResult? Function(String textId)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String typeId)? teyvatMap,
    TResult Function(String domainId, String areaId)? domain,
    TResult Function(String bossId, String areaId)? weeklyBoss,
    TResult Function(String textId)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TeyvatMapMaterialSource value) teyvatMap,
    required TResult Function(DomainMaterialSource value) domain,
    required TResult Function(WeeklyBossMaterialSource value) weeklyBoss,
    required TResult Function(TextMaterialSource value) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TeyvatMapMaterialSource value)? teyvatMap,
    TResult? Function(DomainMaterialSource value)? domain,
    TResult? Function(WeeklyBossMaterialSource value)? weeklyBoss,
    TResult? Function(TextMaterialSource value)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TeyvatMapMaterialSource value)? teyvatMap,
    TResult Function(DomainMaterialSource value)? domain,
    TResult Function(WeeklyBossMaterialSource value)? weeklyBoss,
    TResult Function(TextMaterialSource value)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this MaterialSource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialSourceCopyWith<$Res> {
  factory $MaterialSourceCopyWith(
          MaterialSource value, $Res Function(MaterialSource) then) =
      _$MaterialSourceCopyWithImpl<$Res, MaterialSource>;
}

/// @nodoc
class _$MaterialSourceCopyWithImpl<$Res, $Val extends MaterialSource>
    implements $MaterialSourceCopyWith<$Res> {
  _$MaterialSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialSource
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TeyvatMapMaterialSourceImplCopyWith<$Res> {
  factory _$$TeyvatMapMaterialSourceImplCopyWith(
          _$TeyvatMapMaterialSourceImpl value,
          $Res Function(_$TeyvatMapMaterialSourceImpl) then) =
      __$$TeyvatMapMaterialSourceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String typeId});
}

/// @nodoc
class __$$TeyvatMapMaterialSourceImplCopyWithImpl<$Res>
    extends _$MaterialSourceCopyWithImpl<$Res, _$TeyvatMapMaterialSourceImpl>
    implements _$$TeyvatMapMaterialSourceImplCopyWith<$Res> {
  __$$TeyvatMapMaterialSourceImplCopyWithImpl(
      _$TeyvatMapMaterialSourceImpl _value,
      $Res Function(_$TeyvatMapMaterialSourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialSource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeId = null,
  }) {
    return _then(_$TeyvatMapMaterialSourceImpl(
      typeId: null == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeyvatMapMaterialSourceImpl implements TeyvatMapMaterialSource {
  const _$TeyvatMapMaterialSourceImpl(
      {required this.typeId, final String? $type})
      : $type = $type ?? 'teyvatMap';

  factory _$TeyvatMapMaterialSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeyvatMapMaterialSourceImplFromJson(json);

  @override
  final String typeId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MaterialSource.teyvatMap(typeId: $typeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeyvatMapMaterialSourceImpl &&
            (identical(other.typeId, typeId) || other.typeId == typeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, typeId);

  /// Create a copy of MaterialSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeyvatMapMaterialSourceImplCopyWith<_$TeyvatMapMaterialSourceImpl>
      get copyWith => __$$TeyvatMapMaterialSourceImplCopyWithImpl<
          _$TeyvatMapMaterialSourceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String typeId) teyvatMap,
    required TResult Function(String domainId, String areaId) domain,
    required TResult Function(String bossId, String areaId) weeklyBoss,
    required TResult Function(String textId) text,
  }) {
    return teyvatMap(typeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String typeId)? teyvatMap,
    TResult? Function(String domainId, String areaId)? domain,
    TResult? Function(String bossId, String areaId)? weeklyBoss,
    TResult? Function(String textId)? text,
  }) {
    return teyvatMap?.call(typeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String typeId)? teyvatMap,
    TResult Function(String domainId, String areaId)? domain,
    TResult Function(String bossId, String areaId)? weeklyBoss,
    TResult Function(String textId)? text,
    required TResult orElse(),
  }) {
    if (teyvatMap != null) {
      return teyvatMap(typeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TeyvatMapMaterialSource value) teyvatMap,
    required TResult Function(DomainMaterialSource value) domain,
    required TResult Function(WeeklyBossMaterialSource value) weeklyBoss,
    required TResult Function(TextMaterialSource value) text,
  }) {
    return teyvatMap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TeyvatMapMaterialSource value)? teyvatMap,
    TResult? Function(DomainMaterialSource value)? domain,
    TResult? Function(WeeklyBossMaterialSource value)? weeklyBoss,
    TResult? Function(TextMaterialSource value)? text,
  }) {
    return teyvatMap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TeyvatMapMaterialSource value)? teyvatMap,
    TResult Function(DomainMaterialSource value)? domain,
    TResult Function(WeeklyBossMaterialSource value)? weeklyBoss,
    TResult Function(TextMaterialSource value)? text,
    required TResult orElse(),
  }) {
    if (teyvatMap != null) {
      return teyvatMap(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TeyvatMapMaterialSourceImplToJson(
      this,
    );
  }
}

abstract class TeyvatMapMaterialSource implements MaterialSource {
  const factory TeyvatMapMaterialSource({required final String typeId}) =
      _$TeyvatMapMaterialSourceImpl;

  factory TeyvatMapMaterialSource.fromJson(Map<String, dynamic> json) =
      _$TeyvatMapMaterialSourceImpl.fromJson;

  String get typeId;

  /// Create a copy of MaterialSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeyvatMapMaterialSourceImplCopyWith<_$TeyvatMapMaterialSourceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DomainMaterialSourceImplCopyWith<$Res> {
  factory _$$DomainMaterialSourceImplCopyWith(_$DomainMaterialSourceImpl value,
          $Res Function(_$DomainMaterialSourceImpl) then) =
      __$$DomainMaterialSourceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String domainId, String areaId});
}

/// @nodoc
class __$$DomainMaterialSourceImplCopyWithImpl<$Res>
    extends _$MaterialSourceCopyWithImpl<$Res, _$DomainMaterialSourceImpl>
    implements _$$DomainMaterialSourceImplCopyWith<$Res> {
  __$$DomainMaterialSourceImplCopyWithImpl(_$DomainMaterialSourceImpl _value,
      $Res Function(_$DomainMaterialSourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialSource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domainId = null,
    Object? areaId = null,
  }) {
    return _then(_$DomainMaterialSourceImpl(
      domainId: null == domainId
          ? _value.domainId
          : domainId // ignore: cast_nullable_to_non_nullable
              as String,
      areaId: null == areaId
          ? _value.areaId
          : areaId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DomainMaterialSourceImpl implements DomainMaterialSource {
  const _$DomainMaterialSourceImpl(
      {required this.domainId, required this.areaId, final String? $type})
      : $type = $type ?? 'domain';

  factory _$DomainMaterialSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DomainMaterialSourceImplFromJson(json);

  @override
  final String domainId;
  @override
  final String areaId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MaterialSource.domain(domainId: $domainId, areaId: $areaId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DomainMaterialSourceImpl &&
            (identical(other.domainId, domainId) ||
                other.domainId == domainId) &&
            (identical(other.areaId, areaId) || other.areaId == areaId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, domainId, areaId);

  /// Create a copy of MaterialSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DomainMaterialSourceImplCopyWith<_$DomainMaterialSourceImpl>
      get copyWith =>
          __$$DomainMaterialSourceImplCopyWithImpl<_$DomainMaterialSourceImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String typeId) teyvatMap,
    required TResult Function(String domainId, String areaId) domain,
    required TResult Function(String bossId, String areaId) weeklyBoss,
    required TResult Function(String textId) text,
  }) {
    return domain(domainId, areaId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String typeId)? teyvatMap,
    TResult? Function(String domainId, String areaId)? domain,
    TResult? Function(String bossId, String areaId)? weeklyBoss,
    TResult? Function(String textId)? text,
  }) {
    return domain?.call(domainId, areaId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String typeId)? teyvatMap,
    TResult Function(String domainId, String areaId)? domain,
    TResult Function(String bossId, String areaId)? weeklyBoss,
    TResult Function(String textId)? text,
    required TResult orElse(),
  }) {
    if (domain != null) {
      return domain(domainId, areaId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TeyvatMapMaterialSource value) teyvatMap,
    required TResult Function(DomainMaterialSource value) domain,
    required TResult Function(WeeklyBossMaterialSource value) weeklyBoss,
    required TResult Function(TextMaterialSource value) text,
  }) {
    return domain(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TeyvatMapMaterialSource value)? teyvatMap,
    TResult? Function(DomainMaterialSource value)? domain,
    TResult? Function(WeeklyBossMaterialSource value)? weeklyBoss,
    TResult? Function(TextMaterialSource value)? text,
  }) {
    return domain?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TeyvatMapMaterialSource value)? teyvatMap,
    TResult Function(DomainMaterialSource value)? domain,
    TResult Function(WeeklyBossMaterialSource value)? weeklyBoss,
    TResult Function(TextMaterialSource value)? text,
    required TResult orElse(),
  }) {
    if (domain != null) {
      return domain(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DomainMaterialSourceImplToJson(
      this,
    );
  }
}

abstract class DomainMaterialSource implements MaterialSource {
  const factory DomainMaterialSource(
      {required final String domainId,
      required final String areaId}) = _$DomainMaterialSourceImpl;

  factory DomainMaterialSource.fromJson(Map<String, dynamic> json) =
      _$DomainMaterialSourceImpl.fromJson;

  String get domainId;
  String get areaId;

  /// Create a copy of MaterialSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DomainMaterialSourceImplCopyWith<_$DomainMaterialSourceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WeeklyBossMaterialSourceImplCopyWith<$Res> {
  factory _$$WeeklyBossMaterialSourceImplCopyWith(
          _$WeeklyBossMaterialSourceImpl value,
          $Res Function(_$WeeklyBossMaterialSourceImpl) then) =
      __$$WeeklyBossMaterialSourceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String bossId, String areaId});
}

/// @nodoc
class __$$WeeklyBossMaterialSourceImplCopyWithImpl<$Res>
    extends _$MaterialSourceCopyWithImpl<$Res, _$WeeklyBossMaterialSourceImpl>
    implements _$$WeeklyBossMaterialSourceImplCopyWith<$Res> {
  __$$WeeklyBossMaterialSourceImplCopyWithImpl(
      _$WeeklyBossMaterialSourceImpl _value,
      $Res Function(_$WeeklyBossMaterialSourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialSource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bossId = null,
    Object? areaId = null,
  }) {
    return _then(_$WeeklyBossMaterialSourceImpl(
      bossId: null == bossId
          ? _value.bossId
          : bossId // ignore: cast_nullable_to_non_nullable
              as String,
      areaId: null == areaId
          ? _value.areaId
          : areaId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyBossMaterialSourceImpl implements WeeklyBossMaterialSource {
  const _$WeeklyBossMaterialSourceImpl(
      {required this.bossId, required this.areaId, final String? $type})
      : $type = $type ?? 'weeklyBoss';

  factory _$WeeklyBossMaterialSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyBossMaterialSourceImplFromJson(json);

  @override
  final String bossId;
  @override
  final String areaId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MaterialSource.weeklyBoss(bossId: $bossId, areaId: $areaId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyBossMaterialSourceImpl &&
            (identical(other.bossId, bossId) || other.bossId == bossId) &&
            (identical(other.areaId, areaId) || other.areaId == areaId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bossId, areaId);

  /// Create a copy of MaterialSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyBossMaterialSourceImplCopyWith<_$WeeklyBossMaterialSourceImpl>
      get copyWith => __$$WeeklyBossMaterialSourceImplCopyWithImpl<
          _$WeeklyBossMaterialSourceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String typeId) teyvatMap,
    required TResult Function(String domainId, String areaId) domain,
    required TResult Function(String bossId, String areaId) weeklyBoss,
    required TResult Function(String textId) text,
  }) {
    return weeklyBoss(bossId, areaId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String typeId)? teyvatMap,
    TResult? Function(String domainId, String areaId)? domain,
    TResult? Function(String bossId, String areaId)? weeklyBoss,
    TResult? Function(String textId)? text,
  }) {
    return weeklyBoss?.call(bossId, areaId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String typeId)? teyvatMap,
    TResult Function(String domainId, String areaId)? domain,
    TResult Function(String bossId, String areaId)? weeklyBoss,
    TResult Function(String textId)? text,
    required TResult orElse(),
  }) {
    if (weeklyBoss != null) {
      return weeklyBoss(bossId, areaId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TeyvatMapMaterialSource value) teyvatMap,
    required TResult Function(DomainMaterialSource value) domain,
    required TResult Function(WeeklyBossMaterialSource value) weeklyBoss,
    required TResult Function(TextMaterialSource value) text,
  }) {
    return weeklyBoss(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TeyvatMapMaterialSource value)? teyvatMap,
    TResult? Function(DomainMaterialSource value)? domain,
    TResult? Function(WeeklyBossMaterialSource value)? weeklyBoss,
    TResult? Function(TextMaterialSource value)? text,
  }) {
    return weeklyBoss?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TeyvatMapMaterialSource value)? teyvatMap,
    TResult Function(DomainMaterialSource value)? domain,
    TResult Function(WeeklyBossMaterialSource value)? weeklyBoss,
    TResult Function(TextMaterialSource value)? text,
    required TResult orElse(),
  }) {
    if (weeklyBoss != null) {
      return weeklyBoss(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyBossMaterialSourceImplToJson(
      this,
    );
  }
}

abstract class WeeklyBossMaterialSource implements MaterialSource {
  const factory WeeklyBossMaterialSource(
      {required final String bossId,
      required final String areaId}) = _$WeeklyBossMaterialSourceImpl;

  factory WeeklyBossMaterialSource.fromJson(Map<String, dynamic> json) =
      _$WeeklyBossMaterialSourceImpl.fromJson;

  String get bossId;
  String get areaId;

  /// Create a copy of MaterialSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyBossMaterialSourceImplCopyWith<_$WeeklyBossMaterialSourceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TextMaterialSourceImplCopyWith<$Res> {
  factory _$$TextMaterialSourceImplCopyWith(_$TextMaterialSourceImpl value,
          $Res Function(_$TextMaterialSourceImpl) then) =
      __$$TextMaterialSourceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String textId});
}

/// @nodoc
class __$$TextMaterialSourceImplCopyWithImpl<$Res>
    extends _$MaterialSourceCopyWithImpl<$Res, _$TextMaterialSourceImpl>
    implements _$$TextMaterialSourceImplCopyWith<$Res> {
  __$$TextMaterialSourceImplCopyWithImpl(_$TextMaterialSourceImpl _value,
      $Res Function(_$TextMaterialSourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialSource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textId = null,
  }) {
    return _then(_$TextMaterialSourceImpl(
      textId: null == textId
          ? _value.textId
          : textId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextMaterialSourceImpl implements TextMaterialSource {
  const _$TextMaterialSourceImpl({required this.textId, final String? $type})
      : $type = $type ?? 'text';

  factory _$TextMaterialSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextMaterialSourceImplFromJson(json);

  @override
  final String textId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MaterialSource.text(textId: $textId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextMaterialSourceImpl &&
            (identical(other.textId, textId) || other.textId == textId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, textId);

  /// Create a copy of MaterialSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextMaterialSourceImplCopyWith<_$TextMaterialSourceImpl> get copyWith =>
      __$$TextMaterialSourceImplCopyWithImpl<_$TextMaterialSourceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String typeId) teyvatMap,
    required TResult Function(String domainId, String areaId) domain,
    required TResult Function(String bossId, String areaId) weeklyBoss,
    required TResult Function(String textId) text,
  }) {
    return text(textId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String typeId)? teyvatMap,
    TResult? Function(String domainId, String areaId)? domain,
    TResult? Function(String bossId, String areaId)? weeklyBoss,
    TResult? Function(String textId)? text,
  }) {
    return text?.call(textId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String typeId)? teyvatMap,
    TResult Function(String domainId, String areaId)? domain,
    TResult Function(String bossId, String areaId)? weeklyBoss,
    TResult Function(String textId)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(textId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TeyvatMapMaterialSource value) teyvatMap,
    required TResult Function(DomainMaterialSource value) domain,
    required TResult Function(WeeklyBossMaterialSource value) weeklyBoss,
    required TResult Function(TextMaterialSource value) text,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TeyvatMapMaterialSource value)? teyvatMap,
    TResult? Function(DomainMaterialSource value)? domain,
    TResult? Function(WeeklyBossMaterialSource value)? weeklyBoss,
    TResult? Function(TextMaterialSource value)? text,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TeyvatMapMaterialSource value)? teyvatMap,
    TResult Function(DomainMaterialSource value)? domain,
    TResult Function(WeeklyBossMaterialSource value)? weeklyBoss,
    TResult Function(TextMaterialSource value)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TextMaterialSourceImplToJson(
      this,
    );
  }
}

abstract class TextMaterialSource implements MaterialSource {
  const factory TextMaterialSource({required final String textId}) =
      _$TextMaterialSourceImpl;

  factory TextMaterialSource.fromJson(Map<String, dynamic> json) =
      _$TextMaterialSourceImpl.fromJson;

  String get textId;

  /// Create a copy of MaterialSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextMaterialSourceImplCopyWith<_$TextMaterialSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MaterialsMeta _$MaterialsMetaFromJson(Map<String, dynamic> json) {
  return _MaterialsMeta.fromJson(json);
}

/// @nodoc
mixin _$MaterialsMeta {
  Map<String, LocalizedText> get categories =>
      throw _privateConstructorUsedError;
  Map<String, int> get sortOrder => throw _privateConstructorUsedError;
  DailyMaterials get daily => throw _privateConstructorUsedError;
  Map<String, List<String>> get specialCharactersUsingMaterials =>
      throw _privateConstructorUsedError;

  /// Serializes this MaterialsMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialsMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialsMetaCopyWith<MaterialsMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialsMetaCopyWith<$Res> {
  factory $MaterialsMetaCopyWith(
          MaterialsMeta value, $Res Function(MaterialsMeta) then) =
      _$MaterialsMetaCopyWithImpl<$Res, MaterialsMeta>;
  @useResult
  $Res call(
      {Map<String, LocalizedText> categories,
      Map<String, int> sortOrder,
      DailyMaterials daily,
      Map<String, List<String>> specialCharactersUsingMaterials});

  $DailyMaterialsCopyWith<$Res> get daily;
}

/// @nodoc
class _$MaterialsMetaCopyWithImpl<$Res, $Val extends MaterialsMeta>
    implements $MaterialsMetaCopyWith<$Res> {
  _$MaterialsMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialsMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? sortOrder = null,
    Object? daily = null,
    Object? specialCharactersUsingMaterials = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalizedText>,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      daily: null == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as DailyMaterials,
      specialCharactersUsingMaterials: null == specialCharactersUsingMaterials
          ? _value.specialCharactersUsingMaterials
          : specialCharactersUsingMaterials // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
    ) as $Val);
  }

  /// Create a copy of MaterialsMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyMaterialsCopyWith<$Res> get daily {
    return $DailyMaterialsCopyWith<$Res>(_value.daily, (value) {
      return _then(_value.copyWith(daily: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialsMetaImplCopyWith<$Res>
    implements $MaterialsMetaCopyWith<$Res> {
  factory _$$MaterialsMetaImplCopyWith(
          _$MaterialsMetaImpl value, $Res Function(_$MaterialsMetaImpl) then) =
      __$$MaterialsMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, LocalizedText> categories,
      Map<String, int> sortOrder,
      DailyMaterials daily,
      Map<String, List<String>> specialCharactersUsingMaterials});

  @override
  $DailyMaterialsCopyWith<$Res> get daily;
}

/// @nodoc
class __$$MaterialsMetaImplCopyWithImpl<$Res>
    extends _$MaterialsMetaCopyWithImpl<$Res, _$MaterialsMetaImpl>
    implements _$$MaterialsMetaImplCopyWith<$Res> {
  __$$MaterialsMetaImplCopyWithImpl(
      _$MaterialsMetaImpl _value, $Res Function(_$MaterialsMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialsMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? sortOrder = null,
    Object? daily = null,
    Object? specialCharactersUsingMaterials = null,
  }) {
    return _then(_$MaterialsMetaImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalizedText>,
      sortOrder: null == sortOrder
          ? _value._sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      daily: null == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as DailyMaterials,
      specialCharactersUsingMaterials: null == specialCharactersUsingMaterials
          ? _value._specialCharactersUsingMaterials
          : specialCharactersUsingMaterials // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialsMetaImpl implements _MaterialsMeta {
  const _$MaterialsMetaImpl(
      {required final Map<String, LocalizedText> categories,
      required final Map<String, int> sortOrder,
      required this.daily,
      required final Map<String, List<String>> specialCharactersUsingMaterials})
      : _categories = categories,
        _sortOrder = sortOrder,
        _specialCharactersUsingMaterials = specialCharactersUsingMaterials;

  factory _$MaterialsMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialsMetaImplFromJson(json);

  final Map<String, LocalizedText> _categories;
  @override
  Map<String, LocalizedText> get categories {
    if (_categories is EqualUnmodifiableMapView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categories);
  }

  final Map<String, int> _sortOrder;
  @override
  Map<String, int> get sortOrder {
    if (_sortOrder is EqualUnmodifiableMapView) return _sortOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_sortOrder);
  }

  @override
  final DailyMaterials daily;
  final Map<String, List<String>> _specialCharactersUsingMaterials;
  @override
  Map<String, List<String>> get specialCharactersUsingMaterials {
    if (_specialCharactersUsingMaterials is EqualUnmodifiableMapView)
      return _specialCharactersUsingMaterials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_specialCharactersUsingMaterials);
  }

  @override
  String toString() {
    return 'MaterialsMeta(categories: $categories, sortOrder: $sortOrder, daily: $daily, specialCharactersUsingMaterials: $specialCharactersUsingMaterials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialsMetaImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._sortOrder, _sortOrder) &&
            (identical(other.daily, daily) || other.daily == daily) &&
            const DeepCollectionEquality().equals(
                other._specialCharactersUsingMaterials,
                _specialCharactersUsingMaterials));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_sortOrder),
      daily,
      const DeepCollectionEquality().hash(_specialCharactersUsingMaterials));

  /// Create a copy of MaterialsMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialsMetaImplCopyWith<_$MaterialsMetaImpl> get copyWith =>
      __$$MaterialsMetaImplCopyWithImpl<_$MaterialsMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialsMetaImplToJson(
      this,
    );
  }
}

abstract class _MaterialsMeta implements MaterialsMeta {
  const factory _MaterialsMeta(
      {required final Map<String, LocalizedText> categories,
      required final Map<String, int> sortOrder,
      required final DailyMaterials daily,
      required final Map<String, List<String>>
          specialCharactersUsingMaterials}) = _$MaterialsMetaImpl;

  factory _MaterialsMeta.fromJson(Map<String, dynamic> json) =
      _$MaterialsMetaImpl.fromJson;

  @override
  Map<String, LocalizedText> get categories;
  @override
  Map<String, int> get sortOrder;
  @override
  DailyMaterials get daily;
  @override
  Map<String, List<String>> get specialCharactersUsingMaterials;

  /// Create a copy of MaterialsMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialsMetaImplCopyWith<_$MaterialsMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyMaterials _$DailyMaterialsFromJson(Map<String, dynamic> json) {
  return _DailyMaterials.fromJson(json);
}

/// @nodoc
mixin _$DailyMaterials {
  Map<String, List<DailyMaterial>> get talent =>
      throw _privateConstructorUsedError;
  Map<String, List<DailyMaterial>> get weapon =>
      throw _privateConstructorUsedError;

  /// Serializes this DailyMaterials to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyMaterials
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyMaterialsCopyWith<DailyMaterials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyMaterialsCopyWith<$Res> {
  factory $DailyMaterialsCopyWith(
          DailyMaterials value, $Res Function(DailyMaterials) then) =
      _$DailyMaterialsCopyWithImpl<$Res, DailyMaterials>;
  @useResult
  $Res call(
      {Map<String, List<DailyMaterial>> talent,
      Map<String, List<DailyMaterial>> weapon});
}

/// @nodoc
class _$DailyMaterialsCopyWithImpl<$Res, $Val extends DailyMaterials>
    implements $DailyMaterialsCopyWith<$Res> {
  _$DailyMaterialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyMaterials
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? talent = null,
    Object? weapon = null,
  }) {
    return _then(_value.copyWith(
      talent: null == talent
          ? _value.talent
          : talent // ignore: cast_nullable_to_non_nullable
              as Map<String, List<DailyMaterial>>,
      weapon: null == weapon
          ? _value.weapon
          : weapon // ignore: cast_nullable_to_non_nullable
              as Map<String, List<DailyMaterial>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyMaterialsImplCopyWith<$Res>
    implements $DailyMaterialsCopyWith<$Res> {
  factory _$$DailyMaterialsImplCopyWith(_$DailyMaterialsImpl value,
          $Res Function(_$DailyMaterialsImpl) then) =
      __$$DailyMaterialsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, List<DailyMaterial>> talent,
      Map<String, List<DailyMaterial>> weapon});
}

/// @nodoc
class __$$DailyMaterialsImplCopyWithImpl<$Res>
    extends _$DailyMaterialsCopyWithImpl<$Res, _$DailyMaterialsImpl>
    implements _$$DailyMaterialsImplCopyWith<$Res> {
  __$$DailyMaterialsImplCopyWithImpl(
      _$DailyMaterialsImpl _value, $Res Function(_$DailyMaterialsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyMaterials
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? talent = null,
    Object? weapon = null,
  }) {
    return _then(_$DailyMaterialsImpl(
      talent: null == talent
          ? _value._talent
          : talent // ignore: cast_nullable_to_non_nullable
              as Map<String, List<DailyMaterial>>,
      weapon: null == weapon
          ? _value._weapon
          : weapon // ignore: cast_nullable_to_non_nullable
              as Map<String, List<DailyMaterial>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyMaterialsImpl implements _DailyMaterials {
  const _$DailyMaterialsImpl(
      {required final Map<String, List<DailyMaterial>> talent,
      required final Map<String, List<DailyMaterial>> weapon})
      : _talent = talent,
        _weapon = weapon;

  factory _$DailyMaterialsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyMaterialsImplFromJson(json);

  final Map<String, List<DailyMaterial>> _talent;
  @override
  Map<String, List<DailyMaterial>> get talent {
    if (_talent is EqualUnmodifiableMapView) return _talent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_talent);
  }

  final Map<String, List<DailyMaterial>> _weapon;
  @override
  Map<String, List<DailyMaterial>> get weapon {
    if (_weapon is EqualUnmodifiableMapView) return _weapon;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_weapon);
  }

  @override
  String toString() {
    return 'DailyMaterials(talent: $talent, weapon: $weapon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyMaterialsImpl &&
            const DeepCollectionEquality().equals(other._talent, _talent) &&
            const DeepCollectionEquality().equals(other._weapon, _weapon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_talent),
      const DeepCollectionEquality().hash(_weapon));

  /// Create a copy of DailyMaterials
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyMaterialsImplCopyWith<_$DailyMaterialsImpl> get copyWith =>
      __$$DailyMaterialsImplCopyWithImpl<_$DailyMaterialsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyMaterialsImplToJson(
      this,
    );
  }
}

abstract class _DailyMaterials implements DailyMaterials {
  const factory _DailyMaterials(
          {required final Map<String, List<DailyMaterial>> talent,
          required final Map<String, List<DailyMaterial>> weapon}) =
      _$DailyMaterialsImpl;

  factory _DailyMaterials.fromJson(Map<String, dynamic> json) =
      _$DailyMaterialsImpl.fromJson;

  @override
  Map<String, List<DailyMaterial>> get talent;
  @override
  Map<String, List<DailyMaterial>> get weapon;

  /// Create a copy of DailyMaterials
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyMaterialsImplCopyWith<_$DailyMaterialsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyMaterial _$DailyMaterialFromJson(Map<String, dynamic> json) {
  return _DailyMaterial.fromJson(json);
}

/// @nodoc
mixin _$DailyMaterial {
  LocalizedText get description => throw _privateConstructorUsedError;
  List<String> get items => throw _privateConstructorUsedError;

  /// Serializes this DailyMaterial to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyMaterial
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyMaterialCopyWith<DailyMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyMaterialCopyWith<$Res> {
  factory $DailyMaterialCopyWith(
          DailyMaterial value, $Res Function(DailyMaterial) then) =
      _$DailyMaterialCopyWithImpl<$Res, DailyMaterial>;
  @useResult
  $Res call({LocalizedText description, List<String> items});

  $LocalizedTextCopyWith<$Res> get description;
}

/// @nodoc
class _$DailyMaterialCopyWithImpl<$Res, $Val extends DailyMaterial>
    implements $DailyMaterialCopyWith<$Res> {
  _$DailyMaterialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyMaterial
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of DailyMaterial
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedTextCopyWith<$Res> get description {
    return $LocalizedTextCopyWith<$Res>(_value.description, (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DailyMaterialImplCopyWith<$Res>
    implements $DailyMaterialCopyWith<$Res> {
  factory _$$DailyMaterialImplCopyWith(
          _$DailyMaterialImpl value, $Res Function(_$DailyMaterialImpl) then) =
      __$$DailyMaterialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LocalizedText description, List<String> items});

  @override
  $LocalizedTextCopyWith<$Res> get description;
}

/// @nodoc
class __$$DailyMaterialImplCopyWithImpl<$Res>
    extends _$DailyMaterialCopyWithImpl<$Res, _$DailyMaterialImpl>
    implements _$$DailyMaterialImplCopyWith<$Res> {
  __$$DailyMaterialImplCopyWithImpl(
      _$DailyMaterialImpl _value, $Res Function(_$DailyMaterialImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyMaterial
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? items = null,
  }) {
    return _then(_$DailyMaterialImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyMaterialImpl implements _DailyMaterial {
  const _$DailyMaterialImpl(
      {required this.description, required final List<String> items})
      : _items = items;

  factory _$DailyMaterialImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyMaterialImplFromJson(json);

  @override
  final LocalizedText description;
  final List<String> _items;
  @override
  List<String> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'DailyMaterial(description: $description, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyMaterialImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, description, const DeepCollectionEquality().hash(_items));

  /// Create a copy of DailyMaterial
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyMaterialImplCopyWith<_$DailyMaterialImpl> get copyWith =>
      __$$DailyMaterialImplCopyWithImpl<_$DailyMaterialImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyMaterialImplToJson(
      this,
    );
  }
}

abstract class _DailyMaterial implements DailyMaterial {
  const factory _DailyMaterial(
      {required final LocalizedText description,
      required final List<String> items}) = _$DailyMaterialImpl;

  factory _DailyMaterial.fromJson(Map<String, dynamic> json) =
      _$DailyMaterialImpl.fromJson;

  @override
  LocalizedText get description;
  @override
  List<String> get items;

  /// Create a copy of DailyMaterial
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyMaterialImplCopyWith<_$DailyMaterialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
