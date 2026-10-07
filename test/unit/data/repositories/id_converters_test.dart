import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/asset_cache.dart";
import "package:genshin_material/data/repositories/id_converters.dart";

import "../../../utils/asset_data.dart";
import "../../../utils/test_data.dart";

void main() {
  late AssetData assetData;

  setUp(() {
    assetData = buildTestAssetData(
      characters: createTestCharacters(),
      weapons: createTestWeapons(),
      elements: createTestElements(),
    );
  });

  group("getLocalCharacterId", () {
    test("returns the listed character matching the element", () {
      expect(
        assetData.getLocalCharacterId(charaHyvId, elementId: anemoHyvId),
        testCharaId,
      );
    });

    test("returns null for a listed character when the element does not match", () {
      expect(
        assetData.getLocalCharacterId(charaHyvId, elementId: geoHyvId),
        isNull,
      );
    });

    test("returns the variant of the group matching the element, for any of its hyvIds", () {
      expect(
        assetData.getLocalCharacterId(groupHyvId1, elementId: anemoHyvId),
        testVariantId1,
      );
      expect(
        assetData.getLocalCharacterId(groupHyvId2, elementId: geoHyvId),
        testVariantId2,
      );
    });

    test("returns null when the group has no variant of the element", () {
      expect(
        assetData.getLocalCharacterId(groupHyvId1, elementId: pyroHyvId),
        isNull,
      );
    });

    test("returns null when the hyvId does not belong to the variant's group", () {
      expect(
        assetData.getLocalCharacterId(unknownCharaHyvId, elementId: anemoHyvId),
        isNull,
      );
    });
  });

  group("getLocalWeaponId", () {
    test("returns the ID of the weapon", () {
      expect(assetData.getLocalWeaponId(weaponHyvId), testWeaponId);
    });

    test("returns null for an unknown hyvId", () {
      expect(assetData.getLocalWeaponId(unknownWeaponHyvId), isNull);
    });
  });

  group("getLocalElementId", () {
    test("returns the key of the element", () {
      expect(assetData.getLocalElementId(geoHyvId), testGeo);
    });
  });
}
