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
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String rid,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            String element,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)
        $default, {
    required TResult Function(
            String id,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            List<String> variantIds,
            Map<String, String> materials)
        group,
    required TResult Function(
            String id,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            String smallImageUrl,
            String element,
            String weaponType,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)
        variant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String rid,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            String element,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)?
        $default, {
    TResult? Function(
            String id,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            List<String> variantIds,
            Map<String, String> materials)?
        group,
    TResult? Function(
            String id,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            String smallImageUrl,
            String element,
            String weaponType,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)?
        variant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String rid,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            String element,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)?
        $default, {
    TResult Function(
            String id,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            List<String> variantIds,
            Map<String, String> materials)?
        group,
    TResult Function(
            String id,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            String smallImageUrl,
            String element,
            String weaponType,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)?
        variant,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ListedCharacter value) $default, {
    required TResult Function(CharacterGroup value) group,
    required TResult Function(CharacterVariant value) variant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ListedCharacter value)? $default, {
    TResult? Function(CharacterGroup value)? group,
    TResult? Function(CharacterVariant value)? variant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ListedCharacter value)? $default, {
    TResult Function(CharacterGroup value)? group,
    TResult Function(CharacterVariant value)? variant,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterCopyWith<Character> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterCopyWith<$Res> {
  factory $CharacterCopyWith(Character value, $Res Function(Character) then) =
      _$CharacterCopyWithImpl<$Res, Character>;
  @useResult
  $Res call(
      {String id,
      LocalizedText name,
      String jaPronunciation,
      String smallImageUrl,
      String weaponType,
      Map<String, String> materials});

  $LocalizedTextCopyWith<$Res> get name;
}

/// @nodoc
class _$CharacterCopyWithImpl<$Res, $Val extends Character>
    implements $CharacterCopyWith<$Res> {
  _$CharacterCopyWithImpl(this._value, this._then);

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
    Object? smallImageUrl = null,
    Object? weaponType = null,
    Object? materials = null,
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
      smallImageUrl: null == smallImageUrl
          ? _value.smallImageUrl
          : smallImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      weaponType: null == weaponType
          ? _value.weaponType
          : weaponType // ignore: cast_nullable_to_non_nullable
              as String,
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
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
abstract class _$$ListedCharacterImplCopyWith<$Res>
    implements $CharacterCopyWith<$Res> {
  factory _$$ListedCharacterImplCopyWith(_$ListedCharacterImpl value,
          $Res Function(_$ListedCharacterImpl) then) =
      __$$ListedCharacterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String rid,
      List<int> hyvIds,
      LocalizedText name,
      String jaPronunciation,
      String imageUrl,
      String smallImageUrl,
      int rarity,
      String weaponType,
      String element,
      Map<String, LocalizedText> talents,
      Map<String, String> materials});

  @override
  $LocalizedTextCopyWith<$Res> get name;
}

