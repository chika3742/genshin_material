import "package:flutter/services.dart";
import "package:genshin_material/models/release_note.dart";
import "package:genshin_material/utils/unwrap_yaml_value.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:yaml/yaml.dart";

part "data.g.dart";

@Riverpod(keepAlive: true)
Future<List<ReleaseNote>> releaseNotesData(ReleaseNotesDataRef ref) async {
  const assetName = "assets/release_notes.yaml";

  final yamlString = await rootBundle.loadString(assetName);
  final data = loadYaml(yamlString);

  if (data is! YamlList) {
    throw DataParsingException(assetName: "release_notes.yaml", message: "Root type is not a List.");
  }
  try {
    return data.map((e) => ReleaseNote.fromJson(unwrapYamlMap(e))).toList();
  } on TypeError catch (e) {
    throw DataParsingException(assetName: "release_notes.yaml", message: e.toString());
  }
}

class DataParsingException implements Exception {
  final String assetName;
  final String message;

  DataParsingException({required this.assetName, required this.message});

  @override
  String toString() {
    return "Failed to parse asset \"$assetName\". $message";
  }
}
