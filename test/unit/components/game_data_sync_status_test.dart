import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/game_data_sync_indicator.dart";

void main() {
  group("combine", () {
    // The variants without fields are const, so each one is a single canonical
    // instance and can be compared with `same`.
    const syncing = GameDataSyncStatus.syncing();
    const synced = GameDataSyncStatus.synced();
    const warning = GameDataSyncStatus.characterNotExists();
    final error = GameDataSyncStatus.error(error: Exception("sync"));

    test("returns null when there is no status", () {
      expect(GameDataSyncStatus.combine([]), isNull);
      expect(GameDataSyncStatus.combine([null, null]), isNull);
    });

    test("prefers syncing over every other status", () {
      expect(GameDataSyncStatus.combine([synced, warning, error, syncing]), same(syncing));
    });

    test("prefers an error over a warning and synced", () {
      expect(GameDataSyncStatus.combine([synced, warning, error]), same(error));
    });

    test("prefers a warning over synced", () {
      expect(GameDataSyncStatus.combine([synced, warning]), same(warning));
    });

    test("ignores null entries", () {
      expect(GameDataSyncStatus.combine([null, synced, null]), same(synced));
    });
  });
}
