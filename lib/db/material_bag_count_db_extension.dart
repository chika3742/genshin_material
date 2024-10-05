import "package:drift/drift.dart";

import "../database.dart";

extension MaterialBagCountDbExtension on AppDatabase {
  Stream<List<MaterialBagCount>> watchMaterialBagCounts(String uid, List<int> hyvId) {
    return (select(materialBagCountTable)..where((tbl) => tbl.uid.equals(uid) & tbl.hyvId.isIn(hyvId))).watch();
  }

  Future<void> updateMaterialBagCounts(String uid, Map<int, int> counts) {
    return transaction(() async {
      for (final entry in counts.entries) {
        await into(materialBagCountTable).insert(MaterialBagCountCompanion.insert(
          uid: uid,
          hyvId: entry.key,
          count: entry.value,
        ), mode: InsertMode.insertOrReplace,);
      }
    });
  }
}
