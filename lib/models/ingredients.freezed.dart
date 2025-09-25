// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredients.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpItem {

 String get itemId; int get expPerItem; bool get isDefault;

  /// Serializes this ExpItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.expPerItem, expPerItem) || other.expPerItem == expPerItem)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,expPerItem,isDefault);

@override
String toString() {
  return 'ExpItem(itemId: $itemId, expPerItem: $expPerItem, isDefault: $isDefault)';
}


}





/// @nodoc
@JsonSerializable()

class _ExpItem implements ExpItem {
  const _ExpItem({required this.itemId, required this.expPerItem, this.isDefault = false});
  factory _ExpItem.fromJson(Map<String, dynamic> json) => _$ExpItemFromJson(json);

@override final  String itemId;
@override final  int expPerItem;
@override@JsonKey() final  bool isDefault;


@override
Map<String, dynamic> toJson() {
  return _$ExpItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.expPerItem, expPerItem) || other.expPerItem == expPerItem)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,expPerItem,isDefault);

@override
String toString() {
  return 'ExpItem(itemId: $itemId, expPerItem: $expPerItem, isDefault: $isDefault)';
}


}




Ingredient _$IngredientFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'byType':
          return IngredientByType.fromJson(
            json
          );
                case 'exp':
          return IngredientExp.fromJson(
            json
          );
                case 'fixed':
          return IngredientWithFixedId.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'Ingredient',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$Ingredient {



  /// Serializes this Ingredient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ingredient);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Ingredient()';
}


}





/// @nodoc
@JsonSerializable()

class IngredientByType implements Ingredient {
  const IngredientByType({required this.type, required this.quantity, this.craftLevel, final  Map<String, MaterialId?>? targetSpecific, final  String? $type}): _targetSpecific = targetSpecific,$type = $type ?? 'byType';
  factory IngredientByType.fromJson(Map<String, dynamic> json) => _$IngredientByTypeFromJson(json);

 final  String type;
 final  int quantity;
 final  int? craftLevel;
 final  Map<String, MaterialId?>? _targetSpecific;
 Map<String, MaterialId?>? get targetSpecific {
  final value = _targetSpecific;
  if (value == null) return null;
  if (_targetSpecific is EqualUnmodifiableMapView) return _targetSpecific;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$IngredientByTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientByType&&(identical(other.type, type) || other.type == type)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.craftLevel, craftLevel) || other.craftLevel == craftLevel)&&const DeepCollectionEquality().equals(other._targetSpecific, _targetSpecific));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,quantity,craftLevel,const DeepCollectionEquality().hash(_targetSpecific));

@override
String toString() {
  return 'Ingredient.byType(type: $type, quantity: $quantity, craftLevel: $craftLevel, targetSpecific: $targetSpecific)';
}


}




/// @nodoc
@JsonSerializable()

class IngredientExp implements Ingredient {
  const IngredientExp({required this.exp, final  String? $type}): $type = $type ?? 'exp';
  factory IngredientExp.fromJson(Map<String, dynamic> json) => _$IngredientExpFromJson(json);

 final  int exp;

@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$IngredientExpToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientExp&&(identical(other.exp, exp) || other.exp == exp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exp);

@override
String toString() {
  return 'Ingredient.exp(exp: $exp)';
}


}




/// @nodoc
@JsonSerializable()

class IngredientWithFixedId implements Ingredient {
  const IngredientWithFixedId({required this.itemId, required this.quantity, final  String? $type}): $type = $type ?? 'fixed';
  factory IngredientWithFixedId.fromJson(Map<String, dynamic> json) => _$IngredientWithFixedIdFromJson(json);

 final  String itemId;
 final  int quantity;

@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$IngredientWithFixedIdToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientWithFixedId&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,quantity);

@override
String toString() {
  return 'Ingredient.fixed(itemId: $itemId, quantity: $quantity)';
}


}





/// @nodoc
mixin _$SliderEntry {

 LocalizedText get title; List<Purpose> get purposes; PreferredTargetType? get preferredTargetType;

  /// Serializes this SliderEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SliderEntry&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.purposes, purposes)&&(identical(other.preferredTargetType, preferredTargetType) || other.preferredTargetType == preferredTargetType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(purposes),preferredTargetType);

@override
String toString() {
  return 'SliderEntry(title: $title, purposes: $purposes, preferredTargetType: $preferredTargetType)';
}


}





/// @nodoc
@JsonSerializable()

class _SliderEntry implements SliderEntry {
  const _SliderEntry({required this.title, required final  List<Purpose> purposes, this.preferredTargetType}): _purposes = purposes;
  factory _SliderEntry.fromJson(Map<String, dynamic> json) => _$SliderEntryFromJson(json);

@override final  LocalizedText title;
 final  List<Purpose> _purposes;
@override List<Purpose> get purposes {
  if (_purposes is EqualUnmodifiableListView) return _purposes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_purposes);
}

@override final  PreferredTargetType? preferredTargetType;


@override
Map<String, dynamic> toJson() {
  return _$SliderEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SliderEntry&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._purposes, _purposes)&&(identical(other.preferredTargetType, preferredTargetType) || other.preferredTargetType == preferredTargetType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_purposes),preferredTargetType);

@override
String toString() {
  return 'SliderEntry(title: $title, purposes: $purposes, preferredTargetType: $preferredTargetType)';
}


}





