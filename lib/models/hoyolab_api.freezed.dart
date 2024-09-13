// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hoyolab_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HoyolabApiResult<T> _$HoyolabApiResultFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _HoyolabApiResult<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$HoyolabApiResult<T> {
  int get retcode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;

  /// Serializes this HoyolabApiResult to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$HoyolabApiResultImpl<T> extends _HoyolabApiResult<T> {
  const _$HoyolabApiResultImpl(
      {required this.retcode, required this.message, this.data})
      : super._();

  factory _$HoyolabApiResultImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$HoyolabApiResultImplFromJson(json, fromJsonT);

  @override
  final int retcode;
  @override
  final String message;
  @override
  final T? data;

  @override
  String toString() {
    return 'HoyolabApiResult<$T>(retcode: $retcode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HoyolabApiResultImpl<T> &&
            (identical(other.retcode, retcode) || other.retcode == retcode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, retcode, message, const DeepCollectionEquality().hash(data));

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$HoyolabApiResultImplToJson<T>(this, toJsonT);
  }
}

abstract class _HoyolabApiResult<T> extends HoyolabApiResult<T> {
  const factory _HoyolabApiResult(
      {required final int retcode,
      required final String message,
      final T? data}) = _$HoyolabApiResultImpl<T>;
  const _HoyolabApiResult._() : super._();

  factory _HoyolabApiResult.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$HoyolabApiResultImpl<T>.fromJson;

  @override
  int get retcode;
  @override
  String get message;
  @override
  T? get data;
}

HoyolabListData<T> _$HoyolabListDataFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _HoyolabListData<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$HoyolabListData<T> {
  List<T> get list => throw _privateConstructorUsedError;

  /// Serializes this HoyolabListData to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$HoyolabListDataImpl<T> implements _HoyolabListData<T> {
  const _$HoyolabListDataImpl({required final List<T> list}) : _list = list;

  factory _$HoyolabListDataImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$HoyolabListDataImplFromJson(json, fromJsonT);

  final List<T> _list;
  @override
  List<T> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'HoyolabListData<$T>(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HoyolabListDataImpl<T> &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$HoyolabListDataImplToJson<T>(this, toJsonT);
  }
}

abstract class _HoyolabListData<T> implements HoyolabListData<T> {
  const factory _HoyolabListData({required final List<T> list}) =
      _$HoyolabListDataImpl<T>;

  factory _HoyolabListData.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$HoyolabListDataImpl<T>.fromJson;

  @override
  List<T> get list;
}

HyvServer _$HyvServerFromJson(Map<String, dynamic> json) {
  return _HyvServer.fromJson(json);
}

