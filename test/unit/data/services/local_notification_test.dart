import "package:flutter_local_notifications/flutter_local_notifications.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/data/services/local_notification.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:timezone/data/latest_10y.dart" as tz;
import "package:timezone/timezone.dart" as tz;

@GenerateNiceMocks([
  MockSpec<FlutterLocalNotificationsPlugin>(),
  MockSpec<AndroidFlutterLocalNotificationsPlugin>(),
  MockSpec<IOSFlutterLocalNotificationsPlugin>(),
])
import "local_notification_test.mocks.dart";

/// mockito matches stubs by member name and arguments only, ignoring type
/// arguments, so `when(resolve<Android>())` and `when(resolve<IOS>())` would
/// overwrite each other. Resolving the type argument by hand instead lets a
/// single plugin behave like exactly one platform.
class _PlatformAwarePlugin extends MockFlutterLocalNotificationsPlugin {
  _PlatformAwarePlugin({this.android, this.ios});

  final AndroidFlutterLocalNotificationsPlugin? android;
  final IOSFlutterLocalNotificationsPlugin? ios;

  @override
  T? resolvePlatformSpecificImplementation<T extends FlutterLocalNotificationsPlatform>() {
    if (T == AndroidFlutterLocalNotificationsPlugin) {
      return android as T?;
    }
    if (T == IOSFlutterLocalNotificationsPlugin) {
      return ios as T?;
    }
    return null;
  }
}

