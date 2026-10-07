import "package:genshin_material/models/character.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/element.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/models/weapon.dart";

import "asset_data.dart";

const testCharaId = CharacterId("test_chara");
const testGroupId = CharacterId("test_group");
const testVariantId1 = VariantId("test_group_anemo");
const testVariantId2 = VariantId("test_group_geo");
const charaHyvId = 90001;
const groupHyvId1 = 90002;
const groupHyvId2 = 90003;
const unknownCharaHyvId = 99999;

const TeyvatElement testAnemo = "test_anemo";
const TeyvatElement testGeo = "test_geo";
const TeyvatElement testPyro = "test_pyro";
const anemoHyvId = 90101;
const geoHyvId = 90102;
const pyroHyvId = 90103;

const WeaponId testWeaponId = "test_weapon";
const weaponHyvId = 90201;
const unknownWeaponHyvId = 99998;

const WeaponType testSword = "test_sword";
const WeaponType testClaymore = "test_claymore";
const swordHyvId = 90301;
const claymoreHyvId = 90302;

Map<CharacterId, Character> createTestCharacters() => {
  for (final c in [
    buildTestCharacter(
      id: testCharaId,
      hyvIds: [charaHyvId],
      element: testAnemo,
      weaponType: testSword,
    ),
    buildTestCharacter(
      id: testGroupId,
      hyvIds: [groupHyvId1, groupHyvId2],
      variants: [
        buildTestCharacterVariant(
          id: testVariantId1,
          characterId: testGroupId,
          element: testAnemo,
          weaponType: testSword,
        ),
        buildTestCharacterVariant(
          id: testVariantId2,
          characterId: testGroupId,
          element: testGeo,
          weaponType: testClaymore,
        ),
      ],
    ),
  ]) c.id: c,
};

Map<WeaponId, Weapon> createTestWeapons() => {
  testWeaponId: buildTestWeapon(id: testWeaponId, hyvId: weaponHyvId),
};

/// [testPyro] has no character, for lookups of an element no variant matches.
Map<TeyvatElement, Element> createTestElements() => {
  for (final (id, hyvId) in [(testAnemo, anemoHyvId), (testGeo, geoHyvId), (testPyro, pyroHyvId)])
    id: Element(hyvId: hyvId, imageUrl: "", text: LocalizedText(locales: {})),
};

Map<WeaponType, WeaponTypeInfo> createTestWeaponTypes() => {
  for (final (id, hyvId) in [(testSword, swordHyvId), (testClaymore, claymoreHyvId)])
    id: WeaponTypeInfo(hyvId: hyvId, name: LocalizedText(locales: {})),
};
