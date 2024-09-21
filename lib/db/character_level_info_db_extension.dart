import "package:drift/drift.dart";

import "../database.dart";
import "../models/common.dart";

extension CharacterLevelInfoDbExtension on AppDatabase {
  Future<int> setCharacterLevels(String uid, String characterId, Map<Purpose, int> purposes) async {
    return await into(characterLevelInfoTable).insertOnConflictUpdate(
      CharacterLevelInfoCompanion.insert(
        uid: uid,
        characterId: characterId,
        purposes: purposes,
      ),
    );
  }

  Future<Map<Purpose, int>?> getCharacterLevels(String uid, String characterId) async {
    final query = select(characterLevelInfoTable)
      ..where((tbl) => tbl.uid.equals(uid) & tbl.characterId.equals(characterId));
    final info = await query.getSingleOrNull();
    return info?.purposes;
  }
}
