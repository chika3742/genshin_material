import "package:drift/drift.dart";

import "../database.dart";
import "../models/common.dart";

extension InGameCharacterStateDbExtension on AppDatabase {
  Future<int> setCharacterState(InGameCharacterStateCompanion companion) async {
    return await into(inGameCharacterStateTable).insertOnConflictUpdate(
      companion,
    );
  }

  Future<InGameCharacterState?> getCharacterState(String uid, String characterId) {
    final query = select(inGameCharacterStateTable)
      ..where((tbl) => tbl.uid.equals(uid) & tbl.characterId.equals(characterId));
    return query.getSingleOrNull();
  }

  Future<List<CharacterId>> getSyncedCharacters(String uid) async {
    final query = select(inGameCharacterStateTable)
      ..where((tbl) => tbl.uid.equals(uid));
    final states = await query.get();
    return states.map((e) => e.characterId).toList();
  }
}
