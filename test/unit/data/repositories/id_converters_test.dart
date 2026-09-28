import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/asset_cache.dart";
import "package:genshin_material/data/repositories/id_converters.dart";
import "package:genshin_material/models/element.dart";
import "package:genshin_material/models/localized_text.dart";

import "../../../utils/asset_data.dart";

const _charaHyvId = 90001;
const _groupHyvId1 = 90002;
const _groupHyvId2 = 90003;
const _unknownHyvId = 99999;

const _anemoHyvId = 90101;
const _geoHyvId = 90102;
const _pyroHyvId = 90103;

const _weaponHyvId = 90201;

Element _buildElement(int hyvId) {
  return Element(hyvId: hyvId, imageUrl: "", text: LocalizedText(locales: {}));
}

void main() {
  late AssetData assetData;

  setUp(() {
    assetData = buildTestAssetData(
      characters: {
        "test_chara": buildTestCharacter(
          id: "test_chara",
          hyvIds: [_charaHyvId],
          element: "test_anemo",
        ),
        "test_group": buildTestCharacterGroup(
          id: "test_group",
          hyvIds: [_groupHyvId1, _groupHyvId2],
          variantIds: ["test_group_anemo", "test_group_geo"],
        ),
        "test_group_anemo": buildTestCharacterVariant(
          id: "test_group_anemo",
          parentId: "test_group",
          element: "test_anemo",
        ),
        "test_group_geo": buildTestCharacterVariant(
          id: "test_group_geo",
          parentId: "test_group",
          element: "test_geo",
        ),
      },
      weapons: {
        "test_weapon": buildTestWeapon(id: "test_weapon", hyvId: _weaponHyvId),
      },
      elements: {
        "test_anemo": _buildElement(_anemoHyvId),
        "test_geo": _buildElement(_geoHyvId),
        "test_pyro": _buildElement(_pyroHyvId),
      },
    );
  });

  group("getLocalCharacterId", () {
    test("returns the listed character regardless of the element", () {
      expect(
        assetData.getLocalCharacterId(_charaHyvId, elementId: _geoHyvId),
        "test_chara",
      );
    });

    test("returns the variant of the group matching the element, for any of its hyvIds", () {
      expect(
        assetData.getLocalCharacterId(_groupHyvId1, elementId: _anemoHyvId),
        "test_group_anemo",
      );
      expect(
        assetData.getLocalCharacterId(_groupHyvId2, elementId: _geoHyvId),
        "test_group_geo",
      );
    });

    test("returns null when the group has no variant of the element", () {
      expect(
        assetData.getLocalCharacterId(_groupHyvId1, elementId: _pyroHyvId),
        isNull,
      );
    });

    test("returns null when the hyvId does not belong to the variant's group", () {
      expect(
        assetData.getLocalCharacterId(_unknownHyvId, elementId: _anemoHyvId),
        isNull,
      );
    });
  });

  group("getLocalWeaponId", () {
    test("returns the ID of the weapon", () {
      expect(assetData.getLocalWeaponId(_weaponHyvId), "test_weapon");
    });

    test("returns null for an unknown hyvId", () {
      expect(assetData.getLocalWeaponId(_unknownHyvId), isNull);
    });
  });

  group("getLocalElementId", () {
    test("returns the key of the element", () {
      expect(assetData.getLocalElementId(_geoHyvId), "test_geo");
    });
  });

  group("variantIdToCharacterHyvIds", () {
    test("returns the hyvIds of a listed character", () {
      expect(assetData.variantIdToCharacterHyvIds("test_chara"), [_charaHyvId]);
    });

    test("returns the hyvIds of the parent group for a variant", () {
      expect(
        assetData.variantIdToCharacterHyvIds("test_group_geo"),
        [_groupHyvId1, _groupHyvId2],
      );
    });

    test("returns null for a group ID", () {
      expect(assetData.variantIdToCharacterHyvIds("test_group"), isNull);
    });

    test("returns null for an unknown ID", () {
      expect(assetData.variantIdToCharacterHyvIds("test_unknown"), isNull);
    });
  });
}