/// @nodoc
mixin _$HyvServer {
  String get region => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this HyvServer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$HyvServerImpl implements _HyvServer {
  const _$HyvServerImpl({required this.region, required this.name});

  factory _$HyvServerImpl.fromJson(Map<String, dynamic> json) =>
      _$$HyvServerImplFromJson(json);

  @override
  final String region;
  @override
  final String name;

  @override
  String toString() {
    return 'HyvServer(region: $region, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HyvServerImpl &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, region, name);

  @override
  Map<String, dynamic> toJson() {
    return _$$HyvServerImplToJson(
      this,
    );
  }
}

abstract class _HyvServer implements HyvServer {
  const factory _HyvServer(
      {required final String region,
      required final String name}) = _$HyvServerImpl;

  factory _HyvServer.fromJson(Map<String, dynamic> json) =
      _$HyvServerImpl.fromJson;

  @override
  String get region;
  @override
  String get name;
}

HyvUserInfo _$HyvUserInfoFromJson(Map<String, dynamic> json) {
  return _HyvUserInfo.fromJson(json);
}

/// @nodoc
mixin _$HyvUserInfo {
// workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @JsonKey(name: "account_name")
  String get accountName => throw _privateConstructorUsedError;

  /// Serializes this HyvUserInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$HyvUserInfoImpl implements _HyvUserInfo {
  const _$HyvUserInfoImpl(
      {@JsonKey(name: "account_name") required this.accountName});

  factory _$HyvUserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$HyvUserInfoImplFromJson(json);

// workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "account_name")
  final String accountName;

  @override
  String toString() {
    return 'HyvUserInfo(accountName: $accountName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HyvUserInfoImpl &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accountName);

  @override
  Map<String, dynamic> toJson() {
    return _$$HyvUserInfoImplToJson(
      this,
    );
  }
}

abstract class _HyvUserInfo implements HyvUserInfo {
  const factory _HyvUserInfo(
          {@JsonKey(name: "account_name") required final String accountName}) =
      _$HyvUserInfoImpl;

  factory _HyvUserInfo.fromJson(Map<String, dynamic> json) =
      _$HyvUserInfoImpl.fromJson;

// workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "account_name")
  String get accountName;
}

HyvUserGameRole _$HyvUserGameRoleFromJson(Map<String, dynamic> json) {
  return _HyvUserGameRole.fromJson(json);
}

/// @nodoc
mixin _$HyvUserGameRole {
// workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @JsonKey(name: "game_uid")
  String get uid => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;

  /// Serializes this HyvUserGameRole to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$HyvUserGameRoleImpl implements _HyvUserGameRole {
  const _$HyvUserGameRoleImpl(
      {@JsonKey(name: "game_uid") required this.uid,
      required this.nickname,
      required this.level});

  factory _$HyvUserGameRoleImpl.fromJson(Map<String, dynamic> json) =>
      _$$HyvUserGameRoleImplFromJson(json);

// workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "game_uid")
  final String uid;
  @override
  final String nickname;
  @override
  final int level;

  @override
  String toString() {
    return 'HyvUserGameRole(uid: $uid, nickname: $nickname, level: $level)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HyvUserGameRoleImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uid, nickname, level);

  @override
  Map<String, dynamic> toJson() {
    return _$$HyvUserGameRoleImplToJson(
      this,
    );
  }
}

abstract class _HyvUserGameRole implements HyvUserGameRole {
  const factory _HyvUserGameRole(
      {@JsonKey(name: "game_uid") required final String uid,
      required final String nickname,
      required final int level}) = _$HyvUserGameRoleImpl;

  factory _HyvUserGameRole.fromJson(Map<String, dynamic> json) =
      _$HyvUserGameRoleImpl.fromJson;

// workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "game_uid")
  String get uid;
  @override
  String get nickname;
  @override
  int get level;
}

AvatarListResultItem _$AvatarListResultItemFromJson(Map<String, dynamic> json) {
  return _AvatarListResultItem.fromJson(json);
}

/// @nodoc
mixin _$AvatarListResultItem {
  int get id => throw _privateConstructorUsedError;
  String get name =>
      throw _privateConstructorUsedError; // workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @JsonKey(name: "level_current")
  String get currentLevel =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "max_level")
  int get maxLevel => throw _privateConstructorUsedError;

  /// Serializes this AvatarListResultItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$AvatarListResultItemImpl extends _AvatarListResultItem {
  const _$AvatarListResultItemImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: "level_current") required this.currentLevel,
      @JsonKey(name: "max_level") required this.maxLevel})
      : super._();

  factory _$AvatarListResultItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarListResultItemImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
// workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "level_current")
  final String currentLevel;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "max_level")
  final int maxLevel;

  @override
  String toString() {
    return 'AvatarListResultItem(id: $id, name: $name, currentLevel: $currentLevel, maxLevel: $maxLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarListResultItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            (identical(other.maxLevel, maxLevel) ||
                other.maxLevel == maxLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, currentLevel, maxLevel);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvatarListResultItemImplToJson(
      this,
    );
  }
}

