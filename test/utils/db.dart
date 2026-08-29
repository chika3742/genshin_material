import "package:drift/native.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/models/bookmark.dart";
import "package:genshin_material/models/common.dart";

/// Creates an [AppDatabase] backed by an in-memory SQLite database.
///
/// Close it in `tearDown` with `await db.close()`.
AppDatabase createTestDatabase() {
  return AppDatabase(NativeDatabase.memory());
}

/// Builds a [MaterialBookmarkInsertable] with sensible defaults so tests only
/// have to spell out the fields they care about.
///
/// Pass [weaponId] to build a weapon bookmark; leave it out for a character one.
MaterialBookmarkInsertable buildTestMaterialBookmark({
  CharacterId characterId = "char_1",
  WeaponId? weaponId,
  MaterialId? materialId,
  Purpose purposeType = Purpose.ascension,
  int upperLevel = 1,
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
