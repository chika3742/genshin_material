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
  ItemSource? get source => throw _privateConstructorUsedError;

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
      ItemSource? source});

  $LocalizedTextCopyWith<$Res> get name;
  $ItemSourceCopyWith<$Res>? get source;
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
              as ItemSource?,
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
  $ItemSourceCopyWith<$Res>? get source {
    if (_value.source == null) {
      return null;
    }

    return $ItemSourceCopyWith<$Res>(_value.source!, (value) {
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
      ItemSource? source});

  @override
  $LocalizedTextCopyWith<$Res> get name;
  @override
  $ItemSourceCopyWith<$Res>? get source;
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
              as ItemSource?,
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
  final ItemSource? source;

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
      final ItemSource? source}) = _$MaterialImpl;
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
  ItemSource? get source;

  /// Create a copy of Material
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialImplCopyWith<_$MaterialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemSource _$ItemSourceFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'teyvatMap':
      return TeyvatMapItemSource.fromJson(json);
    case 'text':
      return TextItemSource.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ItemSource',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ItemSource {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String typeId, String? center) teyvatMap,
    required TResult Function(LocalizedText text) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String typeId, String? center)? teyvatMap,
    TResult? Function(LocalizedText text)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String typeId, String? center)? teyvatMap,
    TResult Function(LocalizedText text)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TeyvatMapItemSource value) teyvatMap,
    required TResult Function(TextItemSource value) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TeyvatMapItemSource value)? teyvatMap,
    TResult? Function(TextItemSource value)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TeyvatMapItemSource value)? teyvatMap,
    TResult Function(TextItemSource value)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ItemSource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemSourceCopyWith<$Res> {
  factory $ItemSourceCopyWith(
          ItemSource value, $Res Function(ItemSource) then) =
      _$ItemSourceCopyWithImpl<$Res, ItemSource>;
}

/// @nodoc
class _$ItemSourceCopyWithImpl<$Res, $Val extends ItemSource>
    implements $ItemSourceCopyWith<$Res> {
  _$ItemSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemSource
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TeyvatMapItemSourceImplCopyWith<$Res> {
  factory _$$TeyvatMapItemSourceImplCopyWith(_$TeyvatMapItemSourceImpl value,
          $Res Function(_$TeyvatMapItemSourceImpl) then) =
      __$$TeyvatMapItemSourceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String typeId, String? center});
}

