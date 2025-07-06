// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hoyolab_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HoyolabApiResult<T> {
  int get retcode;
  String get message;
  T? get data;

  /// Serializes this HoyolabApiResult to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HoyolabApiResult<T> &&
            (identical(other.retcode, retcode) || other.retcode == retcode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, retcode, message, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'HoyolabApiResult<$T>(retcode: $retcode, message: $message, data: $data)';
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _HoyolabApiResult<T> extends HoyolabApiResult<T> {
  const _HoyolabApiResult(
      {required this.retcode, required this.message, this.data})
      : super._();
  factory _HoyolabApiResult.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$HoyolabApiResultFromJson(json, fromJsonT);

  @override
  final int retcode;
  @override
  final String message;
  @override
  final T? data;

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$HoyolabApiResultToJson<T>(this, toJsonT);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HoyolabApiResult<T> &&
            (identical(other.retcode, retcode) || other.retcode == retcode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, retcode, message, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'HoyolabApiResult<$T>(retcode: $retcode, message: $message, data: $data)';
  }
}

/// @nodoc
mixin _$HoyolabListData<T> {
  List<T> get list;

  /// Serializes this HoyolabListData to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HoyolabListData<T> &&
            const DeepCollectionEquality().equals(other.list, list));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(list));

  @override
  String toString() {
    return 'HoyolabListData<$T>(list: $list)';
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _HoyolabListData<T> implements HoyolabListData<T> {
  const _HoyolabListData({required final List<T> list}) : _list = list;
  factory _HoyolabListData.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$HoyolabListDataFromJson(json, fromJsonT);

  final List<T> _list;
  @override
  List<T> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$HoyolabListDataToJson<T>(this, toJsonT);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HoyolabListData<T> &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @override
  String toString() {
    return 'HoyolabListData<$T>(list: $list)';
  }
}

/// @nodoc
mixin _$HyvServer {
  String get region;
  String get name;

  /// Serializes this HyvServer to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HyvServer &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, region, name);

  @override
  String toString() {
    return 'HyvServer(region: $region, name: $name)';
  }
}

/// @nodoc
@JsonSerializable()
class _HyvServer implements HyvServer {
  const _HyvServer({required this.region, required this.name});
  factory _HyvServer.fromJson(Map<String, dynamic> json) =>
      _$HyvServerFromJson(json);

  @override
  final String region;
  @override
  final String name;

  @override
  Map<String, dynamic> toJson() {
    return _$HyvServerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HyvServer &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, region, name);

  @override
  String toString() {
    return 'HyvServer(region: $region, name: $name)';
  }
}

/// @nodoc
mixin _$HyvUserInfo {
  @JsonKey(name: "account_name")
  String get accountName;

  /// Serializes this HyvUserInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HyvUserInfo &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accountName);

  @override
  String toString() {
    return 'HyvUserInfo(accountName: $accountName)';
  }
}

/// @nodoc
@JsonSerializable()
class _HyvUserInfo implements HyvUserInfo {
  const _HyvUserInfo(
      {@JsonKey(name: "account_name") required this.accountName});
  factory _HyvUserInfo.fromJson(Map<String, dynamic> json) =>
      _$HyvUserInfoFromJson(json);

  @override
  @JsonKey(name: "account_name")
  final String accountName;

  @override
  Map<String, dynamic> toJson() {
    return _$HyvUserInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HyvUserInfo &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accountName);

  @override
  String toString() {
    return 'HyvUserInfo(accountName: $accountName)';
  }
}

/// @nodoc
mixin _$HyvUserGameRole {
  @JsonKey(name: "game_uid")
  String get uid;
  String get nickname;
  int get level;

  /// Serializes this HyvUserGameRole to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HyvUserGameRole &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uid, nickname, level);

  @override
  String toString() {
    return 'HyvUserGameRole(uid: $uid, nickname: $nickname, level: $level)';
  }
}

/// @nodoc
@JsonSerializable()
class _HyvUserGameRole implements HyvUserGameRole {
  const _HyvUserGameRole(
      {@JsonKey(name: "game_uid") required this.uid,
      required this.nickname,
      required this.level});
  factory _HyvUserGameRole.fromJson(Map<String, dynamic> json) =>
      _$HyvUserGameRoleFromJson(json);

  @override
  @JsonKey(name: "game_uid")
  final String uid;
  @override
  final String nickname;
  @override
  final int level;

  @override
  Map<String, dynamic> toJson() {
    return _$HyvUserGameRoleToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HyvUserGameRole &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uid, nickname, level);

  @override
  String toString() {
    return 'HyvUserGameRole(uid: $uid, nickname: $nickname, level: $level)';
  }
}

/// @nodoc
mixin _$AvatarListResultItem {
  int get id;
  String get name;
  @JsonKey(name: "level_current")
  String get currentLevel;
  @JsonKey(name: "max_level")
  int get maxLevel;
  @JsonKey(name: "skill_list")
  List<AvatarSkill> get skills;
  AvatarWeapon? get weapon;

  /// Serializes this AvatarListResultItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AvatarListResultItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            (identical(other.maxLevel, maxLevel) ||
                other.maxLevel == maxLevel) &&
            const DeepCollectionEquality().equals(other.skills, skills) &&
            (identical(other.weapon, weapon) || other.weapon == weapon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, currentLevel, maxLevel,
      const DeepCollectionEquality().hash(skills), weapon);

  @override
  String toString() {
    return 'AvatarListResultItem(id: $id, name: $name, currentLevel: $currentLevel, maxLevel: $maxLevel, skills: $skills, weapon: $weapon)';
  }
}

