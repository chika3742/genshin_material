// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_release_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssetReleaseVersion _$AssetReleaseVersionFromJson(Map<String, dynamic> json) =>
    _AssetReleaseVersion(
      createdAt: DateTime.parse(json['createdAt'] as String),
      dataVersion: json['dataVersion'] as String,
      channel: $enumDecode(_$AssetChannelEnumMap, json['channel']),
      distUrl: json['distUrl'] as String,
      schemaVersion: (json['schemaVersion'] as num).toInt(),
    );

Map<String, dynamic> _$AssetReleaseVersionToJson(
        _AssetReleaseVersion instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'dataVersion': instance.dataVersion,
      'channel': _$AssetChannelEnumMap[instance.channel]!,
      'distUrl': instance.distUrl,
      'schemaVersion': instance.schemaVersion,
    };

const _$AssetChannelEnumMap = {
  AssetChannel.prod: 'prod',
  AssetChannel.dev: 'dev',
};
