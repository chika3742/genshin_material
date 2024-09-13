// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_bookmark_frame.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaterialBookmarkFrame {
  String? get materialId => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  Purpose get purposeType => throw _privateConstructorUsedError;
}

/// @nodoc

class _$MaterialBookmarkFrameImpl implements _MaterialBookmarkFrame {
  const _$MaterialBookmarkFrameImpl(
      {required this.materialId,
      required this.level,
      required this.quantity,
      required this.purposeType});

  @override
  final String materialId;
  @override
  final int level;
  @override
  final int quantity;
  @override
  final Purpose purposeType;

  @override
  String toString() {
    return 'MaterialBookmarkFrame(materialId: $materialId, level: $level, quantity: $quantity, purposeType: $purposeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialBookmarkFrameImpl &&
            (identical(other.materialId, materialId) ||
                other.materialId == materialId) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.purposeType, purposeType) ||
                other.purposeType == purposeType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, materialId, level, quantity, purposeType);
}

abstract class _MaterialBookmarkFrame implements MaterialBookmarkFrame {
  const factory _MaterialBookmarkFrame(
      {required final String materialId,
      required final int level,
      required final int quantity,
      required final Purpose purposeType}) = _$MaterialBookmarkFrameImpl;

  @override
  String get materialId;
  @override
  int get level;
  int get quantity;
  @override
  Purpose get purposeType;
}

/// @nodoc

class _$MaterialBookmarkFrameExpImpl implements MaterialBookmarkFrameExp {
  const _$MaterialBookmarkFrameExpImpl(
      {this.materialId = null,
      required this.level,
      required this.exp,
      this.purposeType = Purpose.ascension});

  @override
  @JsonKey()
  final String? materialId;
  @override
  final int level;
  @override
  final int exp;
  @override
  @JsonKey()
  final Purpose purposeType;

  @override
  String toString() {
    return 'MaterialBookmarkFrame.exp(materialId: $materialId, level: $level, exp: $exp, purposeType: $purposeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialBookmarkFrameExpImpl &&
            (identical(other.materialId, materialId) ||
                other.materialId == materialId) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.exp, exp) || other.exp == exp) &&
            (identical(other.purposeType, purposeType) ||
                other.purposeType == purposeType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, materialId, level, exp, purposeType);
}

abstract class MaterialBookmarkFrameExp implements MaterialBookmarkFrame {
  const factory MaterialBookmarkFrameExp(
      {final String? materialId,
      required final int level,
      required final int exp,
      final Purpose purposeType}) = _$MaterialBookmarkFrameExpImpl;

  @override
  String? get materialId;
  @override
  int get level;
  int get exp;
  @override
  Purpose get purposeType;
}

/// @nodoc
mixin _$MaterialUsage {
  String get characterId => throw _privateConstructorUsedError;
  String? get weaponId => throw _privateConstructorUsedError;
}

/// @nodoc

class _$MaterialUsageImpl implements _MaterialUsage {
  const _$MaterialUsageImpl({required this.characterId, this.weaponId});

  @override
  final String characterId;
  @override
  final String? weaponId;

  @override
  String toString() {
    return 'MaterialUsage(characterId: $characterId, weaponId: $weaponId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialUsageImpl &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.weaponId, weaponId) ||
                other.weaponId == weaponId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, characterId, weaponId);
}

abstract class _MaterialUsage implements MaterialUsage {
  const factory _MaterialUsage(
      {required final String characterId,
      final String? weaponId}) = _$MaterialUsageImpl;

  @override
  String get characterId;
  @override
  String? get weaponId;
}
