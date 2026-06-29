import "package:clock/clock.dart";
import "package:collection/collection.dart";
import "package:drift/drift.dart";
import "package:drift/native.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/data/services/local_notification.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/use_cases/reschedule_daily_material_notifications.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:timezone/data/latest_10y.dart" as tz;
import "package:timezone/timezone.dart" as tz;
import "package:uuid/v4.dart";

import "../../utils/asset_data.dart";
@GenerateNiceMocks([MockSpec<LocalNotification>()])
import "reschedule_daily_material_notifications_test.mocks.dart";

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
        "x": buildTestCharacter(id: "x", name: LocalizedText(locales: {"ja": "旅人"})),
        "y": buildTestCharacter(id: "y", name: LocalizedText(locales: {"ja": "アンバー"})),
      },
      materials: {
        "a": buildTestMaterial(id: "a", availableDays: [.monday, .thursday, .sunday]),
        "b": buildTestMaterial(id: "b", availableDays: [.tuesday, .friday, .sunday]),
        "c": buildTestMaterial(id: "c", availableDays: [.wednesday, .saturday, .sunday]),
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

    test("Nothing is scheduled if notificationTime is null", () async {
      final useCase = instantiate(
        gameServer: .asia,
        notificationTime: null,
      );

      await useCase.execute();
      verifyNever(mockLocalNotification.schedule(
        id: anyNamed("id"),
        title: anyNamed("title"),
        body: anyNamed("body"),
        scheduledDate: anyNamed("scheduledDate"),
        androidChannel: anyNamed("androidChannel"),
        androidScheduleExactly: false,
      ));
      expectAllCanceled();
    });

    test("Nothing is scheduled if assetData is null", () async {
      final useCase = instantiate(
        gameServer: .asia,
        notificationTime: TimeOfDay(hour: 16, minute: 0),
        noAssetData: true,
      );

      await useCase.execute();
      verifyNever(mockLocalNotification.schedule(
        id: anyNamed("id"),
        title: anyNamed("title"),
        body: anyNamed("body"),
        scheduledDate: anyNamed("scheduledDate"),
        androidChannel: anyNamed("androidChannel"),
      ));
      expectAllCanceled();
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
      await withClock(Clock.fixed(DateTime(2026, 6, 29)), () async {
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
      await withClock(Clock.fixed(DateTime(2026, 6, 29)), () async {
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
        await withClock(Clock.fixed(DateTime(2026, 6, 29)), () async {
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
        await withClock(Clock.fixed(DateTime(2026, 6, 29)), () async {
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
        await withClock(Clock.fixed(DateTime(2026, 6, 29)), () async {
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
    });

    group("Timezone", () {
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
        await withClock(Clock.fixed(DateTime(2026, 6, 29)), () async {
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
  });
}