/// @nodoc
@JsonSerializable()
class _AvatarListResultItem extends AvatarListResultItem {
  const _AvatarListResultItem(
      {required this.id,
      required this.name,
      @JsonKey(name: "level_current") required this.currentLevel,
      @JsonKey(name: "max_level") required this.maxLevel,
      @JsonKey(name: "skill_list") required final List<AvatarSkill> skills,
      this.weapon})
      : _skills = skills,
        super._();
  factory _AvatarListResultItem.fromJson(Map<String, dynamic> json) =>
      _$AvatarListResultItemFromJson(json);

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
  Map<String, dynamic> toJson() {
    return _$AvatarListResultItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AvatarListResultItem &&
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
  String toString() {
    return 'AvatarListResultItem(id: $id, name: $name, currentLevel: $currentLevel, maxLevel: $maxLevel, skills: $skills, weapon: $weapon)';
  }
}

/// @nodoc
mixin _$AvatarSkill {
  @JsonKey(name: "group_id")
  int get groupId;
  @JsonKey(name: "max_level")
  int get maxLevel;
  @JsonKey(name: "level_current")
  int get currentLevel;

  /// Serializes this AvatarSkill to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AvatarSkill &&
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
  String toString() {
    return 'AvatarSkill(groupId: $groupId, maxLevel: $maxLevel, currentLevel: $currentLevel)';
  }
}

/// @nodoc
@JsonSerializable()
class _AvatarSkill implements AvatarSkill {
  const _AvatarSkill(
      {@JsonKey(name: "group_id") required this.groupId,
      @JsonKey(name: "max_level") required this.maxLevel,
      @JsonKey(name: "level_current") required this.currentLevel});
  factory _AvatarSkill.fromJson(Map<String, dynamic> json) =>
      _$AvatarSkillFromJson(json);

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
  Map<String, dynamic> toJson() {
    return _$AvatarSkillToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AvatarSkill &&
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
  String toString() {
    return 'AvatarSkill(groupId: $groupId, maxLevel: $maxLevel, currentLevel: $currentLevel)';
  }
}

/// @nodoc
mixin _$AvatarAuth {
  @JsonKey(name: "avatar_auth")
  int get avatarAuth;

  /// Serializes this AvatarAuth to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AvatarAuth &&
            (identical(other.avatarAuth, avatarAuth) ||
                other.avatarAuth == avatarAuth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, avatarAuth);

  @override
  String toString() {
    return 'AvatarAuth(avatarAuth: $avatarAuth)';
  }
}

/// @nodoc
@JsonSerializable()
class _AvatarAuth implements AvatarAuth {
  const _AvatarAuth({@JsonKey(name: "avatar_auth") required this.avatarAuth});
  factory _AvatarAuth.fromJson(Map<String, dynamic> json) =>
      _$AvatarAuthFromJson(json);

