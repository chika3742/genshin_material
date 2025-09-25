// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpItem _$ExpItemFromJson(Map<String, dynamic> json) => _ExpItem(
  itemId: json['itemId'] as String,
  expPerItem: (json['expPerItem'] as num).toInt(),
  isDefault: json['isDefault'] as bool? ?? false,
);

Map<String, dynamic> _$ExpItemToJson(_ExpItem instance) => <String, dynamic>{
  'itemId': instance.itemId,
  'expPerItem': instance.expPerItem,
  'isDefault': instance.isDefault,
};

IngredientByType _$IngredientByTypeFromJson(Map<String, dynamic> json) =>
    IngredientByType(
      type: json['type'] as String,
      quantity: (json['quantity'] as num).toInt(),
      craftLevel: (json['craftLevel'] as num?)?.toInt(),
      targetSpecific: (json['targetSpecific'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$IngredientByTypeToJson(IngredientByType instance) =>
    <String, dynamic>{
      'type': instance.type,
      'quantity': instance.quantity,
      'craftLevel': instance.craftLevel,
      'targetSpecific': instance.targetSpecific,
      'runtimeType': instance.$type,
    };

IngredientExp _$IngredientExpFromJson(Map<String, dynamic> json) =>
    IngredientExp(
      exp: (json['exp'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$IngredientExpToJson(IngredientExp instance) =>
    <String, dynamic>{'exp': instance.exp, 'runtimeType': instance.$type};

IngredientWithFixedId _$IngredientWithFixedIdFromJson(
  Map<String, dynamic> json,
) => IngredientWithFixedId(
  itemId: json['itemId'] as String,
  quantity: (json['quantity'] as num).toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$IngredientWithFixedIdToJson(
  IngredientWithFixedId instance,
) => <String, dynamic>{
  'itemId': instance.itemId,
  'quantity': instance.quantity,
  'runtimeType': instance.$type,
};

_SliderEntry _$SliderEntryFromJson(Map<String, dynamic> json) => _SliderEntry(
  title: LocalizedText.fromJson(json['title'] as Map<String, dynamic>),
  purposes: (json['purposes'] as List<dynamic>)
      .map((e) => $enumDecode(_$PurposeEnumMap, e))
      .toList(),
  preferredTargetType: $enumDecodeNullable(
    _$PreferredTargetTypeEnumMap,
    json['preferredTargetType'],
  ),
);

Map<String, dynamic> _$SliderEntryToJson(_SliderEntry instance) =>
    <String, dynamic>{
      'title': instance.title,
      'purposes': instance.purposes.map((e) => _$PurposeEnumMap[e]!).toList(),
      'preferredTargetType':
          _$PreferredTargetTypeEnumMap[instance.preferredTargetType],
    };

const _$PurposeEnumMap = {
  Purpose.ascension: 'ascension',
  Purpose.normalAttack: 'normalAttack',
  Purpose.elementalSkill: 'elementalSkill',
  Purpose.elementalBurst: 'elementalBurst',
};

const _$PreferredTargetTypeEnumMap = {
  PreferredTargetType.group: 'group',
  PreferredTargetType.variant: 'variant',
};

_IngredientLevels _$IngredientLevelsFromJson(Map<String, dynamic> json) =>
    _IngredientLevels(
      sliderTicks: (json['sliderTicks'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      levels: (json['levels'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          int.parse(k),
          (e as List<dynamic>)
              .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ),
    );

Map<String, dynamic> _$IngredientLevelsToJson(_IngredientLevels instance) =>
    <String, dynamic>{
      'sliderTicks': instance.sliderTicks,
      'levels': instance.levels.map((k, e) => MapEntry(k.toString(), e)),
    };

_IngredientPurposes _$IngredientPurposesFromJson(Map<String, dynamic> json) =>
    _IngredientPurposes(
      purposes: (json['purposes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$PurposeEnumMap, k), e as String),
      ),
    );

Map<String, dynamic> _$IngredientPurposesToJson(_IngredientPurposes instance) =>
    <String, dynamic>{
      'purposes': instance.purposes.map(
        (k, e) => MapEntry(_$PurposeEnumMap[k]!, e),
      ),
    };

_IngredientConfigurations _$IngredientConfigurationsFromJson(
  Map<String, dynamic> json,
) => _IngredientConfigurations(
  expItems: (json['expItems'] as List<dynamic>)
      .map((e) => ExpItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  rarities: (json['rarities'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(
      int.parse(k),
      IngredientPurposes.fromJson(e as Map<String, dynamic>),
    ),
  ),
  sliders: (json['sliders'] as List<dynamic>)
      .map((e) => SliderEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
  ingredientTables: (json['ingredientTables'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, IngredientLevels.fromJson(e as Map<String, dynamic>)),
  ),
);

Map<String, dynamic> _$IngredientConfigurationsToJson(
  _IngredientConfigurations instance,
) => <String, dynamic>{
  'expItems': instance.expItems,
  'rarities': instance.rarities.map((k, e) => MapEntry(k.toString(), e)),
  'sliders': instance.sliders,
  'ingredientTables': instance.ingredientTables,
};
