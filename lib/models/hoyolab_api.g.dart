// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hoyolab_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HoyolabApiResultImpl<T> _$$HoyolabApiResultImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$HoyolabApiResultImpl<T>(
      retcode: (json['retcode'] as num).toInt(),
      message: json['message'] as String,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$$HoyolabApiResultImplToJson<T>(
  _$HoyolabApiResultImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'retcode': instance.retcode,
      'message': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

_$HoyolabListDataImpl<T> _$$HoyolabListDataImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$HoyolabListDataImpl<T>(
      list: (json['list'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$$HoyolabListDataImplToJson<T>(
  _$HoyolabListDataImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'list': instance.list.map(toJsonT).toList(),
    };

_$HyvServerImpl _$$HyvServerImplFromJson(Map<String, dynamic> json) =>
    _$HyvServerImpl(
      region: json['region'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$HyvServerImplToJson(_$HyvServerImpl instance) =>
    <String, dynamic>{
      'region': instance.region,
      'name': instance.name,
    };

_$HyvUserInfoImpl _$$HyvUserInfoImplFromJson(Map<String, dynamic> json) =>
    _$HyvUserInfoImpl(
      accountName: json['account_name'] as String,
    );

Map<String, dynamic> _$$HyvUserInfoImplToJson(_$HyvUserInfoImpl instance) =>
    <String, dynamic>{
      'account_name': instance.accountName,
    };

_$HyvUserGameRoleImpl _$$HyvUserGameRoleImplFromJson(
        Map<String, dynamic> json) =>
    _$HyvUserGameRoleImpl(
      uid: json['game_uid'] as String,
      nickname: json['nickname'] as String,
      level: (json['level'] as num).toInt(),
    );

Map<String, dynamic> _$$HyvUserGameRoleImplToJson(
        _$HyvUserGameRoleImpl instance) =>
    <String, dynamic>{
      'game_uid': instance.uid,
      'nickname': instance.nickname,
      'level': instance.level,
    };

_$AvatarListResultItemImpl _$$AvatarListResultItemImplFromJson(
        Map<String, dynamic> json) =>
    _$AvatarListResultItemImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      currentLevel: json['level_current'] as String,
      maxLevel: (json['max_level'] as num).toInt(),
      skills: (json['skill_list'] as List<dynamic>)
          .map((e) => AvatarSkill.fromJson(e as Map<String, dynamic>))
          .toList(),
      weapon: json['weapon'] == null
          ? null
          : AvatarWeapon.fromJson(json['weapon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AvatarListResultItemImplToJson(
        _$AvatarListResultItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'level_current': instance.currentLevel,
      'max_level': instance.maxLevel,
      'skill_list': instance.skills,
      'weapon': instance.weapon,
    };

_$AvatarSkillImpl _$$AvatarSkillImplFromJson(Map<String, dynamic> json) =>
    _$AvatarSkillImpl(
      groupId: (json['group_id'] as num).toInt(),
      maxLevel: (json['max_level'] as num).toInt(),
      currentLevel: (json['level_current'] as num).toInt(),
    );

Map<String, dynamic> _$$AvatarSkillImplToJson(_$AvatarSkillImpl instance) =>
    <String, dynamic>{
      'group_id': instance.groupId,
      'max_level': instance.maxLevel,
      'level_current': instance.currentLevel,
    };

_$AvatarAuthImpl _$$AvatarAuthImplFromJson(Map<String, dynamic> json) =>
    _$AvatarAuthImpl(
      avatarAuth: (json['avatar_auth'] as num).toInt(),
    );

Map<String, dynamic> _$$AvatarAuthImplToJson(_$AvatarAuthImpl instance) =>
    <String, dynamic>{
      'avatar_auth': instance.avatarAuth,
    };

_$GameRecordCardImpl _$$GameRecordCardImplFromJson(Map<String, dynamic> json) =>
    _$GameRecordCardImpl(
      gameType: $enumDecode(_$GameTypeEnumMap, json['game_id'],
          unknownValue: GameType.starrail),
      dataSwitches: (json['data_switches'] as List<dynamic>)
          .map((e) => DataSwitchMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GameRecordCardImplToJson(
        _$GameRecordCardImpl instance) =>
    <String, dynamic>{
      'game_id': _$GameTypeEnumMap[instance.gameType]!,
      'data_switches': instance.dataSwitches,
    };

const _$GameTypeEnumMap = {
  GameType.genshin: 2,
  GameType.starrail: 6,
  GameType.houkai3rd: 1,
};

_$DataSwitchMetadataImpl _$$DataSwitchMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$DataSwitchMetadataImpl(
      switchId: $enumDecode(_$DataSwitchTypeEnumMap, json['switch_id'],
          unknownValue: DataSwitchType.enableBattleChronicle),
      isPublic: json['is_public'] as bool,
    );

Map<String, dynamic> _$$DataSwitchMetadataImplToJson(
        _$DataSwitchMetadataImpl instance) =>
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

_$DailyNoteImpl _$$DailyNoteImplFromJson(Map<String, dynamic> json) =>
    _$DailyNoteImpl(
      currentResin: (json['current_resin'] as num).toInt(),
      resinRecoveryTime: json['resin_recovery_time'] as String,
      currentHomeCoin: (json['current_home_coin'] as num).toInt(),
    );

Map<String, dynamic> _$$DailyNoteImplToJson(_$DailyNoteImpl instance) =>
    <String, dynamic>{
      'current_resin': instance.currentResin,
      'resin_recovery_time': instance.resinRecoveryTime,
      'current_home_coin': instance.currentHomeCoin,
    };

Map<String, dynamic> _$$CalcComputeItemImplToJson(
        _$CalcComputeItemImpl instance) =>
    <String, dynamic>{
      'avatar_id': instance.avatarId,
      'avatar_level_current': instance.currentAvatarLevel,
      'element_attr_id': instance.elementAttrId,
      'avatar_level_target': instance.targetAvatarLevel,
      'skill_list': instance.skills,
      'weapon': instance.weapon,
    };

Map<String, dynamic> _$$CalcComputeSkillImplToJson(
        _$CalcComputeSkillImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level_current': instance.currentLevel,
      'level_target': instance.targetLevel,
    };

_$AvatarWeaponImpl _$$AvatarWeaponImplFromJson(Map<String, dynamic> json) =>
    _$AvatarWeaponImpl(
      id: (json['id'] as num).toInt(),
      maxLevel: (json['max_level'] as num).toInt(),
      currentLevel: (json['level_current'] as num).toInt(),
      categoryId: (json['weapon_cat_id'] as num).toInt(),
      rarity: (json['weapon_level'] as num).toInt(),
      name: json['name'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$AvatarWeaponImplToJson(_$AvatarWeaponImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'max_level': instance.maxLevel,
      'level_current': instance.currentLevel,
      'weapon_cat_id': instance.categoryId,
      'weapon_level': instance.rarity,
      'name': instance.name,
      'icon': instance.icon,
    };

Map<String, dynamic> _$$CalcComputeWeaponImplToJson(
        _$CalcComputeWeaponImpl instance) =>
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

_$CalcResultImpl _$$CalcResultImplFromJson(Map<String, dynamic> json) =>
    _$CalcResultImpl(
      overallConsume: (json['overall_consume'] as List<dynamic>)
          .map((e) => CalcConsumptionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CalcResultImplToJson(_$CalcResultImpl instance) =>
    <String, dynamic>{
      'overall_consume': instance.overallConsume,
    };

_$CalcConsumptionItemImpl _$$CalcConsumptionItemImplFromJson(
        Map<String, dynamic> json) =>
    _$CalcConsumptionItemImpl(
      id: (json['id'] as num).toInt(),
      lackNum: (json['lack_num'] as num).toInt(),
      num: (json['num'] as num).toInt(),
    );

Map<String, dynamic> _$$CalcConsumptionItemImplToJson(
        _$CalcConsumptionItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lack_num': instance.lackNum,
      'num': instance.num,
    };
