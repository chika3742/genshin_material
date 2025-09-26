import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../models/common.dart";

class PreferenceKey<T> {
  @protected
  final SharedPreferencesWithCache sp;

  @protected
  final String key;

  @protected
  final T defaultValue;

  const PreferenceKey(this.sp, this.key, this.defaultValue);

  T get value {
    final v = sp.get(key);
    if (v == null) {
      return defaultValue;
    }
    if (v is List) {
      return (v as List<Object?>).cast<String>().toList() as T;
    }
    return v as T;
  }

  /// Supported value types are:
  /// - [String]
  /// - `List<String>`
  /// - [int]
  /// - [double]
  /// - [bool]
  /// - [Null]
  Future<void> setValue(T? value) {
    return switch (value) {
      String() => sp.setString(key, value),
      List<String>() => sp.setStringList(key, value),
      int() => sp.setInt(key, value),
      double() => sp.setDouble(key, value),
      bool() => sp.setBool(key, value),
      Null() => sp.remove(key),
      _ => throw UnsupportedError("Invalid value type"),
    };
  }
}

typedef FromPrefCallback<T, C> = C Function(T pref);
typedef ToPrefCallback<T, C> = T Function(C value);

class PreferenceKeyWithConverter<T, C> extends PreferenceKey<T> {
  @protected
  final FromPrefCallback<T, C> fromPref;

  @protected
  final ToPrefCallback<T, C> toPref;

  const PreferenceKeyWithConverter(super.sp, super.key, super.defaultValue, {
    required this.fromPref,
    required this.toPref,
  });

  @override
  @protected
  T get value => super.value;

  @override
  @protected
  Future<void> setValue(T? value) => super.setValue(value);

  C get convertedValue => fromPref(value);

  Future<void> setValueWithConversion(C value) => setValue(toPref(value));
}

class KvPreferences {
  final SharedPreferencesWithCache sp;

  const KvPreferences(this.sp);

  PreferenceKey<T> key<T>(String key, T defaultValue) => PreferenceKey(
    sp,
    key,
    defaultValue,
  );

  PreferenceKeyWithConverter<T, C> keyWithConv<T, C>(String key, T defaultValue, {
    required FromPrefCallback<T, C> fromPref,
    required ToPrefCallback<T, C> toPref,
  }) => PreferenceKeyWithConverter(
    sp,
    key,
    defaultValue,
    fromPref: fromPref,
    toPref: toPref,
  );

  PreferenceKey<int?> get resin => key("resin", null);
  PreferenceKeyWithConverter<String?, DateTime?> get resinBaseTime => keyWithConv(
    "resinBaseTime",
    null,
    fromPref: (pref) => pref != null ? DateTime.tryParse(pref) : null,
    toPref: (value) => value?.toIso8601String(),
  );
  PreferenceKey<String?> get hyvServer => key("hyvServer", null);
  PreferenceKey<String?> get hyvServerName => key("hyvServerName", null);
  PreferenceKey<String?> get hyvUserName => key("hyvUserName", null);
  PreferenceKey<String?> get hyvUid => key("hyvUid", null);
  PreferenceKey<bool> get syncResin => key("syncResin", true);
  PreferenceKey<bool> get syncCharaState => key("syncCharaState", true);
  PreferenceKey<bool> get syncWeaponState => key("syncWeaponState", true);
  PreferenceKey<bool> get autoRemoveBookmarks => key("autoRemoveBookmarks", true);
  PreferenceKey<bool> get syncBagLackNums => key("syncBagLackNums", true);
  PreferenceKey<bool> get showItemNameOnCard => key("showItemNameOnCard", true);
  PreferenceKeyWithConverter<String, GameServer> get dailyResetServer => keyWithConv(
    "dailyResetServer",
    GameServer.asia.name,
    fromPref: (pref) => GameServer.values.firstWhere(
      (e) => e.name == pref,
      orElse: () => GameServer.asia,
    ),
    toPref: (value) => value.name,
  );
  PreferenceKey<bool> get indexSheetTutorialShown => key("indexSheetTutorialShown", false);
  PreferenceKey<List<String>> get bannerReadKeys => key("bannerReadKeys", []);
  PreferenceKey<int> get adventureRank => key("adventureRank", 60);
  PreferenceKey<double> get condensedMultiplier => key("condensedMultiplier", 2.0);
  PreferenceKey<bool> get showFarmCount => key("showFarmCount", true);
}
