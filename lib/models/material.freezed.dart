// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Material {
  String get id;
  int get hyvId;
  LocalizedText get name;
  String get jaPronunciation;
  String get imageUrl;
  int get rarity;
  String get category;
  String? get groupId;
  int? get craftLevel;
  List<DayOfWeek>? get availableDays;
  ItemSource? get source;

  /// Serializes this Material to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Material &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hyvId, hyvId) || other.hyvId == hyvId) &&
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
                .equals(other.availableDays, availableDays) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      hyvId,
      name,
      jaPronunciation,
      imageUrl,
      rarity,
      category,
      groupId,
      craftLevel,
      const DeepCollectionEquality().hash(availableDays),
      source);

  @override
  String toString() {
    return 'Material(id: $id, hyvId: $hyvId, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, rarity: $rarity, category: $category, groupId: $groupId, craftLevel: $craftLevel, availableDays: $availableDays, source: $source)';
  }
}

/// @nodoc
@JsonSerializable()
class _Material extends Material {
  const _Material(
      {required this.id,
      required this.hyvId,
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
  factory _Material.fromJson(Map<String, dynamic> json) =>
      _$MaterialFromJson(json);

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
  Map<String, dynamic> toJson() {
    return _$MaterialToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Material &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hyvId, hyvId) || other.hyvId == hyvId) &&
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
      hyvId,
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
  String toString() {
    return 'Material(id: $id, hyvId: $hyvId, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, rarity: $rarity, category: $category, groupId: $groupId, craftLevel: $craftLevel, availableDays: $availableDays, source: $source)';
  }
}

ItemSource _$ItemSourceFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'teyvatMap':
      return TeyvatMapItemSource.fromJson(json);
    case 'text':
      return TextItemSource.fromJson(json);
    case 'sourceList':
      return SourceListItemSource.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ItemSource',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ItemSource {
  /// Serializes this ItemSource to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ItemSource);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ItemSource()';
  }
}

/// @nodoc
@JsonSerializable()
class TeyvatMapItemSource implements ItemSource {
  const TeyvatMapItemSource(
      {required this.typeId, this.center, final String? $type})
      : $type = $type ?? 'teyvatMap';
  factory TeyvatMapItemSource.fromJson(Map<String, dynamic> json) =>
      _$TeyvatMapItemSourceFromJson(json);

  final String typeId;
  final String? center;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$TeyvatMapItemSourceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TeyvatMapItemSource &&
            (identical(other.typeId, typeId) || other.typeId == typeId) &&
            (identical(other.center, center) || other.center == center));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, typeId, center);

  @override
  String toString() {
    return 'ItemSource.teyvatMap(typeId: $typeId, center: $center)';
  }
}

/// @nodoc
@JsonSerializable()
class TextItemSource implements ItemSource {
  const TextItemSource({required this.text, final String? $type})
      : $type = $type ?? 'text';
  factory TextItemSource.fromJson(Map<String, dynamic> json) =>
      _$TextItemSourceFromJson(json);

  final LocalizedText text;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$TextItemSourceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TextItemSource &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  @override
  String toString() {
    return 'ItemSource.text(text: $text)';
  }
}

/// @nodoc
@JsonSerializable()
class SourceListItemSource implements ItemSource {
  const SourceListItemSource(
      {required final List<LocalizedText> list, final String? $type})
      : _list = list,
        $type = $type ?? 'sourceList';
  factory SourceListItemSource.fromJson(Map<String, dynamic> json) =>
      _$SourceListItemSourceFromJson(json);

  final List<LocalizedText> _list;
  List<LocalizedText> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$SourceListItemSourceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SourceListItemSource &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @override
  String toString() {
    return 'ItemSource.sourceList(list: $list)';
  }
}

