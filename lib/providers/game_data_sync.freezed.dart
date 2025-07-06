// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_data_sync.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameDataSyncResult {
  Map<Purpose, int> get levels;
  bool get hasRemovedBookmarks;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameDataSyncResult &&
            const DeepCollectionEquality().equals(other.levels, levels) &&
            (identical(other.hasRemovedBookmarks, hasRemovedBookmarks) ||
                other.hasRemovedBookmarks == hasRemovedBookmarks));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(levels), hasRemovedBookmarks);

  @override
  String toString() {
    return 'GameDataSyncResult(levels: $levels, hasRemovedBookmarks: $hasRemovedBookmarks)';
  }
}

/// @nodoc

class _GameDataSyncResult implements GameDataSyncResult {
  const _GameDataSyncResult(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameDataSyncResult &&
            const DeepCollectionEquality().equals(other._levels, _levels) &&
            (identical(other.hasRemovedBookmarks, hasRemovedBookmarks) ||
                other.hasRemovedBookmarks == hasRemovedBookmarks));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_levels), hasRemovedBookmarks);

  @override
  String toString() {
    return 'GameDataSyncResult(levels: $levels, hasRemovedBookmarks: $hasRemovedBookmarks)';
  }
}

// dart format on
