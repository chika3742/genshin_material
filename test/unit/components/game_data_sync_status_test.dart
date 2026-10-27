import "package:flutter_riverpod/flutter_riverpod.dart";
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

  group("==", () {
    final exception = Exception("sync");

    test("is equal only to the same variant", () {
      expect(const GameDataSyncStatus.syncing(), isNot(const GameDataSyncStatus.synced()));
      expect(
        GameDataSyncStatus.error(error: exception),
        isNot(const GameDataSyncStatus.synced()),
      );
    });

    test("compares the error of an error status", () {
      final a = GameDataSyncStatus.error(error: exception);
      final b = GameDataSyncStatus.error(error: exception);
      expect(a, b);
      expect(a.hashCode, b.hashCode);
      expect(a, isNot(GameDataSyncStatus.error(error: Exception("other"))));
    });
  });

  group("fromAsyncValue", () {
    const syncing = GameDataSyncStatus.syncing();
    const synced = GameDataSyncStatus.synced();
    final exception = Exception("sync");

    test("returns syncing while loading for the first time", () {
      expect(GameDataSyncStatus.fromAsyncValue(const AsyncLoading()), syncing);
    });

    test("returns null when the value is null", () {
      expect(GameDataSyncStatus.fromAsyncValue(const AsyncData(null)), isNull);
    });

    test("returns synced when the value is not null", () {
      expect(GameDataSyncStatus.fromAsyncValue(const AsyncData(1)), synced);
    });

    test("returns an error carrying the thrown error", () {
      expect(
        GameDataSyncStatus.fromAsyncValue(AsyncError(exception, StackTrace.empty)),
        GameDataSyncStatus.error(error: exception),
      );
    });

    group("while refreshing", () {
      // Builds the state a provider is in while it refreshes from `previous`.
      AsyncValue<int?> refreshing(AsyncValue<int?> previous) {
        // ignore: invalid_use_of_internal_member
        return const AsyncLoading<int?>().copyWithPrevious(previous);
      }

      test("returns syncing after data", () {
        final async = refreshing(const AsyncData(1));
        // Keeps this from silently turning into the plain AsyncLoading case.
        expect(async, isA<AsyncData<int?>>().having((a) => a.isLoading, "isLoading", isTrue));

        expect(GameDataSyncStatus.fromAsyncValue(async), syncing);
      });

      test("returns syncing after null data", () {
        expect(GameDataSyncStatus.fromAsyncValue(refreshing(const AsyncData(null))), syncing);
      });

      test("returns syncing after an error", () {
        expect(
          GameDataSyncStatus.fromAsyncValue(refreshing(AsyncError(exception, StackTrace.empty))),
          syncing,
        );
      });
    });
  });
}
