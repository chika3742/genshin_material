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

  @override
  @JsonKey(name: "account_name")
  String get accountName;
}

HyvUserGameRole _$HyvUserGameRoleFromJson(Map<String, dynamic> json) {
  return _HyvUserGameRole.fromJson(json);
}

/// @nodoc
mixin _$HyvUserGameRole {
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
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "level_current")
  String get currentLevel => throw _privateConstructorUsedError;
  @JsonKey(name: "max_level")
  int get maxLevel => throw _privateConstructorUsedError;
  @JsonKey(name: "skill_list")
  List<AvatarSkill> get skills => throw _privateConstructorUsedError;
  AvatarWeapon? get weapon => throw _privateConstructorUsedError;

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
      @JsonKey(name: "max_level") required this.maxLevel,
      @JsonKey(name: "skill_list") required final List<AvatarSkill> skills,
      this.weapon})
      : _skills = skills,
        super._();

  factory _$AvatarListResultItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarListResultItemImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: "level_current")
  final String currentLevel;
  @override
  @JsonKey(name: "max_level")
  final int maxLevel;
  final List<AvatarSkill> _skills;
  @override
  @JsonKey(name: "skill_list")
  List<AvatarSkill> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  final AvatarWeapon? weapon;

  @override
  String toString() {
    return 'AvatarListResultItem(id: $id, name: $name, currentLevel: $currentLevel, maxLevel: $maxLevel, skills: $skills, weapon: $weapon)';
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
                other.maxLevel == maxLevel) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.weapon, weapon) || other.weapon == weapon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, currentLevel, maxLevel,
      const DeepCollectionEquality().hash(_skills), weapon);

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
      @JsonKey(name: "max_level") required final int maxLevel,
      @JsonKey(name: "skill_list") required final List<AvatarSkill> skills,
      final AvatarWeapon? weapon}) = _$AvatarListResultItemImpl;
  const _AvatarListResultItem._() : super._();

  factory _AvatarListResultItem.fromJson(Map<String, dynamic> json) =
      _$AvatarListResultItemImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: "level_current")
  String get currentLevel;
  @override
  @JsonKey(name: "max_level")
  int get maxLevel;
  @override
  @JsonKey(name: "skill_list")
  List<AvatarSkill> get skills;
  @override
  AvatarWeapon? get weapon;
}

AvatarSkill _$AvatarSkillFromJson(Map<String, dynamic> json) {
  return _AvatarSkill.fromJson(json);
}

/// @nodoc
mixin _$AvatarSkill {
  @JsonKey(name: "group_id")
  int get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: "max_level")
  int get maxLevel => throw _privateConstructorUsedError;
  @JsonKey(name: "level_current")
  int get currentLevel => throw _privateConstructorUsedError;

  /// Serializes this AvatarSkill to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$AvatarSkillImpl implements _AvatarSkill {
  const _$AvatarSkillImpl(
      {@JsonKey(name: "group_id") required this.groupId,
      @JsonKey(name: "max_level") required this.maxLevel,
      @JsonKey(name: "level_current") required this.currentLevel});

  factory _$AvatarSkillImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarSkillImplFromJson(json);

  @override
  @JsonKey(name: "group_id")
  final int groupId;
  @override
  @JsonKey(name: "max_level")
  final int maxLevel;
  @override
  @JsonKey(name: "level_current")
  final int currentLevel;

  @override
  String toString() {
    return 'AvatarSkill(groupId: $groupId, maxLevel: $maxLevel, currentLevel: $currentLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarSkillImpl &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.maxLevel, maxLevel) ||
                other.maxLevel == maxLevel) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, groupId, maxLevel, currentLevel);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvatarSkillImplToJson(
      this,
    );
  }
}

abstract class _AvatarSkill implements AvatarSkill {
  const factory _AvatarSkill(
          {@JsonKey(name: "group_id") required final int groupId,
          @JsonKey(name: "max_level") required final int maxLevel,
          @JsonKey(name: "level_current") required final int currentLevel}) =
      _$AvatarSkillImpl;

  factory _AvatarSkill.fromJson(Map<String, dynamic> json) =
      _$AvatarSkillImpl.fromJson;

  @override
  @JsonKey(name: "group_id")
  int get groupId;
  @override
  @JsonKey(name: "max_level")
  int get maxLevel;
  @override
  @JsonKey(name: "level_current")
  int get currentLevel;
}

