// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'furnishing_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Furnishing {
  String get id;
  int get hyvId;
  LocalizedText get name;
  String get jaPronunciation;
  String get imageUrl;
  ItemSource? get source;

  /// Serializes this Furnishing to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Furnishing &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hyvId, hyvId) || other.hyvId == hyvId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.jaPronunciation, jaPronunciation) ||
                other.jaPronunciation == jaPronunciation) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, hyvId, name, jaPronunciation, imageUrl, source);

  @override
  String toString() {
    return 'Furnishing(id: $id, hyvId: $hyvId, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, source: $source)';
  }
}

/// @nodoc
@JsonSerializable()
class _Furnishing extends Furnishing {
  const _Furnishing(
      {required this.id,
      required this.hyvId,
      required this.name,
      required this.jaPronunciation,
      required this.imageUrl,
      this.source})
      : super._();
  factory _Furnishing.fromJson(Map<String, dynamic> json) =>
      _$FurnishingFromJson(json);

  @override
  final String id;
  @override
  final int hyvId;
  @override
  final LocalizedText name;
  @override
  final String jaPronunciation;
  @override
  final String imageUrl;
  @override
  final ItemSource? source;

  @override
  Map<String, dynamic> toJson() {
    return _$FurnishingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Furnishing &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hyvId, hyvId) || other.hyvId == hyvId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.jaPronunciation, jaPronunciation) ||
                other.jaPronunciation == jaPronunciation) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, hyvId, name, jaPronunciation, imageUrl, source);

  @override
  String toString() {
    return 'Furnishing(id: $id, hyvId: $hyvId, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, source: $source)';
  }
}

/// @nodoc
mixin _$FurnishingSetType {
  LocalizedText get title;

  /// Serializes this FurnishingSetType to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FurnishingSetType &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  @override
  String toString() {
    return 'FurnishingSetType(title: $title)';
  }
}

/// @nodoc
@JsonSerializable()
class _FurnishingSetType implements FurnishingSetType {
  const _FurnishingSetType({required this.title});
  factory _FurnishingSetType.fromJson(Map<String, dynamic> json) =>
      _$FurnishingSetTypeFromJson(json);

  @override
  final LocalizedText title;

  @override
  Map<String, dynamic> toJson() {
    return _$FurnishingSetTypeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FurnishingSetType &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  @override
  String toString() {
    return 'FurnishingSetType(title: $title)';
  }
}

/// @nodoc
mixin _$FurnishingSetMeta {
  Map<String, FurnishingSetType> get setTypes;

  /// Serializes this FurnishingSetMeta to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FurnishingSetMeta &&
            const DeepCollectionEquality().equals(other.setTypes, setTypes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(setTypes));

  @override
  String toString() {
    return 'FurnishingSetMeta(setTypes: $setTypes)';
  }
}

/// @nodoc
@JsonSerializable()
class _FurnishingSetMeta implements FurnishingSetMeta {
  const _FurnishingSetMeta(
      {required final Map<String, FurnishingSetType> setTypes})
      : _setTypes = setTypes;
  factory _FurnishingSetMeta.fromJson(Map<String, dynamic> json) =>
      _$FurnishingSetMetaFromJson(json);

  final Map<String, FurnishingSetType> _setTypes;
  @override
  Map<String, FurnishingSetType> get setTypes {
    if (_setTypes is EqualUnmodifiableMapView) return _setTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_setTypes);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$FurnishingSetMetaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FurnishingSetMeta &&
            const DeepCollectionEquality().equals(other._setTypes, _setTypes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_setTypes));

  @override
  String toString() {
    return 'FurnishingSetMeta(setTypes: $setTypes)';
  }
}

/// @nodoc
mixin _$FurnishingSetComponent {
  String get furnishingId;
  int get quantity;

  /// Serializes this FurnishingSetComponent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FurnishingSetComponent &&
            (identical(other.furnishingId, furnishingId) ||
                other.furnishingId == furnishingId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, furnishingId, quantity);

  @override
  String toString() {
    return 'FurnishingSetComponent(furnishingId: $furnishingId, quantity: $quantity)';
  }
}

