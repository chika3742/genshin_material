// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artifact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArtifactSet _$ArtifactSetFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ArtifactSet', json, ($checkedConvert) {
      final val = _ArtifactSet(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => LocalizedText.fromJson(v)),
        jaPronunciation: $checkedConvert('jaPronunciation', (v) => v as String),
        maxRarity: $checkedConvert('maxRarity', (v) => (v as num).toInt()),
        tags: $checkedConvert(
          'tags',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
        consistsOf: $checkedConvert(
          'consistsOf',
          (v) => Map<String, String>.from(v as Map),
        ),
        bonuses: $checkedConvert(
          'bonuses',
          (v) => (v as List<dynamic>)
              .map((e) => ArtifactSetBonus.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

_ArtifactPiece _$ArtifactPieceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ArtifactPiece', json, ($checkedConvert) {
      final val = _ArtifactPiece(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => LocalizedText.fromJson(v)),
        jaPronunciation: $checkedConvert('jaPronunciation', (v) => v as String),
        parentId: $checkedConvert('parentId', (v) => v as String),
        type: $checkedConvert('type', (v) => v as String),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String),
      );
      return val;
    });

_ArtifactSetBonus _$ArtifactSetBonusFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ArtifactSetBonus', json, ($checkedConvert) {
      final val = _ArtifactSetBonus(
        type: $checkedConvert('type', (v) => v as String),
        description: $checkedConvert(
          'description',
          (v) => LocalizedText.fromJson(v),
        ),
      );
      return val;
    });

_ArtifactsMeta _$ArtifactsMetaFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ArtifactsMeta', json, ($checkedConvert) {
      final val = _ArtifactsMeta(
        stats: $checkedConvert(
          'stats',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) => MapEntry(k, LocalizedText.fromJson(e)),
          ),
        ),
        pieceTypes: $checkedConvert(
          'pieceTypes',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) => MapEntry(
              k,
              ArtifactPieceType.fromJson(e as Map<String, dynamic>),
            ),
          ),
        ),
        possibleSubStats: $checkedConvert(
          'possibleSubStats',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        tags: $checkedConvert(
          'tags',
          (v) =>
              ArtifactTagCategoriesInternal.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

_ArtifactPieceType _$ArtifactPieceTypeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ArtifactPieceType', json, ($checkedConvert) {
      final val = _ArtifactPieceType(
        id: $checkedConvert('id', (v) => v as String),
        desc: $checkedConvert('desc', (v) => LocalizedText.fromJson(v)),
        possibleMainStats: $checkedConvert(
          'possibleMainStats',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
      );
      return val;
    });

_ArtifactStat _$ArtifactStatFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ArtifactStat', json, ($checkedConvert) {
      final val = _ArtifactStat(
        id: $checkedConvert('id', (v) => v as String),
        desc: $checkedConvert('desc', (v) => LocalizedText.fromJson(v)),
      );
      return val;
    });

_ArtifactTagCategoriesInternal _$ArtifactTagCategoriesInternalFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ArtifactTagCategoriesInternal', json, ($checkedConvert) {
  final val = _ArtifactTagCategoriesInternal(
    categories: $checkedConvert(
      'categories',
      (v) => (v as List<dynamic>)
          .map((e) => ArtifactTagCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

_ArtifactTagCategory _$ArtifactTagCategoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ArtifactTagCategory', json, ($checkedConvert) {
      final val = _ArtifactTagCategory(
        desc: $checkedConvert('desc', (v) => LocalizedText.fromJson(v)),
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => ArtifactTag.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

_ArtifactTag _$ArtifactTagFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ArtifactTag', json, ($checkedConvert) {
      final val = _ArtifactTag(
        id: $checkedConvert('id', (v) => v as String),
        desc: $checkedConvert('desc', (v) => LocalizedText.fromJson(v)),
      );
      return val;
    });
