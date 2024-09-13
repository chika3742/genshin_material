// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  String get id => throw _privateConstructorUsedError;
  LocalizedText get name => throw _privateConstructorUsedError;
  String get jaPronunciation => throw _privateConstructorUsedError;
  String get smallImageUrl => throw _privateConstructorUsedError;
  String get weaponType => throw _privateConstructorUsedError;
  Map<String, String> get materials => throw _privateConstructorUsedError;

  /// Serializes this Character to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$ListedCharacterImpl extends ListedCharacter
    with CharacterWithLargeImage, CharacterOrVariant {
  const _$ListedCharacterImpl(
      {required this.id,
      required final List<int> hyvIds,
      required this.name,
      required this.jaPronunciation,
      required this.imageUrl,
      required this.smallImageUrl,
      required this.rarity,
      required this.weaponType,
      required this.element,
      required final Map<String, CharacterTalent> talents,
      required final Map<String, String> materials,
      final String? $type})
      : _hyvIds = hyvIds,
        _talents = talents,
        _materials = materials,
        $type = $type ?? 'default',
        super._();

  factory _$ListedCharacterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListedCharacterImplFromJson(json);

  @override
  final String id;
  final List<int> _hyvIds;
  @override
  List<int> get hyvIds {
    if (_hyvIds is EqualUnmodifiableListView) return _hyvIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hyvIds);
  }

  @override
  final LocalizedText name;
  @override
  final String jaPronunciation;
  @override
  final String imageUrl;
  @override
  final String smallImageUrl;
  @override
  final int rarity;
  @override
  final String weaponType;
  @override
  final String element;
  final Map<String, CharacterTalent> _talents;
  @override
  Map<String, CharacterTalent> get talents {
    if (_talents is EqualUnmodifiableMapView) return _talents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_talents);
  }

  final Map<String, String> _materials;
  @override
  Map<String, String> get materials {
    if (_materials is EqualUnmodifiableMapView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materials);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Character(id: $id, hyvIds: $hyvIds, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, smallImageUrl: $smallImageUrl, rarity: $rarity, weaponType: $weaponType, element: $element, talents: $talents, materials: $materials)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ListedCharacterImplToJson(
      this,
    );
  }
}

abstract class ListedCharacter extends Character
    implements CharacterWithLargeImage, CharacterOrVariant {
  const factory ListedCharacter(
      {required final String id,
      required final List<int> hyvIds,
      required final LocalizedText name,
      required final String jaPronunciation,
      required final String imageUrl,
      required final String smallImageUrl,
      required final int rarity,
      required final String weaponType,
      required final String element,
      required final Map<String, CharacterTalent> talents,
      required final Map<String, String> materials}) = _$ListedCharacterImpl;
  const ListedCharacter._() : super._();

  factory ListedCharacter.fromJson(Map<String, dynamic> json) =
      _$ListedCharacterImpl.fromJson;

  @override
  String get id;
  List<int> get hyvIds;
  @override
  LocalizedText get name;
  @override
  String get jaPronunciation;
  String get imageUrl;
  @override
  String get smallImageUrl;
  int get rarity;
  @override
  String get weaponType;
  String get element;
  Map<String, CharacterTalent> get talents;
  @override
  Map<String, String> get materials;
}

/// @nodoc
@JsonSerializable()
class _$CharacterGroupImpl extends CharacterGroup with CharacterWithLargeImage {
  const _$CharacterGroupImpl(
      {required this.id,
      required final List<int> hyvIds,
      required this.name,
      required this.jaPronunciation,
      required this.imageUrl,
      required this.smallImageUrl,
      required this.rarity,
      required this.weaponType,
      required final List<String> variantIds,
      required final Map<String, String> materials,
      final String? $type})
      : _hyvIds = hyvIds,
        _variantIds = variantIds,
        _materials = materials,
        $type = $type ?? 'group',
        super._();

  factory _$CharacterGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterGroupImplFromJson(json);

  @override
  final String id;
  final List<int> _hyvIds;
  @override
  List<int> get hyvIds {
    if (_hyvIds is EqualUnmodifiableListView) return _hyvIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hyvIds);
  }

  @override
  final LocalizedText name;
  @override
  final String jaPronunciation;
  @override
  final String imageUrl;
  @override
  final String smallImageUrl;
  @override
  final int rarity;
  @override
  final String weaponType;
  final List<String> _variantIds;
  @override
  List<String> get variantIds {
    if (_variantIds is EqualUnmodifiableListView) return _variantIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variantIds);
  }

  final Map<String, String> _materials;
  @override
  Map<String, String> get materials {
    if (_materials is EqualUnmodifiableMapView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materials);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Character.group(id: $id, hyvIds: $hyvIds, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, smallImageUrl: $smallImageUrl, rarity: $rarity, weaponType: $weaponType, variantIds: $variantIds, materials: $materials)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterGroupImplToJson(
      this,
    );
  }
}