/// @nodoc
@JsonSerializable()
class _FurnishingSetComponent implements FurnishingSetComponent {
  const _FurnishingSetComponent(
      {required this.furnishingId, required this.quantity});
  factory _FurnishingSetComponent.fromJson(Map<String, dynamic> json) =>
      _$FurnishingSetComponentFromJson(json);

  @override
  final String furnishingId;
  @override
  final int quantity;

  @override
  Map<String, dynamic> toJson() {
    return _$FurnishingSetComponentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FurnishingSetComponent &&
            (identical(other.furnishingId, furnishingId) ||
                other.furnishingId == furnishingId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, furnishingId, quantity);

  @override
  String toString() {
    return 'FurnishingSetComponent(furnishingId: $furnishingId, quantity: $quantity)';
  }
}

/// @nodoc
mixin _$FurnishingSet {
  String get id;
  int get hyvId;
  LocalizedText get name;
  String get jaPronunciation;
  String get imageUrl;
  String get type;
  List<int> get favoriteCharacterHyvIds;
  List<FurnishingSetComponent> get consistsOf;

  /// Serializes this FurnishingSet to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FurnishingSet &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hyvId, hyvId) || other.hyvId == hyvId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.jaPronunciation, jaPronunciation) ||
                other.jaPronunciation == jaPronunciation) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(
                other.favoriteCharacterHyvIds, favoriteCharacterHyvIds) &&
            const DeepCollectionEquality()
                .equals(other.consistsOf, consistsOf));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      hyvId,
      name,
      jaPronunciation,
      imageUrl,
      type,
      const DeepCollectionEquality().hash(favoriteCharacterHyvIds),
      const DeepCollectionEquality().hash(consistsOf));

  @override
  String toString() {
    return 'FurnishingSet(id: $id, hyvId: $hyvId, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, type: $type, favoriteCharacterHyvIds: $favoriteCharacterHyvIds, consistsOf: $consistsOf)';
  }
}

/// @nodoc
@JsonSerializable()
class _FurnishingSet extends FurnishingSet {
  const _FurnishingSet(
      {required this.id,
      required this.hyvId,
      required this.name,
      required this.jaPronunciation,
      required this.imageUrl,
      required this.type,
      required final List<int> favoriteCharacterHyvIds,
      required final List<FurnishingSetComponent> consistsOf})
      : _favoriteCharacterHyvIds = favoriteCharacterHyvIds,
        _consistsOf = consistsOf,
        super._();
  factory _FurnishingSet.fromJson(Map<String, dynamic> json) =>
      _$FurnishingSetFromJson(json);

  @override
  final String id;
  @override
  final int hyvId;
  @override
  final LocalizedText name;
  @override
  final String jaPronunciation;
  @override
  final String imageUrl;
  @override
  final String type;
  final List<int> _favoriteCharacterHyvIds;
  @override
  List<int> get favoriteCharacterHyvIds {
    if (_favoriteCharacterHyvIds is EqualUnmodifiableListView)
      return _favoriteCharacterHyvIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteCharacterHyvIds);
  }

  final List<FurnishingSetComponent> _consistsOf;
  @override
  List<FurnishingSetComponent> get consistsOf {
    if (_consistsOf is EqualUnmodifiableListView) return _consistsOf;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_consistsOf);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$FurnishingSetToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FurnishingSet &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hyvId, hyvId) || other.hyvId == hyvId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.jaPronunciation, jaPronunciation) ||
                other.jaPronunciation == jaPronunciation) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(
                other._favoriteCharacterHyvIds, _favoriteCharacterHyvIds) &&
            const DeepCollectionEquality()
                .equals(other._consistsOf, _consistsOf));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      hyvId,
      name,
      jaPronunciation,
      imageUrl,
      type,
      const DeepCollectionEquality().hash(_favoriteCharacterHyvIds),
      const DeepCollectionEquality().hash(_consistsOf));

  @override
  String toString() {
    return 'FurnishingSet(id: $id, hyvId: $hyvId, name: $name, jaPronunciation: $jaPronunciation, imageUrl: $imageUrl, type: $type, favoriteCharacterHyvIds: $favoriteCharacterHyvIds, consistsOf: $consistsOf)';
  }
}

// dart format on