AvatarAuth _$AvatarAuthFromJson(Map<String, dynamic> json) {
  return _AvatarAuth.fromJson(json);
}

/// @nodoc
mixin _$AvatarAuth {
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

  @override
  @JsonKey(name: "avatar_auth")
  int get avatarAuth;
}

GameRecordCard _$GameRecordCardFromJson(Map<String, dynamic> json) {
  return _GameRecordCard.fromJson(json);
}

/// @nodoc
mixin _$GameRecordCard {
  @JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
  GameType get gameType => throw _privateConstructorUsedError;
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

  @override
  @JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
  final GameType gameType;
  final List<DataSwitchMetadata> _dataSwitches;
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

  @override
  @JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
  GameType get gameType;
  @override
  @JsonKey(name: "data_switches")
  List<DataSwitchMetadata> get dataSwitches;
}

DataSwitchMetadata _$DataSwitchMetadataFromJson(Map<String, dynamic> json) {
  return _DataSwitchMetadata.fromJson(json);
}

/// @nodoc
mixin _$DataSwitchMetadata {
  @JsonKey(
      name: "switch_id", unknownEnumValue: DataSwitchType.enableBattleChronicle)
  DataSwitchType get switchId => throw _privateConstructorUsedError;
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

  @override
  @JsonKey(
      name: "switch_id", unknownEnumValue: DataSwitchType.enableBattleChronicle)
  final DataSwitchType switchId;
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

  @override
  @JsonKey(
      name: "switch_id", unknownEnumValue: DataSwitchType.enableBattleChronicle)
  DataSwitchType get switchId;
  @override
  @JsonKey(name: "is_public")
  bool get isPublic;
}

DailyNote _$DailyNoteFromJson(Map<String, dynamic> json) {
  return _DailyNote.fromJson(json);
}

/// @nodoc
mixin _$DailyNote {
  @JsonKey(name: "current_resin")
  int get currentResin => throw _privateConstructorUsedError;
  @JsonKey(name: "resin_recovery_time")
  String get resinRecoveryTime => throw _privateConstructorUsedError;
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

  @override
  @JsonKey(name: "current_resin")
  final int currentResin;
  @override
  @JsonKey(name: "resin_recovery_time")
  final String resinRecoveryTime;
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

  @override
  @JsonKey(name: "current_resin")
  int get currentResin;
  @override
  @JsonKey(name: "resin_recovery_time")
  String get resinRecoveryTime;
  @override
  @JsonKey(name: "current_home_coin")
  int get currentHomeCoin;
}

/// @nodoc
mixin _$CalcComputeItem {
  @JsonKey(name: "avatar_id")
  int? get avatarId => throw _privateConstructorUsedError;
  @JsonKey(name: "avatar_level_current")
  int? get currentAvatarLevel => throw _privateConstructorUsedError;
  @JsonKey(name: "element_attr_id")
  int? get elementAttrId => throw _privateConstructorUsedError;
  @JsonKey(name: "avatar_level_target")
  int? get targetAvatarLevel => throw _privateConstructorUsedError;
  @JsonKey(name: "skill_list")
  List<CalcComputeSkill>? get skills => throw _privateConstructorUsedError;
  CalcComputeWeapon? get weapon => throw _privateConstructorUsedError;

  /// Serializes this CalcComputeItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalcComputeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalcComputeItemCopyWith<CalcComputeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalcComputeItemCopyWith<$Res> {
  factory $CalcComputeItemCopyWith(
          CalcComputeItem value, $Res Function(CalcComputeItem) then) =
      _$CalcComputeItemCopyWithImpl<$Res, CalcComputeItem>;
  @useResult
  $Res call(
      {@JsonKey(name: "avatar_id") int? avatarId,
      @JsonKey(name: "avatar_level_current") int? currentAvatarLevel,
      @JsonKey(name: "element_attr_id") int? elementAttrId,
      @JsonKey(name: "avatar_level_target") int? targetAvatarLevel,
      @JsonKey(name: "skill_list") List<CalcComputeSkill>? skills,
      CalcComputeWeapon? weapon});
}

