import "package:drift/drift.dart" as drift;
import "package:drift/native.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/composables/use_notification_reschedule_listener.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/data/services/local_notification.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/providers/database_provider.dart";
import "package:genshin_material/providers/pref_notifier.dart";
import "package:genshin_material/use_cases/reschedule_daily_material_notifications.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:uuid/v4.dart";

import "../utils/in_memory_pref_notifier.dart";
import "../utils/local_notification_mocks.dart";
@GenerateNiceMocks([MockSpec<RescheduleDailyMaterialNotifications>()])
import "use_notification_reschedule_listener_test.mocks.dart";

class _Host extends HookConsumerWidget {
  const _Host();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useNotificationRescheduleListener(ref);
    return const Scaffold(body: SizedBox());
  }
}

void main() {
  const debounce = Duration(milliseconds: 50);
  const pastDebounce = Duration(milliseconds: 60);
  const notificationTime = TimeOfDay(hour: 16, minute: 0);

  late AppDatabase db;
  late MockRescheduleDailyMaterialNotifications rescheduler;
  late MockLocalNotification notification;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    rescheduler = MockRescheduleDailyMaterialNotifications();
    notification = MockLocalNotification();
    when(notification.isNotificationGranted()).thenAnswer((_) async => true);
    LocaleSettings.setLocale(AppLocale.ja);
  });

  tearDown(() async {
    await db.close();
  });

  /// Lets the startup Future run, fires the debouncer, then drains the async
  /// body scheduled by it.
  Future<void> drain(WidgetTester tester) async {
    await tester.pump();
    await tester.pump(pastDebounce);
    await tester.pump();
  }

  Future<ProviderContainer> pumpHost(
    WidgetTester tester, {
    TimeOfDay? time = notificationTime,
  }) async {
    await tester.pumpWidget(ProviderScope(
      overrides: [
        appDatabaseProvider.overrideWithValue(db),
        localNotificationProvider.overrideWithValue(notification),
        rescheduleDailyMaterialNotificationsProvider.overrideWith((ref) => rescheduler),
        prefProvider(PrefKeys.dailyMaterialNotificationTime)
            .overrideWith(() => InMemoryPrefNotifier(time)),
        prefProvider(PrefKeys.dailyResetServer)
            .overrideWith(() => InMemoryPrefNotifier(GameServer.asia)),
      ],
      child: const MaterialApp(home: _Host()),
    ));
    await drain(tester);
    return ProviderScope.containerOf(tester.element(find.byType(_Host)));
  }

  Future<void> insertGroup(String groupHash) {
    return db.managers.bookmarkMaterialGroupTable.create((o) => o(
      characterId: "x",
      groupHash: groupHash,
      orderIndex: groupHash, // unique
      purposeType: .ascension,
    ));
  }

  Future<void> insertItem(String groupHash) {
    return db.managers.bookmarkMaterialItemTable.create((o) => o(
      groupHash: groupHash,
      materialId: const drift.Value("a"),
      hash: UuidV4().generate(),
      upperLevel: 1,
      quantity: 1,
    ));
  }

  testWidgets("Reschedules once at startup", (tester) async {
    await pumpHost(tester);

    verify(rescheduler.execute()).called(1);
  });

  testWidgets("Reschedules when the bookmark group table changes", (tester) async {
    await pumpHost(tester);
    clearInteractions(rescheduler);

    await insertGroup("g1");
    await drain(tester);

    verify(rescheduler.execute()).called(1);
  });

  testWidgets("Reschedules when the notification time changes", (tester) async {
    final container = await pumpHost(tester);
    clearInteractions(rescheduler);

    await container
        .read(prefProvider(PrefKeys.dailyMaterialNotificationTime).notifier)
        .set(const TimeOfDay(hour: 7, minute: 0));
    await drain(tester);

    verify(rescheduler.execute()).called(1);
  });

  testWidgets("Reschedules when the daily reset server changes", (tester) async {
    final container = await pumpHost(tester);
    clearInteractions(rescheduler);

    await container.read(prefProvider(PrefKeys.dailyResetServer).notifier).set(GameServer.europe);
    await drain(tester);

    verify(rescheduler.execute()).called(1);
  });

  testWidgets("Debounces rapid consecutive triggers into a single reschedule", (tester) async {
    await pumpHost(tester);
    clearInteractions(rescheduler);

    await insertGroup("g1");
    await tester.pump(const Duration(milliseconds: 10));
    await insertGroup("g2");
    await tester.pump(const Duration(milliseconds: 10));
    await insertGroup("g3");
    await drain(tester);

    verify(rescheduler.execute()).called(1);
  });

  testWidgets("Does not reschedule when only the item table changes", (tester) async {
    // The listener subscribes to bookmarkMaterialGroupTable only, so adding
    // materials to an existing group intentionally does not reschedule.
    await pumpHost(tester);
    await insertGroup("g1");
    await drain(tester);
    clearInteractions(rescheduler);

    await insertItem("g1");
    await drain(tester);

    verifyNever(rescheduler.execute());
  });

  testWidgets("Shows a snack bar when the notification permission was revoked", (tester) async {
    when(notification.isNotificationGranted()).thenAnswer((_) async => false);

    await pumpHost(tester);
    await tester.pump();

    expect(find.text(tr.errors.notificationPermissionRevoked), findsOneWidget);

    // Let the snack bar time out so no timer outlives the test.
    await tester.pumpAndSettle(const Duration(seconds: 5));
  });

  testWidgets("Does not check the permission when the notification time is unset", (tester) async {
    when(notification.isNotificationGranted()).thenAnswer((_) async => false);

    await pumpHost(tester, time: null);
    await tester.pump();

    verify(rescheduler.execute()).called(1);
    verifyNever(notification.isNotificationGranted());
    expect(find.byType(SnackBar), findsNothing);
  });

  testWidgets("Does not reschedule after the widget is disposed", (tester) async {
    await pumpHost(tester);
    clearInteractions(rescheduler);

    await insertGroup("g1");
    await tester.pump(const Duration(milliseconds: 10));
    // Disposes before the debouncer fires.
    await tester.pumpWidget(const MaterialApp(home: SizedBox()));
    await tester.pump(debounce * 2);

    verifyNever(rescheduler.execute());
  });
}
