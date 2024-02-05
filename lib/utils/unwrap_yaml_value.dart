import "package:yaml/yaml.dart";

dynamic unwrapYamlValue(dynamic value) {
  return switch (value) {
    YamlMap() => unwrapYamlMap(value),
    YamlList() => unwrapYamlList(value),
    _ => value,
  };
}

Map<String, dynamic> unwrapYamlMap(YamlMap map) {
  return map.map((key, value) => MapEntry(key, unwrapYamlValue(value)));
}

List<dynamic> unwrapYamlList(YamlList list) {
  return list.map((element) => unwrapYamlValue(element)).toList();
}
