// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hoyolab_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HoyolabApiResult<T> _$HoyolabApiResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => $checkedCreate('_HoyolabApiResult', json, ($checkedConvert) {
  final val = _HoyolabApiResult<T>(
    retcode: $checkedConvert('retcode', (v) => (v as num).toInt()),
    message: $checkedConvert('message', (v) => v as String),
    data: $checkedConvert(
      'data',
      (v) => _$nullableGenericFromJson(v, fromJsonT),
    ),
  );
  return val;
});

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
) => $checkedCreate('_HoyolabListData', json, ($checkedConvert) {
  final val = _HoyolabListData<T>(
    list: $checkedConvert(
      'list',
      (v) => (v as List<dynamic>).map(fromJsonT).toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$HoyolabListDataToJson<T>(
  _HoyolabListData<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{'list': instance.list.map(toJsonT).toList()};

_HyvServer _$HyvServerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_HyvServer', json, ($checkedConvert) {
      final val = _HyvServer(
        region: $checkedConvert('region', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$HyvServerToJson(_HyvServer instance) =>
    <String, dynamic>{'region': instance.region, 'name': instance.name};

_HyvUserInfo _$HyvUserInfoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_HyvUserInfo', json, ($checkedConvert) {
      final val = _HyvUserInfo(
        accountName: $checkedConvert('account_name', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'accountName': 'account_name'});

Map<String, dynamic> _$HyvUserInfoToJson(_HyvUserInfo instance) =>
    <String, dynamic>{'account_name': instance.accountName};

_HyvUserGameRole _$HyvUserGameRoleFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_HyvUserGameRole', json, ($checkedConvert) {
      final val = _HyvUserGameRole(
        uid: $checkedConvert('game_uid', (v) => v as String),
        nickname: $checkedConvert('nickname', (v) => v as String),
        level: $checkedConvert('level', (v) => (v as num).toInt()),
      );
      return val;
    }, fieldKeyMap: const {'uid': 'game_uid'});

Map<String, dynamic> _$HyvUserGameRoleToJson(_HyvUserGameRole instance) =>
    <String, dynamic>{
      'game_uid': instance.uid,
      'nickname': instance.nickname,
      'level': instance.level,
    };

_AvatarListResultItem _$AvatarListResultItemFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_AvatarListResultItem',
  json,
  ($checkedConvert) {
    final val = _AvatarListResultItem(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      currentLevel: $checkedConvert('level_current', (v) => (v as num).toInt()),
      maxLevel: $checkedConvert('max_level', (v) => (v as num).toInt()),
      skills: $checkedConvert(
        'skill_list',
        (v) => (v as List<dynamic>)
            .map((e) => AvatarSkill.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      weapon: $checkedConvert(
        'weapon',
        (v) =>
            v == null ? null : AvatarWeapon.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'currentLevel': 'level_current',
    'maxLevel': 'max_level',
    'skills': 'skill_list',
  },
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

_AvatarSkill _$AvatarSkillFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_AvatarSkill',
  json,
  ($checkedConvert) {
    final val = _AvatarSkill(
      groupId: $checkedConvert('group_id', (v) => (v as num).toInt()),
      maxLevel: $checkedConvert('max_level', (v) => (v as num).toInt()),
      currentLevel: $checkedConvert('level_current', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'groupId': 'group_id',
    'maxLevel': 'max_level',
    'currentLevel': 'level_current',
  },
);

Map<String, dynamic> _$AvatarSkillToJson(_AvatarSkill instance) =>
    <String, dynamic>{
      'group_id': instance.groupId,
      'max_level': instance.maxLevel,
      'level_current': instance.currentLevel,
    };

_AvatarAuth _$AvatarAuthFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AvatarAuth', json, ($checkedConvert) {
      final val = _AvatarAuth(
        avatarAuth: $checkedConvert('avatar_auth', (v) => (v as num).toInt()),
      );
      return val;
    }, fieldKeyMap: const {'avatarAuth': 'avatar_auth'});

Map<String, dynamic> _$AvatarAuthToJson(_AvatarAuth instance) =>
    <String, dynamic>{'avatar_auth': instance.avatarAuth};

_GameRecordCard _$GameRecordCardFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_GameRecordCard', json, ($checkedConvert) {
  final val = _GameRecordCard(
    gameType: $checkedConvert(
      'game_id',
      (v) => $enumDecode(_$GameTypeEnumMap, v, unknownValue: GameType.starrail),
    ),
    dataSwitches: $checkedConvert(
      'data_switches',
      (v) => (v as List<dynamic>)
          .map((e) => DataSwitchMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
}, fieldKeyMap: const {'gameType': 'game_id', 'dataSwitches': 'data_switches'});

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
    $checkedCreate('_DataSwitchMetadata', json, ($checkedConvert) {
      final val = _DataSwitchMetadata(
        switchId: $checkedConvert(
          'switch_id',
          (v) => $enumDecode(
            _$DataSwitchTypeEnumMap,
            v,
            unknownValue: DataSwitchType.enableBattleChronicle,
          ),
        ),
        isPublic: $checkedConvert('is_public', (v) => v as bool),
      );
      return val;
    }, fieldKeyMap: const {'switchId': 'switch_id', 'isPublic': 'is_public'});

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

_DailyNote _$DailyNoteFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_DailyNote',
  json,
  ($checkedConvert) {
    final val = _DailyNote(
      currentResin: $checkedConvert('current_resin', (v) => (v as num).toInt()),
      resinRecoveryTime: $checkedConvert(
        'resin_recovery_time',
        (v) => v as String,
      ),
      currentHomeCoin: $checkedConvert(
        'current_home_coin',
        (v) => (v as num).toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'currentResin': 'current_resin',
    'resinRecoveryTime': 'resin_recovery_time',
    'currentHomeCoin': 'current_home_coin',
  },
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

_AvatarWeapon _$AvatarWeaponFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_AvatarWeapon',
  json,
  ($checkedConvert) {
    final val = _AvatarWeapon(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      maxLevel: $checkedConvert('max_level', (v) => (v as num).toInt()),
      currentLevel: $checkedConvert('level_current', (v) => (v as num).toInt()),
      categoryId: $checkedConvert('weapon_cat_id', (v) => (v as num).toInt()),
      rarity: $checkedConvert('weapon_level', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      icon: $checkedConvert('icon', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'maxLevel': 'max_level',
    'currentLevel': 'level_current',
    'categoryId': 'weapon_cat_id',
    'rarity': 'weapon_level',
  },
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

_CalcResult _$CalcResultFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_CalcResult',
  json,
  ($checkedConvert) {
    final val = _CalcResult(
      overallConsume: $checkedConvert(
        'overall_consume',
        (v) => (v as List<dynamic>)
            .map((e) => CalcConsumptionItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'overallConsume': 'overall_consume'},
);

Map<String, dynamic> _$CalcResultToJson(_CalcResult instance) =>
    <String, dynamic>{'overall_consume': instance.overallConsume};

_CalcConsumptionItem _$CalcConsumptionItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CalcConsumptionItem', json, ($checkedConvert) {
      final val = _CalcConsumptionItem(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        lackNum: $checkedConvert('lack_num', (v) => (v as num).toInt()),
        num: $checkedConvert('num', (v) => (v as num).toInt()),
      );
      return val;
    }, fieldKeyMap: const {'lackNum': 'lack_num'});

Map<String, dynamic> _$CalcConsumptionItemToJson(
  _CalcConsumptionItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'lack_num': instance.lackNum,
  'num': instance.num,
};

_SignInfo _$SignInfoFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_SignInfo',
  json,
  ($checkedConvert) {
    final val = _SignInfo(isSign: $checkedConvert('is_sign', (v) => v as bool));
    return val;
  },
  fieldKeyMap: const {'isSign': 'is_sign'},
);

Map<String, dynamic> _$SignInfoToJson(_SignInfo instance) => <String, dynamic>{
  'is_sign': instance.isSign,
};
