import "dart:convert";

import "package:drift/drift.dart";

import "../models/character.dart";
import "../models/common.dart";

class PurposeMapConverter extends TypeConverter<Map<Purpose, int>, String> {
  const PurposeMapConverter();

  @override
  Map<Purpose, int> fromSql(String fromDb) {
    final decoded = jsonDecode(fromDb) as Map<String, dynamic>;
    return decoded.map((key, value) => MapEntry(Purpose.values.firstWhere((e) => e.name == key), value));
  }

  @override
  String toSql(Map<Purpose, int> value) {
    return jsonEncode(value.map((key, value) => MapEntry(key.name, value)));
  }
}

class ListConverter<T> extends TypeConverter<List<T>, String> {
  const ListConverter();

  @override
  List<T> fromSql(String fromDb) {
    return (jsonDecode(fromDb) as List<dynamic>).cast<T>();
  }

  @override
  String toSql(List<T> value) {
    return jsonEncode(value);
  }
}

class MapConverter<T> extends TypeConverter<Map<String, T>, String> {
  const MapConverter();

  @override
  Map<String, T> fromSql(String fromDb) {
    return (jsonDecode(fromDb) as Map<String, dynamic>).cast<String, T>();
  }

  @override
  String toSql(Map<String, T> value) {
    return jsonEncode(value);
  }
}

class CharacterOrVariantIdConverter extends TypeConverter<CharacterOrVariantId, String> {
  const CharacterOrVariantIdConverter();

  @override
  CharacterOrVariantId fromSql(String fromDb) => CharacterOrVariantId(fromDb);

  @override
  String toSql(CharacterOrVariantId value) => value;
}

class VariantIdConverter extends TypeConverter<VariantId, String> {
  const VariantIdConverter();

  @override
  VariantId fromSql(String fromDb) => VariantId(fromDb);

  @override
  String toSql(VariantId value) => value;
}
