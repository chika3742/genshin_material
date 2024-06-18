import "package:freezed_annotation/freezed_annotation.dart";

part "hoyolab_api.freezed.dart";
part "hoyolab_api.g.dart";

@Freezed(genericArgumentFactories: true)
class HoyolabApiResult<T> with _$HoyolabApiResult<T> {
  const HoyolabApiResult._();

  const factory HoyolabApiResult({
    required int retcode,
    required String message,
    T? data,
  }) = _HoyolabApiResult<T>;

  factory HoyolabApiResult.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$HoyolabApiResultFromJson(json, fromJsonT);

  static HoyolabApiResult<HoyolabListData<I>> fromJsonList<I>(Map<String, dynamic> json, I Function(Object?) fromJsonItem) {
    return HoyolabApiResult.fromJson(json, (Object? it) => HoyolabListData.fromJson(it as Map<String, dynamic>, fromJsonItem));
  }

  bool get hasError => retcode != 0;
}

@Freezed(genericArgumentFactories: true)
class HoyolabListData<T> with _$HoyolabListData<T> {
  const factory HoyolabListData({
    required List<T> list,
  }) = _HoyolabListData<T>;

  factory HoyolabListData.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$HoyolabListDataFromJson(json, fromJsonT);

  static HoyolabListData<T> fromJsonT<T>(Object? json, T Function(Map<String, dynamic>) fromJsonT) {
    return HoyolabListData.fromJson(json as Map<String, dynamic>, (e) => fromJsonT(e as Map<String, dynamic>));
  }
}

@freezed
class HyvServer with _$HyvServer {
  const factory HyvServer({
    required String region,
    required String name,
  }) = _HyvServer;

  factory HyvServer.fromJson(Map<String, dynamic> json) =>
      _$HyvServerFromJson(json);
}

@freezed
class HyvUserInfo with _$HyvUserInfo {
  const factory HyvUserInfo({
    // workaround for https://github.com/rrousselGit/freezed/issues/488
    // ignore: invalid_annotation_target
    @JsonKey(name: "account_name") required String accountName,
  }) = _HyvUserInfo;
  
  factory HyvUserInfo.fromJson(Map<String, dynamic> json) =>
      _$HyvUserInfoFromJson(json);
}

@freezed
class HyvUserGameRole with _$HyvUserGameRole {
  const factory HyvUserGameRole({
    // workaround for https://github.com/rrousselGit/freezed/issues/488
    // ignore: invalid_annotation_target
    @JsonKey(name: "game_uid") required String uid,
    required String nickname,
    required int level,
  }) = _HyvUserGameRole;

  factory HyvUserGameRole.fromJson(Map<String, dynamic> json) =>
      _$HyvUserGameRoleFromJson(json);
}

@freezed
class AvatarListResultItem with _$AvatarListResultItem, WithId {
  const AvatarListResultItem._();

  const factory AvatarListResultItem({
    required int id,
    required String name,
    // workaround for https://github.com/rrousselGit/freezed/issues/488
    // ignore: invalid_annotation_target
    @JsonKey(name: "level_current") required String currentLevel,
    // ignore: invalid_annotation_target
    @JsonKey(name: "max_level") required int maxLevel,
  }) = _AvatarListResultItem;

  factory AvatarListResultItem.fromJson(Map<String, dynamic> json) =>
      _$AvatarListResultItemFromJson(json);
}

@freezed
class AvatarDetail with _$AvatarDetail {
  const factory AvatarDetail({
    // ignore: invalid_annotation_target
    @JsonKey(name: "skill_list") required List<AvatarDetailSkill> skills,
  }) = _AvatarDetail;

  factory AvatarDetail.fromJson(Map<String, dynamic> json) =>
      _$AvatarDetailFromJson(json);
}

@freezed
class AvatarDetailSkill with _$AvatarDetailSkill {
  const factory AvatarDetailSkill({
    // ignore: invalid_annotation_target
    @JsonKey(name: "max_level") required int maxLevel,
    // ignore: invalid_annotation_target
    @JsonKey(name: "level_current") required int currentLevel,
  }) = _AvatarDetailSkill;

  factory AvatarDetailSkill.fromJson(Map<String, dynamic> json) =>
      _$AvatarDetailSkillFromJson(json);
}

@freezed
class AvatarAuth with _$AvatarAuth {
  const factory AvatarAuth({
    // ignore: invalid_annotation_target
    @JsonKey(name: "avatar_auth") required int avatarAuth,
  }) = _AvatarAuth;

  factory AvatarAuth.fromJson(Map<String, dynamic> json) =>
      _$AvatarAuthFromJson(json);
}

@freezed
class GameRecordCard with _$GameRecordCard {
  const factory GameRecordCard({
    // ignore: invalid_annotation_target
    @JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
    required GameType gameType,
    // ignore: invalid_annotation_target
    @JsonKey(name: "data_switches") required List<DataSwitchMetadata> dataSwitches,
  }) = _GameRecordCard;

  factory GameRecordCard.fromJson(Map<String, dynamic> json) =>
      _$GameRecordCardFromJson(json);
}

@freezed
class DataSwitchMetadata with _$DataSwitchMetadata {
  const factory DataSwitchMetadata({
    // ignore: invalid_annotation_target
    @JsonKey(name: "switch_id", unknownEnumValue: DataSwitchType.enableBattleChronicle)
    required DataSwitchType switchId,
    // ignore: invalid_annotation_target
    @JsonKey(name: "is_public") required bool isPublic,
  }) = _DataSwitchMetadata;

  factory DataSwitchMetadata.fromJson(Map<String, dynamic> json) =>
      _$DataSwitchMetadataFromJson(json);
}

enum DataSwitchType {
  @JsonValue(1)
  enableBattleChronicle,
  @JsonValue(2)
  publicCharacterDetails,
  @JsonValue(4)
  publicCharacterDetailsStarrail,
  @JsonValue(3)
  enableRealtimeNotes,
}

enum GameType {
  @JsonValue(2)
  genshin,
  @JsonValue(6)
  starrail,
  @JsonValue(1)
  houkai3rd,
}

mixin WithId {
  int get id;
}

typedef LookupServersResult = HoyolabApiResult<HoyolabListData<HyvServer>>;
typedef VerifyLTokenResult = HoyolabApiResult<HyvUserInfo>;
typedef GetUserGameRolesResult = HoyolabListData<HyvUserGameRole>;
typedef AvatarListResult = HoyolabListData<AvatarListResultItem>;
typedef GameRecordCardList = HoyolabListData<GameRecordCard>;
