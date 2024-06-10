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
