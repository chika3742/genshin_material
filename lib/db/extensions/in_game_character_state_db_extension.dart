import "package:drift/drift.dart";

import "../database.dart";

extension InGameCharacterStateDbExtension on AppDatabase {
  Future<InGameCharacterState> setCharacterState(InGameCharacterStateCompanion companion) async {
    return await into(inGameCharacterStateTable).insertReturning(
      companion,
      mode: .insertOrReplace,
    );
  }

  Future<void> setCharacterStates(List<InGameCharacterStateCompanion> companions) async {
    return batch((b) {
      b.insertAllOnConflictUpdate(inGameCharacterStateTable, companions);
    });
  }

  Stream<List<InGameCharacterState>> watchCharacterStates(String uid) {
    final query = select(inGameCharacterStateTable)
      ..where((tbl) => tbl.uid.equals(uid));
    return query.watch();
  }

  Future<int?> getSavedHyvId(String uid, List<int> hyvIds) async {
    final query = selectOnly(inGameCharacterStateTable)
      ..addColumns([inGameCharacterStateTable.characterId])
      ..where(inGameCharacterStateTable.uid.equals(uid) & inGameCharacterStateTable.characterId.isIn(hyvIds))
      ..limit(1);
    return (await query.getSingleOrNull())?.read(inGameCharacterStateTable.characterId);
  }
}