abstract class _AvatarListResultItem extends AvatarListResultItem {
  const factory _AvatarListResultItem(
          {required final int id,
          required final String name,
          @JsonKey(name: "level_current") required final String currentLevel,
          @JsonKey(name: "max_level") required final int maxLevel}) =
      _$AvatarListResultItemImpl;
  const _AvatarListResultItem._() : super._();

  factory _AvatarListResultItem.fromJson(Map<String, dynamic> json) =
      _$AvatarListResultItemImpl.fromJson;

  @override
  int get id;
  @override
  String
      get name; // workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "level_current")
  String get currentLevel; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: "max_level")
  int get maxLevel;
}

AvatarDetail _$AvatarDetailFromJson(Map<String, dynamic> json) {
  return _AvatarDetail.fromJson(json);
}

/// @nodoc
mixin _$AvatarDetail {
// ignore: invalid_annotation_target
  @JsonKey(name: "skill_list")
  List<AvatarDetailSkill> get skills => throw _privateConstructorUsedError;

  /// Serializes this AvatarDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$AvatarDetailImpl implements _AvatarDetail {
  const _$AvatarDetailImpl(
      {@JsonKey(name: "skill_list")
      required final List<AvatarDetailSkill> skills})
      : _skills = skills;

  factory _$AvatarDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarDetailImplFromJson(json);

// ignore: invalid_annotation_target
  final List<AvatarDetailSkill> _skills;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "skill_list")
  List<AvatarDetailSkill> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  String toString() {
    return 'AvatarDetail(skills: $skills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarDetailImpl &&
            const DeepCollectionEquality().equals(other._skills, _skills));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_skills));

  @override
  Map<String, dynamic> toJson() {
    return _$$AvatarDetailImplToJson(
      this,
    );
  }
}

abstract class _AvatarDetail implements AvatarDetail {
  const factory _AvatarDetail(
      {@JsonKey(name: "skill_list")
      required final List<AvatarDetailSkill> skills}) = _$AvatarDetailImpl;

  factory _AvatarDetail.fromJson(Map<String, dynamic> json) =
      _$AvatarDetailImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "skill_list")
  List<AvatarDetailSkill> get skills;
}

AvatarDetailSkill _$AvatarDetailSkillFromJson(Map<String, dynamic> json) {
  return _AvatarDetailSkill.fromJson(json);
}

/// @nodoc
mixin _$AvatarDetailSkill {
// ignore: invalid_annotation_target
  @JsonKey(name: "max_level")
  int get maxLevel =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "level_current")
  int get currentLevel => throw _privateConstructorUsedError;

  /// Serializes this AvatarDetailSkill to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$AvatarDetailSkillImpl implements _AvatarDetailSkill {
  const _$AvatarDetailSkillImpl(
      {@JsonKey(name: "max_level") required this.maxLevel,
      @JsonKey(name: "level_current") required this.currentLevel});

  factory _$AvatarDetailSkillImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarDetailSkillImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "max_level")
  final int maxLevel;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "level_current")
  final int currentLevel;

  @override
  String toString() {
    return 'AvatarDetailSkill(maxLevel: $maxLevel, currentLevel: $currentLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarDetailSkillImpl &&
            (identical(other.maxLevel, maxLevel) ||
                other.maxLevel == maxLevel) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, maxLevel, currentLevel);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvatarDetailSkillImplToJson(
      this,
    );
  }
}

abstract class _AvatarDetailSkill implements AvatarDetailSkill {
  const factory _AvatarDetailSkill(
          {@JsonKey(name: "max_level") required final int maxLevel,
          @JsonKey(name: "level_current") required final int currentLevel}) =
      _$AvatarDetailSkillImpl;

  factory _AvatarDetailSkill.fromJson(Map<String, dynamic> json) =
      _$AvatarDetailSkillImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "max_level")
  int get maxLevel; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: "level_current")
  int get currentLevel;
}

AvatarAuth _$AvatarAuthFromJson(Map<String, dynamic> json) {
  return _AvatarAuth.fromJson(json);
}