/// @nodoc
class __$$TeyvatMapItemSourceImplCopyWithImpl<$Res>
    extends _$ItemSourceCopyWithImpl<$Res, _$TeyvatMapItemSourceImpl>
    implements _$$TeyvatMapItemSourceImplCopyWith<$Res> {
  __$$TeyvatMapItemSourceImplCopyWithImpl(_$TeyvatMapItemSourceImpl _value,
      $Res Function(_$TeyvatMapItemSourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemSource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeId = null,
    Object? center = freezed,
  }) {
    return _then(_$TeyvatMapItemSourceImpl(
      typeId: null == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as String,
      center: freezed == center
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeyvatMapItemSourceImpl implements TeyvatMapItemSource {
  const _$TeyvatMapItemSourceImpl(
      {required this.typeId, this.center, final String? $type})
      : $type = $type ?? 'teyvatMap';

  factory _$TeyvatMapItemSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeyvatMapItemSourceImplFromJson(json);

  @override
  final String typeId;
  @override
  final String? center;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ItemSource.teyvatMap(typeId: $typeId, center: $center)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeyvatMapItemSourceImpl &&
            (identical(other.typeId, typeId) || other.typeId == typeId) &&
            (identical(other.center, center) || other.center == center));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, typeId, center);

  /// Create a copy of ItemSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeyvatMapItemSourceImplCopyWith<_$TeyvatMapItemSourceImpl> get copyWith =>
      __$$TeyvatMapItemSourceImplCopyWithImpl<_$TeyvatMapItemSourceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String typeId, String? center) teyvatMap,
    required TResult Function(LocalizedText text) text,
  }) {
    return teyvatMap(typeId, center);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String typeId, String? center)? teyvatMap,
    TResult? Function(LocalizedText text)? text,
  }) {
    return teyvatMap?.call(typeId, center);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String typeId, String? center)? teyvatMap,
    TResult Function(LocalizedText text)? text,
    required TResult orElse(),
  }) {
    if (teyvatMap != null) {
      return teyvatMap(typeId, center);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TeyvatMapItemSource value) teyvatMap,
    required TResult Function(TextItemSource value) text,
  }) {
    return teyvatMap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TeyvatMapItemSource value)? teyvatMap,
    TResult? Function(TextItemSource value)? text,
  }) {
    return teyvatMap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TeyvatMapItemSource value)? teyvatMap,
    TResult Function(TextItemSource value)? text,
    required TResult orElse(),
  }) {
    if (teyvatMap != null) {
      return teyvatMap(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TeyvatMapItemSourceImplToJson(
      this,
    );
  }
}

abstract class TeyvatMapItemSource implements ItemSource {
  const factory TeyvatMapItemSource(
      {required final String typeId,
      final String? center}) = _$TeyvatMapItemSourceImpl;

  factory TeyvatMapItemSource.fromJson(Map<String, dynamic> json) =
      _$TeyvatMapItemSourceImpl.fromJson;

  String get typeId;
  String? get center;

  /// Create a copy of ItemSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeyvatMapItemSourceImplCopyWith<_$TeyvatMapItemSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TextItemSourceImplCopyWith<$Res> {
  factory _$$TextItemSourceImplCopyWith(_$TextItemSourceImpl value,
          $Res Function(_$TextItemSourceImpl) then) =
      __$$TextItemSourceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LocalizedText text});

  $LocalizedTextCopyWith<$Res> get text;
}

/// @nodoc
class __$$TextItemSourceImplCopyWithImpl<$Res>
    extends _$ItemSourceCopyWithImpl<$Res, _$TextItemSourceImpl>
    implements _$$TextItemSourceImplCopyWith<$Res> {
  __$$TextItemSourceImplCopyWithImpl(
      _$TextItemSourceImpl _value, $Res Function(_$TextItemSourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemSource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$TextItemSourceImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ));
  }

  /// Create a copy of ItemSource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedTextCopyWith<$Res> get text {
    return $LocalizedTextCopyWith<$Res>(_value.text, (value) {
      return _then(_value.copyWith(text: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$TextItemSourceImpl implements TextItemSource {
  const _$TextItemSourceImpl({required this.text, final String? $type})
      : $type = $type ?? 'text';

  factory _$TextItemSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextItemSourceImplFromJson(json);

  @override
  final LocalizedText text;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ItemSource.text(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextItemSourceImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of ItemSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextItemSourceImplCopyWith<_$TextItemSourceImpl> get copyWith =>
      __$$TextItemSourceImplCopyWithImpl<_$TextItemSourceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String typeId, String? center) teyvatMap,
    required TResult Function(LocalizedText text) text,
  }) {
    return text(this.text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String typeId, String? center)? teyvatMap,
    TResult? Function(LocalizedText text)? text,
  }) {
    return text?.call(this.text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String typeId, String? center)? teyvatMap,
    TResult Function(LocalizedText text)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this.text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TeyvatMapItemSource value) teyvatMap,
    required TResult Function(TextItemSource value) text,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TeyvatMapItemSource value)? teyvatMap,
    TResult? Function(TextItemSource value)? text,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TeyvatMapItemSource value)? teyvatMap,
    TResult Function(TextItemSource value)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TextItemSourceImplToJson(
      this,
    );
  }
}

abstract class TextItemSource implements ItemSource {
  const factory TextItemSource({required final LocalizedText text}) =
      _$TextItemSourceImpl;

  factory TextItemSource.fromJson(Map<String, dynamic> json) =
      _$TextItemSourceImpl.fromJson;

  LocalizedText get text;

  /// Create a copy of ItemSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextItemSourceImplCopyWith<_$TextItemSourceImpl> get copyWith =>
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
