import "package:flutter_riverpod/misc.dart";
import "package:genshin_material/models/pref_key.dart";
import "package:genshin_material/providers/pref_notifier.dart";

/// Overrides [prefProvider] for [key] with an [InMemoryPrefNotifier] holding
/// [value], so a test needs no `SharedPreferences` at all.
///
/// Both type arguments are inferred from [key], which spares the call site the
/// explicit `InMemoryPrefNotifier<String?, String?>(null)` that a bare
/// `overrideWith` needs when [value] is null.
Override overridePref<PrefT, ConvT>(PrefKey<PrefT, ConvT> key, ConvT value) {
  return prefProvider(key).overrideWith(() => InMemoryPrefNotifier(value));
}

class InMemoryPrefNotifier<PrefT, ConvT> extends PrefNotifier<PrefT, ConvT> {
  ConvT _value;

  InMemoryPrefNotifier(ConvT initialValue) : _value = initialValue;

  @override
  ConvT build(PrefKey<PrefT, ConvT> key) => _value;

  @override
  Future<void> set(ConvT value) async {
    _value = value;
    state = _value;
  }
}
