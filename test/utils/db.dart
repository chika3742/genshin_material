import "package:drift/drift.dart";
import "package:drift/native.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/models/bookmark.dart";
import "package:genshin_material/models/common.dart";

/// Creates an [AppDatabase] backed by an in-memory SQLite database.
///
/// The database is closed at the end of the test, so callers do not need a
/// `tearDown` of their own — closing it again is a no-op if they do. Call this
/// from a test body or `setUp`; `addTearDown` is unavailable in `setUpAll`.
AppDatabase createTestDatabase() {
  // Tests routinely hold several databases at once; the warning is just noise.
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  final db = AppDatabase(NativeDatabase.memory());
  addTearDown(db.close);

  return db;
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
