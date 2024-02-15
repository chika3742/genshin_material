// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_release_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetReleaseVersionImpl _$$AssetReleaseVersionImplFromJson(
        Map<String, dynamic> json) =>
    _$AssetReleaseVersionImpl(
      releasedAt: DateTime.parse(json['releasedAt'] as String),
      dataVersion: json['dataVersion'] as String,
      channel: $enumDecode(_$AssetChannelEnumMap, json['channel']),
      distUrl: json['distUrl'] as String,
    );

Map<String, dynamic> _$$AssetReleaseVersionImplToJson(
        _$AssetReleaseVersionImpl instance) =>
    <String, dynamic>{
      'releasedAt': instance.releasedAt.toIso8601String(),
      'dataVersion': instance.dataVersion,
      'channel': _$AssetChannelEnumMap[instance.channel]!,
      'distUrl': instance.distUrl,
    };

const _$AssetChannelEnumMap = {
  AssetChannel.prod: 'prod',
  AssetChannel.staging: 'staging',
};
