// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_updating_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AssetUpdatingState {
  AssetUpdateProgressState? get state => throw _privateConstructorUsedError;
  double? get progress => throw _privateConstructorUsedError;
  int? get totalBytes => throw _privateConstructorUsedError;
}

/// @nodoc

class _$AssetUpdatingStateImpl implements _AssetUpdatingState {
  const _$AssetUpdatingStateImpl(
      {required this.state, this.progress, this.totalBytes});

  @override
  final AssetUpdateProgressState? state;
  @override
  final double? progress;
  @override
  final int? totalBytes;

  @override
  String toString() {
    return 'AssetUpdatingState(state: $state, progress: $progress, totalBytes: $totalBytes)';
  }
}

abstract class _AssetUpdatingState implements AssetUpdatingState {
  const factory _AssetUpdatingState(
      {required final AssetUpdateProgressState? state,
      final double? progress,
      final int? totalBytes}) = _$AssetUpdatingStateImpl;

  @override
  AssetUpdateProgressState? get state;
  @override
  double? get progress;
  @override
  int? get totalBytes;
}
