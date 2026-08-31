import "dart:convert";
import "dart:io";

import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/asset_cache.dart";
import "package:genshin_material/core/data_parsing_exception.dart";
import "package:genshin_material/core/errors.dart";
import "package:genshin_material/models/asset_release_version.dart";
import "package:path/path.dart" as path;

/// The files `AssetDataCacheProvider.load()` reads, with the smallest payload
/// each one parses into. Individual entries are overridden per test.
Map<String, Object> _emptyDataFiles() => {
      "characters.json": <String, dynamic>{},
      "character-ingredients.json": _emptyIngredientConfigurations(),
      "weapons.json": <String, dynamic>{},
      "weapon-ingredients.json": _emptyIngredientConfigurations(),
      "weapons-meta.json": {"subStats": {}, "types": {}},
      "elements.json": <String, dynamic>{},
      "materials.json": <String, dynamic>{},
      "materials-meta.json": {
        "categories": {},
        "sortOrder": {},
        "daily": {"talent": {}, "weapon": {}},
        "specialCharactersUsingMaterials": {},
      },
      "artifact-sets.json": <String, dynamic>{},
      "artifact-pieces.json": <String, dynamic>{},
      "artifacts-meta.json": {
        "stats": {},
        "pieceTypes": {},
        "possibleSubStats": [],
        "tags": {"categories": []},
      },
      "furnishings.json": <String, dynamic>{},
      "furnishing-sets.json": <String, dynamic>{},
      "furnishings-meta.json": {"setTypes": {}},
      "drop-rates.json": <dynamic>[],
    };

Map<String, Object> _emptyIngredientConfigurations() => {
      "expItems": [],
      "rarities": {},
      "sliders": [],
      "ingredientTables": {},
    };

Map<String, Object> _versionJson() => {
      "createdAt": "2024-01-01T00:00:00.000Z",
      "dataVersion": "test",
      "channel": "dev",
      "distUrl": "",
      "schemaVersion": 0,
    };

