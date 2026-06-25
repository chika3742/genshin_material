import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../models/pref_key.dart";

part "pref_notifier.g.dart";

@Riverpod(keepAlive: true)
SharedPreferencesWithCache sharedPreferencesWithCache(Ref ref) {
  throw StateError("This provider must be initialized with overrideWithValue.");
}

@Riverpod(keepAlive: true)
class PrefNotifier<PrefT, ConvT> extends _$PrefNotifier<PrefT, ConvT> {
  @override
  ConvT build(PrefKey<PrefT, ConvT> key) {
    final sp = ref.watch(sharedPreferencesWithCacheProvider);
    final raw = sp.get(key.key);
    final prefValue = (raw is PrefT && raw != null ? raw : key.defaultValue) as PrefT;
    return key.fromPref(prefValue);
  }

  Future<void> set(ConvT value) async {
    final sp = ref.read(sharedPreferencesWithCacheProvider);
    final prefValue = key.toPref(value);
    state = value;
    await switch (prefValue) {
      final String v => sp.setString(key.key, v),
      final int v => sp.setInt(key.key, v),
      final double v => sp.setDouble(key.key, v),
      final bool v => sp.setBool(key.key, v),
      final List<String> v => sp.setStringList(key.key, v),
      null => sp.remove(key.key),
      _ => throw UnsupportedError("Unsupported pref type: ${prefValue.runtimeType}"),
    };
  }
}