/// @nodoc
mixin _$AvatarAuth {
// ignore: invalid_annotation_target
  @JsonKey(name: "avatar_auth")
  int get avatarAuth => throw _privateConstructorUsedError;

  /// Serializes this AvatarAuth to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$AvatarAuthImpl implements _AvatarAuth {
  const _$AvatarAuthImpl(
      {@JsonKey(name: "avatar_auth") required this.avatarAuth});

  factory _$AvatarAuthImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarAuthImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "avatar_auth")
  final int avatarAuth;

  @override
  String toString() {
    return 'AvatarAuth(avatarAuth: $avatarAuth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarAuthImpl &&
            (identical(other.avatarAuth, avatarAuth) ||
                other.avatarAuth == avatarAuth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, avatarAuth);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvatarAuthImplToJson(
      this,
    );
  }
}

abstract class _AvatarAuth implements AvatarAuth {
  const factory _AvatarAuth(
          {@JsonKey(name: "avatar_auth") required final int avatarAuth}) =
      _$AvatarAuthImpl;

  factory _AvatarAuth.fromJson(Map<String, dynamic> json) =
      _$AvatarAuthImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "avatar_auth")
  int get avatarAuth;
}

GameRecordCard _$GameRecordCardFromJson(Map<String, dynamic> json) {
  return _GameRecordCard.fromJson(json);
}

/// @nodoc
mixin _$GameRecordCard {
// ignore: invalid_annotation_target
  @JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
  GameType get gameType =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "data_switches")
  List<DataSwitchMetadata> get dataSwitches =>
      throw _privateConstructorUsedError;

  /// Serializes this GameRecordCard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$GameRecordCardImpl implements _GameRecordCard {
  const _$GameRecordCardImpl(
      {@JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
      required this.gameType,
      @JsonKey(name: "data_switches")
      required final List<DataSwitchMetadata> dataSwitches})
      : _dataSwitches = dataSwitches;

  factory _$GameRecordCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameRecordCardImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
  final GameType gameType;
// ignore: invalid_annotation_target
  final List<DataSwitchMetadata> _dataSwitches;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "data_switches")
  List<DataSwitchMetadata> get dataSwitches {
    if (_dataSwitches is EqualUnmodifiableListView) return _dataSwitches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataSwitches);
  }

  @override
  String toString() {
    return 'GameRecordCard(gameType: $gameType, dataSwitches: $dataSwitches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameRecordCardImpl &&
            (identical(other.gameType, gameType) ||
                other.gameType == gameType) &&
            const DeepCollectionEquality()
                .equals(other._dataSwitches, _dataSwitches));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gameType,
      const DeepCollectionEquality().hash(_dataSwitches));

  @override
  Map<String, dynamic> toJson() {
    return _$$GameRecordCardImplToJson(
      this,
    );
  }
}

abstract class _GameRecordCard implements GameRecordCard {
  const factory _GameRecordCard(
          {@JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
          required final GameType gameType,
          @JsonKey(name: "data_switches")
          required final List<DataSwitchMetadata> dataSwitches}) =
      _$GameRecordCardImpl;

  factory _GameRecordCard.fromJson(Map<String, dynamic> json) =
      _$GameRecordCardImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
  GameType get gameType; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: "data_switches")
  List<DataSwitchMetadata> get dataSwitches;
}

DataSwitchMetadata _$DataSwitchMetadataFromJson(Map<String, dynamic> json) {
  return _DataSwitchMetadata.fromJson(json);
}

