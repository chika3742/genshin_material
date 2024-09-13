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
  /// Serializes this ItemSource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
}