/// @nodoc
mixin _$MaterialsMeta {
  Map<MaterialCategoryType, LocalizedText> get categories;
  Map<String, int> get sortOrder;
  DailyMaterials get daily;
  Map<MaterialId, List<CharacterId>> get specialCharactersUsingMaterials;

  /// Serializes this MaterialsMeta to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MaterialsMeta &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality().equals(other.sortOrder, sortOrder) &&
            (identical(other.daily, daily) || other.daily == daily) &&
            const DeepCollectionEquality().equals(
                other.specialCharactersUsingMaterials,
                specialCharactersUsingMaterials));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(sortOrder),
      daily,
      const DeepCollectionEquality().hash(specialCharactersUsingMaterials));

  @override
  String toString() {
    return 'MaterialsMeta(categories: $categories, sortOrder: $sortOrder, daily: $daily, specialCharactersUsingMaterials: $specialCharactersUsingMaterials)';
  }
}

/// @nodoc
@JsonSerializable()
class _MaterialsMeta implements MaterialsMeta {
  const _MaterialsMeta(
      {required final Map<MaterialCategoryType, LocalizedText> categories,
      required final Map<String, int> sortOrder,
      required this.daily,
      required final Map<MaterialId, List<CharacterId>>
          specialCharactersUsingMaterials})
      : _categories = categories,
        _sortOrder = sortOrder,
        _specialCharactersUsingMaterials = specialCharactersUsingMaterials;
  factory _MaterialsMeta.fromJson(Map<String, dynamic> json) =>
      _$MaterialsMetaFromJson(json);

  final Map<MaterialCategoryType, LocalizedText> _categories;
  @override
  Map<MaterialCategoryType, LocalizedText> get categories {
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
  final Map<MaterialId, List<CharacterId>> _specialCharactersUsingMaterials;
  @override
  Map<MaterialId, List<CharacterId>> get specialCharactersUsingMaterials {
    if (_specialCharactersUsingMaterials is EqualUnmodifiableMapView)
      return _specialCharactersUsingMaterials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_specialCharactersUsingMaterials);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$MaterialsMetaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MaterialsMeta &&
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
  String toString() {
    return 'MaterialsMeta(categories: $categories, sortOrder: $sortOrder, daily: $daily, specialCharactersUsingMaterials: $specialCharactersUsingMaterials)';
  }
}

/// @nodoc
mixin _$DailyMaterials {
  Map<String, List<DailyMaterial>> get talent;
  Map<String, List<DailyMaterial>> get weapon;

  /// Serializes this DailyMaterials to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailyMaterials &&
            const DeepCollectionEquality().equals(other.talent, talent) &&
            const DeepCollectionEquality().equals(other.weapon, weapon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(talent),
      const DeepCollectionEquality().hash(weapon));

  @override
  String toString() {
    return 'DailyMaterials(talent: $talent, weapon: $weapon)';
  }
}

/// @nodoc
@JsonSerializable()
class _DailyMaterials implements DailyMaterials {
  const _DailyMaterials(
      {required final Map<String, List<DailyMaterial>> talent,
      required final Map<String, List<DailyMaterial>> weapon})
      : _talent = talent,
        _weapon = weapon;
  factory _DailyMaterials.fromJson(Map<String, dynamic> json) =>
      _$DailyMaterialsFromJson(json);

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
  Map<String, dynamic> toJson() {
    return _$DailyMaterialsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailyMaterials &&
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
  String toString() {
    return 'DailyMaterials(talent: $talent, weapon: $weapon)';
  }
}

/// @nodoc
mixin _$DailyMaterial {
  LocalizedText get description;
  List<String> get items;

  /// Serializes this DailyMaterial to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailyMaterial &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, description, const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'DailyMaterial(description: $description, items: $items)';
  }
}

/// @nodoc
@JsonSerializable()
class _DailyMaterial implements DailyMaterial {
  const _DailyMaterial(
      {required this.description, required final List<String> items})
      : _items = items;
  factory _DailyMaterial.fromJson(Map<String, dynamic> json) =>
      _$DailyMaterialFromJson(json);

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
  Map<String, dynamic> toJson() {
    return _$DailyMaterialToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailyMaterial &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, description, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'DailyMaterial(description: $description, items: $items)';
  }
}

// dart format on
