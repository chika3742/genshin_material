// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PreferencesState {
  KvPreferences get pref;
  int? get resin;
  DateTime? get resinBaseTime;
  String? get hyvServer;
  String? get hyvServerName;
  String? get hyvUserName;
  String? get hyvUid;
  bool get syncResin;
  bool get syncCharaState;
  bool get syncWeaponState;
  bool get autoRemoveBookmarks;
  bool get syncBagCounts;
  bool get showItemNameOnCard;
  GameServer get dailyResetServer;
  bool get indexSheetTutorialShown;
  LackNumDisplayMethod get lackNumDisplayMethod;
  List<String> get bannerReadKeys;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PreferencesState &&
            (identical(other.pref, pref) || other.pref == pref) &&
            (identical(other.resin, resin) || other.resin == resin) &&
            (identical(other.resinBaseTime, resinBaseTime) ||
                other.resinBaseTime == resinBaseTime) &&
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
            (identical(other.syncWeaponState, syncWeaponState) ||
                other.syncWeaponState == syncWeaponState) &&
            (identical(other.autoRemoveBookmarks, autoRemoveBookmarks) ||
                other.autoRemoveBookmarks == autoRemoveBookmarks) &&
            (identical(other.syncBagCounts, syncBagCounts) ||
                other.syncBagCounts == syncBagCounts) &&
            (identical(other.showItemNameOnCard, showItemNameOnCard) ||
                other.showItemNameOnCard == showItemNameOnCard) &&
            (identical(other.dailyResetServer, dailyResetServer) ||
                other.dailyResetServer == dailyResetServer) &&
            (identical(
                    other.indexSheetTutorialShown, indexSheetTutorialShown) ||
                other.indexSheetTutorialShown == indexSheetTutorialShown) &&
            (identical(other.lackNumDisplayMethod, lackNumDisplayMethod) ||
                other.lackNumDisplayMethod == lackNumDisplayMethod) &&
            const DeepCollectionEquality()
                .equals(other.bannerReadKeys, bannerReadKeys));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pref,
      resin,
      resinBaseTime,
      hyvServer,
      hyvServerName,
      hyvUserName,
      hyvUid,
      syncResin,
      syncCharaState,
      syncWeaponState,
      autoRemoveBookmarks,
      syncBagCounts,
      showItemNameOnCard,
      dailyResetServer,
      indexSheetTutorialShown,
      lackNumDisplayMethod,
      const DeepCollectionEquality().hash(bannerReadKeys));

  @override
  String toString() {
    return 'PreferencesState(pref: $pref, resin: $resin, resinBaseTime: $resinBaseTime, hyvServer: $hyvServer, hyvServerName: $hyvServerName, hyvUserName: $hyvUserName, hyvUid: $hyvUid, syncResin: $syncResin, syncCharaState: $syncCharaState, syncWeaponState: $syncWeaponState, autoRemoveBookmarks: $autoRemoveBookmarks, syncBagCounts: $syncBagCounts, showItemNameOnCard: $showItemNameOnCard, dailyResetServer: $dailyResetServer, indexSheetTutorialShown: $indexSheetTutorialShown, lackNumDisplayMethod: $lackNumDisplayMethod, bannerReadKeys: $bannerReadKeys)';
  }
}

/// @nodoc

class _PreferencesState extends PreferencesState {
  const _PreferencesState(
      {required this.pref,
      required this.resin,
      required this.resinBaseTime,
      required this.hyvServer,
      required this.hyvServerName,
      required this.hyvUserName,
      required this.hyvUid,
      required this.syncResin,
      required this.syncCharaState,
      required this.syncWeaponState,
      required this.autoRemoveBookmarks,
      required this.syncBagCounts,
      required this.showItemNameOnCard,
      required this.dailyResetServer,
      required this.indexSheetTutorialShown,
      required this.lackNumDisplayMethod,
      required final List<String> bannerReadKeys})
      : _bannerReadKeys = bannerReadKeys,
        super._();

  @override
  final KvPreferences pref;
  @override
  final int? resin;
  @override
  final DateTime? resinBaseTime;
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
  final bool syncWeaponState;
  @override
  final bool autoRemoveBookmarks;
  @override
  final bool syncBagCounts;
  @override
  final bool showItemNameOnCard;
  @override
  final GameServer dailyResetServer;
  @override
  final bool indexSheetTutorialShown;
  @override
  final LackNumDisplayMethod lackNumDisplayMethod;
  final List<String> _bannerReadKeys;
  @override
  List<String> get bannerReadKeys {
    if (_bannerReadKeys is EqualUnmodifiableListView) return _bannerReadKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bannerReadKeys);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PreferencesState &&
            (identical(other.pref, pref) || other.pref == pref) &&
            (identical(other.resin, resin) || other.resin == resin) &&
            (identical(other.resinBaseTime, resinBaseTime) ||
                other.resinBaseTime == resinBaseTime) &&
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
            (identical(other.syncWeaponState, syncWeaponState) ||
                other.syncWeaponState == syncWeaponState) &&
            (identical(other.autoRemoveBookmarks, autoRemoveBookmarks) ||
                other.autoRemoveBookmarks == autoRemoveBookmarks) &&
            (identical(other.syncBagCounts, syncBagCounts) ||
                other.syncBagCounts == syncBagCounts) &&
            (identical(other.showItemNameOnCard, showItemNameOnCard) ||
                other.showItemNameOnCard == showItemNameOnCard) &&
            (identical(other.dailyResetServer, dailyResetServer) ||
                other.dailyResetServer == dailyResetServer) &&
            (identical(
                    other.indexSheetTutorialShown, indexSheetTutorialShown) ||
                other.indexSheetTutorialShown == indexSheetTutorialShown) &&
            (identical(other.lackNumDisplayMethod, lackNumDisplayMethod) ||
                other.lackNumDisplayMethod == lackNumDisplayMethod) &&
            const DeepCollectionEquality()
                .equals(other._bannerReadKeys, _bannerReadKeys));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pref,
      resin,
      resinBaseTime,
      hyvServer,
      hyvServerName,
      hyvUserName,
      hyvUid,
      syncResin,
      syncCharaState,
      syncWeaponState,
      autoRemoveBookmarks,
      syncBagCounts,
      showItemNameOnCard,
      dailyResetServer,
      indexSheetTutorialShown,
      lackNumDisplayMethod,
      const DeepCollectionEquality().hash(_bannerReadKeys));

  @override
  String toString() {
    return 'PreferencesState(pref: $pref, resin: $resin, resinBaseTime: $resinBaseTime, hyvServer: $hyvServer, hyvServerName: $hyvServerName, hyvUserName: $hyvUserName, hyvUid: $hyvUid, syncResin: $syncResin, syncCharaState: $syncCharaState, syncWeaponState: $syncWeaponState, autoRemoveBookmarks: $autoRemoveBookmarks, syncBagCounts: $syncBagCounts, showItemNameOnCard: $showItemNameOnCard, dailyResetServer: $dailyResetServer, indexSheetTutorialShown: $indexSheetTutorialShown, lackNumDisplayMethod: $lackNumDisplayMethod, bannerReadKeys: $bannerReadKeys)';
  }
}

// dart format on
