import "package:drift/drift.dart";

import "../database.dart";
import "../models/common.dart";

extension InGameCharacterStateDbExtension on AppDatabase {
  Future<int> setCharacterState(InGameCharacterStateCompanion companion) async {
    return await into(inGameCharacterStateTable).insertOnConflictUpdate(
      companion,
    );
  }

  Future<Map<Purpose, int>?> getCharacterLevels(String uid, String characterId) async {
    final query = select(inGameCharacterStateTable)
      ..where((tbl) => tbl.uid.equals(uid) & tbl.characterId.equals(characterId));
    final info = await query.getSingleOrNull();
    return info?.purposes;
  }

  Future<List<CharacterId>> getSyncedCharacters(String uid) async {
    final query = select(inGameCharacterStateTable)
      ..where((tbl) => tbl.uid.equals(uid));
    final states = await query.get();
    return states.map((e) => e.characterId).toList();
  }

  Stream<String?> watchCharacterWeapon(String uid, String characterId) {
    final query = select(inGameCharacterStateTable)
      ..where((tbl) => tbl.uid.equals(uid) & tbl.characterId.equals(characterId));
    return query.watchSingleOrNull().map((event) => event?.equippedWeaponId);
  }
}
