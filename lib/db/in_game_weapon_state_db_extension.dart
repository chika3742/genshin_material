import "package:drift/drift.dart";

import "../database.dart";
import "../models/common.dart";

extension InGameWeaponStateDbExtension on AppDatabase {
  Future<int> setWeaponLevels(String uid, String characterId, String weaponId, int level) async {
    return await into(inGameWeaponStateTable).insertOnConflictUpdate(
      InGameWeaponStateCompanion.insert(
        uid: uid,
        characterId: characterId,
        weaponId: weaponId,
        purposes: { Purpose.ascension: level },
      ),
    );
  }

  Future<InGameWeaponState?> getWeaponState(String uid, String characterId, String weaponId) {
    final query = select(inGameWeaponStateTable)
      ..where((tbl) => tbl.uid.equals(uid) & tbl.characterId.equals(characterId) & tbl.weaponId.equals(weaponId));
    return query.getSingleOrNull();
  }
}
