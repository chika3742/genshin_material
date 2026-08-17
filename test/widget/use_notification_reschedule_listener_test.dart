import "dart:async";

import "package:drift/drift.dart" as drift;
import "package:drift/native.dart";
import "package:material_ui/material_ui.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/composables/use_notification_reschedule_listener.dart";
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
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:timezone/data/latest_10y.dart" as tz;
import "package:timezone/timezone.dart" as tz;
import "package:uuid/v4.dart";

import "../utils/asset_data.dart";
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
  // Kept unresolved by default, so tests run with the asset data still loading.
  // Reassign it before invalidating [assetDataProvider] to emit a new value.
  // Created in [pumpHost] rather than `setUp`, because a `Future` only delivers
  // its completion in the zone it was created in, and `setUp` runs outside the
  // fake async zone `tester.pump` advances.
  late Completer<AssetData> assetDataCompleter;

  // Bookmarking material "a" for character "x" must schedule notifications on
  // Monday, Thursday, and Sunday.
  final assetData = buildTestAssetData(
    characters: {
      "x": buildTestCharacter(id: "x", name: LocalizedText(locales: {"ja": "旅人"})),
    },
    materials: {
      "a": buildTestMaterial(id: "a", availableDays: [.monday, .thursday, .sunday]),
    },
  );

  setUpAll(tz.initializeTimeZones);

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    rescheduler = MockRescheduleDailyMaterialNotifications();
    notification = MockLocalNotification();
    when(notification.isNotificationGranted()).thenAnswer((_) async => true);
    tz.setLocalLocation(tz.getLocation("Asia/Tokyo"));
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
    assetDataCompleter = Completer<AssetData>();
    await tester.pumpWidget(ProviderScope(
      overrides: [
        appDatabaseProvider.overrideWithValue(db),
        localNotificationProvider.overrideWithValue(notification),
        rescheduleDailyMaterialNotificationsProvider.overrideWith((ref) => rescheduler),
        assetDataProvider.overrideWith((ref) => assetDataCompleter.future),
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
    assetDataCompleter.complete(buildTestAssetData());
    await drain(tester);

    expect(find.text(tr.errors.notificationPermissionRevoked), findsOneWidget);

    // Let the snack bar time out so no timer outlives the test.
    await tester.pumpAndSettle(const Duration(seconds: 5));
  });

  testWidgets("Does not check the permission when the notification time is unset", (tester) async {
    when(notification.isNotificationGranted()).thenAnswer((_) async => false);

    await pumpHost(tester, time: null);
    clearInteractions(rescheduler);

    assetDataCompleter.complete(buildTestAssetData());
    await drain(tester);

    verify(rescheduler.execute()).called(1);
    verifyNever(notification.isNotificationGranted());
    expect(find.byType(SnackBar), findsNothing);
  });

  testWidgets("Reschedules when the asset data becomes available", (tester) async {
    // Until then the rescheduler can only cancel, so the notifications have to
    // be registered again once the asset data arrives.
    await pumpHost(tester);
    clearInteractions(rescheduler);

    assetDataCompleter.complete(buildTestAssetData());
    await drain(tester);

    verify(rescheduler.execute()).called(1);
  });

  testWidgets("Reschedules when an asset update replaces the asset data", (tester) async {
    final container = await pumpHost(tester);
    assetDataCompleter.complete(assetData);
    await drain(tester);
    clearInteractions(rescheduler);

    // Reproduces the invalidation done after an asset update. Riverpod keeps
    // the previous value across a refresh, so this is a data -> data
    // transition, and the notification bodies and weekdays may have changed.
    assetDataCompleter = Completer<AssetData>()..complete(buildTestAssetData());
    container.invalidate(assetDataProvider);
    await drain(tester);

    verify(rescheduler.execute()).called(1);
  });

  testWidgets("Does not reschedule when the asset data is refreshed with the same value", (tester) async {
    final container = await pumpHost(tester);
    assetDataCompleter.complete(assetData);
    await drain(tester);
    clearInteractions(rescheduler);

    // Same instance, so nothing the notifications depend on has changed.
    assetDataCompleter = Completer<AssetData>()..complete(assetData);
    container.invalidate(assetDataProvider);
    await drain(tester);

    verifyNever(rescheduler.execute());
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

  group("With the real rescheduler", () {
    // The tests above mock the rescheduler, so they only prove that *a*
    // reschedule was triggered. These ones keep the real provider so they also
    // prove the reschedule ran against an up-to-date rescheduler instance: the
    // provider is rebuilt after the widget's listeners fire, so a rescheduler
    // captured at build time would still hold the stale asset data / prefs.
    Future<ProviderContainer> pumpHost(WidgetTester tester) async {
      assetDataCompleter = Completer<AssetData>();
      await tester.pumpWidget(ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(db),
          localNotificationProvider.overrideWithValue(notification),
          assetDataProvider.overrideWith((ref) => assetDataCompleter.future),
          prefProvider(PrefKeys.dailyMaterialNotificationTime)
              .overrideWith(() => InMemoryPrefNotifier(notificationTime)),
          prefProvider(PrefKeys.dailyResetServer)
              .overrideWith(() => InMemoryPrefNotifier(GameServer.asia)),
        ],
        child: const MaterialApp(home: _Host()),
      ));
      await drain(tester);
      return ProviderScope.containerOf(tester.element(find.byType(_Host)));
    }

    List<Object?> capturedScheduleArgs(Symbol name) {
      return verify(notification.schedule(
        id: name == #id ? captureAnyNamed("id") : anyNamed("id"),
        title: anyNamed("title"),
        body: anyNamed("body"),
        scheduledDate:
            name == #scheduledDate ? captureAnyNamed("scheduledDate") : anyNamed("scheduledDate"),
        androidChannel: anyNamed("androidChannel"),
        matchDateTimeComponents: anyNamed("matchDateTimeComponents"),
      )).captured;
    }

    testWidgets("Schedules the notifications once the asset data becomes available", (tester) async {
      await pumpHost(tester);
      await insertGroup("g1");
      await insertItem("g1");
      await drain(tester);
      // Nothing can be scheduled yet: the asset data is still loading.
      clearInteractions(notification);

      assetDataCompleter.complete(assetData);
      await drain(tester);

      expect(capturedScheduleArgs(#id), unorderedEquals([1, 4, 7]));
    });

    testWidgets("Schedules with the newly set notification time", (tester) async {
      final container = await pumpHost(tester);
      await insertGroup("g1");
      await insertItem("g1");
      assetDataCompleter.complete(assetData);
      await drain(tester);
      clearInteractions(notification);

      const newTime = TimeOfDay(hour: 7, minute: 30);
      await container
          .read(prefProvider(PrefKeys.dailyMaterialNotificationTime).notifier)
          .set(newTime);
      await drain(tester);

      expect(
        capturedScheduleArgs(#scheduledDate)
            .cast<tz.TZDateTime>()
            .map(TimeOfDay.fromDateTime),
        everyElement(newTime),
      );
    });
  });
}
