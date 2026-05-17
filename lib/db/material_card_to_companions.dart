import "../models/bookmark.dart";
import "../models/material_bookmark_frame.dart";

List<MaterialBookmarkInsertable> materialCardToCompanions(
  MaterialCardMaterial card,
  MaterialUsage usage,
) {
  return card.levels.map((level) {
    return MaterialBookmarkInsertable(
      characterId: usage.characterId,
      materialId: card.id,
      weaponId: usage.weaponId,
      purposeType: level.purposeType,
      quantity: switch (level) {
        MaterialBookmarkFrameNormal(:final quantity) => quantity,
        MaterialBookmarkFrameExp(:final exp) => exp,
      },
      upperLevel: level.level,
    );
  }).toList();
}
