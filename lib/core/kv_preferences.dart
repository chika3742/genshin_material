import "package:shared_preferences/shared_preferences.dart";

class KvPreferences {
  final SharedPreferences sp;

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

  String? get hyvCookie => sp.getString("hyvCookie");
  Future<void> setHyvCookie(String? value) => value != null
      ? sp.setString("hyvCookie", value)
      : sp.remove("hyvCookie");

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

  bool get showItemNameOnCard => sp.getBool("showItemNameOnCard") ?? true;
  Future<void> setShowItemNameOnCard(bool value) => sp.setBool("showItemNameOnCard", value);
}