/// @nodoc
class _$CalcComputeItemCopyWithImpl<$Res, $Val extends CalcComputeItem>
    implements $CalcComputeItemCopyWith<$Res> {
  _$CalcComputeItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalcComputeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarId = freezed,
    Object? currentAvatarLevel = freezed,
    Object? elementAttrId = freezed,
    Object? targetAvatarLevel = freezed,
    Object? skills = freezed,
    Object? weapon = freezed,
  }) {
    return _then(_value.copyWith(
      avatarId: freezed == avatarId
          ? _value.avatarId
          : avatarId // ignore: cast_nullable_to_non_nullable
              as int?,
      currentAvatarLevel: freezed == currentAvatarLevel
          ? _value.currentAvatarLevel
          : currentAvatarLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      elementAttrId: freezed == elementAttrId
          ? _value.elementAttrId
          : elementAttrId // ignore: cast_nullable_to_non_nullable
              as int?,
      targetAvatarLevel: freezed == targetAvatarLevel
          ? _value.targetAvatarLevel
          : targetAvatarLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      skills: freezed == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<CalcComputeSkill>?,
      weapon: freezed == weapon
          ? _value.weapon
          : weapon // ignore: cast_nullable_to_non_nullable
              as CalcComputeWeapon?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalcComputeItemImplCopyWith<$Res>
    implements $CalcComputeItemCopyWith<$Res> {
  factory _$$CalcComputeItemImplCopyWith(_$CalcComputeItemImpl value,
          $Res Function(_$CalcComputeItemImpl) then) =
      __$$CalcComputeItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "avatar_id") int? avatarId,
      @JsonKey(name: "avatar_level_current") int? currentAvatarLevel,
      @JsonKey(name: "element_attr_id") int? elementAttrId,
      @JsonKey(name: "avatar_level_target") int? targetAvatarLevel,
      @JsonKey(name: "skill_list") List<CalcComputeSkill>? skills,
      CalcComputeWeapon? weapon});
}

