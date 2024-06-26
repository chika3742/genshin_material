// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artifact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtifactSet _$ArtifactSetFromJson(Map<String, dynamic> json) {
  return _ArtifactSet.fromJson(json);
}

/// @nodoc
mixin _$ArtifactSet {
  String get id => throw _privateConstructorUsedError;
  LocalizedText get name => throw _privateConstructorUsedError;
  int get maxRarity => throw _privateConstructorUsedError;
  List<ArtifactPiece> get consistsOf => throw _privateConstructorUsedError;
  List<ArtifactBonus> get bonuses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtifactSetCopyWith<ArtifactSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactSetCopyWith<$Res> {
  factory $ArtifactSetCopyWith(
          ArtifactSet value, $Res Function(ArtifactSet) then) =
      _$ArtifactSetCopyWithImpl<$Res, ArtifactSet>;
  @useResult
  $Res call(
      {String id,
      LocalizedText name,
      int maxRarity,
      List<ArtifactPiece> consistsOf,
      List<ArtifactBonus> bonuses});

  $LocalizedTextCopyWith<$Res> get name;
}

/// @nodoc
class _$ArtifactSetCopyWithImpl<$Res, $Val extends ArtifactSet>
    implements $ArtifactSetCopyWith<$Res> {
  _$ArtifactSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? maxRarity = null,
    Object? consistsOf = null,
    Object? bonuses = null,
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
      maxRarity: null == maxRarity
          ? _value.maxRarity
          : maxRarity // ignore: cast_nullable_to_non_nullable
              as int,
      consistsOf: null == consistsOf
          ? _value.consistsOf
          : consistsOf // ignore: cast_nullable_to_non_nullable
              as List<ArtifactPiece>,
      bonuses: null == bonuses
          ? _value.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<ArtifactBonus>,
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
abstract class _$$ArtifactSetImplCopyWith<$Res>
    implements $ArtifactSetCopyWith<$Res> {
  factory _$$ArtifactSetImplCopyWith(
          _$ArtifactSetImpl value, $Res Function(_$ArtifactSetImpl) then) =
      __$$ArtifactSetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      LocalizedText name,
      int maxRarity,
      List<ArtifactPiece> consistsOf,
      List<ArtifactBonus> bonuses});

  @override
  $LocalizedTextCopyWith<$Res> get name;
}

