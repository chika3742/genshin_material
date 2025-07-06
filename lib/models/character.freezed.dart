// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
Character _$CharacterFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'group':
      return CharacterGroup.fromJson(json);
    case 'variant':
      return CharacterVariant.fromJson(json);

    default:
      return ListedCharacter.fromJson(json);
  }
}

/// @nodoc
mixin _$Character {
  String get id;
  LocalizedText get name;
  String get jaPronunciation;
  String get smallImageUrl;
  WeaponType get weaponType;
  MaterialDefinitions get materials;

  /// Serializes this Character to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Character &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.jaPronunciation, jaPronunciation) ||
                other.jaPronunciation == jaPronunciation) &&
            (identical(other.smallImageUrl, smallImageUrl) ||
                other.smallImageUrl == smallImageUrl) &&
            (identical(other.weaponType, weaponType) ||
                other.weaponType == weaponType) &&
            const DeepCollectionEquality().equals(other.materials, materials));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      jaPronunciation,
      smallImageUrl,
      weaponType,
      const DeepCollectionEquality().hash(materials));

  @override
  String toString() {
    return 'Character(id: $id, name: $name, jaPronunciation: $jaPronunciation, smallImageUrl: $smallImageUrl, weaponType: $weaponType, materials: $materials)';
  }
}

/// @nodoc
@JsonSerializable()
class ListedCharacter extends Character
    with CharacterWithLargeImage, CharacterOrVariant {
  const ListedCharacter(
      {required this.id,
      required final List<int> hyvIds,
      required this.name,
      required this.jaPronunciation,
      required this.imageUrl,
      required this.smallImageUrl,
      required this.rarity,
      required this.weaponType,
      required this.element,
      required final Talents talents,
      required final MaterialDefinitions materials,
      final String? $type})
      : _hyvIds = hyvIds,
        _talents = talents,
        _materials = materials,
        $type = $type ?? 'default',
        super._();
  factory ListedCharacter.fromJson(Map<String, dynamic> json) =>
      _$ListedCharacterFromJson(json);

  @override
  final String id;
  final List<int> _hyvIds;
  List<int> get hyvIds {
    if (_hyvIds is EqualUnmodifiableListView) return _hyvIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hyvIds);
  }

  @override
  final LocalizedText name;
  @override
  final String jaPronunciation;
  final String imageUrl;
  @override
  final String smallImageUrl;
  final int rarity;
  @override
  final WeaponType weaponType;
  final TeyvatElement element;
  final Talents _talents;
  Talents get talents {
    if (_talents is EqualUnmodifiableMapView) return _talents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_talents);
  }

  final MaterialDefinitions _materials;
  @override
  MaterialDefinitions get materials {
    if (_materials is EqualUnmodifiableMapView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materials);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$ListedCharacterToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListedCharacter &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._hyvIds, _hyvIds) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.jaPronunciation, jaPronunciation) ||
                other.jaPronunciation == jaPronunciation) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.smallImageUrl, smallImageUrl) ||
                other.smallImageUrl == smallImageUrl) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.weaponType, weaponType) ||
                other.weaponType == weaponType) &&
            (identical(other.element, element) || other.element == element) &&
            const DeepCollectionEquality().equals(other._talents, _talents) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_hyvIds),
      name,
      jaPronunciation,
      imageUrl,
      smallImageUrl,
      rarity,
      weaponType,
      element,
      const DeepCollectionEquality().hash(_talents),
      const DeepCollectionEquality().hash(_materials));

  @override
  String toString() {
    return 'Character(id: $id, hyvIds: $hyvIds, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, smallImageUrl: $smallImageUrl, rarity: $rarity, weaponType: $weaponType, element: $element, talents: $talents, materials: $materials)';
  }
}

/// @nodoc
@JsonSerializable()
class CharacterGroup extends Character with CharacterWithLargeImage {
  const CharacterGroup(
      {required this.id,
      required final List<int> hyvIds,
      required this.name,
      required this.jaPronunciation,
      required this.imageUrl,
      required this.smallImageUrl,
      required this.rarity,
      required this.weaponType,
      required final List<String> variantIds,
      required final MaterialDefinitions materials,
      final String? $type})
      : _hyvIds = hyvIds,
        _variantIds = variantIds,
        _materials = materials,
        $type = $type ?? 'group',
        super._();
  factory CharacterGroup.fromJson(Map<String, dynamic> json) =>
      _$CharacterGroupFromJson(json);

