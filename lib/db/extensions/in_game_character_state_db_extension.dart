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
}
