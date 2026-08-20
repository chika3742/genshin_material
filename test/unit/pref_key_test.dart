import "package:material_ui/material_ui.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/models/pref_key.dart";

void main() {
  group("TimeOfDayPrefKey", () {
    const key = TimeOfDayPrefKey("test");

    test("round-trips TimeOfDay values", () {
      for (final time in [
        const TimeOfDay(hour: 0, minute: 0),
        const TimeOfDay(hour: 23, minute: 59),
        const TimeOfDay(hour: 9, minute: 5),
      ]) {
        expect(key.fromPref(key.toPref(time)), time);
      }
    });

    test("serializes without zero padding", () {
      expect(key.toPref(const TimeOfDay(hour: 0, minute: 0)), "0:0");
      expect(key.toPref(const TimeOfDay(hour: 9, minute: 5)), "9:5");
      expect(key.toPref(const TimeOfDay(hour: 23, minute: 59)), "23:59");
    });

    test("maps null in both directions", () {
      expect(key.toPref(null), isNull);
      expect(key.fromPref(null), isNull);
    });

    // Locks in the current behavior: a corrupted preference value propagates the
    // parse failure instead of falling back to null.
    test("throws on malformed stored values", () {
      expect(() => key.fromPref("abc"), throwsFormatException);
      expect(() => key.fromPref(""), throwsFormatException);
      expect(() => key.fromPref("12"), throwsA(isA<RangeError>()));
    });
  });
}
