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
/// [materialId] has no default on purpose: a null one marks the bookmark as an
/// EXP item bookmark rather than an ordinary material one, so the choice is
/// always explicit. Pass [weaponId] to build a weapon bookmark instead of a
/// character one.
///
/// Beware that [MaterialBookmarkInsertable.hash] is derived from
/// `characterId`, `purposeType`, `weaponId`, `materialId` and `upperLevel` —
/// not from [quantity] — and that `addMaterialBookmarks` skips rows whose hash
/// already exists. Two bookmarks that differ only in [quantity] therefore
/// insert a single row.
MaterialBookmarkInsertable buildMaterialBookmark({
  required MaterialId? materialId,
  CharacterId characterId = "char_1",
  WeaponId? weaponId,
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