/// @nodoc
class __$$CalcComputeItemImplCopyWithImpl<$Res>
    extends _$CalcComputeItemCopyWithImpl<$Res, _$CalcComputeItemImpl>
    implements _$$CalcComputeItemImplCopyWith<$Res> {
  __$$CalcComputeItemImplCopyWithImpl(
      _$CalcComputeItemImpl _value, $Res Function(_$CalcComputeItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalcComputeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarId = freezed,
    Object? currentAvatarLevel = freezed,
    Object? elementAttrId = freezed,
    Object? targetAvatarLevel = freezed,
    Object? skills = freezed,
    Object? weapon = freezed,
  }) {
    return _then(_$CalcComputeItemImpl(
      avatarId: freezed == avatarId
          ? _value.avatarId
          : avatarId // ignore: cast_nullable_to_non_nullable
              as int?,
      currentAvatarLevel: freezed == currentAvatarLevel
          ? _value.currentAvatarLevel
          : currentAvatarLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      elementAttrId: freezed == elementAttrId
          ? _value.elementAttrId
          : elementAttrId // ignore: cast_nullable_to_non_nullable
              as int?,
      targetAvatarLevel: freezed == targetAvatarLevel
          ? _value.targetAvatarLevel
          : targetAvatarLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      skills: freezed == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<CalcComputeSkill>?,
      weapon: freezed == weapon
          ? _value.weapon
          : weapon // ignore: cast_nullable_to_non_nullable
              as CalcComputeWeapon?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$CalcComputeItemImpl implements _CalcComputeItem {
  const _$CalcComputeItemImpl(
      {@JsonKey(name: "avatar_id") this.avatarId,
      @JsonKey(name: "avatar_level_current") this.currentAvatarLevel,
      @JsonKey(name: "element_attr_id") this.elementAttrId,
      @JsonKey(name: "avatar_level_target") this.targetAvatarLevel,
      @JsonKey(name: "skill_list") final List<CalcComputeSkill>? skills,
      this.weapon})
      : _skills = skills;

  @override
  @JsonKey(name: "avatar_id")
  final int? avatarId;
  @override
  @JsonKey(name: "avatar_level_current")
  final int? currentAvatarLevel;
  @override
  @JsonKey(name: "element_attr_id")
  final int? elementAttrId;
  @override
  @JsonKey(name: "avatar_level_target")
  final int? targetAvatarLevel;
  final List<CalcComputeSkill>? _skills;
  @override
  @JsonKey(name: "skill_list")
  List<CalcComputeSkill>? get skills {
    final value = _skills;
    if (value == null) return null;
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CalcComputeWeapon? weapon;

  @override
  String toString() {
    return 'CalcComputeItem(avatarId: $avatarId, currentAvatarLevel: $currentAvatarLevel, elementAttrId: $elementAttrId, targetAvatarLevel: $targetAvatarLevel, skills: $skills, weapon: $weapon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalcComputeItemImpl &&
            (identical(other.avatarId, avatarId) ||
                other.avatarId == avatarId) &&
            (identical(other.currentAvatarLevel, currentAvatarLevel) ||
                other.currentAvatarLevel == currentAvatarLevel) &&
            (identical(other.elementAttrId, elementAttrId) ||
                other.elementAttrId == elementAttrId) &&
            (identical(other.targetAvatarLevel, targetAvatarLevel) ||
                other.targetAvatarLevel == targetAvatarLevel) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.weapon, weapon) || other.weapon == weapon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      avatarId,
      currentAvatarLevel,
      elementAttrId,
      targetAvatarLevel,
      const DeepCollectionEquality().hash(_skills),
      weapon);

  /// Create a copy of CalcComputeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalcComputeItemImplCopyWith<_$CalcComputeItemImpl> get copyWith =>
      __$$CalcComputeItemImplCopyWithImpl<_$CalcComputeItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalcComputeItemImplToJson(
      this,
    );
  }
}

abstract class _CalcComputeItem implements CalcComputeItem {
  const factory _CalcComputeItem(
      {@JsonKey(name: "avatar_id") final int? avatarId,
      @JsonKey(name: "avatar_level_current") final int? currentAvatarLevel,
      @JsonKey(name: "element_attr_id") final int? elementAttrId,
      @JsonKey(name: "avatar_level_target") final int? targetAvatarLevel,
      @JsonKey(name: "skill_list") final List<CalcComputeSkill>? skills,
      final CalcComputeWeapon? weapon}) = _$CalcComputeItemImpl;

  @override
  @JsonKey(name: "avatar_id")
  int? get avatarId;
  @override
  @JsonKey(name: "avatar_level_current")
  int? get currentAvatarLevel;
  @override
  @JsonKey(name: "element_attr_id")
  int? get elementAttrId;
  @override
  @JsonKey(name: "avatar_level_target")
  int? get targetAvatarLevel;
  @override
  @JsonKey(name: "skill_list")
  List<CalcComputeSkill>? get skills;
  @override
  CalcComputeWeapon? get weapon;

  /// Create a copy of CalcComputeItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalcComputeItemImplCopyWith<_$CalcComputeItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CalcComputeSkill {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "level_current")
  int get currentLevel => throw _privateConstructorUsedError;
  @JsonKey(name: "level_target")
  int get targetLevel => throw _privateConstructorUsedError;

  /// Serializes this CalcComputeSkill to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$CalcComputeSkillImpl implements _CalcComputeSkill {
  const _$CalcComputeSkillImpl(
      {required this.id,
      @JsonKey(name: "level_current") required this.currentLevel,
      @JsonKey(name: "level_target") required this.targetLevel});

  @override
  final int id;
  @override
  @JsonKey(name: "level_current")
  final int currentLevel;
  @override
  @JsonKey(name: "level_target")
  final int targetLevel;

  @override
  String toString() {
    return 'CalcComputeSkill(id: $id, currentLevel: $currentLevel, targetLevel: $targetLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalcComputeSkillImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            (identical(other.targetLevel, targetLevel) ||
                other.targetLevel == targetLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, currentLevel, targetLevel);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalcComputeSkillImplToJson(
      this,
    );
  }
}

abstract class _CalcComputeSkill implements CalcComputeSkill {
  const factory _CalcComputeSkill(
          {required final int id,
          @JsonKey(name: "level_current") required final int currentLevel,
          @JsonKey(name: "level_target") required final int targetLevel}) =
      _$CalcComputeSkillImpl;

  @override
  int get id;
  @override
  @JsonKey(name: "level_current")
  int get currentLevel;
  @override
  @JsonKey(name: "level_target")
  int get targetLevel;
}

AvatarWeapon _$AvatarWeaponFromJson(Map<String, dynamic> json) {
  return _AvatarWeapon.fromJson(json);
}

/// @nodoc
mixin _$AvatarWeapon {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "max_level")
  int get maxLevel => throw _privateConstructorUsedError;
  @JsonKey(name: "level_current")
  int get currentLevel => throw _privateConstructorUsedError;
  @JsonKey(name: "weapon_cat_id")
  int get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "weapon_level")
  int get rarity => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  /// Serializes this AvatarWeapon to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$AvatarWeaponImpl implements _AvatarWeapon {
  const _$AvatarWeaponImpl(
      {required this.id,
      @JsonKey(name: "max_level") required this.maxLevel,
      @JsonKey(name: "level_current") required this.currentLevel,
      @JsonKey(name: "weapon_cat_id") required this.categoryId,
      @JsonKey(name: "weapon_level") required this.rarity,
      required this.name,
      required this.icon});

  factory _$AvatarWeaponImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarWeaponImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "max_level")
  final int maxLevel;
  @override
  @JsonKey(name: "level_current")
  final int currentLevel;
  @override
  @JsonKey(name: "weapon_cat_id")
  final int categoryId;
  @override
  @JsonKey(name: "weapon_level")
  final int rarity;
  @override
  final String name;
  @override
  final String icon;

  @override
  String toString() {
    return 'AvatarWeapon(id: $id, maxLevel: $maxLevel, currentLevel: $currentLevel, categoryId: $categoryId, rarity: $rarity, name: $name, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarWeaponImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.maxLevel, maxLevel) ||
                other.maxLevel == maxLevel) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, maxLevel, currentLevel, categoryId, rarity, name, icon);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvatarWeaponImplToJson(
      this,
    );
  }
}

