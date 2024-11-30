// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_data_sync.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameDataSyncResult {
  Map<Purpose, int> get levels => throw _privateConstructorUsedError;
  bool get hasRemovedBookmarks => throw _privateConstructorUsedError;
}

/// @nodoc

class _$GameDataSyncResultImpl implements _GameDataSyncResult {
  const _$GameDataSyncResultImpl(
      {required final Map<Purpose, int> levels,
      required this.hasRemovedBookmarks})
      : _levels = levels;

  final Map<Purpose, int> _levels;
  @override
  Map<Purpose, int> get levels {
    if (_levels is EqualUnmodifiableMapView) return _levels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_levels);
  }

  @override
  final bool hasRemovedBookmarks;

  @override
  String toString() {
    return 'GameDataSyncResult(levels: $levels, hasRemovedBookmarks: $hasRemovedBookmarks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameDataSyncResultImpl &&
            const DeepCollectionEquality().equals(other._levels, _levels) &&
            (identical(other.hasRemovedBookmarks, hasRemovedBookmarks) ||
                other.hasRemovedBookmarks == hasRemovedBookmarks));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_levels), hasRemovedBookmarks);
}

abstract class _GameDataSyncResult implements GameDataSyncResult {
  const factory _GameDataSyncResult(
      {required final Map<Purpose, int> levels,
      required final bool hasRemovedBookmarks}) = _$GameDataSyncResultImpl;

  @override
  Map<Purpose, int> get levels;
  @override
  bool get hasRemovedBookmarks;
}
