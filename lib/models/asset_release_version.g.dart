// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_release_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssetReleaseVersion _$AssetReleaseVersionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_AssetReleaseVersion', json, ($checkedConvert) {
  final val = _AssetReleaseVersion(
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    dataVersion: $checkedConvert('dataVersion', (v) => v as String),
    channel: $checkedConvert(
      'channel',
      (v) => $enumDecode(_$AssetChannelEnumMap, v),
    ),
    distUrl: $checkedConvert('distUrl', (v) => v as String),
    schemaVersion: $checkedConvert('schemaVersion', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$AssetReleaseVersionToJson(
  _AssetReleaseVersion instance,
) => <String, dynamic>{
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
