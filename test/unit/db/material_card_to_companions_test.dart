import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/db/material_card_to_companions.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/material_bookmark_frame.dart";

void main() {
  group("materialCardToCompanions", () {
    test("Takes the quantity of a normal frame", () {
      final companions = materialCardToCompanions(
        MaterialCardMaterial(
          id: "iron_chunk",
          levels: const [
            MaterialBookmarkFrame(
              materialId: "iron_chunk",
              level: 40,
              quantity: 3,
              purposeType: Purpose.ascension,
            ),
          ],
        ),
        const MaterialUsage(characterId: "char_1"),
      );

      expect(companions, hasLength(1));
      expect(companions.single.materialId, "iron_chunk");
      expect(companions.single.quantity, 3);
      expect(companions.single.upperLevel, 40);
      expect(companions.single.purposeType, Purpose.ascension);
    });

    test("Takes the exp of an exp frame as the quantity", () {
      final companions = materialCardToCompanions(
        MaterialCardMaterial(
          levels: const [
            MaterialBookmarkFrame.exp(
              level: 50,
              exp: 12500,
              purposeType: Purpose.ascension,
            ),
          ],
        ),
        const MaterialUsage(characterId: "char_1"),
      );

      expect(companions.single.quantity, 12500);
      expect(companions.single.upperLevel, 50);
    });

    test("Takes the material id from the card, not from the frame", () {
      final companions = materialCardToCompanions(
        MaterialCardMaterial(
          levels: const [
            MaterialBookmarkFrame.exp(
              materialId: "mat_from_frame",
              level: 50,
              exp: 12500,
            ),
          ],
        ),
        const MaterialUsage(characterId: "char_1"),
      );

      expect(companions.single.materialId, isNull);
    });

    test("Carries the character of the usage into every companion", () {
      final companions = materialCardToCompanions(
        MaterialCardMaterial(
          id: "iron_chunk",
          levels: const [
            MaterialBookmarkFrame(
              materialId: "iron_chunk",
              level: 40,
              quantity: 3,
              purposeType: Purpose.ascension,
            ),
            MaterialBookmarkFrame(
              materialId: "iron_chunk",
              level: 50,
              quantity: 6,
              purposeType: Purpose.ascension,
            ),
          ],
        ),
        const MaterialUsage(characterId: "char_1"),
      );

      expect(companions, hasLength(2));
      expect(companions.every((e) => e.characterId == "char_1"), isTrue);
      expect(companions.every((e) => e.weaponId == null), isTrue);
    });

    test("Carries the weapon of the usage into every companion", () {
      final companions = materialCardToCompanions(
        MaterialCardMaterial(
          id: "iron_chunk",
          levels: const [
            MaterialBookmarkFrame(
              materialId: "iron_chunk",
              level: 40,
              quantity: 3,
              purposeType: Purpose.ascension,
            ),
            MaterialBookmarkFrame(
              materialId: "iron_chunk",
              level: 50,
              quantity: 6,
              purposeType: Purpose.ascension,
            ),
          ],
        ),
        const MaterialUsage(characterId: "char_1", weaponId: "weapon_1"),
      );

      expect(companions.every((e) => e.characterId == "char_1"), isTrue);
      expect(companions.every((e) => e.weaponId == "weapon_1"), isTrue);
    });

    test("Keeps one companion per level, in the order of the card", () {
      final companions = materialCardToCompanions(
        MaterialCardMaterial(
          id: "iron_chunk",
          levels: const [
            MaterialBookmarkFrame(
              materialId: "iron_chunk",
              level: 40,
              quantity: 3,
              purposeType: Purpose.ascension,
            ),
            MaterialBookmarkFrame(
              materialId: "iron_chunk",
              level: 6,
              quantity: 9,
              purposeType: Purpose.normalAttack,
            ),
          ],
        ),
        const MaterialUsage(characterId: "char_1"),
      );

      expect(
        companions.map((e) => (e.upperLevel, e.quantity, e.purposeType)),
        [
          (40, 3, Purpose.ascension),
          (6, 9, Purpose.normalAttack),
        ],
      );
    });
  });
}