/// @nodoc
mixin _$DataSwitchMetadata {
// ignore: invalid_annotation_target
  @JsonKey(
      name: "switch_id", unknownEnumValue: DataSwitchType.enableBattleChronicle)
  DataSwitchType get switchId =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "is_public")
  bool get isPublic => throw _privateConstructorUsedError;

  /// Serializes this DataSwitchMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$DataSwitchMetadataImpl implements _DataSwitchMetadata {
  const _$DataSwitchMetadataImpl(
      {@JsonKey(
          name: "switch_id",
          unknownEnumValue: DataSwitchType.enableBattleChronicle)
      required this.switchId,
      @JsonKey(name: "is_public") required this.isPublic});

  factory _$DataSwitchMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataSwitchMetadataImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(
      name: "switch_id", unknownEnumValue: DataSwitchType.enableBattleChronicle)
  final DataSwitchType switchId;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "is_public")
  final bool isPublic;

  @override
  String toString() {
    return 'DataSwitchMetadata(switchId: $switchId, isPublic: $isPublic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataSwitchMetadataImpl &&
            (identical(other.switchId, switchId) ||
                other.switchId == switchId) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, switchId, isPublic);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataSwitchMetadataImplToJson(
      this,
    );
  }
}

abstract class _DataSwitchMetadata implements DataSwitchMetadata {
  const factory _DataSwitchMetadata(
          {@JsonKey(
              name: "switch_id",
              unknownEnumValue: DataSwitchType.enableBattleChronicle)
          required final DataSwitchType switchId,
          @JsonKey(name: "is_public") required final bool isPublic}) =
      _$DataSwitchMetadataImpl;

  factory _DataSwitchMetadata.fromJson(Map<String, dynamic> json) =
      _$DataSwitchMetadataImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(
      name: "switch_id", unknownEnumValue: DataSwitchType.enableBattleChronicle)
  DataSwitchType get switchId; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: "is_public")
  bool get isPublic;
}

DailyNote _$DailyNoteFromJson(Map<String, dynamic> json) {
  return _DailyNote.fromJson(json);
}

/// @nodoc
mixin _$DailyNote {
// ignore: invalid_annotation_target
  @JsonKey(name: "current_resin")
  int get currentResin =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "resin_recovery_time")
  String get resinRecoveryTime =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "current_home_coin")
  int get currentHomeCoin => throw _privateConstructorUsedError;

  /// Serializes this DailyNote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$DailyNoteImpl implements _DailyNote {
  const _$DailyNoteImpl(
      {@JsonKey(name: "current_resin") required this.currentResin,
      @JsonKey(name: "resin_recovery_time") required this.resinRecoveryTime,
      @JsonKey(name: "current_home_coin") required this.currentHomeCoin});

  factory _$DailyNoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyNoteImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "current_resin")
  final int currentResin;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "resin_recovery_time")
  final String resinRecoveryTime;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "current_home_coin")
  final int currentHomeCoin;

  @override
  String toString() {
    return 'DailyNote(currentResin: $currentResin, resinRecoveryTime: $resinRecoveryTime, currentHomeCoin: $currentHomeCoin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyNoteImpl &&
            (identical(other.currentResin, currentResin) ||
                other.currentResin == currentResin) &&
            (identical(other.resinRecoveryTime, resinRecoveryTime) ||
                other.resinRecoveryTime == resinRecoveryTime) &&
            (identical(other.currentHomeCoin, currentHomeCoin) ||
                other.currentHomeCoin == currentHomeCoin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentResin, resinRecoveryTime, currentHomeCoin);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyNoteImplToJson(
      this,
    );
  }
}

abstract class _DailyNote implements DailyNote {
  const factory _DailyNote(
      {@JsonKey(name: "current_resin") required final int currentResin,
      @JsonKey(name: "resin_recovery_time")
      required final String resinRecoveryTime,
      @JsonKey(name: "current_home_coin")
      required final int currentHomeCoin}) = _$DailyNoteImpl;

  factory _DailyNote.fromJson(Map<String, dynamic> json) =
      _$DailyNoteImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "current_resin")
  int get currentResin; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: "resin_recovery_time")
  String get resinRecoveryTime; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: "current_home_coin")
  int get currentHomeCoin;
}
