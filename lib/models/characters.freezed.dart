// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'characters.dart';

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
    case 'unlisted':
      return UnlistedCharacter.fromJson(json);

    default:
      return _Character.fromJson(json);
  }
}

/// @nodoc
mixin _$Character {
  String get id => throw _privateConstructorUsedError;
  LocalizedText get name => throw _privateConstructorUsedError;
  String get jaPronunciation => throw _privateConstructorUsedError;
  int get rarity => throw _privateConstructorUsedError;
  WeaponType get weaponType => throw _privateConstructorUsedError;
  CharacterMaterialDefinitions get materials =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String rid,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)
        $default, {
    required TResult Function(
            String id,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            List<String> variantIds,
            CharacterMaterialDefinitions materials)
        group,
    required TResult Function(
            String id,
            String rid,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)
        unlisted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String rid,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)?
        $default, {
    TResult? Function(
            String id,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            List<String> variantIds,
            CharacterMaterialDefinitions materials)?
        group,
    TResult? Function(
            String id,
            String rid,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)?
        unlisted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String rid,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)?
        $default, {
    TResult Function(
            String id,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            List<String> variantIds,
            CharacterMaterialDefinitions materials)?
        group,
    TResult Function(
            String id,
            String rid,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)?
        unlisted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Character value) $default, {
    required TResult Function(CharacterGroup value) group,
    required TResult Function(UnlistedCharacter value) unlisted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Character value)? $default, {
    TResult? Function(CharacterGroup value)? group,
    TResult? Function(UnlistedCharacter value)? unlisted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Character value)? $default, {
    TResult Function(CharacterGroup value)? group,
    TResult Function(UnlistedCharacter value)? unlisted,
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
      int rarity,
      WeaponType weaponType,
      CharacterMaterialDefinitions materials});

  $LocalizedTextCopyWith<$Res> get name;
  $CharacterMaterialDefinitionsCopyWith<$Res> get materials;
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
    Object? rarity = null,
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
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int,
      weaponType: null == weaponType
          ? _value.weaponType
          : weaponType // ignore: cast_nullable_to_non_nullable
              as WeaponType,
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as CharacterMaterialDefinitions,
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
  $CharacterMaterialDefinitionsCopyWith<$Res> get materials {
    return $CharacterMaterialDefinitionsCopyWith<$Res>(_value.materials,
        (value) {
      return _then(_value.copyWith(materials: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CharacterImplCopyWith<$Res>
    implements $CharacterCopyWith<$Res> {
  factory _$$CharacterImplCopyWith(
          _$CharacterImpl value, $Res Function(_$CharacterImpl) then) =
      __$$CharacterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String rid,
      LocalizedText name,
      String jaPronunciation,
      int rarity,
      WeaponType weaponType,
      TeyvatElement element,
      CharacterMaterialDefinitions materials});

  @override
  $LocalizedTextCopyWith<$Res> get name;
  @override
  $CharacterMaterialDefinitionsCopyWith<$Res> get materials;
}

/// @nodoc
class __$$CharacterImplCopyWithImpl<$Res>
    extends _$CharacterCopyWithImpl<$Res, _$CharacterImpl>
    implements _$$CharacterImplCopyWith<$Res> {
  __$$CharacterImplCopyWithImpl(
      _$CharacterImpl _value, $Res Function(_$CharacterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rid = null,
    Object? name = null,
    Object? jaPronunciation = null,
    Object? rarity = null,
    Object? weaponType = null,
    Object? element = null,
    Object? materials = null,
  }) {
    return _then(_$CharacterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rid: null == rid
          ? _value.rid
          : rid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
      jaPronunciation: null == jaPronunciation
          ? _value.jaPronunciation
          : jaPronunciation // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int,
      weaponType: null == weaponType
          ? _value.weaponType
          : weaponType // ignore: cast_nullable_to_non_nullable
              as WeaponType,
      element: null == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as TeyvatElement,
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as CharacterMaterialDefinitions,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterImpl implements _Character {
  const _$CharacterImpl(
      {required this.id,
      required this.rid,
      required this.name,
      required this.jaPronunciation,
      required this.rarity,
      required this.weaponType,
      required this.element,
      required this.materials,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$CharacterImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterImplFromJson(json);

  @override
  final String id;
  @override
  final String rid;
  @override
  final LocalizedText name;
  @override
  final String jaPronunciation;
  @override
  final int rarity;
  @override
  final WeaponType weaponType;
  @override
  final TeyvatElement element;
  @override
  final CharacterMaterialDefinitions materials;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Character(id: $id, rid: $rid, name: $name, jaPronunciation: $jaPronunciation, rarity: $rarity, weaponType: $weaponType, element: $element, materials: $materials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rid, rid) || other.rid == rid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.jaPronunciation, jaPronunciation) ||
                other.jaPronunciation == jaPronunciation) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.weaponType, weaponType) ||
                other.weaponType == weaponType) &&
            (identical(other.element, element) || other.element == element) &&
            (identical(other.materials, materials) ||
                other.materials == materials));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, rid, name, jaPronunciation,
      rarity, weaponType, element, materials);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterImplCopyWith<_$CharacterImpl> get copyWith =>
      __$$CharacterImplCopyWithImpl<_$CharacterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String rid,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)
        $default, {
    required TResult Function(
            String id,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            List<String> variantIds,
            CharacterMaterialDefinitions materials)
        group,
    required TResult Function(
            String id,
            String rid,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)
        unlisted,
  }) {
    return $default(
        id, rid, name, jaPronunciation, rarity, weaponType, element, materials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String rid,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)?
        $default, {
    TResult? Function(
            String id,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            List<String> variantIds,
            CharacterMaterialDefinitions materials)?
        group,
    TResult? Function(
            String id,
            String rid,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)?
        unlisted,
  }) {
    return $default?.call(
        id, rid, name, jaPronunciation, rarity, weaponType, element, materials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String rid,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)?
        $default, {
    TResult Function(
            String id,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            List<String> variantIds,
            CharacterMaterialDefinitions materials)?
        group,
    TResult Function(
            String id,
            String rid,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)?
        unlisted,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, rid, name, jaPronunciation, rarity, weaponType,
          element, materials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Character value) $default, {
    required TResult Function(CharacterGroup value) group,
    required TResult Function(UnlistedCharacter value) unlisted,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Character value)? $default, {
    TResult? Function(CharacterGroup value)? group,
    TResult? Function(UnlistedCharacter value)? unlisted,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Character value)? $default, {
    TResult Function(CharacterGroup value)? group,
    TResult Function(UnlistedCharacter value)? unlisted,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterImplToJson(
      this,
    );
  }
}

abstract class _Character implements Character {
  const factory _Character(
      {required final String id,
      required final String rid,
      required final LocalizedText name,
      required final String jaPronunciation,
      required final int rarity,
      required final WeaponType weaponType,
      required final TeyvatElement element,
      required final CharacterMaterialDefinitions materials}) = _$CharacterImpl;

  factory _Character.fromJson(Map<String, dynamic> json) =
      _$CharacterImpl.fromJson;

  @override
  String get id;
  String get rid;
  @override
  LocalizedText get name;
  @override
  String get jaPronunciation;
  @override
  int get rarity;
  @override
  WeaponType get weaponType;
  TeyvatElement get element;
  @override
  CharacterMaterialDefinitions get materials;
  @override
  @JsonKey(ignore: true)
  _$$CharacterImplCopyWith<_$CharacterImpl> get copyWith =>
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
      LocalizedText name,
      String jaPronunciation,
      int rarity,
      WeaponType weaponType,
      List<String> variantIds,
      CharacterMaterialDefinitions materials});

  @override
  $LocalizedTextCopyWith<$Res> get name;
  @override
  $CharacterMaterialDefinitionsCopyWith<$Res> get materials;
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
    Object? name = null,
    Object? jaPronunciation = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
      jaPronunciation: null == jaPronunciation
          ? _value.jaPronunciation
          : jaPronunciation // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int,
      weaponType: null == weaponType
          ? _value.weaponType
          : weaponType // ignore: cast_nullable_to_non_nullable
              as WeaponType,
      variantIds: null == variantIds
          ? _value._variantIds
          : variantIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as CharacterMaterialDefinitions,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterGroupImpl implements CharacterGroup {
  const _$CharacterGroupImpl(
      {required this.id,
      required this.name,
      required this.jaPronunciation,
      required this.rarity,
      required this.weaponType,
      required final List<String> variantIds,
      required this.materials,
      final String? $type})
      : _variantIds = variantIds,
        $type = $type ?? 'group';

  factory _$CharacterGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterGroupImplFromJson(json);

  @override
  final String id;
  @override
  final LocalizedText name;
  @override
  final String jaPronunciation;
  @override
  final int rarity;
  @override
  final WeaponType weaponType;
  final List<String> _variantIds;
  @override
  List<String> get variantIds {
    if (_variantIds is EqualUnmodifiableListView) return _variantIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variantIds);
  }

  @override
  final CharacterMaterialDefinitions materials;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Character.group(id: $id, name: $name, jaPronunciation: $jaPronunciation, rarity: $rarity, weaponType: $weaponType, variantIds: $variantIds, materials: $materials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.jaPronunciation, jaPronunciation) ||
                other.jaPronunciation == jaPronunciation) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.weaponType, weaponType) ||
                other.weaponType == weaponType) &&
            const DeepCollectionEquality()
                .equals(other._variantIds, _variantIds) &&
            (identical(other.materials, materials) ||
                other.materials == materials));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      jaPronunciation,
      rarity,
      weaponType,
      const DeepCollectionEquality().hash(_variantIds),
      materials);

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
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)
        $default, {
    required TResult Function(
            String id,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            List<String> variantIds,
            CharacterMaterialDefinitions materials)
        group,
    required TResult Function(
            String id,
            String rid,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)
        unlisted,
  }) {
    return group(
        id, name, jaPronunciation, rarity, weaponType, variantIds, materials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String rid,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)?
        $default, {
    TResult? Function(
            String id,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            List<String> variantIds,
            CharacterMaterialDefinitions materials)?
        group,
    TResult? Function(
            String id,
            String rid,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)?
        unlisted,
  }) {
    return group?.call(
        id, name, jaPronunciation, rarity, weaponType, variantIds, materials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String rid,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)?
        $default, {
    TResult Function(
            String id,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            List<String> variantIds,
            CharacterMaterialDefinitions materials)?
        group,
    TResult Function(
            String id,
            String rid,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)?
        unlisted,
    required TResult orElse(),
  }) {
    if (group != null) {
      return group(
          id, name, jaPronunciation, rarity, weaponType, variantIds, materials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Character value) $default, {
    required TResult Function(CharacterGroup value) group,
    required TResult Function(UnlistedCharacter value) unlisted,
  }) {
    return group(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Character value)? $default, {
    TResult? Function(CharacterGroup value)? group,
    TResult? Function(UnlistedCharacter value)? unlisted,
  }) {
    return group?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Character value)? $default, {
    TResult Function(CharacterGroup value)? group,
    TResult Function(UnlistedCharacter value)? unlisted,
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

abstract class CharacterGroup implements Character {
  const factory CharacterGroup(
          {required final String id,
          required final LocalizedText name,
          required final String jaPronunciation,
          required final int rarity,
          required final WeaponType weaponType,
          required final List<String> variantIds,
          required final CharacterMaterialDefinitions materials}) =
      _$CharacterGroupImpl;

  factory CharacterGroup.fromJson(Map<String, dynamic> json) =
      _$CharacterGroupImpl.fromJson;

  @override
  String get id;
  @override
  LocalizedText get name;
  @override
  String get jaPronunciation;
  @override
  int get rarity;
  @override
  WeaponType get weaponType;
  List<String> get variantIds;
  @override
  CharacterMaterialDefinitions get materials;
  @override
  @JsonKey(ignore: true)
  _$$CharacterGroupImplCopyWith<_$CharacterGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnlistedCharacterImplCopyWith<$Res>
    implements $CharacterCopyWith<$Res> {
  factory _$$UnlistedCharacterImplCopyWith(_$UnlistedCharacterImpl value,
          $Res Function(_$UnlistedCharacterImpl) then) =
      __$$UnlistedCharacterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String rid,
      String parentId,
      LocalizedText name,
      String jaPronunciation,
      int rarity,
      WeaponType weaponType,
      TeyvatElement element,
      CharacterMaterialDefinitions materials});

  @override
  $LocalizedTextCopyWith<$Res> get name;
  @override
  $CharacterMaterialDefinitionsCopyWith<$Res> get materials;
}

/// @nodoc
class __$$UnlistedCharacterImplCopyWithImpl<$Res>
    extends _$CharacterCopyWithImpl<$Res, _$UnlistedCharacterImpl>
    implements _$$UnlistedCharacterImplCopyWith<$Res> {
  __$$UnlistedCharacterImplCopyWithImpl(_$UnlistedCharacterImpl _value,
      $Res Function(_$UnlistedCharacterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rid = null,
    Object? parentId = null,
    Object? name = null,
    Object? jaPronunciation = null,
    Object? rarity = null,
    Object? weaponType = null,
    Object? element = null,
    Object? materials = null,
  }) {
    return _then(_$UnlistedCharacterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rid: null == rid
          ? _value.rid
          : rid // ignore: cast_nullable_to_non_nullable
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
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int,
      weaponType: null == weaponType
          ? _value.weaponType
          : weaponType // ignore: cast_nullable_to_non_nullable
              as WeaponType,
      element: null == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as TeyvatElement,
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as CharacterMaterialDefinitions,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnlistedCharacterImpl implements UnlistedCharacter {
  const _$UnlistedCharacterImpl(
      {required this.id,
      required this.rid,
      required this.parentId,
      required this.name,
      required this.jaPronunciation,
      required this.rarity,
      required this.weaponType,
      required this.element,
      required this.materials,
      final String? $type})
      : $type = $type ?? 'unlisted';

  factory _$UnlistedCharacterImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnlistedCharacterImplFromJson(json);

  @override
  final String id;
  @override
  final String rid;
  @override
  final String parentId;
  @override
  final LocalizedText name;
  @override
  final String jaPronunciation;
  @override
  final int rarity;
  @override
  final WeaponType weaponType;
  @override
  final TeyvatElement element;
  @override
  final CharacterMaterialDefinitions materials;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Character.unlisted(id: $id, rid: $rid, parentId: $parentId, name: $name, jaPronunciation: $jaPronunciation, rarity: $rarity, weaponType: $weaponType, element: $element, materials: $materials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnlistedCharacterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rid, rid) || other.rid == rid) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.jaPronunciation, jaPronunciation) ||
                other.jaPronunciation == jaPronunciation) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.weaponType, weaponType) ||
                other.weaponType == weaponType) &&
            (identical(other.element, element) || other.element == element) &&
            (identical(other.materials, materials) ||
                other.materials == materials));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, rid, parentId, name,
      jaPronunciation, rarity, weaponType, element, materials);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnlistedCharacterImplCopyWith<_$UnlistedCharacterImpl> get copyWith =>
      __$$UnlistedCharacterImplCopyWithImpl<_$UnlistedCharacterImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String rid,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)
        $default, {
    required TResult Function(
            String id,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            List<String> variantIds,
            CharacterMaterialDefinitions materials)
        group,
    required TResult Function(
            String id,
            String rid,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)
        unlisted,
  }) {
    return unlisted(id, rid, parentId, name, jaPronunciation, rarity,
        weaponType, element, materials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String rid,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)?
        $default, {
    TResult? Function(
            String id,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            List<String> variantIds,
            CharacterMaterialDefinitions materials)?
        group,
    TResult? Function(
            String id,
            String rid,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)?
        unlisted,
  }) {
    return unlisted?.call(id, rid, parentId, name, jaPronunciation, rarity,
        weaponType, element, materials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String rid,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)?
        $default, {
    TResult Function(
            String id,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            List<String> variantIds,
            CharacterMaterialDefinitions materials)?
        group,
    TResult Function(
            String id,
            String rid,
            String parentId,
            LocalizedText name,
            String jaPronunciation,
            int rarity,
            WeaponType weaponType,
            TeyvatElement element,
            CharacterMaterialDefinitions materials)?
        unlisted,
    required TResult orElse(),
  }) {
    if (unlisted != null) {
      return unlisted(id, rid, parentId, name, jaPronunciation, rarity,
          weaponType, element, materials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Character value) $default, {
    required TResult Function(CharacterGroup value) group,
    required TResult Function(UnlistedCharacter value) unlisted,
  }) {
    return unlisted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Character value)? $default, {
    TResult? Function(CharacterGroup value)? group,
    TResult? Function(UnlistedCharacter value)? unlisted,
  }) {
    return unlisted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Character value)? $default, {
    TResult Function(CharacterGroup value)? group,
    TResult Function(UnlistedCharacter value)? unlisted,
    required TResult orElse(),
  }) {
    if (unlisted != null) {
      return unlisted(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnlistedCharacterImplToJson(
      this,
    );
  }
}

abstract class UnlistedCharacter implements Character {
  const factory UnlistedCharacter(
          {required final String id,
          required final String rid,
          required final String parentId,
          required final LocalizedText name,
          required final String jaPronunciation,
          required final int rarity,
          required final WeaponType weaponType,
          required final TeyvatElement element,
          required final CharacterMaterialDefinitions materials}) =
      _$UnlistedCharacterImpl;

  factory UnlistedCharacter.fromJson(Map<String, dynamic> json) =
      _$UnlistedCharacterImpl.fromJson;

  @override
  String get id;
  String get rid;
  String get parentId;
  @override
  LocalizedText get name;
  @override
  String get jaPronunciation;
  @override
  int get rarity;
  @override
  WeaponType get weaponType;
  TeyvatElement get element;
  @override
  CharacterMaterialDefinitions get materials;
  @override
  @JsonKey(ignore: true)
  _$$UnlistedCharacterImplCopyWith<_$UnlistedCharacterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CharacterMaterialDefinitions _$CharacterMaterialDefinitionsFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'travelerAscension':
      return TravelerAscensionMaterialDefinitions.fromJson(json);
    case 'travelerTalent':
      return TravelerTalentMaterialDefinitions.fromJson(json);

    default:
      return _CharacterMaterialDefinitions.fromJson(json);
  }
}

