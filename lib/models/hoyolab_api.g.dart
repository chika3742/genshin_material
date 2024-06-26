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
      retcode: json['retcode'] as int,
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
      level: json['level'] as int,
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
      id: json['id'] as int,
      name: json['name'] as String,
      currentLevel: json['level_current'] as String,
      maxLevel: json['max_level'] as int,
    );

Map<String, dynamic> _$$AvatarListResultItemImplToJson(
        _$AvatarListResultItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'level_current': instance.currentLevel,
      'max_level': instance.maxLevel,
    };

_$AvatarDetailImpl _$$AvatarDetailImplFromJson(Map<String, dynamic> json) =>
    _$AvatarDetailImpl(
      skills: (json['skill_list'] as List<dynamic>)
          .map((e) => AvatarDetailSkill.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AvatarDetailImplToJson(_$AvatarDetailImpl instance) =>
    <String, dynamic>{
      'skill_list': instance.skills,
    };

_$AvatarDetailSkillImpl _$$AvatarDetailSkillImplFromJson(
        Map<String, dynamic> json) =>
    _$AvatarDetailSkillImpl(
      maxLevel: json['max_level'] as int,
      currentLevel: json['level_current'] as int,
    );

Map<String, dynamic> _$$AvatarDetailSkillImplToJson(
        _$AvatarDetailSkillImpl instance) =>
    <String, dynamic>{
      'max_level': instance.maxLevel,
      'level_current': instance.currentLevel,
    };

_$AvatarAuthImpl _$$AvatarAuthImplFromJson(Map<String, dynamic> json) =>
    _$AvatarAuthImpl(
      avatarAuth: json['avatar_auth'] as int,
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
      currentResin: json['current_resin'] as int,
      resinRecoveryTime: json['resin_recovery_time'] as String,
      currentHomeCoin: json['current_home_coin'] as int,
    );

Map<String, dynamic> _$$DailyNoteImplToJson(_$DailyNoteImpl instance) =>
    <String, dynamic>{
      'current_resin': instance.currentResin,
      'resin_recovery_time': instance.resinRecoveryTime,
      'current_home_coin': instance.currentHomeCoin,
    };
