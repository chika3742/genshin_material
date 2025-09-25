// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hoyolab_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HoyolabApiResult<T> _$HoyolabApiResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _HoyolabApiResult<T>(
  retcode: (json['retcode'] as num).toInt(),
  message: json['message'] as String,
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
);

Map<String, dynamic> _$HoyolabApiResultToJson<T>(
  _HoyolabApiResult<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'retcode': instance.retcode,
  'message': instance.message,
  'data': _$nullableGenericToJson(instance.data, toJsonT),
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);

_HoyolabListData<T> _$HoyolabListDataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _HoyolabListData<T>(
  list: (json['list'] as List<dynamic>).map(fromJsonT).toList(),
);

Map<String, dynamic> _$HoyolabListDataToJson<T>(
  _HoyolabListData<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{'list': instance.list.map(toJsonT).toList()};

_HyvServer _$HyvServerFromJson(Map<String, dynamic> json) =>
    _HyvServer(region: json['region'] as String, name: json['name'] as String);

Map<String, dynamic> _$HyvServerToJson(_HyvServer instance) =>
    <String, dynamic>{'region': instance.region, 'name': instance.name};

_HyvUserInfo _$HyvUserInfoFromJson(Map<String, dynamic> json) =>
    _HyvUserInfo(accountName: json['account_name'] as String);

Map<String, dynamic> _$HyvUserInfoToJson(_HyvUserInfo instance) =>
    <String, dynamic>{'account_name': instance.accountName};

_HyvUserGameRole _$HyvUserGameRoleFromJson(Map<String, dynamic> json) =>
    _HyvUserGameRole(
      uid: json['game_uid'] as String,
      nickname: json['nickname'] as String,
      level: (json['level'] as num).toInt(),
    );

Map<String, dynamic> _$HyvUserGameRoleToJson(_HyvUserGameRole instance) =>
    <String, dynamic>{
      'game_uid': instance.uid,
      'nickname': instance.nickname,
      'level': instance.level,
    };

_AvatarListResultItem _$AvatarListResultItemFromJson(
  Map<String, dynamic> json,
) => _AvatarListResultItem(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  currentLevel: (json['level_current'] as num).toInt(),
  maxLevel: (json['max_level'] as num).toInt(),
  skills: (json['skill_list'] as List<dynamic>)
      .map((e) => AvatarSkill.fromJson(e as Map<String, dynamic>))
      .toList(),
  weapon: json['weapon'] == null
      ? null
      : AvatarWeapon.fromJson(json['weapon'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AvatarListResultItemToJson(
  _AvatarListResultItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'level_current': instance.currentLevel,
  'max_level': instance.maxLevel,
  'skill_list': instance.skills,
  'weapon': instance.weapon,
};

_AvatarSkill _$AvatarSkillFromJson(Map<String, dynamic> json) => _AvatarSkill(
  groupId: (json['group_id'] as num).toInt(),
  maxLevel: (json['max_level'] as num).toInt(),
  currentLevel: (json['level_current'] as num).toInt(),
);

Map<String, dynamic> _$AvatarSkillToJson(_AvatarSkill instance) =>
    <String, dynamic>{
      'group_id': instance.groupId,
      'max_level': instance.maxLevel,
      'level_current': instance.currentLevel,
    };

_AvatarAuth _$AvatarAuthFromJson(Map<String, dynamic> json) =>
    _AvatarAuth(avatarAuth: (json['avatar_auth'] as num).toInt());

Map<String, dynamic> _$AvatarAuthToJson(_AvatarAuth instance) =>
    <String, dynamic>{'avatar_auth': instance.avatarAuth};

_GameRecordCard _$GameRecordCardFromJson(Map<String, dynamic> json) =>
    _GameRecordCard(
      gameType: $enumDecode(
        _$GameTypeEnumMap,
        json['game_id'],
        unknownValue: GameType.starrail,
      ),
      dataSwitches: (json['data_switches'] as List<dynamic>)
          .map((e) => DataSwitchMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameRecordCardToJson(_GameRecordCard instance) =>
    <String, dynamic>{
      'game_id': _$GameTypeEnumMap[instance.gameType]!,
      'data_switches': instance.dataSwitches,
    };

const _$GameTypeEnumMap = {
  GameType.genshin: 2,
  GameType.starrail: 6,
  GameType.houkai3rd: 1,
};

_DataSwitchMetadata _$DataSwitchMetadataFromJson(Map<String, dynamic> json) =>
    _DataSwitchMetadata(
      switchId: $enumDecode(
        _$DataSwitchTypeEnumMap,
        json['switch_id'],
        unknownValue: DataSwitchType.enableBattleChronicle,
      ),
      isPublic: json['is_public'] as bool,
    );

Map<String, dynamic> _$DataSwitchMetadataToJson(_DataSwitchMetadata instance) =>
    <String, dynamic>{
      'switch_id': _$DataSwitchTypeEnumMap[instance.switchId]!,
      'is_public': instance.isPublic,
    };

const _$DataSwitchTypeEnumMap = {
  DataSwitchType.enableBattleChronicle: 1,
  DataSwitchType.publicCharacterDetails: 2,
  DataSwitchType.publicCharacterDetailsStarrail: 4,
  DataSwitchType.enableRealtimeNotes: 3,
};

_DailyNote _$DailyNoteFromJson(Map<String, dynamic> json) => _DailyNote(
  currentResin: (json['current_resin'] as num).toInt(),
  resinRecoveryTime: json['resin_recovery_time'] as String,
  currentHomeCoin: (json['current_home_coin'] as num).toInt(),
);

Map<String, dynamic> _$DailyNoteToJson(_DailyNote instance) =>
    <String, dynamic>{
      'current_resin': instance.currentResin,
      'resin_recovery_time': instance.resinRecoveryTime,
      'current_home_coin': instance.currentHomeCoin,
    };

Map<String, dynamic> _$CalcComputeItemToJson(_CalcComputeItem instance) =>
    <String, dynamic>{
      'avatar_id': instance.avatarId,
      'avatar_level_current': instance.currentAvatarLevel,
      'element_attr_id': instance.elementAttrId,
      'avatar_level_target': instance.targetAvatarLevel,
      'skill_list': instance.skills,
      'weapon': instance.weapon,
    };

Map<String, dynamic> _$CalcComputeSkillToJson(_CalcComputeSkill instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level_current': instance.currentLevel,
      'level_target': instance.targetLevel,
    };

_AvatarWeapon _$AvatarWeaponFromJson(Map<String, dynamic> json) =>
    _AvatarWeapon(
      id: (json['id'] as num).toInt(),
      maxLevel: (json['max_level'] as num).toInt(),
      currentLevel: (json['level_current'] as num).toInt(),
      categoryId: (json['weapon_cat_id'] as num).toInt(),
      rarity: (json['weapon_level'] as num).toInt(),
      name: json['name'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$AvatarWeaponToJson(_AvatarWeapon instance) =>
    <String, dynamic>{
      'id': instance.id,
      'max_level': instance.maxLevel,
      'level_current': instance.currentLevel,
      'weapon_cat_id': instance.categoryId,
      'weapon_level': instance.rarity,
      'name': instance.name,
      'icon': instance.icon,
    };

Map<String, dynamic> _$CalcComputeWeaponToJson(_CalcComputeWeapon instance) =>
    <String, dynamic>{
      'id': instance.id,
      'max_level': instance.maxLevel,
      'level_current': instance.currentLevel,
      'level_target': instance.targetLevel,
      'weapon_cat_id': instance.categoryId,
      'weapon_level': instance.rarity,
      'name': instance.name,
      'icon': instance.icon,
    };

_CalcResult _$CalcResultFromJson(Map<String, dynamic> json) => _CalcResult(
  overallConsume: (json['overall_consume'] as List<dynamic>)
      .map((e) => CalcConsumptionItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CalcResultToJson(_CalcResult instance) =>
    <String, dynamic>{'overall_consume': instance.overallConsume};

_CalcConsumptionItem _$CalcConsumptionItemFromJson(Map<String, dynamic> json) =>
    _CalcConsumptionItem(
      id: (json['id'] as num).toInt(),
      lackNum: (json['lack_num'] as num).toInt(),
      num: (json['num'] as num).toInt(),
    );

Map<String, dynamic> _$CalcConsumptionItemToJson(
  _CalcConsumptionItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'lack_num': instance.lackNum,
  'num': instance.num,
};