/// @nodoc
mixin _$CharacterMaterialDefinitions {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String primary, String elementalStone, String local,
            String secondary, String talentPrimary, String talentBoss)
        $default, {
    required TResult Function(String primary, String local, String secondary)
        travelerAscension,
    required TResult Function(MaterialIdPerType talentPrimary,
            MaterialIdPerType talentSecondary, MaterialIdPerType talentBoss)
        travelerTalent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String primary, String elementalStone, String local,
            String secondary, String talentPrimary, String talentBoss)?
        $default, {
    TResult? Function(String primary, String local, String secondary)?
        travelerAscension,
    TResult? Function(MaterialIdPerType talentPrimary,
            MaterialIdPerType talentSecondary, MaterialIdPerType talentBoss)?
        travelerTalent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String primary, String elementalStone, String local,
            String secondary, String talentPrimary, String talentBoss)?
        $default, {
    TResult Function(String primary, String local, String secondary)?
        travelerAscension,
    TResult Function(MaterialIdPerType talentPrimary,
            MaterialIdPerType talentSecondary, MaterialIdPerType talentBoss)?
        travelerTalent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CharacterMaterialDefinitions value) $default, {
    required TResult Function(TravelerAscensionMaterialDefinitions value)
        travelerAscension,
    required TResult Function(TravelerTalentMaterialDefinitions value)
        travelerTalent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CharacterMaterialDefinitions value)? $default, {
    TResult? Function(TravelerAscensionMaterialDefinitions value)?
        travelerAscension,
    TResult? Function(TravelerTalentMaterialDefinitions value)? travelerTalent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CharacterMaterialDefinitions value)? $default, {
    TResult Function(TravelerAscensionMaterialDefinitions value)?
        travelerAscension,
    TResult Function(TravelerTalentMaterialDefinitions value)? travelerTalent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterMaterialDefinitionsCopyWith<$Res> {
  factory $CharacterMaterialDefinitionsCopyWith(
          CharacterMaterialDefinitions value,
          $Res Function(CharacterMaterialDefinitions) then) =
      _$CharacterMaterialDefinitionsCopyWithImpl<$Res,
          CharacterMaterialDefinitions>;
}

/// @nodoc
class _$CharacterMaterialDefinitionsCopyWithImpl<$Res,
        $Val extends CharacterMaterialDefinitions>
    implements $CharacterMaterialDefinitionsCopyWith<$Res> {
  _$CharacterMaterialDefinitionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CharacterMaterialDefinitionsImplCopyWith<$Res> {
  factory _$$CharacterMaterialDefinitionsImplCopyWith(
          _$CharacterMaterialDefinitionsImpl value,
          $Res Function(_$CharacterMaterialDefinitionsImpl) then) =
      __$$CharacterMaterialDefinitionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String primary,
      String elementalStone,
      String local,
      String secondary,
      String talentPrimary,
      String talentBoss});
}

