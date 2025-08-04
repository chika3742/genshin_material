import "package:shared_preferences/shared_preferences.dart";

import "../models/common.dart";

class KvPreferences {
  final SharedPreferencesWithCache sp;

  KvPreferences(this.sp);

  int? get resin => sp.getInt("resin");
  Future<void> setResin(int? value) => value != null
      ? sp.setInt("resin", value)
      : sp.remove("resin");

  DateTime? get resinBaseTime {
    final value = sp.getString("resinBaseTime");
    return value != null ? DateTime.tryParse(value) : null;
  }
  Future<void> setResinBaseTime(DateTime? value) => value != null
      ? sp.setString("resinBaseTime", value.toIso8601String())
      : sp.remove("resinBaseTime");

  String? get hyvServer => sp.getString("hyvServer");
  Future<void> setHyvServer(String? value) => value != null
      ? sp.setString("hyvServer", value)
      : sp.remove("hyvServer");

  String? get hyvServerName => sp.getString("hyvServerName");
  Future<void> setHyvServerName(String? value) => value != null
      ? sp.setString("hyvServerName", value)
      : sp.remove("hyvServerName");

  String? get hyvUserName => sp.getString("hyvUserName");
  Future<void> setHyvUserName(String? value) => value != null
      ? sp.setString("hyvUserName", value)
      : sp.remove("hyvUserName");

  String? get hyvUid => sp.getString("hyvUid");
  Future<void> setHyvUid(String? value) => value != null
      ? sp.setString("hyvUid", value)
      : sp.remove("hyvUid");

  bool get syncResin => sp.getBool("syncResin") ?? true;
  Future<void> setSyncResin(bool value) => sp.setBool("syncResin", value);

  bool get syncCharaState => sp.getBool("syncCharaState") ?? true;
  Future<void> setSyncCharaState(bool value) => sp.setBool("syncCharaState", value);

  bool get syncWeaponState => sp.getBool("syncWeaponState") ?? true;
  Future<void> setSyncWeaponState(bool value) => sp.setBool("syncWeaponState", value);

  bool get autoRemoveBookmarks => sp.getBool("autoRemoveBookmarks") ?? true;
  Future<void> setAutoRemoveBookmarks(bool value) => sp.setBool("autoRemoveBookmarks", value);

  bool get syncBagLackNums => sp.getBool("syncBagLackNums") ?? true;
  Future<void> setSyncBagLackNums(bool value) => sp.setBool("syncBagLackNums", value);

  bool get showItemNameOnCard => sp.getBool("showItemNameOnCard") ?? true;
  Future<void> setShowItemNameOnCard(bool value) => sp.setBool("showItemNameOnCard", value);

  String get dailyResetServer => sp.getString("dailyResetServer") ?? GameServer.asia.name;
  Future<void> setDailyResetServer(String value) => sp.setString("dailyResetServer", value);

  bool get indexSheetTutorialShown => sp.getBool("indexSheetTutorialShown") ?? false;
  Future<void> setIndexSheetTutorialShown(bool value) => sp.setBool("indexSheetTutorialShown", value);

  LackNumDisplayMethod get lackNumDisplayMethod => LackNumDisplayMethod.values[sp.getInt("lackNumDisplayMethod") ?? 0];
  Future<void> setLackNumDisplayMethod(LackNumDisplayMethod value) => sp.setInt("lackNumDisplayMethod", value.index);

  List<String> get bannerReadKeys => sp.getStringList("bannerReadKeys") ?? [];
  Future<void> setBannerReadKeys(List<String> value) => sp.setStringList("bannerReadKeys", value);
}

enum LackNumDisplayMethod {
  alternate,
  requiredNumOnly,
  lackNumOnly,
  craftedLackNumOnly;

  bool get isSingleShowMode => this == requiredNumOnly || this == lackNumOnly || this == craftedLackNumOnly;
}
