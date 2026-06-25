sealed class PrefKey<PrefT, ConvT> {
  final String key;

  const PrefKey(this.key);

  PrefT? get defaultValue;

  PrefT toPref(ConvT input);

  ConvT fromPref(PrefT pref);
}

abstract final class NoConversionPrefKey<PrefT> extends PrefKey<PrefT, PrefT> {
  @override
  final PrefT? defaultValue;

  const NoConversionPrefKey(super.key, this.defaultValue);

  @override
  PrefT toPref(PrefT input) => input;

  @override
  PrefT fromPref(PrefT pref) => pref;
}

final class BooleanPrefKey extends NoConversionPrefKey<bool> {
  const BooleanPrefKey(super.key, bool super.defaultValue);
}
final class IntPrefKey extends NoConversionPrefKey<int> {
  const IntPrefKey(super.key, int super.defaultValue);
}
final class NullableIntPrefKey extends NoConversionPrefKey<int?> {
  const NullableIntPrefKey(super.key, [super.defaultValue]);
}
final class DoublePrefKey extends NoConversionPrefKey<double> {
  const DoublePrefKey(super.key, double super.defaultValue);
}
final class NullableStringPrefKey extends NoConversionPrefKey<String?> {
  const NullableStringPrefKey(super.key, [super.defaultValue]);
}
final class StringListPrefKey extends NoConversionPrefKey<List<String>> {
  const StringListPrefKey(super.key, List<String> super.defaultValue);
}

final class DateTimeIsoPrefKey extends PrefKey<String?, DateTime?> {
  @override
  final String? defaultValue;

  const DateTimeIsoPrefKey(super.key, [this.defaultValue]);

  @override
  String? toPref(DateTime? input) => input?.toIso8601String();

  @override
  DateTime? fromPref(String? pref) =>
      pref != null ? DateTime.tryParse(pref) : null;
}

final class EnumPrefKey<E extends Enum> extends PrefKey<String, E> {
  final List<E> values;
  final E? _defaultEnum;

  const EnumPrefKey(super.key, this.values, [E? defaultValue])
    : _defaultEnum = defaultValue;

  E get _fallback => _defaultEnum ?? values.first;

  @override
  String get defaultValue => _fallback.name;

  @override
  String toPref(E input) => input.name;

  @override
  E fromPref(String pref) =>
      values.firstWhere((e) => e.name == pref, orElse: () => _fallback);
}
