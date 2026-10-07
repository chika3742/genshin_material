// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterTalent _$CharacterTalentFromJson(Map<String, dynamic> json) =>
    _CharacterTalent(
      idList: (json['idList'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      name: LocalizedText.fromJson(json['name']),
    );