  @override
  final String id;
  final List<int> _hyvIds;
  List<int> get hyvIds {
    if (_hyvIds is EqualUnmodifiableListView) return _hyvIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hyvIds);
  }

  @override
  final LocalizedText name;
  @override
  final String jaPronunciation;
  final String imageUrl;
  @override
  final String smallImageUrl;
  final int rarity;
  @override
  final WeaponType weaponType;
  final List<String> _variantIds;
  List<String> get variantIds {
    if (_variantIds is EqualUnmodifiableListView) return _variantIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variantIds);
  }

  final MaterialDefinitions _materials;
  @override
  MaterialDefinitions get materials {
    if (_materials is EqualUnmodifiableMapView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materials);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$CharacterGroupToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CharacterGroup &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._hyvIds, _hyvIds) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.jaPronunciation, jaPronunciation) ||
                other.jaPronunciation == jaPronunciation) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.smallImageUrl, smallImageUrl) ||
                other.smallImageUrl == smallImageUrl) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.weaponType, weaponType) ||
                other.weaponType == weaponType) &&
            const DeepCollectionEquality()
                .equals(other._variantIds, _variantIds) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_hyvIds),
      name,
      jaPronunciation,
      imageUrl,
      smallImageUrl,
      rarity,
      weaponType,
      const DeepCollectionEquality().hash(_variantIds),
      const DeepCollectionEquality().hash(_materials));

  @override
  String toString() {
    return 'Character.group(id: $id, hyvIds: $hyvIds, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, smallImageUrl: $smallImageUrl, rarity: $rarity, weaponType: $weaponType, variantIds: $variantIds, materials: $materials)';
  }
}

/// @nodoc
@JsonSerializable()
class CharacterVariant extends Character with CharacterOrVariant {
  const CharacterVariant(
      {required this.id,
      required this.parentId,
      required this.name,
      required this.jaPronunciation,
      required this.smallImageUrl,
      required this.element,
      required this.weaponType,
      required final Talents talents,
      required final MaterialDefinitions materials,
      final String? $type})
      : _talents = talents,
        _materials = materials,
        $type = $type ?? 'variant',
        super._();
  factory CharacterVariant.fromJson(Map<String, dynamic> json) =>
      _$CharacterVariantFromJson(json);

  @override
  final String id;
  final String parentId;
  @override
  final LocalizedText name;
  @override
  final String jaPronunciation;
  @override
  final String smallImageUrl;
  final TeyvatElement element;
  @override
  final WeaponType weaponType;
  final Talents _talents;
  Talents get talents {
    if (_talents is EqualUnmodifiableMapView) return _talents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_talents);
  }

  final MaterialDefinitions _materials;
  @override
  MaterialDefinitions get materials {
    if (_materials is EqualUnmodifiableMapView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materials);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$CharacterVariantToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CharacterVariant &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.jaPronunciation, jaPronunciation) ||
                other.jaPronunciation == jaPronunciation) &&
            (identical(other.smallImageUrl, smallImageUrl) ||
                other.smallImageUrl == smallImageUrl) &&
            (identical(other.element, element) || other.element == element) &&
            (identical(other.weaponType, weaponType) ||
                other.weaponType == weaponType) &&
            const DeepCollectionEquality().equals(other._talents, _talents) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      parentId,
      name,
      jaPronunciation,
      smallImageUrl,
      element,
      weaponType,
      const DeepCollectionEquality().hash(_talents),
      const DeepCollectionEquality().hash(_materials));

  @override
  String toString() {
    return 'Character.variant(id: $id, parentId: $parentId, name: $name, jaPronunciation: $jaPronunciation, smallImageUrl: $smallImageUrl, element: $element, weaponType: $weaponType, talents: $talents, materials: $materials)';
  }
}

/// @nodoc
mixin _$CharacterTalent {
  List<int> get idList;
  LocalizedText get name;

  /// Serializes this CharacterTalent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CharacterTalent &&
            const DeepCollectionEquality().equals(other.idList, idList) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(idList), name);

  @override
  String toString() {
    return 'CharacterTalent(idList: $idList, name: $name)';
  }
}

/// @nodoc
@JsonSerializable()
class _CharacterTalent implements CharacterTalent {
  const _CharacterTalent({required final List<int> idList, required this.name})
      : _idList = idList;
  factory _CharacterTalent.fromJson(Map<String, dynamic> json) =>
      _$CharacterTalentFromJson(json);

  final List<int> _idList;
  @override
  List<int> get idList {
    if (_idList is EqualUnmodifiableListView) return _idList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_idList);
  }

  @override
  final LocalizedText name;

  @override
  Map<String, dynamic> toJson() {
    return _$CharacterTalentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CharacterTalent &&
            const DeepCollectionEquality().equals(other._idList, _idList) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_idList), name);

  @override
  String toString() {
    return 'CharacterTalent(idList: $idList, name: $name)';
  }
}

// dart format on