/// @nodoc
class __$$CharacterMaterialDefinitionsImplCopyWithImpl<$Res>
    extends _$CharacterMaterialDefinitionsCopyWithImpl<$Res,
        _$CharacterMaterialDefinitionsImpl>
    implements _$$CharacterMaterialDefinitionsImplCopyWith<$Res> {
  __$$CharacterMaterialDefinitionsImplCopyWithImpl(
      _$CharacterMaterialDefinitionsImpl _value,
      $Res Function(_$CharacterMaterialDefinitionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primary = null,
    Object? elementalStone = null,
    Object? local = null,
    Object? secondary = null,
    Object? talentPrimary = null,
    Object? talentBoss = null,
  }) {
    return _then(_$CharacterMaterialDefinitionsImpl(
      primary: null == primary
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as String,
      elementalStone: null == elementalStone
          ? _value.elementalStone
          : elementalStone // ignore: cast_nullable_to_non_nullable
              as String,
      local: null == local
          ? _value.local
          : local // ignore: cast_nullable_to_non_nullable
              as String,
      secondary: null == secondary
          ? _value.secondary
          : secondary // ignore: cast_nullable_to_non_nullable
              as String,
      talentPrimary: null == talentPrimary
          ? _value.talentPrimary
          : talentPrimary // ignore: cast_nullable_to_non_nullable
              as String,
      talentBoss: null == talentBoss
          ? _value.talentBoss
          : talentBoss // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterMaterialDefinitionsImpl
    implements _CharacterMaterialDefinitions {
  const _$CharacterMaterialDefinitionsImpl(
      {required this.primary,
      required this.elementalStone,
      required this.local,
      required this.secondary,
      required this.talentPrimary,
      required this.talentBoss,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$CharacterMaterialDefinitionsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CharacterMaterialDefinitionsImplFromJson(json);

  @override
  final String primary;
  @override
  final String elementalStone;
  @override
  final String local;
  @override
  final String secondary;
  @override
  final String talentPrimary;
  @override
  final String talentBoss;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CharacterMaterialDefinitions(primary: $primary, elementalStone: $elementalStone, local: $local, secondary: $secondary, talentPrimary: $talentPrimary, talentBoss: $talentBoss)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterMaterialDefinitionsImpl &&
            (identical(other.primary, primary) || other.primary == primary) &&
            (identical(other.elementalStone, elementalStone) ||
                other.elementalStone == elementalStone) &&
            (identical(other.local, local) || other.local == local) &&
            (identical(other.secondary, secondary) ||
                other.secondary == secondary) &&
            (identical(other.talentPrimary, talentPrimary) ||
                other.talentPrimary == talentPrimary) &&
            (identical(other.talentBoss, talentBoss) ||
                other.talentBoss == talentBoss));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, primary, elementalStone, local,
      secondary, talentPrimary, talentBoss);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterMaterialDefinitionsImplCopyWith<
          _$CharacterMaterialDefinitionsImpl>
      get copyWith => __$$CharacterMaterialDefinitionsImplCopyWithImpl<
          _$CharacterMaterialDefinitionsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String primary, String elementalStone, String local,
            String secondary, String talentPrimary, String talentBoss)
        $default, {
    required TResult Function(String primary, String local, String secondary)
        travelerAscension,
    required TResult Function(MaterialIdPerType talentPrimary,
            MaterialIdPerType talentSecondary, MaterialIdPerType talentBoss)
        travelerTalent,
  }) {
    return $default(
        primary, elementalStone, local, secondary, talentPrimary, talentBoss);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String primary, String elementalStone, String local,
            String secondary, String talentPrimary, String talentBoss)?
        $default, {
    TResult? Function(String primary, String local, String secondary)?
        travelerAscension,
    TResult? Function(MaterialIdPerType talentPrimary,
            MaterialIdPerType talentSecondary, MaterialIdPerType talentBoss)?
        travelerTalent,
  }) {
    return $default?.call(
        primary, elementalStone, local, secondary, talentPrimary, talentBoss);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String primary, String elementalStone, String local,
            String secondary, String talentPrimary, String talentBoss)?
        $default, {
    TResult Function(String primary, String local, String secondary)?
        travelerAscension,
    TResult Function(MaterialIdPerType talentPrimary,
            MaterialIdPerType talentSecondary, MaterialIdPerType talentBoss)?
        travelerTalent,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          primary, elementalStone, local, secondary, talentPrimary, talentBoss);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CharacterMaterialDefinitions value) $default, {
    required TResult Function(TravelerAscensionMaterialDefinitions value)
        travelerAscension,
    required TResult Function(TravelerTalentMaterialDefinitions value)
        travelerTalent,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CharacterMaterialDefinitions value)? $default, {
    TResult? Function(TravelerAscensionMaterialDefinitions value)?
        travelerAscension,
    TResult? Function(TravelerTalentMaterialDefinitions value)? travelerTalent,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CharacterMaterialDefinitions value)? $default, {
    TResult Function(TravelerAscensionMaterialDefinitions value)?
        travelerAscension,
    TResult Function(TravelerTalentMaterialDefinitions value)? travelerTalent,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterMaterialDefinitionsImplToJson(
      this,
    );
  }
}

