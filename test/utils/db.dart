import "package:drift/native.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/models/bookmark.dart";
import "package:genshin_material/models/common.dart";

/// Creates an [AppDatabase] backed by an in-memory SQLite instance.
///
/// Close it in `tearDown`.
AppDatabase createTestDatabase() {
  return AppDatabase(NativeDatabase.memory());
}

/// Builds a [MaterialBookmarkInsertable] for [AppDatabase.addMaterialBookmarks].
///
/// Pass [weaponId] to build a weapon bookmark instead of a character one.
MaterialBookmarkInsertable buildMaterialBookmark({
  CharacterId characterId = "char_1",
  WeaponId? weaponId,
  MaterialId? materialId,
  Purpose purposeType = Purpose.ascension,
  int upperLevel = 40,
  int quantity = 1,
}) {
  return MaterialBookmarkInsertable(
    characterId: characterId,
    weaponId: weaponId,
    materialId: materialId,
    quantity: quantity,
    upperLevel: upperLevel,
    purposeType: purposeType,
  );
}