  @override
  @JsonKey(name: "avatar_auth")
  final int avatarAuth;

  @override
  Map<String, dynamic> toJson() {
    return _$AvatarAuthToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AvatarAuth &&
            (identical(other.avatarAuth, avatarAuth) ||
                other.avatarAuth == avatarAuth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, avatarAuth);

  @override
  String toString() {
    return 'AvatarAuth(avatarAuth: $avatarAuth)';
  }
}

/// @nodoc
mixin _$GameRecordCard {
  @JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
  GameType get gameType;
  @JsonKey(name: "data_switches")
  List<DataSwitchMetadata> get dataSwitches;

  /// Serializes this GameRecordCard to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameRecordCard &&
            (identical(other.gameType, gameType) ||
                other.gameType == gameType) &&
            const DeepCollectionEquality()
                .equals(other.dataSwitches, dataSwitches));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, gameType, const DeepCollectionEquality().hash(dataSwitches));

  @override
  String toString() {
    return 'GameRecordCard(gameType: $gameType, dataSwitches: $dataSwitches)';
  }
}

/// @nodoc
@JsonSerializable()
class _GameRecordCard implements GameRecordCard {
  const _GameRecordCard(
      {@JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
      required this.gameType,
      @JsonKey(name: "data_switches")
      required final List<DataSwitchMetadata> dataSwitches})
      : _dataSwitches = dataSwitches;
  factory _GameRecordCard.fromJson(Map<String, dynamic> json) =>
      _$GameRecordCardFromJson(json);

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
  Map<String, dynamic> toJson() {
    return _$GameRecordCardToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameRecordCard &&
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
  String toString() {
    return 'GameRecordCard(gameType: $gameType, dataSwitches: $dataSwitches)';
  }
}

/// @nodoc
mixin _$DataSwitchMetadata {
  @JsonKey(
      name: "switch_id", unknownEnumValue: DataSwitchType.enableBattleChronicle)
  DataSwitchType get switchId;
  @JsonKey(name: "is_public")
  bool get isPublic;

  /// Serializes this DataSwitchMetadata to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataSwitchMetadata &&
            (identical(other.switchId, switchId) ||
                other.switchId == switchId) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, switchId, isPublic);

  @override
  String toString() {
    return 'DataSwitchMetadata(switchId: $switchId, isPublic: $isPublic)';
  }
}

/// @nodoc
@JsonSerializable()
class _DataSwitchMetadata implements DataSwitchMetadata {
  const _DataSwitchMetadata(
      {@JsonKey(
          name: "switch_id",
          unknownEnumValue: DataSwitchType.enableBattleChronicle)
      required this.switchId,
      @JsonKey(name: "is_public") required this.isPublic});
  factory _DataSwitchMetadata.fromJson(Map<String, dynamic> json) =>
      _$DataSwitchMetadataFromJson(json);

  @override
  @JsonKey(
      name: "switch_id", unknownEnumValue: DataSwitchType.enableBattleChronicle)
  final DataSwitchType switchId;
  @override
  @JsonKey(name: "is_public")
  final bool isPublic;

  @override
  Map<String, dynamic> toJson() {
    return _$DataSwitchMetadataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DataSwitchMetadata &&
            (identical(other.switchId, switchId) ||
                other.switchId == switchId) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, switchId, isPublic);

