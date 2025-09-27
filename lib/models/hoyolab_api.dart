// workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore_for_file: invalid_annotation_target

import "package:freezed_annotation/freezed_annotation.dart";

part "hoyolab_api.freezed.dart";
part "hoyolab_api.g.dart";

@Freezed(genericArgumentFactories: true)
sealed class HoyolabApiResult<T> with _$HoyolabApiResult<T> {
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
sealed class HoyolabListData<T> with _$HoyolabListData<T> {
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
sealed class HyvServer with _$HyvServer {
  const factory HyvServer({
    required String region,
    required String name,
  }) = _HyvServer;

  factory HyvServer.fromJson(Map<String, dynamic> json) =>
      _$HyvServerFromJson(json);
}

@freezed
sealed class HyvUserInfo with _$HyvUserInfo {
  const factory HyvUserInfo({
    @JsonKey(name: "account_name") required String accountName,
  }) = _HyvUserInfo;
  
  factory HyvUserInfo.fromJson(Map<String, dynamic> json) =>
      _$HyvUserInfoFromJson(json);
}

@freezed
sealed class HyvUserGameRole with _$HyvUserGameRole {
  const factory HyvUserGameRole({
    @JsonKey(name: "game_uid") required String uid,
    required String nickname,
    required int level,
  }) = _HyvUserGameRole;

  factory HyvUserGameRole.fromJson(Map<String, dynamic> json) =>
      _$HyvUserGameRoleFromJson(json);
}

@freezed
sealed class AvatarListResultItem with _$AvatarListResultItem, WithId {
  const AvatarListResultItem._();

  const factory AvatarListResultItem({
    required int id,
    required String name,
    @JsonKey(name: "level_current") required int currentLevel,
    @JsonKey(name: "max_level") required int maxLevel,
    @JsonKey(name: "skill_list") required List<AvatarSkill> skills,
    AvatarWeapon? weapon,
  }) = _AvatarListResultItem;

  factory AvatarListResultItem.fromJson(Map<String, dynamic> json) =>
      _$AvatarListResultItemFromJson(json);
}

// @freezed
// class AvatarDetail with _$AvatarDetail {
//   const factory AvatarDetail({
//     @JsonKey(name: "skill_list") required List<AvatarDetailSkill> skills,
//   }) = _AvatarDetail;
//
//   factory AvatarDetail.fromJson(Map<String, dynamic> json) =>
//       _$AvatarDetailFromJson(json);
// }

// @freezed
// class AvatarDetailSkill with _$AvatarDetailSkill {
//   const factory AvatarDetailSkill({
//     @JsonKey(name: "group_id") required int groupId,
//     @JsonKey(name: "max_level") required int maxLevel,
//     @JsonKey(name: "level_current") required int currentLevel,
//   }) = _AvatarDetailSkill;
//
//   factory AvatarDetailSkill.fromJson(Map<String, dynamic> json) =>
//       _$AvatarDetailSkillFromJson(json);
// }

@freezed
sealed class AvatarSkill with _$AvatarSkill {
  const factory AvatarSkill({
    @JsonKey(name: "group_id") required int groupId,
    @JsonKey(name: "max_level") required int maxLevel,
    @JsonKey(name: "level_current") required int currentLevel,
  }) = _AvatarSkill;

  factory AvatarSkill.fromJson(Map<String, dynamic> json) =>
      _$AvatarSkillFromJson(json);
}

@freezed
sealed class AvatarAuth with _$AvatarAuth {
  const factory AvatarAuth({
    @JsonKey(name: "avatar_auth") required int avatarAuth,
  }) = _AvatarAuth;

  factory AvatarAuth.fromJson(Map<String, dynamic> json) =>
      _$AvatarAuthFromJson(json);
}

@freezed
sealed class GameRecordCard with _$GameRecordCard {
  const factory GameRecordCard({
    @JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
    required GameType gameType,
    @JsonKey(name: "data_switches") required List<DataSwitchMetadata> dataSwitches,
  }) = _GameRecordCard;