/// @nodoc
class __$$ArtifactSetImplCopyWithImpl<$Res>
    extends _$ArtifactSetCopyWithImpl<$Res, _$ArtifactSetImpl>
    implements _$$ArtifactSetImplCopyWith<$Res> {
  __$$ArtifactSetImplCopyWithImpl(
      _$ArtifactSetImpl _value, $Res Function(_$ArtifactSetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? maxRarity = null,
    Object? consistsOf = null,
    Object? bonuses = null,
  }) {
    return _then(_$ArtifactSetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
      maxRarity: null == maxRarity
          ? _value.maxRarity
          : maxRarity // ignore: cast_nullable_to_non_nullable
              as int,
      consistsOf: null == consistsOf
          ? _value._consistsOf
          : consistsOf // ignore: cast_nullable_to_non_nullable
              as List<ArtifactPiece>,
      bonuses: null == bonuses
          ? _value._bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<ArtifactBonus>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtifactSetImpl implements _ArtifactSet {
  const _$ArtifactSetImpl(
      {required this.id,
      required this.name,
      required this.maxRarity,
      required final List<ArtifactPiece> consistsOf,
      required final List<ArtifactBonus> bonuses})
      : _consistsOf = consistsOf,
        _bonuses = bonuses;

  factory _$ArtifactSetImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtifactSetImplFromJson(json);

  @override
  final String id;
  @override
  final LocalizedText name;
  @override
  final int maxRarity;
  final List<ArtifactPiece> _consistsOf;
  @override
  List<ArtifactPiece> get consistsOf {
    if (_consistsOf is EqualUnmodifiableListView) return _consistsOf;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_consistsOf);
  }

  final List<ArtifactBonus> _bonuses;
  @override
  List<ArtifactBonus> get bonuses {
    if (_bonuses is EqualUnmodifiableListView) return _bonuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonuses);
  }

  @override
  String toString() {
    return 'ArtifactSet(id: $id, name: $name, maxRarity: $maxRarity, consistsOf: $consistsOf, bonuses: $bonuses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtifactSetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.maxRarity, maxRarity) ||
                other.maxRarity == maxRarity) &&
            const DeepCollectionEquality()
                .equals(other._consistsOf, _consistsOf) &&
            const DeepCollectionEquality().equals(other._bonuses, _bonuses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      maxRarity,
      const DeepCollectionEquality().hash(_consistsOf),
      const DeepCollectionEquality().hash(_bonuses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtifactSetImplCopyWith<_$ArtifactSetImpl> get copyWith =>
      __$$ArtifactSetImplCopyWithImpl<_$ArtifactSetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtifactSetImplToJson(
      this,
    );
  }
}

abstract class _ArtifactSet implements ArtifactSet {
  const factory _ArtifactSet(
      {required final String id,
      required final LocalizedText name,
      required final int maxRarity,
      required final List<ArtifactPiece> consistsOf,
      required final List<ArtifactBonus> bonuses}) = _$ArtifactSetImpl;

  factory _ArtifactSet.fromJson(Map<String, dynamic> json) =
      _$ArtifactSetImpl.fromJson;

  @override
  String get id;
  @override
  LocalizedText get name;
  @override
  int get maxRarity;
  @override
  List<ArtifactPiece> get consistsOf;
  @override
  List<ArtifactBonus> get bonuses;
  @override
  @JsonKey(ignore: true)
  _$$ArtifactSetImplCopyWith<_$ArtifactSetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArtifactPiece _$ArtifactPieceFromJson(Map<String, dynamic> json) {
  return _ArtifactPiece.fromJson(json);
}

/// @nodoc
mixin _$ArtifactPiece {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  LocalizedText get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtifactPieceCopyWith<ArtifactPiece> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactPieceCopyWith<$Res> {
  factory $ArtifactPieceCopyWith(
          ArtifactPiece value, $Res Function(ArtifactPiece) then) =
      _$ArtifactPieceCopyWithImpl<$Res, ArtifactPiece>;
  @useResult
  $Res call({String id, String type, String imageUrl, LocalizedText name});

  $LocalizedTextCopyWith<$Res> get name;
}

/// @nodoc
class _$ArtifactPieceCopyWithImpl<$Res, $Val extends ArtifactPiece>
    implements $ArtifactPieceCopyWith<$Res> {
  _$ArtifactPieceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? imageUrl = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$ArtifactPieceImplCopyWith<$Res>
    implements $ArtifactPieceCopyWith<$Res> {
  factory _$$ArtifactPieceImplCopyWith(
          _$ArtifactPieceImpl value, $Res Function(_$ArtifactPieceImpl) then) =
      __$$ArtifactPieceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String type, String imageUrl, LocalizedText name});

  @override
  $LocalizedTextCopyWith<$Res> get name;
}

/// @nodoc
class __$$ArtifactPieceImplCopyWithImpl<$Res>
    extends _$ArtifactPieceCopyWithImpl<$Res, _$ArtifactPieceImpl>
    implements _$$ArtifactPieceImplCopyWith<$Res> {
  __$$ArtifactPieceImplCopyWithImpl(
      _$ArtifactPieceImpl _value, $Res Function(_$ArtifactPieceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? imageUrl = null,
    Object? name = null,
  }) {
    return _then(_$ArtifactPieceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtifactPieceImpl extends _ArtifactPiece {
  const _$ArtifactPieceImpl(
      {required this.id,
      required this.type,
      required this.imageUrl,
      required this.name})
      : super._();

  factory _$ArtifactPieceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtifactPieceImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String imageUrl;
  @override
  final LocalizedText name;

  @override
  String toString() {
    return 'ArtifactPiece(id: $id, type: $type, imageUrl: $imageUrl, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtifactPieceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, imageUrl, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtifactPieceImplCopyWith<_$ArtifactPieceImpl> get copyWith =>
      __$$ArtifactPieceImplCopyWithImpl<_$ArtifactPieceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtifactPieceImplToJson(
      this,
    );
  }
}

abstract class _ArtifactPiece extends ArtifactPiece {
  const factory _ArtifactPiece(
      {required final String id,
      required final String type,
      required final String imageUrl,
      required final LocalizedText name}) = _$ArtifactPieceImpl;
  const _ArtifactPiece._() : super._();

  factory _ArtifactPiece.fromJson(Map<String, dynamic> json) =
      _$ArtifactPieceImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get imageUrl;
  @override
  LocalizedText get name;
  @override
  @JsonKey(ignore: true)
  _$$ArtifactPieceImplCopyWith<_$ArtifactPieceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArtifactBonus _$ArtifactBonusFromJson(Map<String, dynamic> json) {
  return _ArtifactBonus.fromJson(json);
}

/// @nodoc
mixin _$ArtifactBonus {
  String get type => throw _privateConstructorUsedError;
  LocalizedText get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtifactBonusCopyWith<ArtifactBonus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactBonusCopyWith<$Res> {
  factory $ArtifactBonusCopyWith(
          ArtifactBonus value, $Res Function(ArtifactBonus) then) =
      _$ArtifactBonusCopyWithImpl<$Res, ArtifactBonus>;
  @useResult
  $Res call({String type, LocalizedText description});

  $LocalizedTextCopyWith<$Res> get description;
}

/// @nodoc
class _$ArtifactBonusCopyWithImpl<$Res, $Val extends ArtifactBonus>
    implements $ArtifactBonusCopyWith<$Res> {
  _$ArtifactBonusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalizedTextCopyWith<$Res> get description {
    return $LocalizedTextCopyWith<$Res>(_value.description, (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtifactBonusImplCopyWith<$Res>
    implements $ArtifactBonusCopyWith<$Res> {
  factory _$$ArtifactBonusImplCopyWith(
          _$ArtifactBonusImpl value, $Res Function(_$ArtifactBonusImpl) then) =
      __$$ArtifactBonusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, LocalizedText description});

  @override
  $LocalizedTextCopyWith<$Res> get description;
}

/// @nodoc
class __$$ArtifactBonusImplCopyWithImpl<$Res>
    extends _$ArtifactBonusCopyWithImpl<$Res, _$ArtifactBonusImpl>
    implements _$$ArtifactBonusImplCopyWith<$Res> {
  __$$ArtifactBonusImplCopyWithImpl(
      _$ArtifactBonusImpl _value, $Res Function(_$ArtifactBonusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? description = null,
  }) {
    return _then(_$ArtifactBonusImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtifactBonusImpl implements _ArtifactBonus {
  const _$ArtifactBonusImpl({required this.type, required this.description});

  factory _$ArtifactBonusImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtifactBonusImplFromJson(json);

  @override
  final String type;
  @override
  final LocalizedText description;

  @override
  String toString() {
    return 'ArtifactBonus(type: $type, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtifactBonusImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtifactBonusImplCopyWith<_$ArtifactBonusImpl> get copyWith =>
      __$$ArtifactBonusImplCopyWithImpl<_$ArtifactBonusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtifactBonusImplToJson(
      this,
    );
  }
}

abstract class _ArtifactBonus implements ArtifactBonus {
  const factory _ArtifactBonus(
      {required final String type,
      required final LocalizedText description}) = _$ArtifactBonusImpl;

  factory _ArtifactBonus.fromJson(Map<String, dynamic> json) =
      _$ArtifactBonusImpl.fromJson;

  @override
  String get type;
  @override
  LocalizedText get description;
  @override
  @JsonKey(ignore: true)
  _$$ArtifactBonusImplCopyWith<_$ArtifactBonusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArtifactsMeta _$ArtifactsMetaFromJson(Map<String, dynamic> json) {
  return _ArtifactsMeta.fromJson(json);
}

/// @nodoc
mixin _$ArtifactsMeta {
  Map<String, LocalizedText> get pieceTypes =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtifactsMetaCopyWith<ArtifactsMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactsMetaCopyWith<$Res> {
  factory $ArtifactsMetaCopyWith(
          ArtifactsMeta value, $Res Function(ArtifactsMeta) then) =
      _$ArtifactsMetaCopyWithImpl<$Res, ArtifactsMeta>;
  @useResult
  $Res call({Map<String, LocalizedText> pieceTypes});
}

/// @nodoc
class _$ArtifactsMetaCopyWithImpl<$Res, $Val extends ArtifactsMeta>
    implements $ArtifactsMetaCopyWith<$Res> {
  _$ArtifactsMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pieceTypes = null,
  }) {
    return _then(_value.copyWith(
      pieceTypes: null == pieceTypes
          ? _value.pieceTypes
          : pieceTypes // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalizedText>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtifactsMetaImplCopyWith<$Res>
    implements $ArtifactsMetaCopyWith<$Res> {
  factory _$$ArtifactsMetaImplCopyWith(
          _$ArtifactsMetaImpl value, $Res Function(_$ArtifactsMetaImpl) then) =
      __$$ArtifactsMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, LocalizedText> pieceTypes});
}

/// @nodoc
class __$$ArtifactsMetaImplCopyWithImpl<$Res>
    extends _$ArtifactsMetaCopyWithImpl<$Res, _$ArtifactsMetaImpl>
    implements _$$ArtifactsMetaImplCopyWith<$Res> {
  __$$ArtifactsMetaImplCopyWithImpl(
      _$ArtifactsMetaImpl _value, $Res Function(_$ArtifactsMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pieceTypes = null,
  }) {
    return _then(_$ArtifactsMetaImpl(
      pieceTypes: null == pieceTypes
          ? _value._pieceTypes
          : pieceTypes // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalizedText>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtifactsMetaImpl implements _ArtifactsMeta {
  const _$ArtifactsMetaImpl(
      {required final Map<String, LocalizedText> pieceTypes})
      : _pieceTypes = pieceTypes;

  factory _$ArtifactsMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtifactsMetaImplFromJson(json);

  final Map<String, LocalizedText> _pieceTypes;
  @override
  Map<String, LocalizedText> get pieceTypes {
    if (_pieceTypes is EqualUnmodifiableMapView) return _pieceTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pieceTypes);
  }

  @override
  String toString() {
    return 'ArtifactsMeta(pieceTypes: $pieceTypes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtifactsMetaImpl &&
            const DeepCollectionEquality()
                .equals(other._pieceTypes, _pieceTypes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_pieceTypes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtifactsMetaImplCopyWith<_$ArtifactsMetaImpl> get copyWith =>
      __$$ArtifactsMetaImplCopyWithImpl<_$ArtifactsMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtifactsMetaImplToJson(
      this,
    );
  }
}

abstract class _ArtifactsMeta implements ArtifactsMeta {
  const factory _ArtifactsMeta(
          {required final Map<String, LocalizedText> pieceTypes}) =
      _$ArtifactsMetaImpl;

  factory _ArtifactsMeta.fromJson(Map<String, dynamic> json) =
      _$ArtifactsMetaImpl.fromJson;

  @override
  Map<String, LocalizedText> get pieceTypes;
  @override
  @JsonKey(ignore: true)
  _$$ArtifactsMetaImplCopyWith<_$ArtifactsMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
