import "package:genshin_material/models/pref_key.dart";
import "package:genshin_material/providers/pref_notifier.dart";

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
