import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/utils/unwrap_yaml_value.dart";
import "package:yaml/yaml.dart";

void main() {
  group("unwrapYamlValue", () {
    test("YamlMap が素の Map になる", () {
      final unwrapped = unwrapYamlValue(loadYaml("a: 1"));

      expect(unwrapped, isNot(isA<YamlMap>()));
      expect(unwrapped, isA<Map<String, dynamic>>());
      expect(unwrapped, {"a": 1});
    });

    test("YamlList が素の List になる", () {
      final unwrapped = unwrapYamlValue(loadYaml("- 1\n- 2\n"));

      expect(unwrapped, isNot(isA<YamlList>()));
      expect(unwrapped, isA<List<dynamic>>());
      expect(unwrapped, [1, 2]);
    });

    test("ネストした YamlMap / YamlList が再帰的に変換される", () {
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

    test("スカラーはそのまま返る", () {
      expect(unwrapYamlValue(1), 1);
      expect(unwrapYamlValue("a"), "a");
      expect(unwrapYamlValue(true), isTrue);
      expect(unwrapYamlValue(null), isNull);
    });
  });

  group("loadYamlUnwrapped", () {
    test("ルート型が一致すれば返る", () {
      expect(
        loadYamlUnwrapped<Map<String, dynamic>>("a: 1"),
        {"a": 1},
      );
      expect(
        loadYamlUnwrapped<List<dynamic>>("- 1\n- 2\n"),
        [1, 2],
      );
    });

    test("ルート型が一致しなければ throw する", () {
      expect(
        () => loadYamlUnwrapped<List<dynamic>>("a: 1"),
        throwsA(startsWith("Root type of YAML is not")),
      );
    });
  });
}
