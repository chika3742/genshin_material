// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drop_rates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DropRateEntry {
  LocalizedText get description;
  LocalizedText? get note;
  DropRateTarget get target;
  List<DropRate> get originalRate;
  bool get condensedAvailable;

  /// Serializes this DropRateEntry to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DropRateEntry &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.target, target) || other.target == target) &&
            const DeepCollectionEquality()
                .equals(other.originalRate, originalRate) &&
            (identical(other.condensedAvailable, condensedAvailable) ||
                other.condensedAvailable == condensedAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, description, note, target,
      const DeepCollectionEquality().hash(originalRate), condensedAvailable);

  @override
  String toString() {
    return 'DropRateEntry(description: $description, note: $note, target: $target, originalRate: $originalRate, condensedAvailable: $condensedAvailable)';
  }
}

/// @nodoc
@JsonSerializable()
class _DropRateEntry extends DropRateEntry {
  const _DropRateEntry(
      {required this.description,
      this.note,
      required this.target,
      required final List<DropRate> originalRate,
      required this.condensedAvailable})
      : _originalRate = originalRate,
        super._();
  factory _DropRateEntry.fromJson(Map<String, dynamic> json) =>
      _$DropRateEntryFromJson(json);

  @override
  final LocalizedText description;
  @override
  final LocalizedText? note;
  @override
  final DropRateTarget target;
  final List<DropRate> _originalRate;
  @override
  List<DropRate> get originalRate {
    if (_originalRate is EqualUnmodifiableListView) return _originalRate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_originalRate);
  }

  @override
  final bool condensedAvailable;

  @override
  Map<String, dynamic> toJson() {
    return _$DropRateEntryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DropRateEntry &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.target, target) || other.target == target) &&
            const DeepCollectionEquality()
                .equals(other._originalRate, _originalRate) &&
            (identical(other.condensedAvailable, condensedAvailable) ||
                other.condensedAvailable == condensedAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, description, note, target,
      const DeepCollectionEquality().hash(_originalRate), condensedAvailable);

  @override
  String toString() {
    return 'DropRateEntry(description: $description, note: $note, target: $target, originalRate: $originalRate, condensedAvailable: $condensedAvailable)';
  }
}

/// @nodoc
mixin _$DropRateTarget {
  String? get category;
  int? get rarity;
  List<String>? get ids;

  /// Serializes this DropRateTarget to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DropRateTarget &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            const DeepCollectionEquality().equals(other.ids, ids));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, category, rarity, const DeepCollectionEquality().hash(ids));

  @override
  String toString() {
    return 'DropRateTarget(category: $category, rarity: $rarity, ids: $ids)';
  }
}

/// @nodoc
@JsonSerializable()
class _DropRateTarget implements DropRateTarget {
  const _DropRateTarget({this.category, this.rarity, final List<String>? ids})
      : _ids = ids;
  factory _DropRateTarget.fromJson(Map<String, dynamic> json) =>
      _$DropRateTargetFromJson(json);

  @override
  final String? category;
  @override
  final int? rarity;
  final List<String>? _ids;
  @override
  List<String>? get ids {
    final value = _ids;
    if (value == null) return null;
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$DropRateTargetToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DropRateTarget &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            const DeepCollectionEquality().equals(other._ids, _ids));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, category, rarity, const DeepCollectionEquality().hash(_ids));

  @override
  String toString() {
    return 'DropRateTarget(category: $category, rarity: $rarity, ids: $ids)';
  }
}

/// @nodoc
mixin _$DropRate {
  int get lowerAR;
  double get rate;

  /// Serializes this DropRate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DropRate &&
            (identical(other.lowerAR, lowerAR) || other.lowerAR == lowerAR) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lowerAR, rate);

  @override
  String toString() {
    return 'DropRate(lowerAR: $lowerAR, rate: $rate)';
  }
}

/// @nodoc
@JsonSerializable()
class _DropRate implements DropRate {
  const _DropRate({required this.lowerAR, required this.rate});
  factory _DropRate.fromJson(Map<String, dynamic> json) =>
      _$DropRateFromJson(json);

  @override
  final int lowerAR;
  @override
  final double rate;

  @override
  Map<String, dynamic> toJson() {
    return _$DropRateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DropRate &&
            (identical(other.lowerAR, lowerAR) || other.lowerAR == lowerAR) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lowerAR, rate);

  @override
  String toString() {
    return 'DropRate(lowerAR: $lowerAR, rate: $rate)';
  }
}

// dart format on