abstract class _AvatarWeapon implements AvatarWeapon {
  const factory _AvatarWeapon(
      {required final int id,
      @JsonKey(name: "max_level") required final int maxLevel,
      @JsonKey(name: "level_current") required final int currentLevel,
      @JsonKey(name: "weapon_cat_id") required final int categoryId,
      @JsonKey(name: "weapon_level") required final int rarity,
      required final String name,
      required final String icon}) = _$AvatarWeaponImpl;

  factory _AvatarWeapon.fromJson(Map<String, dynamic> json) =
      _$AvatarWeaponImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "max_level")
  int get maxLevel;
  @override
  @JsonKey(name: "level_current")
  int get currentLevel;
  @override
  @JsonKey(name: "weapon_cat_id")
  int get categoryId;
  @override
  @JsonKey(name: "weapon_level")
  int get rarity;
  @override
  String get name;
  @override
  String get icon;
}

/// @nodoc
mixin _$CalcComputeWeapon {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "max_level")
  int? get maxLevel => throw _privateConstructorUsedError;
  @JsonKey(name: "level_current")
  int get currentLevel => throw _privateConstructorUsedError;
  @JsonKey(name: "level_target")
  int get targetLevel => throw _privateConstructorUsedError;
  @JsonKey(name: "weapon_cat_id")
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "weapon_level")
  int get rarity => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  /// Serializes this CalcComputeWeapon to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$CalcComputeWeaponImpl implements _CalcComputeWeapon {
  const _$CalcComputeWeaponImpl(
      {required this.id,
      @JsonKey(name: "max_level") this.maxLevel,
      @JsonKey(name: "level_current") required this.currentLevel,
      @JsonKey(name: "level_target") required this.targetLevel,
      @JsonKey(name: "weapon_cat_id") this.categoryId,
      @JsonKey(name: "weapon_level") required this.rarity,
      required this.name,
      this.icon});

  @override
  final int id;
  @override
  @JsonKey(name: "max_level")
  final int? maxLevel;
  @override
  @JsonKey(name: "level_current")
  final int currentLevel;
  @override
  @JsonKey(name: "level_target")
  final int targetLevel;
  @override
  @JsonKey(name: "weapon_cat_id")
  final int? categoryId;
  @override
  @JsonKey(name: "weapon_level")
  final int rarity;
  @override
  final String name;
  @override
  final String? icon;

  @override
  String toString() {
    return 'CalcComputeWeapon(id: $id, maxLevel: $maxLevel, currentLevel: $currentLevel, targetLevel: $targetLevel, categoryId: $categoryId, rarity: $rarity, name: $name, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalcComputeWeaponImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.maxLevel, maxLevel) ||
                other.maxLevel == maxLevel) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            (identical(other.targetLevel, targetLevel) ||
                other.targetLevel == targetLevel) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, maxLevel, currentLevel,
      targetLevel, categoryId, rarity, name, icon);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalcComputeWeaponImplToJson(
      this,
    );
  }
}

