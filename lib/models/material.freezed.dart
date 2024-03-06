// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialData _$MaterialDataFromJson(Map<String, dynamic> json) {
  return _MaterialData.fromJson(json);
}

/// @nodoc
mixin _$MaterialData {
  List<Material> get items => throw _privateConstructorUsedError;
  List<MaterialCategory> get categories => throw _privateConstructorUsedError;
  Map<String, int> get sortOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialDataCopyWith<MaterialData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialDataCopyWith<$Res> {
  factory $MaterialDataCopyWith(
          MaterialData value, $Res Function(MaterialData) then) =
      _$MaterialDataCopyWithImpl<$Res, MaterialData>;
  @useResult
  $Res call(
      {List<Material> items,
      List<MaterialCategory> categories,
      Map<String, int> sortOrder});
}

/// @nodoc
class _$MaterialDataCopyWithImpl<$Res, $Val extends MaterialData>
    implements $MaterialDataCopyWith<$Res> {
  _$MaterialDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? categories = null,
    Object? sortOrder = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Material>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<MaterialCategory>,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialDataImplCopyWith<$Res>
    implements $MaterialDataCopyWith<$Res> {
  factory _$$MaterialDataImplCopyWith(
          _$MaterialDataImpl value, $Res Function(_$MaterialDataImpl) then) =
      __$$MaterialDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Material> items,
      List<MaterialCategory> categories,
      Map<String, int> sortOrder});
}

