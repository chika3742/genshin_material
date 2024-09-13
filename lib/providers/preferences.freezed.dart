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
  KvPreferences get pref => throw _privateConstructorUsedError;
  int? get resin => throw _privateConstructorUsedError;
  DateTime? get resinBaseTime => throw _privateConstructorUsedError;
  String? get hyvCookie => throw _privateConstructorUsedError;
  String? get hyvServer => throw _privateConstructorUsedError;
  String? get hyvServerName => throw _privateConstructorUsedError;
  String? get hyvUserName => throw _privateConstructorUsedError;
  String? get hyvUid => throw _privateConstructorUsedError;
  bool get syncResin => throw _privateConstructorUsedError;
  bool get syncCharaState => throw _privateConstructorUsedError;
  bool get showItemNameOnCard => throw _privateConstructorUsedError;
  GameServer get dailyResetServer => throw _privateConstructorUsedError;
  bool get indexSheetTutorialShown => throw _privateConstructorUsedError;
}

/// @nodoc

class _$PreferencesStateImpl extends _PreferencesState {
  const _$PreferencesStateImpl(
      {required this.pref,
      required this.resin,
      required this.resinBaseTime,
      required this.hyvCookie,
      required this.hyvServer,
      required this.hyvServerName,
      required this.hyvUserName,
      required this.hyvUid,
      required this.syncResin,
      required this.syncCharaState,
      required this.showItemNameOnCard,
      required this.dailyResetServer,
      required this.indexSheetTutorialShown})
      : super._();

  @override
  final KvPreferences pref;
  @override
  final int? resin;
  @override
  final DateTime? resinBaseTime;
  @override
  final String? hyvCookie;
  @override
  final String? hyvServer;
  @override
  final String? hyvServerName;
  @override
  final String? hyvUserName;
  @override
  final String? hyvUid;
  @override
  final bool syncResin;
  @override
  final bool syncCharaState;
  @override
  final bool showItemNameOnCard;
  @override
  final GameServer dailyResetServer;
  @override
  final bool indexSheetTutorialShown;

  @override
  String toString() {
    return 'PreferencesState(pref: $pref, resin: $resin, resinBaseTime: $resinBaseTime, hyvCookie: $hyvCookie, hyvServer: $hyvServer, hyvServerName: $hyvServerName, hyvUserName: $hyvUserName, hyvUid: $hyvUid, syncResin: $syncResin, syncCharaState: $syncCharaState, showItemNameOnCard: $showItemNameOnCard, dailyResetServer: $dailyResetServer, indexSheetTutorialShown: $indexSheetTutorialShown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferencesStateImpl &&
            (identical(other.pref, pref) || other.pref == pref) &&
            (identical(other.resin, resin) || other.resin == resin) &&
            (identical(other.resinBaseTime, resinBaseTime) ||
                other.resinBaseTime == resinBaseTime) &&
            (identical(other.hyvCookie, hyvCookie) ||
                other.hyvCookie == hyvCookie) &&
            (identical(other.hyvServer, hyvServer) ||
                other.hyvServer == hyvServer) &&
            (identical(other.hyvServerName, hyvServerName) ||
                other.hyvServerName == hyvServerName) &&
            (identical(other.hyvUserName, hyvUserName) ||
                other.hyvUserName == hyvUserName) &&
            (identical(other.hyvUid, hyvUid) || other.hyvUid == hyvUid) &&
            (identical(other.syncResin, syncResin) ||
                other.syncResin == syncResin) &&
            (identical(other.syncCharaState, syncCharaState) ||
                other.syncCharaState == syncCharaState) &&
            (identical(other.showItemNameOnCard, showItemNameOnCard) ||
                other.showItemNameOnCard == showItemNameOnCard) &&
            (identical(other.dailyResetServer, dailyResetServer) ||
                other.dailyResetServer == dailyResetServer) &&
            (identical(
                    other.indexSheetTutorialShown, indexSheetTutorialShown) ||
                other.indexSheetTutorialShown == indexSheetTutorialShown));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pref,
      resin,
      resinBaseTime,
      hyvCookie,
      hyvServer,
      hyvServerName,
      hyvUserName,
      hyvUid,
      syncResin,
      syncCharaState,
      showItemNameOnCard,
      dailyResetServer,
      indexSheetTutorialShown);
}

abstract class _PreferencesState extends PreferencesState {
  const factory _PreferencesState(
      {required final KvPreferences pref,
      required final int? resin,
      required final DateTime? resinBaseTime,
      required final String? hyvCookie,
      required final String? hyvServer,
      required final String? hyvServerName,
      required final String? hyvUserName,
      required final String? hyvUid,
      required final bool syncResin,
      required final bool syncCharaState,
      required final bool showItemNameOnCard,
      required final GameServer dailyResetServer,
      required final bool indexSheetTutorialShown}) = _$PreferencesStateImpl;
  const _PreferencesState._() : super._();

  @override
  KvPreferences get pref;
  @override
  int? get resin;
  @override
  DateTime? get resinBaseTime;
  @override
  String? get hyvCookie;
  @override
  String? get hyvServer;
  @override
  String? get hyvServerName;
  @override
  String? get hyvUserName;
  @override
  String? get hyvUid;
  @override
  bool get syncResin;
  @override
  bool get syncCharaState;
  @override
  bool get showItemNameOnCard;
  @override
  GameServer get dailyResetServer;
  @override
  bool get indexSheetTutorialShown;
}