abstract class _CalcComputeWeapon implements CalcComputeWeapon {
  const factory _CalcComputeWeapon(
      {required final int id,
      @JsonKey(name: "max_level") final int? maxLevel,
      @JsonKey(name: "level_current") required final int currentLevel,
      @JsonKey(name: "level_target") required final int targetLevel,
      @JsonKey(name: "weapon_cat_id") final int? categoryId,
      @JsonKey(name: "weapon_level") required final int rarity,
      required final String name,
      final String? icon}) = _$CalcComputeWeaponImpl;

  @override
  int get id;
  @override
  @JsonKey(name: "max_level")
  int? get maxLevel;
  @override
  @JsonKey(name: "level_current")
  int get currentLevel;
  @override
  @JsonKey(name: "level_target")
  int get targetLevel;
  @override
  @JsonKey(name: "weapon_cat_id")
  int? get categoryId;
  @override
  @JsonKey(name: "weapon_level")
  int get rarity;
  @override
  String get name;
  @override
  String? get icon;
}

CalcResult _$CalcResultFromJson(Map<String, dynamic> json) {
  return _CalcResult.fromJson(json);
}

/// @nodoc
mixin _$CalcResult {
  @JsonKey(name: "overall_consume")
  List<CalcConsumptionItem> get overallConsume =>
      throw _privateConstructorUsedError;

  /// Serializes this CalcResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$CalcResultImpl implements _CalcResult {
  const _$CalcResultImpl(
      {@JsonKey(name: "overall_consume")
      required final List<CalcConsumptionItem> overallConsume})
      : _overallConsume = overallConsume;

  factory _$CalcResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalcResultImplFromJson(json);

  final List<CalcConsumptionItem> _overallConsume;
  @override
  @JsonKey(name: "overall_consume")
  List<CalcConsumptionItem> get overallConsume {
    if (_overallConsume is EqualUnmodifiableListView) return _overallConsume;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_overallConsume);
  }

  @override
  String toString() {
    return 'CalcResult(overallConsume: $overallConsume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalcResultImpl &&
            const DeepCollectionEquality()
                .equals(other._overallConsume, _overallConsume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_overallConsume));

  @override
  Map<String, dynamic> toJson() {
    return _$$CalcResultImplToJson(
      this,
    );
  }
}

abstract class _CalcResult implements CalcResult {
  const factory _CalcResult(
          {@JsonKey(name: "overall_consume")
          required final List<CalcConsumptionItem> overallConsume}) =
      _$CalcResultImpl;

  factory _CalcResult.fromJson(Map<String, dynamic> json) =
      _$CalcResultImpl.fromJson;

  @override
  @JsonKey(name: "overall_consume")
  List<CalcConsumptionItem> get overallConsume;
}

CalcConsumptionItem _$CalcConsumptionItemFromJson(Map<String, dynamic> json) {
  return _CalcConsumptionItem.fromJson(json);
}

/// @nodoc
mixin _$CalcConsumptionItem {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "lack_num")
  int get lackNum => throw _privateConstructorUsedError;
  int get num => throw _privateConstructorUsedError;

  /// Serializes this CalcConsumptionItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$CalcConsumptionItemImpl implements _CalcConsumptionItem {
  const _$CalcConsumptionItemImpl(
      {required this.id,
      @JsonKey(name: "lack_num") required this.lackNum,
      required this.num});

  factory _$CalcConsumptionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalcConsumptionItemImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "lack_num")
  final int lackNum;
  @override
  final int num;

  @override
  String toString() {
    return 'CalcConsumptionItem(id: $id, lackNum: $lackNum, num: $num)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalcConsumptionItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lackNum, lackNum) || other.lackNum == lackNum) &&
            (identical(other.num, num) || other.num == num));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, lackNum, num);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalcConsumptionItemImplToJson(
      this,
    );
  }
}

abstract class _CalcConsumptionItem implements CalcConsumptionItem {
  const factory _CalcConsumptionItem(
      {required final int id,
      @JsonKey(name: "lack_num") required final int lackNum,
      required final int num}) = _$CalcConsumptionItemImpl;

  factory _CalcConsumptionItem.fromJson(Map<String, dynamic> json) =
      _$CalcConsumptionItemImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "lack_num")
  int get lackNum;
  @override
  int get num;
}