/// @nodoc
class __$$MaterialDataImplCopyWithImpl<$Res>
    extends _$MaterialDataCopyWithImpl<$Res, _$MaterialDataImpl>
    implements _$$MaterialDataImplCopyWith<$Res> {
  __$$MaterialDataImplCopyWithImpl(
      _$MaterialDataImpl _value, $Res Function(_$MaterialDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? categories = null,
    Object? sortOrder = null,
  }) {
    return _then(_$MaterialDataImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Material>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<MaterialCategory>,
      sortOrder: null == sortOrder
          ? _value._sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialDataImpl implements _MaterialData {
  const _$MaterialDataImpl(
      {required final List<Material> items,
      required final List<MaterialCategory> categories,
      required final Map<String, int> sortOrder})
      : _items = items,
        _categories = categories,
        _sortOrder = sortOrder;

  factory _$MaterialDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialDataImplFromJson(json);

  final List<Material> _items;
  @override
  List<Material> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<MaterialCategory> _categories;
  @override
  List<MaterialCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final Map<String, int> _sortOrder;
  @override
  Map<String, int> get sortOrder {
    if (_sortOrder is EqualUnmodifiableMapView) return _sortOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_sortOrder);
  }

  @override
  String toString() {
    return 'MaterialData(items: $items, categories: $categories, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialDataImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._sortOrder, _sortOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_sortOrder));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialDataImplCopyWith<_$MaterialDataImpl> get copyWith =>
      __$$MaterialDataImplCopyWithImpl<_$MaterialDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialDataImplToJson(
      this,
    );
  }
}

abstract class _MaterialData implements MaterialData {
  const factory _MaterialData(
      {required final List<Material> items,
      required final List<MaterialCategory> categories,
      required final Map<String, int> sortOrder}) = _$MaterialDataImpl;

  factory _MaterialData.fromJson(Map<String, dynamic> json) =
      _$MaterialDataImpl.fromJson;

  @override
  List<Material> get items;
  @override
  List<MaterialCategory> get categories;
  @override
  Map<String, int> get sortOrder;
  @override
  @JsonKey(ignore: true)
  _$$MaterialDataImplCopyWith<_$MaterialDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Material _$MaterialFromJson(Map<String, dynamic> json) {
  return _Material.fromJson(json);
}

/// @nodoc
mixin _$Material {
  String get id => throw _privateConstructorUsedError;
  LocalizedText get name => throw _privateConstructorUsedError;
  String get jaPronunciation => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get rarity => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String? get groupId => throw _privateConstructorUsedError;
  int? get craftLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialCopyWith<Material> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialCopyWith<$Res> {
  factory $MaterialCopyWith(Material value, $Res Function(Material) then) =
      _$MaterialCopyWithImpl<$Res, Material>;
  @useResult
  $Res call(
      {String id,
      LocalizedText name,
      String jaPronunciation,
      String imageUrl,
      int rarity,
      String category,
      String? groupId,
      int? craftLevel});

  $LocalizedTextCopyWith<$Res> get name;
}

/// @nodoc
class _$MaterialCopyWithImpl<$Res, $Val extends Material>
    implements $MaterialCopyWith<$Res> {
  _$MaterialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? jaPronunciation = null,
    Object? imageUrl = null,
    Object? rarity = null,
    Object? category = null,
    Object? groupId = freezed,
    Object? craftLevel = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
      jaPronunciation: null == jaPronunciation
          ? _value.jaPronunciation
          : jaPronunciation // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      craftLevel: freezed == craftLevel
          ? _value.craftLevel
          : craftLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalizedTextCopyWith<$Res> get name {
    return $LocalizedTextCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialImplCopyWith<$Res>
    implements $MaterialCopyWith<$Res> {
  factory _$$MaterialImplCopyWith(
          _$MaterialImpl value, $Res Function(_$MaterialImpl) then) =
      __$$MaterialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      LocalizedText name,
      String jaPronunciation,
      String imageUrl,
      int rarity,
      String category,
      String? groupId,
      int? craftLevel});

  @override
  $LocalizedTextCopyWith<$Res> get name;
}

/// @nodoc
class __$$MaterialImplCopyWithImpl<$Res>
    extends _$MaterialCopyWithImpl<$Res, _$MaterialImpl>
    implements _$$MaterialImplCopyWith<$Res> {
  __$$MaterialImplCopyWithImpl(
      _$MaterialImpl _value, $Res Function(_$MaterialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? jaPronunciation = null,
    Object? imageUrl = null,
    Object? rarity = null,
    Object? category = null,
    Object? groupId = freezed,
    Object? craftLevel = freezed,
  }) {
    return _then(_$MaterialImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
      jaPronunciation: null == jaPronunciation
          ? _value.jaPronunciation
          : jaPronunciation // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      craftLevel: freezed == craftLevel
          ? _value.craftLevel
          : craftLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialImpl extends _Material {
  const _$MaterialImpl(
      {required this.id,
      required this.name,
      required this.jaPronunciation,
      required this.imageUrl,
      required this.rarity,
      required this.category,
      this.groupId,
      this.craftLevel})
      : super._();

  factory _$MaterialImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialImplFromJson(json);

  @override
  final String id;
  @override
  final LocalizedText name;
  @override
  final String jaPronunciation;
  @override
  final String imageUrl;
  @override
  final int rarity;
  @override
  final String category;
  @override
  final String? groupId;
  @override
  final int? craftLevel;

  @override
  String toString() {
    return 'Material(id: $id, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, rarity: $rarity, category: $category, groupId: $groupId, craftLevel: $craftLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.jaPronunciation, jaPronunciation) ||
                other.jaPronunciation == jaPronunciation) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.craftLevel, craftLevel) ||
                other.craftLevel == craftLevel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, jaPronunciation,
      imageUrl, rarity, category, groupId, craftLevel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialImplCopyWith<_$MaterialImpl> get copyWith =>
      __$$MaterialImplCopyWithImpl<_$MaterialImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialImplToJson(
      this,
    );
  }
}

abstract class _Material extends Material {
  const factory _Material(
      {required final String id,
      required final LocalizedText name,
      required final String jaPronunciation,
      required final String imageUrl,
      required final int rarity,
      required final String category,
      final String? groupId,
      final int? craftLevel}) = _$MaterialImpl;
  const _Material._() : super._();

  factory _Material.fromJson(Map<String, dynamic> json) =
      _$MaterialImpl.fromJson;

  @override
  String get id;
  @override
  LocalizedText get name;
  @override
  String get jaPronunciation;
  @override
  String get imageUrl;
  @override
  int get rarity;
  @override
  String get category;
  @override
  String? get groupId;
  @override
  int? get craftLevel;
  @override
  @JsonKey(ignore: true)
  _$$MaterialImplCopyWith<_$MaterialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MaterialCategory _$MaterialCategoryFromJson(Map<String, dynamic> json) {
  return _MaterialCategory.fromJson(json);
}

/// @nodoc
mixin _$MaterialCategory {
  String get id => throw _privateConstructorUsedError;
  LocalizedText get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialCategoryCopyWith<MaterialCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialCategoryCopyWith<$Res> {
  factory $MaterialCategoryCopyWith(
          MaterialCategory value, $Res Function(MaterialCategory) then) =
      _$MaterialCategoryCopyWithImpl<$Res, MaterialCategory>;
  @useResult
  $Res call({String id, LocalizedText text});

  $LocalizedTextCopyWith<$Res> get text;
}

/// @nodoc
class _$MaterialCategoryCopyWithImpl<$Res, $Val extends MaterialCategory>
    implements $MaterialCategoryCopyWith<$Res> {
  _$MaterialCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalizedTextCopyWith<$Res> get text {
    return $LocalizedTextCopyWith<$Res>(_value.text, (value) {
      return _then(_value.copyWith(text: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialCategoryImplCopyWith<$Res>
    implements $MaterialCategoryCopyWith<$Res> {
  factory _$$MaterialCategoryImplCopyWith(_$MaterialCategoryImpl value,
          $Res Function(_$MaterialCategoryImpl) then) =
      __$$MaterialCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, LocalizedText text});

  @override
  $LocalizedTextCopyWith<$Res> get text;
}

/// @nodoc
class __$$MaterialCategoryImplCopyWithImpl<$Res>
    extends _$MaterialCategoryCopyWithImpl<$Res, _$MaterialCategoryImpl>
    implements _$$MaterialCategoryImplCopyWith<$Res> {
  __$$MaterialCategoryImplCopyWithImpl(_$MaterialCategoryImpl _value,
      $Res Function(_$MaterialCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
  }) {
    return _then(_$MaterialCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as LocalizedText,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialCategoryImpl implements _MaterialCategory {
  const _$MaterialCategoryImpl({required this.id, required this.text});

  factory _$MaterialCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialCategoryImplFromJson(json);

  @override
  final String id;
  @override
  final LocalizedText text;

  @override
  String toString() {
    return 'MaterialCategory(id: $id, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialCategoryImplCopyWith<_$MaterialCategoryImpl> get copyWith =>
      __$$MaterialCategoryImplCopyWithImpl<_$MaterialCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialCategoryImplToJson(
      this,
    );
  }
}

abstract class _MaterialCategory implements MaterialCategory {
  const factory _MaterialCategory(
      {required final String id,
      required final LocalizedText text}) = _$MaterialCategoryImpl;

  factory _MaterialCategory.fromJson(Map<String, dynamic> json) =
      _$MaterialCategoryImpl.fromJson;

  @override
  String get id;
  @override
  LocalizedText get text;
  @override
  @JsonKey(ignore: true)
  _$$MaterialCategoryImplCopyWith<_$MaterialCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
