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
}
