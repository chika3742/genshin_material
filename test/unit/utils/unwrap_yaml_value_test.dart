import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/utils/unwrap_yaml_value.dart";
import "package:yaml/yaml.dart";

void main() {
  group("unwrapYamlValue", () {
    test("turns a YamlMap into a plain Map", () {
      final unwrapped = unwrapYamlValue(loadYaml("a: 1"));

      expect(unwrapped, isNot(isA<YamlMap>()));
      expect(unwrapped, isA<Map<String, dynamic>>());
      expect(unwrapped, {"a": 1});
    });

    test("turns a YamlList into a plain List", () {
      final unwrapped = unwrapYamlValue(loadYaml("- 1\n- 2\n"));

      expect(unwrapped, isNot(isA<YamlList>()));
      expect(unwrapped, isA<List<dynamic>>());
      expect(unwrapped, [1, 2]);
    });

    test("unwraps nested YamlMap and YamlList values recursively", () {
      final unwrapped = unwrapYamlValue(
        loadYaml("a:\n  b:\n    - 1\n    - c: 2\n"),
      ) as Map<String, dynamic>;

      final a = unwrapped["a"] as Map<String, dynamic>;
      final b = a["b"] as List<dynamic>;

      expect(b, isNot(isA<YamlList>()));
      expect(b[1], isNot(isA<YamlMap>()));
      expect(unwrapped, {
        "a": {
          "b": [
            1,
            {"c": 2},
          ],
        },
      });
    });

    test("passes scalars through unchanged", () {
      expect(unwrapYamlValue(1), 1);
      expect(unwrapYamlValue("a"), "a");
      expect(unwrapYamlValue(true), isTrue);
      expect(unwrapYamlValue(null), isNull);
    });
  });

  group("loadYamlUnwrapped", () {
    test("returns the value when the root type matches", () {
      expect(
        loadYamlUnwrapped<Map<String, dynamic>>("a: 1"),
        {"a": 1},
      );
      expect(
        loadYamlUnwrapped<List<dynamic>>("- 1\n- 2\n"),
        [1, 2],
      );
    });

    test("throws when the root type does not match", () {
      expect(
        () => loadYamlUnwrapped<List<dynamic>>("a: 1"),
        throwsA(startsWith("Root type of YAML is not")),
      );
    });
  });
}
