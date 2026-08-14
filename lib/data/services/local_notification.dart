import "package:flutter_local_notifications/flutter_local_notifications.dart";
import "package:flutter_timezone/flutter_timezone.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:timezone/data/latest_10y.dart" as tz;
import "package:timezone/timezone.dart" as tz;

import "../../i18n/strings.g.dart";

part "local_notification.g.dart";

class LocalNotification {
  /// Initializes timezone database and sets the current timezone from the device
  /// configuration.
  static Future<void> initializeTimezone() async {
    tz.initializeTimeZones();
    final tzInfo = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(tzInfo.identifier));
  }

  static final dailyMaterialNotificationChannel = AndroidNotificationChannel(
    "daily_material",
    tr.android.notificationChannels.dailyMaterial.name,
    description: tr.android.notificationChannels.dailyMaterial.description,
  );

  final FlutterLocalNotificationsPlugin _plugin;

  const LocalNotification(this._plugin);

  Future<void> initialize() async {
    // Initialize
    final settings = InitializationSettings(
      android: AndroidInitializationSettings("ic_stat_notification"),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      ),
    );
    await _plugin.initialize(settings: settings);

    // (Android only) create notification channels
    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    if (androidPlugin case final androidPlugin?) {
      await androidPlugin.createNotificationChannel(dailyMaterialNotificationChannel);
    }
  }

  T _platformSpecific<T>({
    required T Function(AndroidFlutterLocalNotificationsPlugin android) android,
    required T Function(IOSFlutterLocalNotificationsPlugin ios) ios,
  }) {
    final androidPlugin = _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    if (androidPlugin != null) {
      return android(androidPlugin);
    }

    final iosPlugin = _plugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>();
    if (iosPlugin != null) {
      return ios(iosPlugin);
    }

    throw UnsupportedError("Unsupported platform");
  }

  Future<bool> isNotificationGranted() async {
    return _platformSpecific(
      android: (android) async {
        return await android.areNotificationsEnabled() == true;
      },
      ios: (ios) async {
        final permissions = await ios.checkPermissions();
        return permissions != null && permissions.isEnabled;
      },
    );
  }

  /// Whether the exact alarm permission is granted on Android. Always returns
  /// `false` on iOS.
  Future<bool> shouldRequestExactAlarmPermission() async {
    return _platformSpecific(
      android: (android) async {
        return await android.canScheduleExactNotifications() == false;
      },
      ios: (ios) {
        return false;
      },
    );
  }

  Future<bool> requestPermission() async {
    return _platformSpecific(
      android: (android) async {
        if (await android.requestNotificationsPermission() != true) {
          return false;
        }
        if (await android.requestExactAlarmsPermission() != true) {
          return false;
        }
        return true;
      },
      ios: (ios) async {
        return await ios.requestPermissions(sound: true, alert: true, badge: true) ?? false;
      },
    );
  }

  /// Android only
  Future<bool> requestExactAlarmPermission() async {
    return _platformSpecific(
      android: (android) async {
        return await android.requestExactAlarmsPermission() ?? false;
      },
      ios: (ios) {
        throw UnsupportedError("Not supported on iOS");
      },
    );
  }

  Future<void> openSystemSettings() {
    return _plugin.openAppNotificationSettings();
  }

  Future<void> schedule({
    required int id,
    required String title,
    required String body,
    required tz.TZDateTime scheduledDate,
    required AndroidNotificationChannel androidChannel,
    DateTimeComponents? matchDateTimeComponents,
  }) async {
    final androidScheduleExactly = await _platformSpecific(
      android: (android) async {
        return await android.canScheduleExactNotifications() == true;
      },
      ios: (ios) async {
        return false; // unused value
      },
    );

    await _plugin.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: scheduledDate,
      androidScheduleMode: androidScheduleExactly ? .exactAllowWhileIdle : .inexact,
      androidInexactWindow: Duration(minutes: 10),
      matchDateTimeComponents: matchDateTimeComponents,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          androidChannel.id,
          androidChannel.name,
        ),
      ),
    );
  }

  Future<void> cancel(int id) async {
    await _plugin.cancel(id: id);
  }
}

@riverpod
LocalNotification localNotification(Ref ref) {
  throw StateError("Must be initialized with overrideWithValue.");
}