void main() {
  late Directory assetDir;

  setUp(() {
    assetDir = Directory.systemTemp.createTempSync("asset_cache_test");
  });

  tearDown(() {
    assetDir.deleteSync(recursive: true);
  });

  /// Writes a complete asset directory. [dataFiles] replaces individual entries
  /// of the minimal set; passing null for a name leaves that file out.
  void installAssets({
    Map<String, Object?> dataFiles = const {},
    Map<String, Object>? version = const {},
  }) {
    if (version != null) {
      File(path.join(assetDir.path, "version.json"))
          .writeAsStringSync(jsonEncode(_versionJson()..addAll(version)));
    }

    final files = _emptyDataFiles();
    for (final entry in dataFiles.entries) {
      if (entry.value == null) {
        files.remove(entry.key);
      } else {
        files[entry.key] = entry.value!;
      }
    }

    for (final entry in files.entries) {
      final file = File(path.join(assetDir.path, "data", entry.key));
      file.createSync(recursive: true);
      file.writeAsStringSync(jsonEncode(entry.value));
    }
  }

  AssetDataCacheProvider createProvider() =>
      AssetDataCacheProvider(assetDir.path);

  group("load", () {
    test("throws NoInstalledAssetException when no version file exists",
        () async {
      installAssets(version: null);

      await expectLater(
        createProvider().load(),
        throwsA(isA<NoInstalledAssetException>()),
      );
    });

    test("keeps the data null when no version file exists", () async {
      installAssets(version: null);
      final provider = createProvider();

      await expectLater(provider.load(), throwsA(isA<NoInstalledAssetException>()));

      expect(provider.version, isNull);
      expect(provider.data, isNull);
    });

    test("builds an AssetData from a minimal installation", () async {
      installAssets();
      final provider = createProvider();

      await provider.load();

      final data = provider.data!;
      expect(data.assetDir, assetDir.path);
      expect(data.version, provider.version);
      expect(data.version.dataVersion, "test");
      expect(data.version.channel, AssetChannel.dev);
      expect(data.characters, isEmpty);
      expect(data.weapons, isEmpty);
      expect(data.materials, isEmpty);
      expect(data.artifactSets, isEmpty);
      expect(data.artifactPieces, isEmpty);
      expect(data.furnishings, isEmpty);
      expect(data.furnishingSets, isEmpty);
      expect(data.dropRates, isEmpty);
      expect(data.dailyMaterials.talent, isEmpty);
      expect(data.dailyMaterials.weapon, isEmpty);
      expect(data.artifactTags, isEmpty);
    });

    test("parses the characters into a map keyed by id", () async {
      installAssets(dataFiles: {
        "characters.json": {
          "amber": {
            "id": "amber",
            "hyvIds": [10000021],
            "name": "Amber",
            "jaPronunciation": "アンバー",
            "imageUrl": "img/amber.png",
            "smallImageUrl": "img/amber_small.png",
            "rarity": 4,
            "weaponType": "bow",
            "element": "pyro",
            "talents": <String, dynamic>{},
            "materials": <String, dynamic>{},
          },
        },
      });

      final provider = createProvider();
      await provider.load();

      final amber = provider.data!.characters["amber"]!;
      expect(amber.id, "amber");
      expect(amber.rarity, 4);
      expect(amber.weaponType, "bow");
      expect(amber.name.localized, "Amber");
    });

    test("parses the weapons and the materials", () async {
      installAssets(dataFiles: {
        "weapons.json": {
          "rust": {
            "id": "rust",
            "hyvId": 15401,
            "name": "Rust",
            "jaPronunciation": "ヘイ",
            "imageUrl": "img/rust.png",
            "rarity": 4,
            "subStat": "atk",
            "weaponAffixDesc": null,
            "type": "bow",
          },
        },
        "materials.json": {
          "mora": {
            "id": "mora",
            "hyvId": 202,
            "name": "Mora",
            "jaPronunciation": "モラ",
            "imageUrl": "img/mora.png",
            "rarity": 1,
            "category": "currency",
          },
        },
      });
      final provider = createProvider();

      await provider.load();

      expect(provider.data!.weapons["rust"]!.hyvId, 15401);
      expect(provider.data!.weapons["rust"]!.type, "bow");
      expect(provider.data!.materials["mora"]!.category, "currency");
    });

    test("flattens the weapons meta into the weapon sub stats and types",
        () async {
      installAssets(dataFiles: {
        "weapons-meta.json": {
          "subStats": {"atk": "ATK"},
          "types": {
            "bow": {"hyvId": 15, "name": "Bow"},
          },
        },
      });
      final provider = createProvider();

      await provider.load();

      expect(provider.data!.weaponSubStats["atk"]!.localized, "ATK");
      expect(provider.data!.weaponTypes["bow"]!.hyvId, 15);
    });

    test("flattens the materials meta into the four AssetData fields",
        () async {
      installAssets(dataFiles: {
        "materials-meta.json": {
          "categories": {"currency": "Currency"},
          "sortOrder": {"category:currency": 10},
          "daily": {
            "talent": {
              "mondstadt": [
                {"description": "Freedom", "items": ["philosophies"]},
              ],
            },
            "weapon": {},
          },
          "specialCharactersUsingMaterials": {
            "philosophies": ["amber"],
          },
        },
      });
      final provider = createProvider();

      await provider.load();

      final data = provider.data!;
      expect(data.materialCategories["currency"]!.localized, "Currency");
      expect(data.materialSortOrder["category:currency"], 10);
      expect(
        data.dailyMaterials.talent["mondstadt"]!.single.items,
        ["philosophies"],
      );
      expect(data.specialCharactersUsingMaterials["philosophies"], ["amber"]);
    });

    test("flattens the artifacts meta into the four AssetData fields",
        () async {
      installAssets(dataFiles: {
        "artifacts-meta.json": {
          "stats": {"hp": "HP"},
          "pieceTypes": {
            "flower": {
              "id": "flower",
              "desc": "Flower of Life",
              "possibleMainStats": ["hp"],
            },
          },
          "possibleSubStats": ["hp", "atk"],
          "tags": {
            "categories": [
              {
                "desc": "Role",
                "items": [
                  {"id": "dps", "desc": "DPS"},
                ],
              },
            ],
          },
        },
      });
      final provider = createProvider();

      await provider.load();

      final data = provider.data!;
      expect(data.stats["hp"]!.localized, "HP");
      expect(data.artifactPieceTypes["flower"]!.possibleMainStats, ["hp"]);
      expect(data.artifactPossibleSubStats, ["hp", "atk"]);
      expect(data.artifactTags.single.desc.localized, "Role");
      expect(data.artifactTags.single.items.single.id, "dps");
    });

    test("parses the furnishing set types and the drop rates", () async {
      installAssets(dataFiles: {
        "furnishings-meta.json": {
          "setTypes": {"indoor": "Indoor"},
        },
        "drop-rates.json": [
          {
            "description": "Boss drop",
            "target": {"category": "boss"},
            "originalRate": [
              {"lowerAR": 35, "rate": 0.5},
            ],
            "condensedAvailable": false,
          },
        ],
      });
      final provider = createProvider();

      await provider.load();

      expect(provider.data!.furnishingSetTypes["indoor"]!.localized, "Indoor");
      expect(provider.data!.dropRates.single.condensedAvailable, isFalse);
      expect(provider.data!.dropRates.single.getDropRateForAR(40), 0.5);
    });

    test("propagates DataParsingException when a data file has a wrong root "
        "type", () async {
      installAssets(dataFiles: {"characters.json": <dynamic>[]});

      await expectLater(
        createProvider().load(),
        throwsA(
          isA<DataParsingException>()
              .having((e) => e.assetName, "assetName", "characters.json"),
        ),
      );
    });

    test("fails when one of the data files is missing", () async {
      installAssets(dataFiles: {"elements.json": null});

      await expectLater(
        createProvider().load(),
        throwsA(isA<PathNotFoundException>()),
      );
    });

    test("can be loaded twice, replacing the previous data", () async {
      final provider = createProvider();
      installAssets();
      await provider.load();
      final first = provider.data;

      installAssets(version: {"dataVersion": "test2"});
      await provider.load();

      expect(provider.data, isNot(same(first)));
      expect(provider.version!.dataVersion, "test2");
      expect(provider.data!.version.dataVersion, "test2");
    });
  });
}
