import "dart:developer";

import "package:drift/drift.dart";
import "package:firebase_crashlytics/firebase_crashlytics.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../core/pref_keys.dart";
import "../data/services/local_notification.dart";
import "../i18n/strings.g.dart";
import "../providers/database_provider.dart";
import "../providers/pref_notifier.dart";
import "../providers/versions.dart";
import "../ui_core/snack_bar.dart";
import "../use_cases/reschedule_daily_material_notifications.dart";
import "../utils/debouncer.dart";

void useNotificationRescheduleListener(WidgetRef ref) {
  final db = ref.watch(appDatabaseProvider);

  final context = useContext();
  final stream = useMemoized(
    () => db.tableUpdates(TableUpdateQuery.onTable(db.bookmarkMaterialGroupTable)),
    [db],
  );

  final debouncer = useMemoized(() => Debouncer(Duration(milliseconds: 50)));
  useEffect(() => debouncer.dispose, [debouncer]);

  Future<void> schedule() async {
    if (!ref.context.mounted) {
      log("WidgetRef not mounted", name: "useNotificationRescheduleListener");
      return;
    }
    debouncer(() async {
      try {
        // Resolved at fire time: the listeners below run before the widget
        // rebuilds, so an instance captured during build would be stale.
        await ref.read(rescheduleDailyMaterialNotificationsProvider).execute();
      } catch (e, st) {
        FirebaseCrashlytics.instance.recordError(e, st);
        if (context.mounted) {
          showSnackBar(context: context, message: tr.errors.notificationRegistrationFailed, error: true);
        }
        return;
      }

      // Warn only when the feature is enabled but the OS permission is missing.
      if (ref.read(prefProvider(PrefKeys.dailyMaterialNotificationTime)) == null) {
        return;
      }
      if (!await ref.read(localNotificationProvider).isNotificationGranted() && context.mounted) {
        showSnackBar(context: context, message: tr.errors.notificationPermissionRevoked, error: true);
      }
    });
  }

  useOnStreamChange(stream, onData: (_) {
    schedule();
  });

  ref.listen(prefProvider(PrefKeys.dailyMaterialNotificationTime), (_, _) {
    schedule();
  });

  ref.listen(prefProvider(PrefKeys.dailyResetServer), (_, _) {
    schedule();
  });

  // trigger after the AssetData becomes available, and after an asset update
  // replaces it (the notification bodies and weekdays come from it). This
  // also covers the startup reschedule, since AssetData is loaded from
  // scratch on every app launch.
  ref.listen(assetDataProvider, (prev, next) {
    if (next.value != null && !identical(prev?.value, next.value)) {
      schedule();
    }
  });
}
