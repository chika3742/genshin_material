// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PreferencesState {
  int get resin => throw _privateConstructorUsedError;
  DateTime get resinBaseTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PreferencesStateCopyWith<PreferencesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferencesStateCopyWith<$Res> {
  factory $PreferencesStateCopyWith(
          PreferencesState value, $Res Function(PreferencesState) then) =
      _$PreferencesStateCopyWithImpl<$Res, PreferencesState>;
  @useResult
  $Res call({int resin, DateTime resinBaseTime});
}

/// @nodoc
class _$PreferencesStateCopyWithImpl<$Res, $Val extends PreferencesState>
    implements $PreferencesStateCopyWith<$Res> {
  _$PreferencesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resin = null,
    Object? resinBaseTime = null,
  }) {
    return _then(_value.copyWith(
      resin: null == resin
          ? _value.resin
          : resin // ignore: cast_nullable_to_non_nullable
              as int,
      resinBaseTime: null == resinBaseTime
          ? _value.resinBaseTime
          : resinBaseTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferencesStateImplCopyWith<$Res>
    implements $PreferencesStateCopyWith<$Res> {
  factory _$$PreferencesStateImplCopyWith(_$PreferencesStateImpl value,
          $Res Function(_$PreferencesStateImpl) then) =
      __$$PreferencesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int resin, DateTime resinBaseTime});
}

/// @nodoc
class __$$PreferencesStateImplCopyWithImpl<$Res>
    extends _$PreferencesStateCopyWithImpl<$Res, _$PreferencesStateImpl>
    implements _$$PreferencesStateImplCopyWith<$Res> {
  __$$PreferencesStateImplCopyWithImpl(_$PreferencesStateImpl _value,
      $Res Function(_$PreferencesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resin = null,
    Object? resinBaseTime = null,
  }) {
    return _then(_$PreferencesStateImpl(
      resin: null == resin
          ? _value.resin
          : resin // ignore: cast_nullable_to_non_nullable
              as int,
      resinBaseTime: null == resinBaseTime
          ? _value.resinBaseTime
          : resinBaseTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$PreferencesStateImpl implements _PreferencesState {
  const _$PreferencesStateImpl(
      {required this.resin, required this.resinBaseTime});

  @override
  final int resin;
  @override
  final DateTime resinBaseTime;

  @override
  String toString() {
    return 'PreferencesState(resin: $resin, resinBaseTime: $resinBaseTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferencesStateImpl &&
            (identical(other.resin, resin) || other.resin == resin) &&
            (identical(other.resinBaseTime, resinBaseTime) ||
                other.resinBaseTime == resinBaseTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resin, resinBaseTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferencesStateImplCopyWith<_$PreferencesStateImpl> get copyWith =>
      __$$PreferencesStateImplCopyWithImpl<_$PreferencesStateImpl>(
          this, _$identity);
}

abstract class _PreferencesState implements PreferencesState {
  const factory _PreferencesState(
      {required final int resin,
      required final DateTime resinBaseTime}) = _$PreferencesStateImpl;

  @override
  int get resin;
  @override
  DateTime get resinBaseTime;
  @override
  @JsonKey(ignore: true)
  _$$PreferencesStateImplCopyWith<_$PreferencesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