/// @nodoc
class __$$ListedCharacterImplCopyWithImpl<$Res>
    extends _$CharacterCopyWithImpl<$Res, _$ListedCharacterImpl>
    implements _$$ListedCharacterImplCopyWith<$Res> {
  __$$ListedCharacterImplCopyWithImpl(
      _$ListedCharacterImpl _value, $Res Function(_$ListedCharacterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rid = null,
    Object? hyvIds = null,
    Object? name = null,
    Object? jaPronunciation = null,
    Object? imageUrl = null,
    Object? smallImageUrl = null,
    Object? rarity = null,
    Object? weaponType = null,
    Object? element = null,
    Object? talents = null,
    Object? materials = null,
  }) {
    return _then(_$ListedCharacterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rid: null == rid
          ? _value.rid
          : rid // ignore: cast_nullable_to_non_nullable
              as String,
      hyvIds: null == hyvIds
          ? _value._hyvIds
          : hyvIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
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
      smallImageUrl: null == smallImageUrl
          ? _value.smallImageUrl
          : smallImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int,
      weaponType: null == weaponType
          ? _value.weaponType
          : weaponType // ignore: cast_nullable_to_non_nullable
              as String,
      element: null == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as String,
      talents: null == talents
          ? _value._talents
          : talents // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalizedText>,
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListedCharacterImpl extends ListedCharacter
    with CharacterWithLargeImage, CharacterOrVariant {
  const _$ListedCharacterImpl(
      {required this.id,
      required this.rid,
      required final List<int> hyvIds,
      required this.name,
      required this.jaPronunciation,
      required this.imageUrl,
      required this.smallImageUrl,
      required this.rarity,
      required this.weaponType,
      required this.element,
      required final Map<String, LocalizedText> talents,
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
  @override
  final String rid;
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
  final Map<String, LocalizedText> _talents;
  @override
  Map<String, LocalizedText> get talents {
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
    return 'Character(id: $id, rid: $rid, hyvIds: $hyvIds, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, smallImageUrl: $smallImageUrl, rarity: $rarity, weaponType: $weaponType, element: $element, talents: $talents, materials: $materials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListedCharacterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rid, rid) || other.rid == rid) &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      rid,
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListedCharacterImplCopyWith<_$ListedCharacterImpl> get copyWith =>
      __$$ListedCharacterImplCopyWithImpl<_$ListedCharacterImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String rid,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            String element,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)
        $default, {
    required TResult Function(
            String id,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            List<String> variantIds,
            Map<String, String> materials)
        group,
    required TResult Function(
            String id,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            String smallImageUrl,
            String element,
            String weaponType,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)
        variant,
  }) {
    return $default(id, rid, hyvIds, name, jaPronunciation, imageUrl,
        smallImageUrl, rarity, weaponType, element, talents, materials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String rid,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            String element,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)?
        $default, {
    TResult? Function(
            String id,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            List<String> variantIds,
            Map<String, String> materials)?
        group,
    TResult? Function(
            String id,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            String smallImageUrl,
            String element,
            String weaponType,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)?
        variant,
  }) {
    return $default?.call(id, rid, hyvIds, name, jaPronunciation, imageUrl,
        smallImageUrl, rarity, weaponType, element, talents, materials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String rid,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            String element,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)?
        $default, {
    TResult Function(
            String id,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            List<String> variantIds,
            Map<String, String> materials)?
        group,
    TResult Function(
            String id,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            String smallImageUrl,
            String element,
            String weaponType,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)?
        variant,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, rid, hyvIds, name, jaPronunciation, imageUrl,
          smallImageUrl, rarity, weaponType, element, talents, materials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ListedCharacter value) $default, {
    required TResult Function(CharacterGroup value) group,
    required TResult Function(CharacterVariant value) variant,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ListedCharacter value)? $default, {
    TResult? Function(CharacterGroup value)? group,
    TResult? Function(CharacterVariant value)? variant,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ListedCharacter value)? $default, {
    TResult Function(CharacterGroup value)? group,
    TResult Function(CharacterVariant value)? variant,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
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
      required final String rid,
      required final List<int> hyvIds,
      required final LocalizedText name,
      required final String jaPronunciation,
      required final String imageUrl,
      required final String smallImageUrl,
      required final int rarity,
      required final String weaponType,
      required final String element,
      required final Map<String, LocalizedText> talents,
      required final Map<String, String> materials}) = _$ListedCharacterImpl;
  const ListedCharacter._() : super._();

  factory ListedCharacter.fromJson(Map<String, dynamic> json) =
      _$ListedCharacterImpl.fromJson;

  @override
  String get id;
  String get rid;
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
  Map<String, LocalizedText> get talents;
  @override
  Map<String, String> get materials;
  @override
  @JsonKey(ignore: true)
  _$$ListedCharacterImplCopyWith<_$ListedCharacterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CharacterGroupImplCopyWith<$Res>
    implements $CharacterCopyWith<$Res> {
  factory _$$CharacterGroupImplCopyWith(_$CharacterGroupImpl value,
          $Res Function(_$CharacterGroupImpl) then) =
      __$$CharacterGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<int> hyvIds,
      LocalizedText name,
      String jaPronunciation,
      String imageUrl,
      String smallImageUrl,
      int rarity,
      String weaponType,
      List<String> variantIds,
      Map<String, String> materials});

  @override
  $LocalizedTextCopyWith<$Res> get name;
}

/// @nodoc
class __$$CharacterGroupImplCopyWithImpl<$Res>
    extends _$CharacterCopyWithImpl<$Res, _$CharacterGroupImpl>
    implements _$$CharacterGroupImplCopyWith<$Res> {
  __$$CharacterGroupImplCopyWithImpl(
      _$CharacterGroupImpl _value, $Res Function(_$CharacterGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hyvIds = null,
    Object? name = null,
    Object? jaPronunciation = null,
    Object? imageUrl = null,
    Object? smallImageUrl = null,
    Object? rarity = null,
    Object? weaponType = null,
    Object? variantIds = null,
    Object? materials = null,
  }) {
    return _then(_$CharacterGroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hyvIds: null == hyvIds
          ? _value._hyvIds
          : hyvIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
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
      smallImageUrl: null == smallImageUrl
          ? _value.smallImageUrl
          : smallImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int,
      weaponType: null == weaponType
          ? _value.weaponType
          : weaponType // ignore: cast_nullable_to_non_nullable
              as String,
      variantIds: null == variantIds
          ? _value._variantIds
          : variantIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterGroupImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterGroupImplCopyWith<_$CharacterGroupImpl> get copyWith =>
      __$$CharacterGroupImplCopyWithImpl<_$CharacterGroupImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String rid,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            String element,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)
        $default, {
    required TResult Function(
            String id,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            List<String> variantIds,
            Map<String, String> materials)
        group,
    required TResult Function(
            String id,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            String smallImageUrl,
            String element,
            String weaponType,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)
        variant,
  }) {
    return group(id, hyvIds, name, jaPronunciation, imageUrl, smallImageUrl,
        rarity, weaponType, variantIds, materials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String rid,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            String element,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)?
        $default, {
    TResult? Function(
            String id,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            List<String> variantIds,
            Map<String, String> materials)?
        group,
    TResult? Function(
            String id,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            String smallImageUrl,
            String element,
            String weaponType,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)?
        variant,
  }) {
    return group?.call(id, hyvIds, name, jaPronunciation, imageUrl,
        smallImageUrl, rarity, weaponType, variantIds, materials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String rid,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            String element,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)?
        $default, {
    TResult Function(
            String id,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            List<String> variantIds,
            Map<String, String> materials)?
        group,
    TResult Function(
            String id,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            String smallImageUrl,
            String element,
            String weaponType,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)?
        variant,
    required TResult orElse(),
  }) {
    if (group != null) {
      return group(id, hyvIds, name, jaPronunciation, imageUrl, smallImageUrl,
          rarity, weaponType, variantIds, materials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ListedCharacter value) $default, {
    required TResult Function(CharacterGroup value) group,
    required TResult Function(CharacterVariant value) variant,
  }) {
    return group(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ListedCharacter value)? $default, {
    TResult? Function(CharacterGroup value)? group,
    TResult? Function(CharacterVariant value)? variant,
  }) {
    return group?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ListedCharacter value)? $default, {
    TResult Function(CharacterGroup value)? group,
    TResult Function(CharacterVariant value)? variant,
    required TResult orElse(),
  }) {
    if (group != null) {
      return group(this);
    }
    return orElse();
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
  @override
  @JsonKey(ignore: true)
  _$$CharacterGroupImplCopyWith<_$CharacterGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CharacterVariantImplCopyWith<$Res>
    implements $CharacterCopyWith<$Res> {
  factory _$$CharacterVariantImplCopyWith(_$CharacterVariantImpl value,
          $Res Function(_$CharacterVariantImpl) then) =
      __$$CharacterVariantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String parentId,
      LocalizedText name,
      String jaPronunciation,
      String smallImageUrl,
      String element,
      String weaponType,
      Map<String, LocalizedText> talents,
      Map<String, String> materials});

  @override
  $LocalizedTextCopyWith<$Res> get name;
}

/// @nodoc
class __$$CharacterVariantImplCopyWithImpl<$Res>
    extends _$CharacterCopyWithImpl<$Res, _$CharacterVariantImpl>
    implements _$$CharacterVariantImplCopyWith<$Res> {
  __$$CharacterVariantImplCopyWithImpl(_$CharacterVariantImpl _value,
      $Res Function(_$CharacterVariantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = null,
    Object? name = null,
    Object? jaPronunciation = null,
    Object? smallImageUrl = null,
    Object? element = null,
    Object? weaponType = null,
    Object? talents = null,
    Object? materials = null,
  }) {
    return _then(_$CharacterVariantImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
      jaPronunciation: null == jaPronunciation
          ? _value.jaPronunciation
          : jaPronunciation // ignore: cast_nullable_to_non_nullable
              as String,
      smallImageUrl: null == smallImageUrl
          ? _value.smallImageUrl
          : smallImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      element: null == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as String,
      weaponType: null == weaponType
          ? _value.weaponType
          : weaponType // ignore: cast_nullable_to_non_nullable
              as String,
      talents: null == talents
          ? _value._talents
          : talents // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalizedText>,
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
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
      required final Map<String, LocalizedText> talents,
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
  final Map<String, LocalizedText> _talents;
  @override
  Map<String, LocalizedText> get talents {
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterVariantImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterVariantImplCopyWith<_$CharacterVariantImpl> get copyWith =>
      __$$CharacterVariantImplCopyWithImpl<_$CharacterVariantImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String rid,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            String element,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)
        $default, {
    required TResult Function(
            String id,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            List<String> variantIds,
            Map<String, String> materials)
        group,
    required TResult Function(
            String id,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            String smallImageUrl,
            String element,
            String weaponType,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)
        variant,
  }) {
    return variant(id, parentId, name, jaPronunciation, smallImageUrl, element,
        weaponType, talents, materials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String rid,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            String element,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)?
        $default, {
    TResult? Function(
            String id,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            List<String> variantIds,
            Map<String, String> materials)?
        group,
    TResult? Function(
            String id,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            String smallImageUrl,
            String element,
            String weaponType,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)?
        variant,
  }) {
    return variant?.call(id, parentId, name, jaPronunciation, smallImageUrl,
        element, weaponType, talents, materials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String rid,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            String element,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)?
        $default, {
    TResult Function(
            String id,
            List<int> hyvIds,
            LocalizedText name,
            String jaPronunciation,
            String imageUrl,
            String smallImageUrl,
            int rarity,
            String weaponType,
            List<String> variantIds,
            Map<String, String> materials)?
        group,
    TResult Function(
            String id,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            String smallImageUrl,
            String element,
            String weaponType,
            Map<String, LocalizedText> talents,
            Map<String, String> materials)?
        variant,
    required TResult orElse(),
  }) {
    if (variant != null) {
      return variant(id, parentId, name, jaPronunciation, smallImageUrl,
          element, weaponType, talents, materials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ListedCharacter value) $default, {
    required TResult Function(CharacterGroup value) group,
    required TResult Function(CharacterVariant value) variant,
  }) {
    return variant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ListedCharacter value)? $default, {
    TResult? Function(CharacterGroup value)? group,
    TResult? Function(CharacterVariant value)? variant,
  }) {
    return variant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ListedCharacter value)? $default, {
    TResult Function(CharacterGroup value)? group,
    TResult Function(CharacterVariant value)? variant,
    required TResult orElse(),
  }) {
    if (variant != null) {
      return variant(this);
    }
    return orElse();
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
      required final Map<String, LocalizedText> talents,
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
  Map<String, LocalizedText> get talents;
  @override
  Map<String, String> get materials;
  @override
  @JsonKey(ignore: true)
  _$$CharacterVariantImplCopyWith<_$CharacterVariantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
