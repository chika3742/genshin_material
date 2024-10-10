import "package:drift/drift.dart";

import "../database.dart";

extension InGameWeaponStateDbExtension on AppDatabase {
  Future<int> setWeaponLevels(String uid, String characterId, String weaponId, int level) async {
    return await into(inGameWeaponStateTable).insertOnConflictUpdate(
      InGameWeaponStateCompanion.insert(
        uid: uid,
        characterId: characterId,
        weaponId: weaponId,
        level: level,
      ),
    );
  }

  Future<int?> getWeaponLevels(String uid, String characterId, String weaponId) async {
    final query = select(inGameWeaponStateTable)
      ..where((tbl) => tbl.uid.equals(uid) & tbl.characterId.equals(characterId) & tbl.weaponId.equals(weaponId));
    final info = await query.getSingleOrNull();
    return info?.level;
  }
}