void main() {
  group("LocalNotification", () {
    late MockAndroidFlutterLocalNotificationsPlugin android;
    late MockIOSFlutterLocalNotificationsPlugin ios;

    setUpAll(tz.initializeTimeZones);

    setUp(() {
      android = MockAndroidFlutterLocalNotificationsPlugin();
      ios = MockIOSFlutterLocalNotificationsPlugin();
      tz.setLocalLocation(tz.getLocation("Asia/Tokyo"));
      // dailyMaterialNotificationChannel reads translated strings lazily.
      LocaleSettings.setLocale(AppLocale.ja);
    });

    _PlatformAwarePlugin onAndroid() => _PlatformAwarePlugin(android: android);

    _PlatformAwarePlugin onIos() => _PlatformAwarePlugin(ios: ios);

    test("Throws UnsupportedError if neither platform implementation resolves", () async {
      final notification = LocalNotification(_PlatformAwarePlugin());

      await expectLater(
        notification.isNotificationGranted(),
        throwsA(isA<UnsupportedError>()),
      );
    });

    group("initialize", () {
      test("Creates the daily material channel on Android", () async {
        final plugin = onAndroid();

        await LocalNotification(plugin).initialize();

        verify(plugin.initialize(settings: anyNamed("settings"))).called(1);
        verify(android.createNotificationChannel(
          LocalNotification.dailyMaterialNotificationChannel,
        )).called(1);
      });

      test("Does not create a channel on iOS", () async {
        final plugin = onIos();

        await LocalNotification(plugin).initialize();

        verify(plugin.initialize(settings: anyNamed("settings"))).called(1);
        verifyZeroInteractions(ios);
      });
    });

    group("isNotificationGranted", () {
      test("Returns false if areNotificationsEnabled returns null", () async {
        when(android.areNotificationsEnabled()).thenAnswer((_) async => null);

        expect(await LocalNotification(onAndroid()).isNotificationGranted(), isFalse);
      });

      test("Returns true if the Android permission is granted", () async {
        when(android.areNotificationsEnabled()).thenAnswer((_) async => true);

        expect(await LocalNotification(onAndroid()).isNotificationGranted(), isTrue);
      });

      test("Returns false if the iOS permission state is unavailable", () async {
        when(ios.checkPermissions()).thenAnswer((_) async => null);

        expect(await LocalNotification(onIos()).isNotificationGranted(), isFalse);
      });
    });

    group("shouldRequestExactAlarmPermission", () {
      test("Returns true on Android if exact notifications cannot be scheduled", () async {
        when(android.canScheduleExactNotifications()).thenAnswer((_) async => false);

        expect(
          await LocalNotification(onAndroid()).shouldRequestExactAlarmPermission(),
          isTrue,
        );
      });

      test("Always returns false on iOS", () async {
        expect(
          await LocalNotification(onIos()).shouldRequestExactAlarmPermission(),
          isFalse,
        );
        verifyZeroInteractions(ios);
      });
    });

    group("requestPermission", () {
      test("Does not request exact alarms if the notification permission is denied", () async {
        when(android.requestNotificationsPermission()).thenAnswer((_) async => false);

        expect(await LocalNotification(onAndroid()).requestPermission(), isFalse);
        verifyNever(android.requestExactAlarmsPermission());
      });

      test("Returns false if the exact alarm permission is denied", () async {
        when(android.requestNotificationsPermission()).thenAnswer((_) async => true);
        when(android.requestExactAlarmsPermission()).thenAnswer((_) async => false);

        expect(await LocalNotification(onAndroid()).requestPermission(), isFalse);
      });

      test("Returns true if both Android permissions are granted", () async {
        when(android.requestNotificationsPermission()).thenAnswer((_) async => true);
        when(android.requestExactAlarmsPermission()).thenAnswer((_) async => true);

        expect(await LocalNotification(onAndroid()).requestPermission(), isTrue);
      });
    });

    group("requestExactAlarmPermission", () {
      test("Throws UnsupportedError on iOS", () async {
        await expectLater(
          LocalNotification(onIos()).requestExactAlarmPermission(),
          throwsA(isA<UnsupportedError>()),
        );
      });
    });

    group("schedule", () {
      Future<void> scheduleOn(FlutterLocalNotificationsPlugin plugin) {
        return LocalNotification(plugin).schedule(
          id: 1,
          title: "title",
          body: "body",
          scheduledDate: tz.TZDateTime.local(2026, 6, 29, 16),
          androidChannel: LocalNotification.dailyMaterialNotificationChannel,
          matchDateTimeComponents: .dayOfWeekAndTime,
        );
      }

      AndroidScheduleMode capturedScheduleMode(MockFlutterLocalNotificationsPlugin plugin) {
        return verify(plugin.zonedSchedule(
          id: anyNamed("id"),
          scheduledDate: anyNamed("scheduledDate"),
          notificationDetails: anyNamed("notificationDetails"),
          androidScheduleMode: captureAnyNamed("androidScheduleMode"),
          androidInexactWindow: anyNamed("androidInexactWindow"),
          title: anyNamed("title"),
          body: anyNamed("body"),
          matchDateTimeComponents: anyNamed("matchDateTimeComponents"),
        )).captured.single as AndroidScheduleMode;
      }

      test("Uses exactAllowWhileIdle if exact alarms are allowed", () async {
        when(android.canScheduleExactNotifications()).thenAnswer((_) async => true);
        final plugin = onAndroid();

        await scheduleOn(plugin);

        expect(capturedScheduleMode(plugin), AndroidScheduleMode.exactAllowWhileIdle);
      });

      test("Falls back to inexact if exact alarms are not allowed", () async {
        when(android.canScheduleExactNotifications()).thenAnswer((_) async => false);
        final plugin = onAndroid();

        await scheduleOn(plugin);

        expect(capturedScheduleMode(plugin), AndroidScheduleMode.inexact);
      });

      test("Passes through the schedule details", () async {
        when(android.canScheduleExactNotifications()).thenAnswer((_) async => true);
        final plugin = onAndroid();

        await scheduleOn(plugin);

        verify(plugin.zonedSchedule(
          id: 1,
          scheduledDate: tz.TZDateTime.local(2026, 6, 29, 16),
          notificationDetails: anyNamed("notificationDetails"),
          androidScheduleMode: anyNamed("androidScheduleMode"),
          androidInexactWindow: const Duration(minutes: 10),
          title: "title",
          body: "body",
          matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
        )).called(1);
      });

      test("Uses inexact on iOS, where the Android permission is irrelevant", () async {
        final plugin = onIos();

        await scheduleOn(plugin);

        expect(capturedScheduleMode(plugin), AndroidScheduleMode.inexact);
      });
    });

    test("cancel forwards the ID to the plugin", () async {
      final plugin = onAndroid();

      await LocalNotification(plugin).cancel(3);

      verify(plugin.cancel(id: 3)).called(1);
    });
  });
}