  factory GameRecordCard.fromJson(Map<String, dynamic> json) =>
      _$GameRecordCardFromJson(json);
}

@freezed
sealed class DataSwitchMetadata with _$DataSwitchMetadata {
  const factory DataSwitchMetadata({
    @JsonKey(name: "switch_id", unknownEnumValue: DataSwitchType.enableBattleChronicle)
    required DataSwitchType switchId,
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

@freezed
sealed class DailyNote with _$DailyNote {
  const factory DailyNote({
    @JsonKey(name: "current_resin") required int currentResin,
    @JsonKey(name: "resin_recovery_time") required String resinRecoveryTime,
    @JsonKey(name: "current_home_coin") required int currentHomeCoin,
  }) = _DailyNote;

  factory DailyNote.fromJson(Map<String, dynamic> json) =>
      _$DailyNoteFromJson(json);
}

@Freezed(toJson: true, copyWith: true)
sealed class CalcComputeItem with _$CalcComputeItem {
  const factory CalcComputeItem({
    @JsonKey(name: "avatar_id") int? avatarId,
    @JsonKey(name: "avatar_level_current") int? currentAvatarLevel,
    @JsonKey(name: "element_attr_id") int? elementAttrId,
    @JsonKey(name: "avatar_level_target") int? targetAvatarLevel,
    @JsonKey(name: "skill_list") List<CalcComputeSkill>? skills,
    CalcComputeWeapon? weapon,
  }) = _CalcComputeItem;
}

@Freezed(toJson: true)
sealed class CalcComputeSkill with _$CalcComputeSkill {
  const factory CalcComputeSkill({
    required int id,
    @JsonKey(name: "level_current") required int currentLevel,
    @JsonKey(name: "level_target") required int targetLevel,
  }) = _CalcComputeSkill;
}

@freezed
sealed class AvatarWeapon with _$AvatarWeapon {
  const factory AvatarWeapon({
    required int id,
    @JsonKey(name: "max_level") required int maxLevel,
    @JsonKey(name: "level_current") required int currentLevel,
    @JsonKey(name: "weapon_cat_id") required int categoryId,
    @JsonKey(name: "weapon_level") required int rarity,
    required String name,
    required String icon,
  }) = _AvatarWeapon;

  factory AvatarWeapon.fromJson(Map<String, dynamic> json) =>
      _$AvatarWeaponFromJson(json);
}

@Freezed(toJson: true)
sealed class CalcComputeWeapon with _$CalcComputeWeapon {
  const factory CalcComputeWeapon({
    required int id,
    @JsonKey(name: "max_level") int? maxLevel,
    @JsonKey(name: "level_current") required int currentLevel,
    @JsonKey(name: "level_target") required int targetLevel,
    @JsonKey(name: "weapon_cat_id") int? categoryId,
    @JsonKey(name: "weapon_level") required int rarity,
    required String name,
    String? icon,
  }) = _CalcComputeWeapon;

  factory CalcComputeWeapon.fromWeapon(AvatarWeapon weapon, int targetLevel) =>
      CalcComputeWeapon(
        id: weapon.id,
        maxLevel: weapon.maxLevel,
        currentLevel: weapon.currentLevel,
        targetLevel: targetLevel,
        categoryId: weapon.categoryId,
        rarity: weapon.rarity,
        name: weapon.name,
        icon: weapon.icon,
      );
}

@freezed
sealed class CalcResult with _$CalcResult {
  const factory CalcResult({
    @JsonKey(name: "overall_consume") required List<CalcConsumptionItem> overallConsume,
  }) = _CalcResult;

  factory CalcResult.fromJson(Map<String, dynamic> json) =>
      _$CalcResultFromJson(json);
}

@freezed
sealed class CalcConsumptionItem with _$CalcConsumptionItem {
  const factory CalcConsumptionItem({
    required int id,
    @JsonKey(name: "lack_num") required int lackNum,
    required int num,
  }) = _CalcConsumptionItem;

  factory CalcConsumptionItem.fromJson(Map<String, dynamic> json) =>
      _$CalcConsumptionItemFromJson(json);
}

mixin WithId {
  int get id;
}

typedef LookupServersResult = HoyolabApiResult<HoyolabListData<HyvServer>>;
typedef VerifyLTokenResult = HoyolabApiResult<HyvUserInfo>;
typedef GetUserGameRolesResult = HoyolabListData<HyvUserGameRole>;
typedef AvatarListResult = HoyolabListData<AvatarListResultItem>;
typedef GameRecordCardList = HoyolabListData<GameRecordCard>;

@freezed
sealed class GachaLogResultItem with _$GachaLogResultItem {
  const factory GachaLogResultItem({
    required String id,
    @JsonKey(name: "gacha_type") required String gachaType,
    required String time,
    required String name,
    @JsonKey(name: "item_type") required String itemType,
    @JsonKey(name: "rank_type") required String rankType,
  }) = _GachaLogResultItem;

  factory GachaLogResultItem.fromJson(Map<String, dynamic> json) =>
      _$GachaLogResultItemFromJson(json);
}

typedef GachaLogResult = HoyolabListData<GachaLogResultItem>;