  @override
  String toString() {
    return 'DataSwitchMetadata(switchId: $switchId, isPublic: $isPublic)';
  }
}

/// @nodoc
mixin _$DailyNote {
  @JsonKey(name: "current_resin")
  int get currentResin;
  @JsonKey(name: "resin_recovery_time")
  String get resinRecoveryTime;
  @JsonKey(name: "current_home_coin")
  int get currentHomeCoin;

  /// Serializes this DailyNote to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailyNote &&
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
  String toString() {
    return 'DailyNote(currentResin: $currentResin, resinRecoveryTime: $resinRecoveryTime, currentHomeCoin: $currentHomeCoin)';
  }
}

/// @nodoc
@JsonSerializable()
class _DailyNote implements DailyNote {
  const _DailyNote(
      {@JsonKey(name: "current_resin") required this.currentResin,
      @JsonKey(name: "resin_recovery_time") required this.resinRecoveryTime,
      @JsonKey(name: "current_home_coin") required this.currentHomeCoin});
  factory _DailyNote.fromJson(Map<String, dynamic> json) =>
      _$DailyNoteFromJson(json);

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
  Map<String, dynamic> toJson() {
    return _$DailyNoteToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailyNote &&
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
  String toString() {
    return 'DailyNote(currentResin: $currentResin, resinRecoveryTime: $resinRecoveryTime, currentHomeCoin: $currentHomeCoin)';
  }
}

/// @nodoc
mixin _$CalcComputeItem {
  @JsonKey(name: "avatar_id")
  int? get avatarId;
  @JsonKey(name: "avatar_level_current")
  int? get currentAvatarLevel;
  @JsonKey(name: "element_attr_id")
  int? get elementAttrId;
  @JsonKey(name: "avatar_level_target")
  int? get targetAvatarLevel;
  @JsonKey(name: "skill_list")
  List<CalcComputeSkill>? get skills;
  CalcComputeWeapon? get weapon;

  /// Create a copy of CalcComputeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CalcComputeItemCopyWith<CalcComputeItem> get copyWith =>
      _$CalcComputeItemCopyWithImpl<CalcComputeItem>(
          this as CalcComputeItem, _$identity);

  /// Serializes this CalcComputeItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalcComputeItem &&
            (identical(other.avatarId, avatarId) ||
                other.avatarId == avatarId) &&
            (identical(other.currentAvatarLevel, currentAvatarLevel) ||
                other.currentAvatarLevel == currentAvatarLevel) &&
            (identical(other.elementAttrId, elementAttrId) ||
                other.elementAttrId == elementAttrId) &&
            (identical(other.targetAvatarLevel, targetAvatarLevel) ||
                other.targetAvatarLevel == targetAvatarLevel) &&
            const DeepCollectionEquality().equals(other.skills, skills) &&
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
      const DeepCollectionEquality().hash(skills),
      weapon);