abstract class CharacterGroup extends Character
    implements CharacterWithLargeImage {
  const factory CharacterGroup(
      {required final String id,
      required final List<int> hyvIds,
      required final LocalizedText name,
      required final String jaPronunciation,
      required final String imageUrl,
      required final String smallImageUrl,
      required final int rarity,
      required final String weaponType,
      required final List<String> variantIds,
      required final Map<String, String> materials}) = _$CharacterGroupImpl;
  const CharacterGroup._() : super._();

  factory CharacterGroup.fromJson(Map<String, dynamic> json) =
      _$CharacterGroupImpl.fromJson;

  @override
  String get id;
  List<int> get hyvIds;
  @override
  LocalizedText get name;
  @override
  String get jaPronunciation;
  String get imageUrl;
  @override
  String get smallImageUrl;
  int get rarity;
  @override
  String get weaponType;
  List<String> get variantIds;
  @override
  Map<String, String> get materials;
}

/// @nodoc
@JsonSerializable()
class _$CharacterVariantImpl extends CharacterVariant with CharacterOrVariant {
  const _$CharacterVariantImpl(
      {required this.id,
      required this.parentId,
      required this.name,
      required this.jaPronunciation,
      required this.smallImageUrl,
      required this.element,
      required this.weaponType,
      required final Map<String, CharacterTalent> talents,
      required final Map<String, String> materials,
      final String? $type})
      : _talents = talents,
        _materials = materials,
        $type = $type ?? 'variant',
        super._();

  factory _$CharacterVariantImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterVariantImplFromJson(json);

  @override
  final String id;
  @override
  final String parentId;
  @override
  final LocalizedText name;
  @override
  final String jaPronunciation;
  @override
  final String smallImageUrl;
  @override
  final String element;
  @override
  final String weaponType;
  final Map<String, CharacterTalent> _talents;
  @override
  Map<String, CharacterTalent> get talents {
    if (_talents is EqualUnmodifiableMapView) return _talents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_talents);
  }

  final Map<String, String> _materials;
  @override
  Map<String, String> get materials {
    if (_materials is EqualUnmodifiableMapView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materials);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Character.variant(id: $id, parentId: $parentId, name: $name, jaPronunciation: $jaPronunciation, smallImageUrl: $smallImageUrl, element: $element, weaponType: $weaponType, talents: $talents, materials: $materials)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterVariantImplToJson(
      this,
    );
  }
}

abstract class CharacterVariant extends Character
    implements CharacterOrVariant {
  const factory CharacterVariant(
      {required final String id,
      required final String parentId,
      required final LocalizedText name,
      required final String jaPronunciation,
      required final String smallImageUrl,
      required final String element,
      required final String weaponType,
      required final Map<String, CharacterTalent> talents,
      required final Map<String, String> materials}) = _$CharacterVariantImpl;
  const CharacterVariant._() : super._();

  factory CharacterVariant.fromJson(Map<String, dynamic> json) =
      _$CharacterVariantImpl.fromJson;

  @override
  String get id;
  String get parentId;
  @override
  LocalizedText get name;
  @override
  String get jaPronunciation;
  @override
  String get smallImageUrl;
  String get element;
  @override
  String get weaponType;
  Map<String, CharacterTalent> get talents;
  @override
  Map<String, String> get materials;
}

CharacterTalent _$CharacterTalentFromJson(Map<String, dynamic> json) {
  return _CharacterTalent.fromJson(json);
}

/// @nodoc
mixin _$CharacterTalent {
  List<int> get idList => throw _privateConstructorUsedError;
  LocalizedText get name => throw _privateConstructorUsedError;

  /// Serializes this CharacterTalent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$CharacterTalentImpl implements _CharacterTalent {
  const _$CharacterTalentImpl(
      {required final List<int> idList, required this.name})
      : _idList = idList;

  factory _$CharacterTalentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterTalentImplFromJson(json);

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
  String toString() {
    return 'CharacterTalent(idList: $idList, name: $name)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterTalentImplToJson(
      this,
    );
  }
}

abstract class _CharacterTalent implements CharacterTalent {
  const factory _CharacterTalent(
      {required final List<int> idList,
      required final LocalizedText name}) = _$CharacterTalentImpl;

  factory _CharacterTalent.fromJson(Map<String, dynamic> json) =
      _$CharacterTalentImpl.fromJson;

  @override
  List<int> get idList;
  @override
  LocalizedText get name;
}