abstract class _CharacterMaterialDefinitions
    implements CharacterMaterialDefinitions {
  const factory _CharacterMaterialDefinitions(
      {required final String primary,
      required final String elementalStone,
      required final String local,
      required final String secondary,
      required final String talentPrimary,
      required final String talentBoss}) = _$CharacterMaterialDefinitionsImpl;

  factory _CharacterMaterialDefinitions.fromJson(Map<String, dynamic> json) =
      _$CharacterMaterialDefinitionsImpl.fromJson;

  String get primary;
  String get elementalStone;
  String get local;
  String get secondary;
  String get talentPrimary;
  String get talentBoss;
  @JsonKey(ignore: true)
  _$$CharacterMaterialDefinitionsImplCopyWith<
          _$CharacterMaterialDefinitionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TravelerAscensionMaterialDefinitionsImplCopyWith<$Res> {
  factory _$$TravelerAscensionMaterialDefinitionsImplCopyWith(
          _$TravelerAscensionMaterialDefinitionsImpl value,
          $Res Function(_$TravelerAscensionMaterialDefinitionsImpl) then) =
      __$$TravelerAscensionMaterialDefinitionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String primary, String local, String secondary});
}

/// @nodoc
class __$$TravelerAscensionMaterialDefinitionsImplCopyWithImpl<$Res>
    extends _$CharacterMaterialDefinitionsCopyWithImpl<$Res,
        _$TravelerAscensionMaterialDefinitionsImpl>
    implements _$$TravelerAscensionMaterialDefinitionsImplCopyWith<$Res> {
  __$$TravelerAscensionMaterialDefinitionsImplCopyWithImpl(
      _$TravelerAscensionMaterialDefinitionsImpl _value,
      $Res Function(_$TravelerAscensionMaterialDefinitionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primary = null,
    Object? local = null,
    Object? secondary = null,
  }) {
    return _then(_$TravelerAscensionMaterialDefinitionsImpl(
      primary: null == primary
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as String,
      local: null == local
          ? _value.local
          : local // ignore: cast_nullable_to_non_nullable
              as String,
      secondary: null == secondary
          ? _value.secondary
          : secondary // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelerAscensionMaterialDefinitionsImpl
    implements TravelerAscensionMaterialDefinitions {
  const _$TravelerAscensionMaterialDefinitionsImpl(
      {required this.primary,
      required this.local,
      required this.secondary,
      final String? $type})
      : $type = $type ?? 'travelerAscension';

  factory _$TravelerAscensionMaterialDefinitionsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TravelerAscensionMaterialDefinitionsImplFromJson(json);

  @override
  final String primary;
  @override
  final String local;
  @override
  final String secondary;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CharacterMaterialDefinitions.travelerAscension(primary: $primary, local: $local, secondary: $secondary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelerAscensionMaterialDefinitionsImpl &&
            (identical(other.primary, primary) || other.primary == primary) &&
            (identical(other.local, local) || other.local == local) &&
            (identical(other.secondary, secondary) ||
                other.secondary == secondary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, primary, local, secondary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelerAscensionMaterialDefinitionsImplCopyWith<
          _$TravelerAscensionMaterialDefinitionsImpl>
      get copyWith => __$$TravelerAscensionMaterialDefinitionsImplCopyWithImpl<
          _$TravelerAscensionMaterialDefinitionsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String primary, String elementalStone, String local,
            String secondary, String talentPrimary, String talentBoss)
        $default, {
    required TResult Function(String primary, String local, String secondary)
        travelerAscension,
    required TResult Function(MaterialIdPerType talentPrimary,
            MaterialIdPerType talentSecondary, MaterialIdPerType talentBoss)
        travelerTalent,
  }) {
    return travelerAscension(primary, local, secondary);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String primary, String elementalStone, String local,
            String secondary, String talentPrimary, String talentBoss)?
        $default, {
    TResult? Function(String primary, String local, String secondary)?
        travelerAscension,
    TResult? Function(MaterialIdPerType talentPrimary,
            MaterialIdPerType talentSecondary, MaterialIdPerType talentBoss)?
        travelerTalent,
  }) {
    return travelerAscension?.call(primary, local, secondary);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String primary, String elementalStone, String local,
            String secondary, String talentPrimary, String talentBoss)?
        $default, {
    TResult Function(String primary, String local, String secondary)?
        travelerAscension,
    TResult Function(MaterialIdPerType talentPrimary,
            MaterialIdPerType talentSecondary, MaterialIdPerType talentBoss)?
        travelerTalent,
    required TResult orElse(),
  }) {
    if (travelerAscension != null) {
      return travelerAscension(primary, local, secondary);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CharacterMaterialDefinitions value) $default, {
    required TResult Function(TravelerAscensionMaterialDefinitions value)
        travelerAscension,
    required TResult Function(TravelerTalentMaterialDefinitions value)
        travelerTalent,
  }) {
    return travelerAscension(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CharacterMaterialDefinitions value)? $default, {
    TResult? Function(TravelerAscensionMaterialDefinitions value)?
        travelerAscension,
    TResult? Function(TravelerTalentMaterialDefinitions value)? travelerTalent,
  }) {
    return travelerAscension?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CharacterMaterialDefinitions value)? $default, {
    TResult Function(TravelerAscensionMaterialDefinitions value)?
        travelerAscension,
    TResult Function(TravelerTalentMaterialDefinitions value)? travelerTalent,
    required TResult orElse(),
  }) {
    if (travelerAscension != null) {
      return travelerAscension(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelerAscensionMaterialDefinitionsImplToJson(
      this,
    );
  }
}

abstract class TravelerAscensionMaterialDefinitions
    implements CharacterMaterialDefinitions {
  const factory TravelerAscensionMaterialDefinitions(
          {required final String primary,
          required final String local,
          required final String secondary}) =
      _$TravelerAscensionMaterialDefinitionsImpl;

  factory TravelerAscensionMaterialDefinitions.fromJson(
          Map<String, dynamic> json) =
      _$TravelerAscensionMaterialDefinitionsImpl.fromJson;

  String get primary;
  String get local;
  String get secondary;
  @JsonKey(ignore: true)
  _$$TravelerAscensionMaterialDefinitionsImplCopyWith<
          _$TravelerAscensionMaterialDefinitionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TravelerTalentMaterialDefinitionsImplCopyWith<$Res> {
  factory _$$TravelerTalentMaterialDefinitionsImplCopyWith(
          _$TravelerTalentMaterialDefinitionsImpl value,
          $Res Function(_$TravelerTalentMaterialDefinitionsImpl) then) =
      __$$TravelerTalentMaterialDefinitionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {MaterialIdPerType talentPrimary,
      MaterialIdPerType talentSecondary,
      MaterialIdPerType talentBoss});

  $MaterialIdPerTypeCopyWith<$Res> get talentPrimary;
  $MaterialIdPerTypeCopyWith<$Res> get talentSecondary;
  $MaterialIdPerTypeCopyWith<$Res> get talentBoss;
}

/// @nodoc
class __$$TravelerTalentMaterialDefinitionsImplCopyWithImpl<$Res>
    extends _$CharacterMaterialDefinitionsCopyWithImpl<$Res,
        _$TravelerTalentMaterialDefinitionsImpl>
    implements _$$TravelerTalentMaterialDefinitionsImplCopyWith<$Res> {
  __$$TravelerTalentMaterialDefinitionsImplCopyWithImpl(
      _$TravelerTalentMaterialDefinitionsImpl _value,
      $Res Function(_$TravelerTalentMaterialDefinitionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? talentPrimary = null,
    Object? talentSecondary = null,
    Object? talentBoss = null,
  }) {
    return _then(_$TravelerTalentMaterialDefinitionsImpl(
      talentPrimary: null == talentPrimary
          ? _value.talentPrimary
          : talentPrimary // ignore: cast_nullable_to_non_nullable
              as MaterialIdPerType,
      talentSecondary: null == talentSecondary
          ? _value.talentSecondary
          : talentSecondary // ignore: cast_nullable_to_non_nullable
              as MaterialIdPerType,
      talentBoss: null == talentBoss
          ? _value.talentBoss
          : talentBoss // ignore: cast_nullable_to_non_nullable
              as MaterialIdPerType,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialIdPerTypeCopyWith<$Res> get talentPrimary {
    return $MaterialIdPerTypeCopyWith<$Res>(_value.talentPrimary, (value) {
      return _then(_value.copyWith(talentPrimary: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialIdPerTypeCopyWith<$Res> get talentSecondary {
    return $MaterialIdPerTypeCopyWith<$Res>(_value.talentSecondary, (value) {
      return _then(_value.copyWith(talentSecondary: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialIdPerTypeCopyWith<$Res> get talentBoss {
    return $MaterialIdPerTypeCopyWith<$Res>(_value.talentBoss, (value) {
      return _then(_value.copyWith(talentBoss: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelerTalentMaterialDefinitionsImpl
    implements TravelerTalentMaterialDefinitions {
  const _$TravelerTalentMaterialDefinitionsImpl(
      {required this.talentPrimary,
      required this.talentSecondary,
      required this.talentBoss,
      final String? $type})
      : $type = $type ?? 'travelerTalent';

  factory _$TravelerTalentMaterialDefinitionsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TravelerTalentMaterialDefinitionsImplFromJson(json);

  @override
  final MaterialIdPerType talentPrimary;
  @override
  final MaterialIdPerType talentSecondary;
  @override
  final MaterialIdPerType talentBoss;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CharacterMaterialDefinitions.travelerTalent(talentPrimary: $talentPrimary, talentSecondary: $talentSecondary, talentBoss: $talentBoss)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelerTalentMaterialDefinitionsImpl &&
            (identical(other.talentPrimary, talentPrimary) ||
                other.talentPrimary == talentPrimary) &&
            (identical(other.talentSecondary, talentSecondary) ||
                other.talentSecondary == talentSecondary) &&
            (identical(other.talentBoss, talentBoss) ||
                other.talentBoss == talentBoss));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, talentPrimary, talentSecondary, talentBoss);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelerTalentMaterialDefinitionsImplCopyWith<
          _$TravelerTalentMaterialDefinitionsImpl>
      get copyWith => __$$TravelerTalentMaterialDefinitionsImplCopyWithImpl<
          _$TravelerTalentMaterialDefinitionsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String primary, String elementalStone, String local,
            String secondary, String talentPrimary, String talentBoss)
        $default, {
    required TResult Function(String primary, String local, String secondary)
        travelerAscension,
    required TResult Function(MaterialIdPerType talentPrimary,
            MaterialIdPerType talentSecondary, MaterialIdPerType talentBoss)
        travelerTalent,
  }) {
    return travelerTalent(talentPrimary, talentSecondary, talentBoss);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String primary, String elementalStone, String local,
            String secondary, String talentPrimary, String talentBoss)?
        $default, {
    TResult? Function(String primary, String local, String secondary)?
        travelerAscension,
    TResult? Function(MaterialIdPerType talentPrimary,
            MaterialIdPerType talentSecondary, MaterialIdPerType talentBoss)?
        travelerTalent,
  }) {
    return travelerTalent?.call(talentPrimary, talentSecondary, talentBoss);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String primary, String elementalStone, String local,
            String secondary, String talentPrimary, String talentBoss)?
        $default, {
    TResult Function(String primary, String local, String secondary)?
        travelerAscension,
    TResult Function(MaterialIdPerType talentPrimary,
            MaterialIdPerType talentSecondary, MaterialIdPerType talentBoss)?
        travelerTalent,
    required TResult orElse(),
  }) {
    if (travelerTalent != null) {
      return travelerTalent(talentPrimary, talentSecondary, talentBoss);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CharacterMaterialDefinitions value) $default, {
    required TResult Function(TravelerAscensionMaterialDefinitions value)
        travelerAscension,
    required TResult Function(TravelerTalentMaterialDefinitions value)
        travelerTalent,
  }) {
    return travelerTalent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CharacterMaterialDefinitions value)? $default, {
    TResult? Function(TravelerAscensionMaterialDefinitions value)?
        travelerAscension,
    TResult? Function(TravelerTalentMaterialDefinitions value)? travelerTalent,
  }) {
    return travelerTalent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CharacterMaterialDefinitions value)? $default, {
    TResult Function(TravelerAscensionMaterialDefinitions value)?
        travelerAscension,
    TResult Function(TravelerTalentMaterialDefinitions value)? travelerTalent,
    required TResult orElse(),
  }) {
    if (travelerTalent != null) {
      return travelerTalent(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelerTalentMaterialDefinitionsImplToJson(
      this,
    );
  }
}

abstract class TravelerTalentMaterialDefinitions
    implements CharacterMaterialDefinitions {
  const factory TravelerTalentMaterialDefinitions(
          {required final MaterialIdPerType talentPrimary,
          required final MaterialIdPerType talentSecondary,
          required final MaterialIdPerType talentBoss}) =
      _$TravelerTalentMaterialDefinitionsImpl;

  factory TravelerTalentMaterialDefinitions.fromJson(
          Map<String, dynamic> json) =
      _$TravelerTalentMaterialDefinitionsImpl.fromJson;

  MaterialIdPerType get talentPrimary;
  MaterialIdPerType get talentSecondary;
  MaterialIdPerType get talentBoss;
  @JsonKey(ignore: true)
  _$$TravelerTalentMaterialDefinitionsImplCopyWith<
          _$TravelerTalentMaterialDefinitionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MaterialIdPerType _$MaterialIdPerTypeFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'byLevel':
      return MaterialIdPerLevelPerType.fromJson(json);

    default:
      return _MaterialIdPerType.fromJson(json);
  }
}

/// @nodoc
mixin _$MaterialIdPerType {
  Map<TalentType, Object> get types => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<TalentType, String> types) $default, {
    required TResult Function(Map<TalentType, MaterialIdPerLevel> types)
        byLevel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Map<TalentType, String> types)? $default, {
    TResult? Function(Map<TalentType, MaterialIdPerLevel> types)? byLevel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<TalentType, String> types)? $default, {
    TResult Function(Map<TalentType, MaterialIdPerLevel> types)? byLevel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MaterialIdPerType value) $default, {
    required TResult Function(MaterialIdPerLevelPerType value) byLevel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MaterialIdPerType value)? $default, {
    TResult? Function(MaterialIdPerLevelPerType value)? byLevel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MaterialIdPerType value)? $default, {
    TResult Function(MaterialIdPerLevelPerType value)? byLevel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialIdPerTypeCopyWith<$Res> {
  factory $MaterialIdPerTypeCopyWith(
          MaterialIdPerType value, $Res Function(MaterialIdPerType) then) =
      _$MaterialIdPerTypeCopyWithImpl<$Res, MaterialIdPerType>;
}

/// @nodoc
class _$MaterialIdPerTypeCopyWithImpl<$Res, $Val extends MaterialIdPerType>
    implements $MaterialIdPerTypeCopyWith<$Res> {
  _$MaterialIdPerTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MaterialIdPerTypeImplCopyWith<$Res> {
  factory _$$MaterialIdPerTypeImplCopyWith(_$MaterialIdPerTypeImpl value,
          $Res Function(_$MaterialIdPerTypeImpl) then) =
      __$$MaterialIdPerTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<TalentType, String> types});
}

/// @nodoc
class __$$MaterialIdPerTypeImplCopyWithImpl<$Res>
    extends _$MaterialIdPerTypeCopyWithImpl<$Res, _$MaterialIdPerTypeImpl>
    implements _$$MaterialIdPerTypeImplCopyWith<$Res> {
  __$$MaterialIdPerTypeImplCopyWithImpl(_$MaterialIdPerTypeImpl _value,
      $Res Function(_$MaterialIdPerTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? types = null,
  }) {
    return _then(_$MaterialIdPerTypeImpl(
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as Map<TalentType, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialIdPerTypeImpl implements _MaterialIdPerType {
  const _$MaterialIdPerTypeImpl(
      {required final Map<TalentType, String> types, final String? $type})
      : _types = types,
        $type = $type ?? 'default';

  factory _$MaterialIdPerTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialIdPerTypeImplFromJson(json);

  final Map<TalentType, String> _types;
  @override
  Map<TalentType, String> get types {
    if (_types is EqualUnmodifiableMapView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_types);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MaterialIdPerType(types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialIdPerTypeImpl &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialIdPerTypeImplCopyWith<_$MaterialIdPerTypeImpl> get copyWith =>
      __$$MaterialIdPerTypeImplCopyWithImpl<_$MaterialIdPerTypeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<TalentType, String> types) $default, {
    required TResult Function(Map<TalentType, MaterialIdPerLevel> types)
        byLevel,
  }) {
    return $default(types);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Map<TalentType, String> types)? $default, {
    TResult? Function(Map<TalentType, MaterialIdPerLevel> types)? byLevel,
  }) {
    return $default?.call(types);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<TalentType, String> types)? $default, {
    TResult Function(Map<TalentType, MaterialIdPerLevel> types)? byLevel,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(types);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MaterialIdPerType value) $default, {
    required TResult Function(MaterialIdPerLevelPerType value) byLevel,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MaterialIdPerType value)? $default, {
    TResult? Function(MaterialIdPerLevelPerType value)? byLevel,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MaterialIdPerType value)? $default, {
    TResult Function(MaterialIdPerLevelPerType value)? byLevel,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialIdPerTypeImplToJson(
      this,
    );
  }
}

abstract class _MaterialIdPerType implements MaterialIdPerType {
  const factory _MaterialIdPerType(
      {required final Map<TalentType, String> types}) = _$MaterialIdPerTypeImpl;

  factory _MaterialIdPerType.fromJson(Map<String, dynamic> json) =
      _$MaterialIdPerTypeImpl.fromJson;

  @override
  Map<TalentType, String> get types;
  @JsonKey(ignore: true)
  _$$MaterialIdPerTypeImplCopyWith<_$MaterialIdPerTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MaterialIdPerLevelPerTypeImplCopyWith<$Res> {
  factory _$$MaterialIdPerLevelPerTypeImplCopyWith(
          _$MaterialIdPerLevelPerTypeImpl value,
          $Res Function(_$MaterialIdPerLevelPerTypeImpl) then) =
      __$$MaterialIdPerLevelPerTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<TalentType, MaterialIdPerLevel> types});
}

/// @nodoc
class __$$MaterialIdPerLevelPerTypeImplCopyWithImpl<$Res>
    extends _$MaterialIdPerTypeCopyWithImpl<$Res,
        _$MaterialIdPerLevelPerTypeImpl>
    implements _$$MaterialIdPerLevelPerTypeImplCopyWith<$Res> {
  __$$MaterialIdPerLevelPerTypeImplCopyWithImpl(
      _$MaterialIdPerLevelPerTypeImpl _value,
      $Res Function(_$MaterialIdPerLevelPerTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? types = null,
  }) {
    return _then(_$MaterialIdPerLevelPerTypeImpl(
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as Map<TalentType, MaterialIdPerLevel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialIdPerLevelPerTypeImpl implements MaterialIdPerLevelPerType {
  const _$MaterialIdPerLevelPerTypeImpl(
      {required final Map<TalentType, MaterialIdPerLevel> types,
      final String? $type})
      : _types = types,
        $type = $type ?? 'byLevel';

  factory _$MaterialIdPerLevelPerTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialIdPerLevelPerTypeImplFromJson(json);

  final Map<TalentType, MaterialIdPerLevel> _types;
  @override
  Map<TalentType, MaterialIdPerLevel> get types {
    if (_types is EqualUnmodifiableMapView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_types);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MaterialIdPerType.byLevel(types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialIdPerLevelPerTypeImpl &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialIdPerLevelPerTypeImplCopyWith<_$MaterialIdPerLevelPerTypeImpl>
      get copyWith => __$$MaterialIdPerLevelPerTypeImplCopyWithImpl<
          _$MaterialIdPerLevelPerTypeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<TalentType, String> types) $default, {
    required TResult Function(Map<TalentType, MaterialIdPerLevel> types)
        byLevel,
  }) {
    return byLevel(types);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Map<TalentType, String> types)? $default, {
    TResult? Function(Map<TalentType, MaterialIdPerLevel> types)? byLevel,
  }) {
    return byLevel?.call(types);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<TalentType, String> types)? $default, {
    TResult Function(Map<TalentType, MaterialIdPerLevel> types)? byLevel,
    required TResult orElse(),
  }) {
    if (byLevel != null) {
      return byLevel(types);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MaterialIdPerType value) $default, {
    required TResult Function(MaterialIdPerLevelPerType value) byLevel,
  }) {
    return byLevel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MaterialIdPerType value)? $default, {
    TResult? Function(MaterialIdPerLevelPerType value)? byLevel,
  }) {
    return byLevel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MaterialIdPerType value)? $default, {
    TResult Function(MaterialIdPerLevelPerType value)? byLevel,
    required TResult orElse(),
  }) {
    if (byLevel != null) {
      return byLevel(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialIdPerLevelPerTypeImplToJson(
      this,
    );
  }
}

abstract class MaterialIdPerLevelPerType implements MaterialIdPerType {
  const factory MaterialIdPerLevelPerType(
          {required final Map<TalentType, MaterialIdPerLevel> types}) =
      _$MaterialIdPerLevelPerTypeImpl;

  factory MaterialIdPerLevelPerType.fromJson(Map<String, dynamic> json) =
      _$MaterialIdPerLevelPerTypeImpl.fromJson;

  @override
  Map<TalentType, MaterialIdPerLevel> get types;
  @JsonKey(ignore: true)
  _$$MaterialIdPerLevelPerTypeImplCopyWith<_$MaterialIdPerLevelPerTypeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MaterialIdPerLevel _$MaterialIdPerLevelFromJson(Map<String, dynamic> json) {
  return _MaterialIdPerLevel.fromJson(json);
}

/// @nodoc
mixin _$MaterialIdPerLevel {
  Map<int, String> get levels => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialIdPerLevelCopyWith<MaterialIdPerLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialIdPerLevelCopyWith<$Res> {
  factory $MaterialIdPerLevelCopyWith(
          MaterialIdPerLevel value, $Res Function(MaterialIdPerLevel) then) =
      _$MaterialIdPerLevelCopyWithImpl<$Res, MaterialIdPerLevel>;
  @useResult
  $Res call({Map<int, String> levels});
}

/// @nodoc
class _$MaterialIdPerLevelCopyWithImpl<$Res, $Val extends MaterialIdPerLevel>
    implements $MaterialIdPerLevelCopyWith<$Res> {
  _$MaterialIdPerLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levels = null,
  }) {
    return _then(_value.copyWith(
      levels: null == levels
          ? _value.levels
          : levels // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialIdPerLevelImplCopyWith<$Res>
    implements $MaterialIdPerLevelCopyWith<$Res> {
  factory _$$MaterialIdPerLevelImplCopyWith(_$MaterialIdPerLevelImpl value,
          $Res Function(_$MaterialIdPerLevelImpl) then) =
      __$$MaterialIdPerLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<int, String> levels});
}

/// @nodoc
class __$$MaterialIdPerLevelImplCopyWithImpl<$Res>
    extends _$MaterialIdPerLevelCopyWithImpl<$Res, _$MaterialIdPerLevelImpl>
    implements _$$MaterialIdPerLevelImplCopyWith<$Res> {
  __$$MaterialIdPerLevelImplCopyWithImpl(_$MaterialIdPerLevelImpl _value,
      $Res Function(_$MaterialIdPerLevelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levels = null,
  }) {
    return _then(_$MaterialIdPerLevelImpl(
      levels: null == levels
          ? _value._levels
          : levels // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialIdPerLevelImpl implements _MaterialIdPerLevel {
  const _$MaterialIdPerLevelImpl({required final Map<int, String> levels})
      : _levels = levels;

  factory _$MaterialIdPerLevelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialIdPerLevelImplFromJson(json);

  final Map<int, String> _levels;
  @override
  Map<int, String> get levels {
    if (_levels is EqualUnmodifiableMapView) return _levels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_levels);
  }

  @override
  String toString() {
    return 'MaterialIdPerLevel(levels: $levels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialIdPerLevelImpl &&
            const DeepCollectionEquality().equals(other._levels, _levels));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_levels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialIdPerLevelImplCopyWith<_$MaterialIdPerLevelImpl> get copyWith =>
      __$$MaterialIdPerLevelImplCopyWithImpl<_$MaterialIdPerLevelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialIdPerLevelImplToJson(
      this,
    );
  }
}

abstract class _MaterialIdPerLevel implements MaterialIdPerLevel {
  const factory _MaterialIdPerLevel({required final Map<int, String> levels}) =
      _$MaterialIdPerLevelImpl;

  factory _MaterialIdPerLevel.fromJson(Map<String, dynamic> json) =
      _$MaterialIdPerLevelImpl.fromJson;

  @override
  Map<int, String> get levels;
  @override
  @JsonKey(ignore: true)
  _$$MaterialIdPerLevelImplCopyWith<_$MaterialIdPerLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