/// @nodoc
mixin _$IngredientLevels {

 List<int> get sliderTicks; Map<int, List<Ingredient>> get levels;

  /// Serializes this IngredientLevels to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientLevels&&const DeepCollectionEquality().equals(other.sliderTicks, sliderTicks)&&const DeepCollectionEquality().equals(other.levels, levels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sliderTicks),const DeepCollectionEquality().hash(levels));

@override
String toString() {
  return 'IngredientLevels(sliderTicks: $sliderTicks, levels: $levels)';
}


}





/// @nodoc
@JsonSerializable()

class _IngredientLevels implements IngredientLevels {
  const _IngredientLevels({required final  List<int> sliderTicks, required final  Map<int, List<Ingredient>> levels}): _sliderTicks = sliderTicks,_levels = levels;
  factory _IngredientLevels.fromJson(Map<String, dynamic> json) => _$IngredientLevelsFromJson(json);

 final  List<int> _sliderTicks;
@override List<int> get sliderTicks {
  if (_sliderTicks is EqualUnmodifiableListView) return _sliderTicks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sliderTicks);
}

 final  Map<int, List<Ingredient>> _levels;
@override Map<int, List<Ingredient>> get levels {
  if (_levels is EqualUnmodifiableMapView) return _levels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_levels);
}



@override
Map<String, dynamic> toJson() {
  return _$IngredientLevelsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientLevels&&const DeepCollectionEquality().equals(other._sliderTicks, _sliderTicks)&&const DeepCollectionEquality().equals(other._levels, _levels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sliderTicks),const DeepCollectionEquality().hash(_levels));

@override
String toString() {
  return 'IngredientLevels(sliderTicks: $sliderTicks, levels: $levels)';
}


}





/// @nodoc
mixin _$IngredientPurposes {

 Map<Purpose, String> get purposes;

  /// Serializes this IngredientPurposes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientPurposes&&const DeepCollectionEquality().equals(other.purposes, purposes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(purposes));

@override
String toString() {
  return 'IngredientPurposes(purposes: $purposes)';
}


}





/// @nodoc
@JsonSerializable()

class _IngredientPurposes implements IngredientPurposes {
  const _IngredientPurposes({required final  Map<Purpose, String> purposes}): _purposes = purposes;
  factory _IngredientPurposes.fromJson(Map<String, dynamic> json) => _$IngredientPurposesFromJson(json);

 final  Map<Purpose, String> _purposes;
@override Map<Purpose, String> get purposes {
  if (_purposes is EqualUnmodifiableMapView) return _purposes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_purposes);
}



@override
Map<String, dynamic> toJson() {
  return _$IngredientPurposesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientPurposes&&const DeepCollectionEquality().equals(other._purposes, _purposes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_purposes));

@override
String toString() {
  return 'IngredientPurposes(purposes: $purposes)';
}


}





/// @nodoc
mixin _$IngredientConfigurations {

 List<ExpItem> get expItems; Map<int, IngredientPurposes> get rarities; List<SliderEntry> get sliders; Map<String, IngredientLevels> get ingredientTables;

  /// Serializes this IngredientConfigurations to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientConfigurations&&const DeepCollectionEquality().equals(other.expItems, expItems)&&const DeepCollectionEquality().equals(other.rarities, rarities)&&const DeepCollectionEquality().equals(other.sliders, sliders)&&const DeepCollectionEquality().equals(other.ingredientTables, ingredientTables));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(expItems),const DeepCollectionEquality().hash(rarities),const DeepCollectionEquality().hash(sliders),const DeepCollectionEquality().hash(ingredientTables));

@override
String toString() {
  return 'IngredientConfigurations(expItems: $expItems, rarities: $rarities, sliders: $sliders, ingredientTables: $ingredientTables)';
}


}





/// @nodoc
@JsonSerializable()

class _IngredientConfigurations extends IngredientConfigurations {
  const _IngredientConfigurations({required final  List<ExpItem> expItems, required final  Map<int, IngredientPurposes> rarities, required final  List<SliderEntry> sliders, required final  Map<String, IngredientLevels> ingredientTables}): _expItems = expItems,_rarities = rarities,_sliders = sliders,_ingredientTables = ingredientTables,super._();
  factory _IngredientConfigurations.fromJson(Map<String, dynamic> json) => _$IngredientConfigurationsFromJson(json);

 final  List<ExpItem> _expItems;
@override List<ExpItem> get expItems {
  if (_expItems is EqualUnmodifiableListView) return _expItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expItems);
}

 final  Map<int, IngredientPurposes> _rarities;
@override Map<int, IngredientPurposes> get rarities {
  if (_rarities is EqualUnmodifiableMapView) return _rarities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_rarities);
}

 final  List<SliderEntry> _sliders;
@override List<SliderEntry> get sliders {
  if (_sliders is EqualUnmodifiableListView) return _sliders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sliders);
}

 final  Map<String, IngredientLevels> _ingredientTables;
@override Map<String, IngredientLevels> get ingredientTables {
  if (_ingredientTables is EqualUnmodifiableMapView) return _ingredientTables;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_ingredientTables);
}



@override
Map<String, dynamic> toJson() {
  return _$IngredientConfigurationsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientConfigurations&&const DeepCollectionEquality().equals(other._expItems, _expItems)&&const DeepCollectionEquality().equals(other._rarities, _rarities)&&const DeepCollectionEquality().equals(other._sliders, _sliders)&&const DeepCollectionEquality().equals(other._ingredientTables, _ingredientTables));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_expItems),const DeepCollectionEquality().hash(_rarities),const DeepCollectionEquality().hash(_sliders),const DeepCollectionEquality().hash(_ingredientTables));

@override
String toString() {
  return 'IngredientConfigurations(expItems: $expItems, rarities: $rarities, sliders: $sliders, ingredientTables: $ingredientTables)';
}


}




// dart format on
