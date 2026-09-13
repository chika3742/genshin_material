// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpItem _$ExpItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ExpItem', json, ($checkedConvert) {
      final val = _ExpItem(
        itemId: $checkedConvert('itemId', (v) => v as String),
        expPerItem: $checkedConvert('expPerItem', (v) => (v as num).toInt()),
        isDefault: $checkedConvert('isDefault', (v) => v as bool? ?? false),
      );
      return val;
    });

Map<String, dynamic> _$ExpItemToJson(_ExpItem instance) => <String, dynamic>{
  'itemId': instance.itemId,
  'expPerItem': instance.expPerItem,
  'isDefault': instance.isDefault,
};

IngredientByType _$IngredientByTypeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('IngredientByType', json, ($checkedConvert) {
      final val = IngredientByType(
        type: $checkedConvert('type', (v) => v as String),
        quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
        craftLevel: $checkedConvert('craftLevel', (v) => (v as num?)?.toInt()),
        targetSpecific: $checkedConvert(
          'targetSpecific',
          (v) => (v as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String?),
          ),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$IngredientByTypeToJson(IngredientByType instance) =>
    <String, dynamic>{
      'type': instance.type,
      'quantity': instance.quantity,
      'craftLevel': instance.craftLevel,
      'targetSpecific': instance.targetSpecific,
      'runtimeType': instance.$type,
    };

IngredientExp _$IngredientExpFromJson(Map<String, dynamic> json) =>
    $checkedCreate('IngredientExp', json, ($checkedConvert) {
      final val = IngredientExp(
        exp: $checkedConvert('exp', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$IngredientExpToJson(IngredientExp instance) =>
    <String, dynamic>{'exp': instance.exp, 'runtimeType': instance.$type};

IngredientWithFixedId _$IngredientWithFixedIdFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('IngredientWithFixedId', json, ($checkedConvert) {
  final val = IngredientWithFixedId(
    itemId: $checkedConvert('itemId', (v) => v as String),
    quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
    $type: $checkedConvert('runtimeType', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$IngredientWithFixedIdToJson(
  IngredientWithFixedId instance,
) => <String, dynamic>{
  'itemId': instance.itemId,
  'quantity': instance.quantity,
  'runtimeType': instance.$type,
};

_SliderEntry _$SliderEntryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SliderEntry', json, ($checkedConvert) {
      final val = _SliderEntry(
        title: $checkedConvert('title', (v) => LocalizedText.fromJson(v)),
        purposes: $checkedConvert(
          'purposes',
          (v) => (v as List<dynamic>)
              .map((e) => $enumDecode(_$PurposeEnumMap, e))
              .toList(),
        ),
        preferredTargetType: $checkedConvert(
          'preferredTargetType',
          (v) => $enumDecodeNullable(_$PreferredTargetTypeEnumMap, v),
        ),
      );
      return val;
    });

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
    $checkedCreate('_IngredientLevels', json, ($checkedConvert) {
      final val = _IngredientLevels(
        sliderTicks: $checkedConvert(
          'sliderTicks',
          (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
        ),
        levels: $checkedConvert(
          'levels',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) => MapEntry(
              int.parse(k),
              (e as List<dynamic>)
                  .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
                  .toList(),
            ),
          ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$IngredientLevelsToJson(_IngredientLevels instance) =>
    <String, dynamic>{
      'sliderTicks': instance.sliderTicks,
      'levels': instance.levels.map((k, e) => MapEntry(k.toString(), e)),
    };

_IngredientPurposes _$IngredientPurposesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_IngredientPurposes', json, ($checkedConvert) {
      final val = _IngredientPurposes(
        purposes: $checkedConvert(
          'purposes',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) => MapEntry($enumDecode(_$PurposeEnumMap, k), e as String),
          ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$IngredientPurposesToJson(_IngredientPurposes instance) =>
    <String, dynamic>{
      'purposes': instance.purposes.map(
        (k, e) => MapEntry(_$PurposeEnumMap[k]!, e),
      ),
    };

_IngredientConfigurations _$IngredientConfigurationsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_IngredientConfigurations', json, ($checkedConvert) {
  final val = _IngredientConfigurations(
    expItems: $checkedConvert(
      'expItems',
      (v) => (v as List<dynamic>)
          .map((e) => ExpItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    rarities: $checkedConvert(
      'rarities',
      (v) => (v as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          int.parse(k),
          IngredientPurposes.fromJson(e as Map<String, dynamic>),
        ),
      ),
    ),
    sliders: $checkedConvert(
      'sliders',
      (v) => (v as List<dynamic>)
          .map((e) => SliderEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    ingredientTables: $checkedConvert(
      'ingredientTables',
      (v) => (v as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, IngredientLevels.fromJson(e as Map<String, dynamic>)),
      ),
    ),
  );
  return val;
});
