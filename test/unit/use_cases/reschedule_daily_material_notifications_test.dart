import "dart:async";

import "package:clock/clock.dart";
import "package:collection/collection.dart";
import "package:drift/drift.dart";
import "package:drift/native.dart";
import "package:material_ui/material_ui.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/asset_cache.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/data/services/local_notification.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/providers/database_provider.dart";
import "package:genshin_material/providers/pref_notifier.dart";
import "package:genshin_material/providers/versions.dart";
import "package:genshin_material/use_cases/reschedule_daily_material_notifications.dart";
import "package:mockito/mockito.dart";
import "package:timezone/data/latest_10y.dart" as tz;
import "package:timezone/timezone.dart" as tz;
import "package:uuid/v4.dart";

import "../../utils/asset_data.dart";
import "../../utils/in_memory_pref_notifier.dart";
import "../../utils/local_notification_mocks.dart";

typedef _TestMaterialBookmarkInsertable = ({
  String groupHash,
  String? materialId,
  String characterId,
});

void main() {
  group("RescheduleDailyMaterialNotifications", () {
    late AppDatabase db;
    late MockLocalNotification mockLocalNotification;

    final assetData = buildTestAssetData(
      characters: {
        "x": buildTestCharacter(id: "x", name: LocalizedText(locales: {"ja": "旅人", "en": "Traveler"})),
        "y": buildTestCharacter(id: "y", name: LocalizedText(locales: {"ja": "アンバー", "en": "Amber"})),
      },
      materials: {
        "a": buildTestMaterial(id: "a", availableDays: [.monday, .thursday, .sunday]),
        "b": buildTestMaterial(id: "b", availableDays: [.tuesday, .friday, .sunday]),
        "c": buildTestMaterial(id: "c", availableDays: [.wednesday, .saturday, .sunday]),
        // Not a daily material: obtainable on any day.
        "n": buildTestMaterial(id: "n"),
      },
    );

    setUpAll(tz.initializeTimeZones);

    setUp(() {
      db = AppDatabase(NativeDatabase.memory());
      mockLocalNotification = MockLocalNotification();
      tz.setLocalLocation(tz.getLocation("Asia/Tokyo"));
      LocaleSettings.setLocale(AppLocale.ja);
    });

    tearDown(() async {
      await db.close();
    });

    RescheduleDailyMaterialNotifications instantiate({
      required GameServer gameServer,
      required TimeOfDay? notificationTime,
      bool noAssetData = false,
    }) {
      return RescheduleDailyMaterialNotifications(
        mockLocalNotification,
        db,
        assetData: noAssetData ? null : assetData,
        gameServer: gameServer,
        notificationTime: notificationTime,
      );
    }

    Future<void> insertBookmarks(List<_TestMaterialBookmarkInsertable> insertables) async {
      return db.transaction(() async {
        await db.managers.bookmarkMaterialGroupTable.bulkCreate((o) => insertables.map((e) => o(
          characterId: e.characterId,
          groupHash: e.groupHash,
          orderIndex: e.groupHash, // unique
          purposeType: .ascension,
        )));
        await db.managers.bookmarkMaterialItemTable
            .bulkCreate((o) => insertables.map((e) => o(
          groupHash: e.groupHash,
          materialId: Value.absentIfNull(e.materialId),
          hash: UuidV4().generate(),
          upperLevel: 1,
          quantity: 1,
        )));
      });
    }

    void expectScheduled(List<List<Object>> expected) {
      final result = verify(mockLocalNotification.schedule(
        id: captureAnyNamed("id"),
        title: anyNamed("title"),
        body: captureAnyNamed("body"),
        scheduledDate: captureAnyNamed("scheduledDate"),
        androidChannel: LocalNotification.dailyMaterialNotificationChannel,
        matchDateTimeComponents: .dayOfWeekAndTime,
      ))..called(expected.length);
      expect(result.captured.slices(3), unorderedEquals(expected));
    }

    void expectAllCanceled() {
      expect(
        verify(mockLocalNotification.cancel(captureAny)).captured,
        unorderedEquals([1, 2, 3, 4, 5, 6, 7]),
      );
    }

    void expectNothingScheduled() {
      verifyNever(mockLocalNotification.schedule(
        id: anyNamed("id"),
        title: anyNamed("title"),
        body: anyNamed("body"),
        scheduledDate: anyNamed("scheduledDate"),
        androidChannel: anyNamed("androidChannel"),
      ));
    }

    test("Nothing is scheduled if notificationTime is null", () async {
      final useCase = instantiate(
        gameServer: .asia,
        notificationTime: null,
      );

      await useCase.execute();
      expectNothingScheduled();
      expectAllCanceled();
    });

    test("Nothing is scheduled if assetData is null", () async {
      final useCase = instantiate(
        gameServer: .asia,
        notificationTime: TimeOfDay(hour: 16, minute: 0),
        noAssetData: true,
      );

      await useCase.execute();
      expectNothingScheduled();
      expectAllCanceled();
    });

    test("Nothing is scheduled if only materials without availableDays are bookmarked", () async {
      final useCase = instantiate(
        gameServer: .asia,
        notificationTime: TimeOfDay(hour: 16, minute: 0),
      );

      await insertBookmarks([
        (
          materialId: "n",
          groupHash: "nx",
          characterId: "x",
        ),
      ]);

      await useCase.execute();
      expectNothingScheduled();
      expectAllCanceled();
    });

    test("Material IDs missing from asset data are skipped", () async {
      final notificationTime = TimeOfDay(hour: 16, minute: 0);
      final useCase = instantiate(
        gameServer: .asia,
        notificationTime: notificationTime,
      );

      await insertBookmarks([
        (
          materialId: "a",
          groupHash: "ax",
          characterId: "x",
        ),
        (
          materialId: "unknown",
          groupHash: "ux",
          characterId: "x",
        ),
      ]);

      // 2026/6/29: Monday
      await withClock(Clock.fixed(tz.TZDateTime.local(2026, 6, 29)), () async {
        await useCase.execute();
      });

      tz.TZDateTime dt(int day) =>
          tz.TZDateTime.local(2026, 6, day, notificationTime.hour, notificationTime.minute);
      expectScheduled([
        [1, contains("旅人"), dt(29)],
        [4, contains("旅人"), dt(32)],
        [7, contains("旅人"), dt(35)],
      ]);
    });

    test("Throws if the bookmarked character is missing from asset data", () async {
      final useCase = instantiate(
        gameServer: .asia,
        notificationTime: TimeOfDay(hour: 16, minute: 0),
      );

      await insertBookmarks([
        (
          materialId: "a",
          groupHash: "az",
          characterId: "z", // not present in assetData.characters
        ),
      ]);

      // Locks in the current behavior of the `!` in _buildNotificationBody.
      await expectLater(useCase.execute(), throwsA(isA<TypeError>()));
    });

    test("Notifications are scheduled on Monday, Thursday, and Sunday when material A is bookmarked", () async {
      final notificationTime = TimeOfDay(hour: 16, minute: 0);
      final useCase = instantiate(
        gameServer: .asia,
        notificationTime: notificationTime,
      );

      await insertBookmarks([
        (
          materialId: "a",
          groupHash: "ax",
          characterId: "x",
        ),
      ]);

      // 2026/6/29: Monday
      await withClock(Clock.fixed(tz.TZDateTime.local(2026, 6, 29)), () async {
        await useCase.execute();
      });

      tz.TZDateTime dt(int day) =>
          tz.TZDateTime.local(2026, 6, day, notificationTime.hour, notificationTime.minute);
      expectScheduled([
        [1, contains("旅人"), dt(29)],
        [4, contains("旅人"), dt(32)],
        [7, contains("旅人"), dt(35)],
      ]);
    });

    test("All notifications are canceled before registering new ones", () async {
      final useCase = instantiate(
        gameServer: .asia,
        notificationTime: TimeOfDay(hour: 16, minute: 0),
      );

      await insertBookmarks([
        (
          materialId: "a",
          groupHash: "ax",
          characterId: "x",
        ),
      ]);

      await useCase.execute();

      expectAllCanceled();
    });

    test("All notifications are canceled if there is no bookmarks", () async {
      final useCase = instantiate(
        gameServer: .asia,
        notificationTime: TimeOfDay(hour: 16, minute: 0),
      );

      // no bookmarks present

      await useCase.execute();

      expectAllCanceled();
    });

    test("7 notifications are scheduled when material A, B, and C is bookmarked", () async {
      final notificationTime = TimeOfDay(hour: 16, minute: 0);
      final useCase = instantiate(
        gameServer: .asia,
        notificationTime: notificationTime,
      );

      await insertBookmarks([
        (
          materialId: "a",
          groupHash: "ax",
          characterId: "x",
        ),
        (
          materialId: "b",
          groupHash: "bx",
          characterId: "x",
        ),
        (
          materialId: "c",
          groupHash: "cx",
          characterId: "x",
        ),
      ]);

      // 2026/6/29: Monday
      await withClock(Clock.fixed(tz.TZDateTime.local(2026, 6, 29)), () async {
        await useCase.execute();
      });

      tz.TZDateTime dt(int day) =>
          tz.TZDateTime.local(2026, 6, day, notificationTime.hour, notificationTime.minute);
      expectScheduled([
        [1, contains("旅人"), dt(29)],
        [2, contains("旅人"), dt(30)],
        [3, contains("旅人"), dt(31)],
        [4, contains("旅人"), dt(32)],
        [5, contains("旅人"), dt(33)],
        [6, contains("旅人"), dt(34)],
        [7, contains("旅人"), dt(35)],
      ]);
    });

    group("Notification body", () {
      test("Contains every character name when multiple characters bookmark the same material", () async {
        final notificationTime = TimeOfDay(hour: 16, minute: 0);
        final useCase = instantiate(
          gameServer: .asia,
          notificationTime: notificationTime,
        );

        await insertBookmarks([
          (
            materialId: "a",
            groupHash: "ax",
            characterId: "x",
          ),
          (
            materialId: "a",
            groupHash: "ay",
            characterId: "y",
          ),
        ]);

        // 2026/6/29: Monday
        await withClock(Clock.fixed(tz.TZDateTime.local(2026, 6, 29)), () async {
          await useCase.execute();
        });

        tz.TZDateTime dt(int day) =>
            tz.TZDateTime.local(2026, 6, day, notificationTime.hour, notificationTime.minute);
        final bothNames = allOf(contains("旅人"), contains("アンバー"), contains("、"));
        expectScheduled([
          [1, bothNames, dt(29)],
          [4, bothNames, dt(32)],
          [7, bothNames, dt(35)],
        ]);
      });

      test("Does not repeat a character name bookmarking the same material in multiple groups", () async {
        final notificationTime = TimeOfDay(hour: 16, minute: 0);
        final useCase = instantiate(
          gameServer: .asia,
          notificationTime: notificationTime,
        );

        await insertBookmarks([
          (
            materialId: "a",
            groupHash: "ax1",
            characterId: "x",
          ),
          (
            materialId: "a",
            groupHash: "ax2",
            characterId: "x",
          ),
        ]);

        // 2026/6/29: Monday
        await withClock(Clock.fixed(tz.TZDateTime.local(2026, 6, 29)), () async {
          await useCase.execute();
        });

        tz.TZDateTime dt(int day) =>
            tz.TZDateTime.local(2026, 6, day, notificationTime.hour, notificationTime.minute);
        // The separator only appears between names, so its absence means the
        // name was emitted exactly once.
        final singleName = allOf(contains("旅人"), isNot(contains("、")));
        expectScheduled([
          [1, singleName, dt(29)],
          [4, singleName, dt(32)],
          [7, singleName, dt(35)],
        ]);
      });

      test("Is built with the English locale strings when the locale is English", () async {
        LocaleSettings.setLocale(AppLocale.en);

        final notificationTime = TimeOfDay(hour: 16, minute: 0);
        final useCase = instantiate(
          gameServer: .asia,
          notificationTime: notificationTime,
        );

        await insertBookmarks([
          (
            materialId: "a",
            groupHash: "ax",
            characterId: "x",
          ),
          (
            materialId: "a",
            groupHash: "ay",
            characterId: "y",
          ),
        ]);

        // 2026/6/29: Monday
        await withClock(Clock.fixed(tz.TZDateTime.local(2026, 6, 29)), () async {
          await useCase.execute();
        });

        tz.TZDateTime dt(int day) =>
            tz.TZDateTime.local(2026, 6, day, notificationTime.hour, notificationTime.minute);
        final bothNames = allOf(
          contains("Traveler"),
          contains("Amber"),
          contains(", "),
          contains("are available today"),
        );
        expectScheduled([
          [1, bothNames, dt(29)],
          [4, bothNames, dt(32)],
          [7, bothNames, dt(35)],
        ]);
      });
    });

    group("Fire time", () {
      test("Today is skipped when the notification time equals the current time", () async {
        final notificationTime = TimeOfDay(hour: 16, minute: 0);
        final useCase = instantiate(
          gameServer: .asia,
          notificationTime: notificationTime,
        );

        await insertBookmarks([
          (
            materialId: "a",
            groupHash: "ax",
            characterId: "x",
          ),
        ]);

        // 2026/6/29 16:00: Monday, exactly the notification time
        await withClock(Clock.fixed(tz.TZDateTime.local(2026, 6, 29, 16)), () async {
          await useCase.execute();
        });

        tz.TZDateTime dt(int day) =>
            tz.TZDateTime.local(2026, 6, day, notificationTime.hour, notificationTime.minute);
        expectScheduled([
          // Monday is pushed to the next week, which is only reachable through
          // the `daysPerWeek + 1` buffer iteration.
          [1, contains("旅人"), dt(36)],
          [4, contains("旅人"), dt(32)],
          [7, contains("旅人"), dt(35)],
        ]);
      });

      test("Today is used when the notification time is still ahead", () async {
        final notificationTime = TimeOfDay(hour: 17, minute: 0);
        final useCase = instantiate(
          gameServer: .asia,
          notificationTime: notificationTime,
        );

        await insertBookmarks([
          (
            materialId: "a",
            groupHash: "ax",
            characterId: "x",
          ),
        ]);

        // 2026/6/29 16:00: Monday, one hour before the notification time
        await withClock(Clock.fixed(tz.TZDateTime.local(2026, 6, 29, 16)), () async {
          await useCase.execute();
        });

        tz.TZDateTime dt(int day) =>
            tz.TZDateTime.local(2026, 6, day, notificationTime.hour, notificationTime.minute);
        expectScheduled([
          [1, contains("旅人"), dt(29)],
          [4, contains("旅人"), dt(32)],
          [7, contains("旅人"), dt(35)],
        ]);
      });

      test("Day overflow is normalized across a year boundary", () async {
        final notificationTime = TimeOfDay(hour: 16, minute: 0);
        final useCase = instantiate(
          gameServer: .asia,
          notificationTime: notificationTime,
        );

        await insertBookmarks([
          (
            materialId: "a",
            groupHash: "ax",
            characterId: "x",
          ),
        ]);

        // 2026/12/29: Tuesday
        await withClock(Clock.fixed(tz.TZDateTime.local(2026, 12, 29)), () async {
          await useCase.execute();
        });

        // Days past 12/31 roll over into 2027.
        tz.TZDateTime dt(int day) =>
            tz.TZDateTime.local(2026, 12, day, notificationTime.hour, notificationTime.minute);
        expectScheduled([
          [1, contains("旅人"), dt(35)], // 2027/1/4
          [4, contains("旅人"), dt(31)],
          [7, contains("旅人"), dt(34)], // 2027/1/3
        ]);
      });
    });

    group("Game server offset", () {
      test("On Asia game server and Asia/Tokyo timezone and Monday material is bookmarked, notified at 5:00 on Monday (local time)", () async {
        final notificationTime = TimeOfDay(hour: 5, minute: 0);
        final useCase = instantiate(
          gameServer: .asia,
          notificationTime: notificationTime,
        );

        await insertBookmarks([
          (
            materialId: "a",
            groupHash: "ax",
            characterId: "x",
          ),
        ]);

        // 2026/6/29: Monday
        await withClock(Clock.fixed(tz.TZDateTime.local(2026, 6, 29)), () async {
          await useCase.execute();
        });

        tz.TZDateTime dt(int day) =>
            tz.TZDateTime.local(2026, 6, day, notificationTime.hour, notificationTime.minute);
        expectScheduled([
          [1, contains("旅人"), dt(29)], // 6/29: Monday
          [4, contains("旅人"), dt(32)],
          [7, contains("旅人"), dt(35)],
        ]);
      });

      test("On Asia game server and Asia/Tokyo timezone and Monday material is bookmarked, Notified at 4:59 on Tuesday (local time)", () async {
        // ~4:59 -> Sunday in game server
        final notificationTime = TimeOfDay(hour: 4, minute: 59);
        final useCase = instantiate(
          gameServer: .asia,
          notificationTime: notificationTime,
        );

        await insertBookmarks([
          (
            materialId: "a",
            groupHash: "ax",
            characterId: "x",
          ),
        ]);

        // 2026/6/29: Monday (local time)
        await withClock(Clock.fixed(tz.TZDateTime.local(2026, 6, 29)), () async {
          await useCase.execute();
        });

        tz.TZDateTime dt(int day) =>
            tz.TZDateTime.local(2026, 6, day, notificationTime.hour, notificationTime.minute);
        expectScheduled([
          [1, contains("旅人"), dt(30)], // 6/30: the next day (Tuesday in local)
          [4, contains("旅人"), dt(33)],
          [7, contains("旅人"), dt(29)], // Sunday in game server at 6/29 4:59
        ]);
      });

      test("On Europe game server and Asia/Tokyo timezone and Monday material is bookmarked, Notified at 11:59 on Tuesday (local time)", () async {
        // ~11:59 -> Sunday in game server
        final notificationTime = TimeOfDay(hour: 11, minute: 59);
        final useCase = instantiate(
          gameServer: .europe,
          notificationTime: notificationTime,
        );

        await insertBookmarks([
          (
            materialId: "a",
            groupHash: "ax",
            characterId: "x",
          ),
        ]);

        // 2026/6/29: Monday (local time)
        await withClock(Clock.fixed(tz.TZDateTime.local(2026, 6, 29)), () async {
          await useCase.execute();
        });

        tz.TZDateTime dt(int day) =>
            tz.TZDateTime.local(2026, 6, day, notificationTime.hour, notificationTime.minute);
        expectScheduled([
          [1, contains("旅人"), dt(30)], // 6/30: the next day
          [4, contains("旅人"), dt(33)],
          [7, contains("旅人"), dt(29)],
        ]);
      });

      test("On America game server (UTC-5) and Asia/Tokyo timezone and Monday material is bookmarked, notified at 16:00 (local time)", () async {
        // The only server with a negative offset: 16:00 in Tokyo is still the
        // previous game day on the America server.
        final notificationTime = TimeOfDay(hour: 16, minute: 0);
        final useCase = instantiate(
          gameServer: .america,
          notificationTime: notificationTime,
        );

        await insertBookmarks([
          (
            materialId: "a",
            groupHash: "ax",
            characterId: "x",
          ),
        ]);

        // 2026/6/29: Monday (local time)
        await withClock(Clock.fixed(tz.TZDateTime.local(2026, 6, 29)), () async {
          await useCase.execute();
        });

        tz.TZDateTime dt(int day) =>
            tz.TZDateTime.local(2026, 6, day, notificationTime.hour, notificationTime.minute);
        expectScheduled([
          [1, contains("旅人"), dt(30)], // 6/30: Monday in game server
          [4, contains("旅人"), dt(33)],
          [7, contains("旅人"), dt(29)], // 6/29 16:00 local is still Sunday in game server
        ]);
      });
    });

    group("Timezone", () {
      test("On Asia game server and America/New_York timezone, the DST transition is crossed correctly", () async {
        // 2026/3/8 is the US spring-forward day (EST -5 -> EDT -4), so the
        // local 16:00 slots are 23 hours apart across it.
        final notificationTime = TimeOfDay(hour: 16, minute: 0);
        tz.setLocalLocation(tz.getLocation("America/New_York"));
        final useCase = instantiate(
          gameServer: .asia,
          notificationTime: notificationTime,
        );

        await insertBookmarks([
          (
            materialId: "a",
            groupHash: "ax",
            characterId: "x",
          ),
        ]);

        // 2026/3/6: Friday (local time), before the transition
        await withClock(Clock.fixed(tz.TZDateTime.local(2026, 3, 6)), () async {
          await useCase.execute();
        });

        tz.TZDateTime dt(int day) =>
            tz.TZDateTime.local(2026, 3, day, notificationTime.hour, notificationTime.minute);
        expectScheduled([
          [1, contains("旅人"), dt(8)], // the transition day itself
          [4, contains("旅人"), dt(11)],
          [7, contains("旅人"), dt(7)],
        ]);
      });

      test("On Europe game server and Africa/Lagos (UTC+1, No DST) timezone and Monday material is bookmarked, Notified at 4:00 on Monday (local time)", () async {
        // 4:00 -> Monday in game server
        final notificationTime = TimeOfDay(hour: 4, minute: 0);
        tz.setLocalLocation(tz.getLocation("Africa/Lagos"));
        final useCase = instantiate(
          gameServer: .europe,
          notificationTime: notificationTime,
        );

        await insertBookmarks([
          (
            materialId: "a",
            groupHash: "ax",
            characterId: "x",
          ),
        ]);

        // 2026/6/29: Monday (local time)
        await withClock(Clock.fixed(tz.TZDateTime.local(2026, 6, 29)), () async {
          await useCase.execute();
        });

        tz.TZDateTime dt(int day) =>
            tz.TZDateTime.local(2026, 6, day, notificationTime.hour, notificationTime.minute);
        expectScheduled([
          [1, contains("旅人"), dt(29)], // 6/29: Monday
          [4, contains("旅人"), dt(32)],
          [7, contains("旅人"), dt(35)],
        ]);
      });
    });

    group("Provider", () {
      ProviderContainer makeContainer(FutureOr<AssetData> Function(Ref) createAssetData) {
        return ProviderContainer.test(overrides: [
          appDatabaseProvider.overrideWithValue(db),
          localNotificationProvider.overrideWithValue(mockLocalNotification),
          assetDataProvider.overrideWith(createAssetData),
          prefProvider(PrefKeys.dailyMaterialNotificationTime)
              .overrideWith(() => InMemoryPrefNotifier(const TimeOfDay(hour: 16, minute: 0))),
          prefProvider(PrefKeys.dailyResetServer)
              .overrideWith(() => InMemoryPrefNotifier(GameServer.asia)),
        ]);
      }

      test("Cancels every notification without scheduling while the asset data is still loading", () async {
        // Never completes: the asset data stays loading for the whole test.
        final container = makeContainer((_) => Completer<AssetData>().future);

        await insertBookmarks([
          (
            materialId: "a",
            groupHash: "ax",
            characterId: "x",
          ),
        ]);

        // Reading synchronously is the point: the provider must not suspend
        // until the asset data is ready.
        await container.read(rescheduleDailyMaterialNotificationsProvider).execute();

        expectNothingScheduled();
        expectAllCanceled();
      });

      test("Schedules once the asset data is available", () async {
        final container = makeContainer((_) => assetData);

        await insertBookmarks([
          (
            materialId: "a",
            groupHash: "ax",
            characterId: "x",
          ),
        ]);

        // 2026/6/29: Monday
        await withClock(Clock.fixed(tz.TZDateTime.local(2026, 6, 29)), () async {
          await container.read(rescheduleDailyMaterialNotificationsProvider).execute();
        });

        tz.TZDateTime dt(int day) => tz.TZDateTime.local(2026, 6, day, 16, 0);
        expectScheduled([
          [1, contains("旅人"), dt(29)],
          [4, contains("旅人"), dt(32)],
          [7, contains("旅人"), dt(35)],
        ]);
      });
    });
  });
}
