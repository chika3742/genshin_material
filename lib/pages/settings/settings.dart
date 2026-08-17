import "package:material_ui/material_ui.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/symbols.dart";

import "../../components/list_subheader.dart";
import "../../components/list_tile.dart";
import "../../composables/use_refreshable_future.dart";
import "../../core/pref_keys.dart";
import "../../data/services/local_notification.dart";
import "../../i18n/strings.g.dart";
import "../../models/common.dart";
import "../../providers/asset_updating_state.dart";
import "../../providers/pref_notifier.dart";
import "../../providers/versions.dart";
import "../../routes.dart";
import "../../ui_core/bottom_sheet.dart";
import "../../ui_core/snack_bar.dart";
import "../../utils/daily_material_weekday.dart";

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showItemNameOnCard = ref.watch(prefProvider(PrefKeys.showItemNameOnCard));
    final dailyResetServer = ref.watch(prefProvider(PrefKeys.dailyResetServer));
    final dailyNotificationTime = ref.watch(prefProvider(PrefKeys.dailyMaterialNotificationTime));

    final updatingState = ref.watch(assetUpdatingStateProvider);
    final assetDataAvailable = ref.watch(assetDataProvider).value != null;

    final (AsyncSnapshot(data: permissionState), refresh) = useRefreshableFuture<(bool, bool)>(() {
      final service = ref.read(localNotificationProvider);
      return (
        service.shouldRequestExactAlarmPermission(),
        service.isNotificationGranted(),
      ).wait;
    });
    useOnAppLifecycleStateChange((previous, current) {
      if (current == .resumed) {
        refresh();
      }
    });
    final shouldRequestExactAlarm = permissionState?.$1 ?? false;
    final notificationGranted = permissionState?.$2 ?? false;

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.settings),
      ),
      body: ListView(
        children: [
          ListSubheader(tr.settingsPage.display),
          CheckboxListTile(
            title: Text(tr.settingsPage.showItemNameOnCard),
            subtitle: Text(tr.settingsPage.showItemNameOnCardDesc),
            value: showItemNameOnCard,
            onChanged: (value) {
              ref.read(prefProvider(PrefKeys.showItemNameOnCard).notifier).set(value!);
            },
          ),
          SimpleListTile(
            title: tr.settingsPage.dailyResetServer,
            subtitle: dailyResetServer.description,
            trailingIcon: Symbols.menu_open,
            onTap: () {
              showSelectBottomSheet(
                context: context,
                title: Text(tr.settingsPage.dailyResetServer),
                subtitle: Text(tr.settingsPage.dailyResetServerDesc),
                selectedValue: dailyResetServer,
                items: [
                  for (final server in GameServer.values)
                    SelectBottomSheetItem(
                      text: server.description,
                      value: server,
                    ),
                ],
              ).then((value) {
                if (value != null) {
                  ref.read(prefProvider(PrefKeys.dailyResetServer).notifier).set(value);
                }
              });
            },
          ),
          SimpleListTile(
            leadingIcon: Symbols.agriculture,
            title: tr.pages.farmCountSettings,
            subtitle: tr.settingsPage.farmCountSettingsDesc,
            location: FarmCountSettingsRoute().location,
          ),

          ListSubheader(tr.settingsPage.notification),
          SimpleListTile(
            title: tr.settingsPage.dailyMaterialNotification,
            subtitle: dailyNotificationTime == null
                ? tr.settingsPage.tapToSet
                : notificationGranted
                  ? dailyNotificationTime.format(context)
                  : tr.settingsPage.grantNotification,
            trailingIcon: Symbols.menu_open,
            enabled: assetDataAvailable,
            onTap: () async {
              if (!await _requestNotificationPermissionIfNotGranted(ref, context)) {
                return;
              }

              if (!context.mounted) {
                return;
              }
              final result = await showTimePicker(
                context: context,
                initialTime: dailyNotificationTime ?? TimeOfDay.now(),
                helpText: tr.settingsPage.dailyMaterialNotification,
                confirmText: tr.common.ok,
                cancelText: tr.common.cancel,
              );
              if (result == null) {
                return;
              }

              ref.read(prefProvider(PrefKeys.dailyMaterialNotificationTime).notifier)
                  .set(result);
            },
            trailing: dailyNotificationTime != null ? IconButton(
              icon: Icon(Symbols.clear),
              onPressed: () {
                ref.read(prefProvider(PrefKeys.dailyMaterialNotificationTime).notifier)
                    .set(null);
              },
            ) : null,
          ),
          SimpleListTile(
            leadingIcon: Symbols.info,
            subtitle: tr.settingsPage.dailyMaterialNotificationDesc(time: getDailyMaterialUpdateTimeInLocalTime(dailyResetServer).format(context)),
          ),
          if (shouldRequestExactAlarm)
            ...[
              SwitchListTile(
                title: Text(tr.settingsPage.notifyOnExactTime),
                subtitle: Text(tr.settingsPage.notifyOnExactTimeSubtitle),
                value: false,
                onChanged: (_) async {
                  await ref.read(localNotificationProvider)
                      .requestExactAlarmPermission();
                  refresh();
                },
              ),
              SimpleListTile(
                leadingIcon: Symbols.info,
                subtitle: tr.settingsPage.notifyOnExactTimeExplanation,
              ),
            ],

          ListSubheader(tr.settingsPage.assetData),
          SimpleListTile(
            title: tr.settingsPage.checkAssetUpdate,
            subtitle: tr.settingsPage.checkAssetUpdateDesc,
            trailingIcon: Symbols.update,
            enabled: !updatingState.state.isBusy,
            onTap: () {
              ref.read(assetUpdatingStateProvider.notifier).checkForUpdate(silent: false);
            },
          ),
          SimpleListTile(
            title: tr.settingsPage.reDownloadAssets,
            subtitle: tr.settingsPage.reDownloadAssetsDesc,
            trailingIcon: Symbols.download,
            enabled: !updatingState.state.isBusy,
            onTap: () {
              ref.read(assetUpdatingStateProvider.notifier).checkForUpdate(silent: false, force: true);
            },
          ),
        ],
      ),
    );
  }

  Future<bool> _requestNotificationPermissionIfNotGranted(WidgetRef ref, BuildContext context) async {
    final notification = ref.read(localNotificationProvider);
    if (await notification.isNotificationGranted()) {
      return true;
    }

    final requestPermissionResult = await notification.requestPermission();
    if (requestPermissionResult) {
      return true;
    }
    if (context.mounted) {
      showSnackBar(
        context: context,
        message: tr.settingsPage.needToAllowNotificationPermission,
        action: SnackBarAction(
          label: tr.settingsPage.openSettings,
          onPressed: notification.openSystemSettings,
        ),
      );
    }

    return false;
  }
}
