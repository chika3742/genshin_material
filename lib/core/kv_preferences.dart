import "package:shared_preferences/shared_preferences.dart";

class KvPreferences {
  final SharedPreferences instance;

  KvPreferences(this.instance);

  int get resin => instance.getInt("resin") ?? 0;

  static Future<void> setResin(int resin) => SharedPreferences.getInstance()
      .then((prefs) => prefs.setInt("resin", resin));


  DateTime get resinBaseTime =>
      DateTime.parse(
        instance.getString("resinBaseTime") ?? DateTime.now().toIso8601String(),
      );

  static Future<void> setResinBaseTime(DateTime resinBaseTime) =>
      SharedPreferences.getInstance().then(
        (prefs) => prefs.setString("resinBaseTime", resinBaseTime.toIso8601String()),
      );

  String get cookie => instance.getString("cookie") ?? "";

  static Future<void> setCookie(String cookie) =>
      SharedPreferences.getInstance().then(
        (prefs) => prefs.setString("cookie", cookie),
      );

  String get hyvServer => instance.getString("hyvServer") ?? "";

  static Future<void> setHyvServer(String hyvServer) =>
      SharedPreferences.getInstance().then(
        (prefs) => prefs.setString("hyvServer", hyvServer),
      );

  String get hyvServerName => instance.getString("hyvServerName") ?? "";

  static Future<void> setHyvServerName(String hyvServerName) =>
      SharedPreferences.getInstance().then(
        (prefs) => prefs.setString("hyvServerName", hyvServerName),
      );

  String get hyvUserName => instance.getString("hyvUserName") ?? "";

  static Future<void> setHyvUserName(String hyvUserName) =>
    SharedPreferences.getInstance().then(
      (prefs) => prefs.setString("hyvUserName", hyvUserName),
    );

  String get hyvUid => instance.getString("hyvUid") ?? "";

  static Future<void> setHyvUid(String hyvUid) =>
    SharedPreferences.getInstance().then(
      (prefs) => prefs.setString("hyvUid", hyvUid),
    );
}