  @override
  String toString() {
    return 'CalcComputeItem(avatarId: $avatarId, currentAvatarLevel: $currentAvatarLevel, elementAttrId: $elementAttrId, targetAvatarLevel: $targetAvatarLevel, skills: $skills, weapon: $weapon)';
  }
}

/// @nodoc
abstract mixin class $CalcComputeItemCopyWith<$Res> {
  factory $CalcComputeItemCopyWith(
          CalcComputeItem value, $Res Function(CalcComputeItem) _then) =
      _$CalcComputeItemCopyWithImpl;
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
class _$CalcComputeItemCopyWithImpl<$Res>
    implements $CalcComputeItemCopyWith<$Res> {
  _$CalcComputeItemCopyWithImpl(this._self, this._then);

  final CalcComputeItem _self;
  final $Res Function(CalcComputeItem) _then;

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
    return _then(_self.copyWith(
      avatarId: freezed == avatarId
          ? _self.avatarId
          : avatarId // ignore: cast_nullable_to_non_nullable
              as int?,
      currentAvatarLevel: freezed == currentAvatarLevel
          ? _self.currentAvatarLevel
          : currentAvatarLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      elementAttrId: freezed == elementAttrId
          ? _self.elementAttrId
          : elementAttrId // ignore: cast_nullable_to_non_nullable
              as int?,
      targetAvatarLevel: freezed == targetAvatarLevel
          ? _self.targetAvatarLevel
          : targetAvatarLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      skills: freezed == skills
          ? _self.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<CalcComputeSkill>?,
      weapon: freezed == weapon
          ? _self.weapon
          : weapon // ignore: cast_nullable_to_non_nullable
              as CalcComputeWeapon?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _CalcComputeItem implements CalcComputeItem {
  const _CalcComputeItem(
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

  /// Create a copy of CalcComputeItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CalcComputeItemCopyWith<_CalcComputeItem> get copyWith =>
      __$CalcComputeItemCopyWithImpl<_CalcComputeItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CalcComputeItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalcComputeItem &&
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

  @override
  String toString() {
    return 'CalcComputeItem(avatarId: $avatarId, currentAvatarLevel: $currentAvatarLevel, elementAttrId: $elementAttrId, targetAvatarLevel: $targetAvatarLevel, skills: $skills, weapon: $weapon)';
  }
}

/// @nodoc
abstract mixin class _$CalcComputeItemCopyWith<$Res>
    implements $CalcComputeItemCopyWith<$Res> {
  factory _$CalcComputeItemCopyWith(
          _CalcComputeItem value, $Res Function(_CalcComputeItem) _then) =
      __$CalcComputeItemCopyWithImpl;
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
class __$CalcComputeItemCopyWithImpl<$Res>
    implements _$CalcComputeItemCopyWith<$Res> {
  __$CalcComputeItemCopyWithImpl(this._self, this._then);

  final _CalcComputeItem _self;
  final $Res Function(_CalcComputeItem) _then;

  /// Create a copy of CalcComputeItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? avatarId = freezed,
    Object? currentAvatarLevel = freezed,
    Object? elementAttrId = freezed,
    Object? targetAvatarLevel = freezed,
    Object? skills = freezed,
    Object? weapon = freezed,
  }) {
    return _then(_CalcComputeItem(
      avatarId: freezed == avatarId
          ? _self.avatarId
          : avatarId // ignore: cast_nullable_to_non_nullable
              as int?,
      currentAvatarLevel: freezed == currentAvatarLevel
          ? _self.currentAvatarLevel
          : currentAvatarLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      elementAttrId: freezed == elementAttrId
          ? _self.elementAttrId
          : elementAttrId // ignore: cast_nullable_to_non_nullable
              as int?,
      targetAvatarLevel: freezed == targetAvatarLevel
          ? _self.targetAvatarLevel
          : targetAvatarLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      skills: freezed == skills
          ? _self._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<CalcComputeSkill>?,
      weapon: freezed == weapon
          ? _self.weapon
          : weapon // ignore: cast_nullable_to_non_nullable
              as CalcComputeWeapon?,
    ));
  }
}

/// @nodoc
mixin _$CalcComputeSkill {
  int get id;
  @JsonKey(name: "level_current")
  int get currentLevel;
  @JsonKey(name: "level_target")
  int get targetLevel;

  /// Serializes this CalcComputeSkill to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalcComputeSkill &&
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
  String toString() {
    return 'CalcComputeSkill(id: $id, currentLevel: $currentLevel, targetLevel: $targetLevel)';
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _CalcComputeSkill implements CalcComputeSkill {
  const _CalcComputeSkill(
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
  Map<String, dynamic> toJson() {
    return _$CalcComputeSkillToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalcComputeSkill &&
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
  String toString() {
    return 'CalcComputeSkill(id: $id, currentLevel: $currentLevel, targetLevel: $targetLevel)';
  }
}

/// @nodoc
mixin _$AvatarWeapon {
  int get id;
  @JsonKey(name: "max_level")
  int get maxLevel;
  @JsonKey(name: "level_current")
  int get currentLevel;
  @JsonKey(name: "weapon_cat_id")
  int get categoryId;
  @JsonKey(name: "weapon_level")
  int get rarity;
  String get name;
  String get icon;

  /// Serializes this AvatarWeapon to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AvatarWeapon &&
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
  String toString() {
    return 'AvatarWeapon(id: $id, maxLevel: $maxLevel, currentLevel: $currentLevel, categoryId: $categoryId, rarity: $rarity, name: $name, icon: $icon)';
  }
}

/// @nodoc
@JsonSerializable()
class _AvatarWeapon implements AvatarWeapon {
  const _AvatarWeapon(
      {required this.id,
      @JsonKey(name: "max_level") required this.maxLevel,
      @JsonKey(name: "level_current") required this.currentLevel,
      @JsonKey(name: "weapon_cat_id") required this.categoryId,
      @JsonKey(name: "weapon_level") required this.rarity,
      required this.name,
      required this.icon});
  factory _AvatarWeapon.fromJson(Map<String, dynamic> json) =>
      _$AvatarWeaponFromJson(json);

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
  Map<String, dynamic> toJson() {
    return _$AvatarWeaponToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AvatarWeapon &&
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
  String toString() {
    return 'AvatarWeapon(id: $id, maxLevel: $maxLevel, currentLevel: $currentLevel, categoryId: $categoryId, rarity: $rarity, name: $name, icon: $icon)';
  }
}

/// @nodoc
mixin _$CalcComputeWeapon {
  int get id;
  @JsonKey(name: "max_level")
  int? get maxLevel;
  @JsonKey(name: "level_current")
  int get currentLevel;
  @JsonKey(name: "level_target")
  int get targetLevel;
  @JsonKey(name: "weapon_cat_id")
  int? get categoryId;
  @JsonKey(name: "weapon_level")
  int get rarity;
  String get name;
  String? get icon;

  /// Serializes this CalcComputeWeapon to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalcComputeWeapon &&
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
  String toString() {
    return 'CalcComputeWeapon(id: $id, maxLevel: $maxLevel, currentLevel: $currentLevel, targetLevel: $targetLevel, categoryId: $categoryId, rarity: $rarity, name: $name, icon: $icon)';
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _CalcComputeWeapon implements CalcComputeWeapon {
  const _CalcComputeWeapon(
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
  Map<String, dynamic> toJson() {
    return _$CalcComputeWeaponToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalcComputeWeapon &&
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
  String toString() {
    return 'CalcComputeWeapon(id: $id, maxLevel: $maxLevel, currentLevel: $currentLevel, targetLevel: $targetLevel, categoryId: $categoryId, rarity: $rarity, name: $name, icon: $icon)';
  }
}

/// @nodoc
mixin _$CalcResult {
  @JsonKey(name: "overall_consume")
  List<CalcConsumptionItem> get overallConsume;

  /// Serializes this CalcResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalcResult &&
            const DeepCollectionEquality()
                .equals(other.overallConsume, overallConsume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(overallConsume));

  @override
  String toString() {
    return 'CalcResult(overallConsume: $overallConsume)';
  }
}

/// @nodoc
@JsonSerializable()
class _CalcResult implements CalcResult {
  const _CalcResult(
      {@JsonKey(name: "overall_consume")
      required final List<CalcConsumptionItem> overallConsume})
      : _overallConsume = overallConsume;
  factory _CalcResult.fromJson(Map<String, dynamic> json) =>
      _$CalcResultFromJson(json);

  final List<CalcConsumptionItem> _overallConsume;
  @override
  @JsonKey(name: "overall_consume")
  List<CalcConsumptionItem> get overallConsume {
    if (_overallConsume is EqualUnmodifiableListView) return _overallConsume;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_overallConsume);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CalcResultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalcResult &&
            const DeepCollectionEquality()
                .equals(other._overallConsume, _overallConsume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_overallConsume));

  @override
  String toString() {
    return 'CalcResult(overallConsume: $overallConsume)';
  }
}

/// @nodoc
mixin _$CalcConsumptionItem {
  int get id;
  @JsonKey(name: "lack_num")
  int get lackNum;
  int get num;

  /// Serializes this CalcConsumptionItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalcConsumptionItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lackNum, lackNum) || other.lackNum == lackNum) &&
            (identical(other.num, num) || other.num == num));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, lackNum, num);

  @override
  String toString() {
    return 'CalcConsumptionItem(id: $id, lackNum: $lackNum, num: $num)';
  }
}

/// @nodoc
@JsonSerializable()
class _CalcConsumptionItem implements CalcConsumptionItem {
  const _CalcConsumptionItem(
      {required this.id,
      @JsonKey(name: "lack_num") required this.lackNum,
      required this.num});
  factory _CalcConsumptionItem.fromJson(Map<String, dynamic> json) =>
      _$CalcConsumptionItemFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "lack_num")
  final int lackNum;
  @override
  final int num;

  @override
  Map<String, dynamic> toJson() {
    return _$CalcConsumptionItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalcConsumptionItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lackNum, lackNum) || other.lackNum == lackNum) &&
            (identical(other.num, num) || other.num == num));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, lackNum, num);

  @override
  String toString() {
    return 'CalcConsumptionItem(id: $id, lackNum: $lackNum, num: $num)';
  }
}

// dart format on
