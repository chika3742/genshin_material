import "dart:developer";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../components/center_text.dart";
import "../../components/list_subheader.dart";
import "../../core/hoyolab_api.dart";
import "../../core/secure_storage.dart";
import "../../i18n/strings.g.dart";
import "../../models/hoyolab_api.dart";
import "../../providers/miscellaneous.dart";
import "../../providers/preferences.dart";
import "../../routes.dart";
import "../../ui_core/dialog.dart";
import "../../ui_core/error_messages.dart";
import "../../ui_core/layout.dart";
import "../../ui_core/progress_indicator.dart";
import "../../ui_core/snack_bar.dart";
import "../../utils/show_loading_modal.dart";

class HoyolabIntegrationSettingsPage extends StatefulHookConsumerWidget {
  const HoyolabIntegrationSettingsPage({super.key});

  @override
  ConsumerState<HoyolabIntegrationSettingsPage> createState() => _HoyolabIntegrationSettingsPageState();
}

class _HoyolabIntegrationSettingsPageState extends ConsumerState<HoyolabIntegrationSettingsPage> {
  @override
  Widget build(BuildContext context) {
    final prefs = ref.watch(preferencesStateNotifierProvider);

    final isSignedIn = useState(false);
    useEffect(() {
      () async {
        isSignedIn.value = await hasHoyolabCookie();
      }();
      return null;
    }, [],);

    final isRealtimeNotesEnabled = ref.watch(realtimeNotesActivationStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.hoyolabIntegrationSettings),
      ),
      body: !isSignedIn.value ? ListView(
        children: [
          ListTile(
            leading: const Icon(Symbols.login),
            title: Text(tr.hoyolab.signIn),
            trailing: const Icon(Symbols.chevron_right),
            onTap: () async {
              final result =
                  await HoyolabSignInRoute().push<String>(context);
              if (result != null && context.mounted) {
                await _signInToHoyolab(result);
                isSignedIn.value = await hasHoyolabCookie();
              }
            },
          ),
          ListTile(
            title: Text(tr.hoyolab.aboutHeading),
            subtitle: Text(tr.hoyolab.about),
          ),
        ],
      ) : ListView(
        children: [
          ListTile(
            leading: const Icon(Symbols.logout),
            title: Text(tr.hoyolab.signOut),
            trailing: const Icon(Symbols.chevron_forward),
            onTap: () async {
              showSimpleDialog(
                context: context,
                title: tr.common.signOut,
                content: tr.hoyolab.signOutConfirm,
                showCancel: true,
                onOkPressed: () {
                  if (ref.context.mounted) {
                    ref.read(preferencesStateNotifierProvider.notifier).clearHoyolabCredential();
                    isSignedIn.value = false;
                  }
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Symbols.dns),
            title: Text(tr.hoyolab.changeServer),
            subtitle: () {
              if (prefs.hyvServer == null || prefs.hyvServerName == null) {
                return Text(tr.hoyolab.noServerSelected);
              }
              return Text(tr.hoyolab.current(server: prefs.hyvServerName!));
            }(),
            trailing: const Icon(Symbols.menu_open),
            onTap: () {
              showModalBottomSheet(
                context: context,
                useRootNavigator: true,
                showDragHandle: true,
                builder: (context) => const _ServerSelectBottomSheet(),
              );
            },
          ),

          ListSubheader(tr.hoyolab.userInfo),
          if (prefs.hyvServer != null && prefs.hyvUserName != null && prefs.hyvUid != null) ListTile(
            title: Text(prefs.hyvUserName!),
            subtitle: Text("UID: ${prefs.hyvUid!}"),
          ) else ListTile(
            title: Text(tr.hoyolab.plsSelectServer, style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ),

          ListSubheader(tr.hoyolab.syncSettings),
          SwitchListTile(
            title: Text(tr.hoyolab.syncCharaState),
            value: prefs.syncCharaState,
            onChanged: prefs.isLinkedWithHoyolab ? (value) {
              ref.read(preferencesStateNotifierProvider.notifier)
                  .setSyncCharaState(value);
            } : null,
          ),
          SwitchListTile(
            title: Text(tr.hoyolab.syncWeaponState),
            value: prefs.syncWeaponState,
            onChanged: prefs.isLinkedWithHoyolab ? (value) {
              ref.read(preferencesStateNotifierProvider.notifier)
                  .setSyncWeaponState(value);
            } : null,
          ),
          // SwitchListTile(
          //   title: Text(tr.hoyolab.syncBagCounts),
          //   value: prefs.syncBagCounts,
          //   onChanged: prefs.isLinkedWithHoyolab ? (value) {
          //     ref.read(preferencesStateNotifierProvider.notifier)
          //         .setSyncBagCounts(value);
          //   } : null,
          // ),
          SwitchListTile(
            title: Text(tr.hoyolab.autoRemoveBookmarks),
            subtitle: Text(tr.hoyolab.autoRemoveBookmarksDesc),
            value: prefs.autoRemoveBookmarks,
            onChanged: prefs.isLinkedWithHoyolab ? (value) {
              ref.read(preferencesStateNotifierProvider.notifier)
                  .setAutoRemoveBookmarks(value);
            } : null,
          ),
          SwitchListTile(
            title: Text(tr.hoyolab.syncResin),
            value: prefs.syncResin,
            onChanged: prefs.isLinkedWithHoyolab ? (value) {
              ref.read(preferencesStateNotifierProvider.notifier)
                  .setSyncResin(value);
            } : null,
          ),

          // ListSubheader(tr.hoyolab.displaySettings),
          // SimpleListTile(
          //   title: tr.hoyolab.lackNumDisplayMethod,
          //   subtitle: tr.hoyolab.lackNumDisplayMethodValues[prefs.lackNumDisplayMethod.name],
          //   trailingIcon: Symbols.menu_open,
          //   onTap: () {
          //     showSelectBottomSheet(
          //       context: context,
          //       title: Text(tr.hoyolab.lackNumDisplayMethod),
          //       subtitle: Text(tr.hoyolab.lackNumDisplayMethodDesc),
          //       selectedValue: prefs.lackNumDisplayMethod,
          //       items: [
          //         for (final method in LackNumDisplayMethod.values)
          //           SelectBottomSheetItem(
          //             text: tr.hoyolab.lackNumDisplayMethodValues[method.name]!,
          //             value: method,
          //           ),
          //       ],
          //     ).then((value) {
          //       if (value != null) {
          //         ref.read(preferencesStateNotifierProvider.notifier).setLackNumDisplayMethod(value);
          //       }
          //     });
          //   },
          // ),

          ListSubheader(tr.hoyolab.accessPermission),
          // error tile
          if (isRealtimeNotesEnabled.hasError) Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: DefaultTextStyle(
              style: TextStyle(color: Theme.of(context).colorScheme.error),
              child: () {
                final error = isRealtimeNotesEnabled.error;
                if (error is HoyolabApiException) {
                  return Text(error.getMessage(tr.hoyolab.failedToLoadPermissionState));
                }
                return Text(tr.hoyolab.failedToLoadPermissionState);
              }(),
            ),
          ),
          SwitchListTile(
            title: Text(tr.hoyolab.enableRealtimeNotes),
            subtitle: Text(tr.hoyolab.enableRealtimeNotesDesc),
            value: isRealtimeNotesEnabled is! AsyncError && (isRealtimeNotesEnabled.value ?? false),
            onChanged: !isRealtimeNotesEnabled.isLoading && !isRealtimeNotesEnabled.hasError ? (value) {
              ref.read(realtimeNotesActivationStateProvider.notifier).updateValue(value);
            } : null,
          ),
        ],
      ),
    );
  }

  Future<void> _signInToHoyolab(String cookie) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (!mounted) return;

    // verify whether the credential is valid
    showLoadingModal(context);

    try {
      await setHoyolabCookie(cookie);
    } catch (e, st) {
      log("Failed to set hoyolab cookie", error: e, stackTrace: st);
      if (mounted) {
        Navigator.of(context, rootNavigator: true).pop();
        showSnackBar(context: context, message: getErrorMessage(e, prefix: tr.hoyolab.failedToSignIn), error: true);
      }
      return;
    }

    bool? isRealtimeNotesEnabled;
    try {
      isRealtimeNotesEnabled = await ref.refresh(realtimeNotesActivationStateProvider.future);
    } catch (e) {
      // do nothing
    }

    // close the loading modal
    if (mounted) Navigator.of(context, rootNavigator: true).pop();

    if (isRealtimeNotesEnabled != null && !isRealtimeNotesEnabled && mounted) {
      await showSimpleDialog(
        context: context,
        title: tr.hoyolab.doYouWantToEnableRealtimeNotes,
        content: tr.hoyolab.enableRealtimeNotesDesc,
        showCancel: true,
        onOkPressed: () async {
          await ref
              .read(realtimeNotesActivationStateProvider.notifier)
              .updateValue(true);
        },
      );
    }

    // show server select dialog
    if (mounted) {
      showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        showDragHandle: true,
        builder: (context) => const _ServerSelectBottomSheet(),
      );
    }
  }
}

class _ServerSelectBottomSheet extends HookConsumerWidget {
  const _ServerSelectBottomSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serversSnapshot = useFuture(useMemoized(() => HoyolabApi().lookupServers()));

    final selectedServer = useState<HyvServer?>(null);
    final gameRoles = useState<Map<HyvServer, HyvUserGameRole?>>({});
    final loadingGameRoleServers = useState<List<HyvServer>>([]);
    final errorText = useState<String?>(null);

    // set initial selected server
    useValueChanged<LookupServersResult?, void>(serversSnapshot.data, (_, __) {
      final prefs = ref.read(preferencesStateNotifierProvider);
      final servers = serversSnapshot.data?.data?.list;
      if (servers != null) {
        selectedServer.value = servers.firstWhereOrNull((e) => e.region == prefs.hyvServer);
      }
    });

    // Load game roles when server is selected
    useValueChanged<HyvServer?, void>(selectedServer.value, (_, __) async {
      if (selectedServer.value != null && gameRoles.value.containsKey(selectedServer.value)) {
        return; // Already loaded
      }

      final server = selectedServer.value!;

      loadingGameRoleServers.value = [...loadingGameRoleServers.value..add(server)];

      final api = HoyolabApi(cookie: await getHoyolabCookie(), region: server.region);
      try {
        errorText.value = null;

        final result = await api.getUserGameRoles();

        gameRoles.value[server] = result.list.firstOrNull;
      } on HoyolabApiException catch (e, st) {
        log("Failed to load game role for server ${server.region}", error: e, stackTrace: st);
        errorText.value = e.getMessage(tr.hoyolab.failedToLoadGameRole);
      } catch (e, st) {
        log("Failed to load game role for server ${server.region}", error: e, stackTrace: st);
        errorText.value = tr.hoyolab.failedToLoadGameRole;
      } finally {
        loadingGameRoleServers.value = [...loadingGameRoleServers.value..remove(server)];
      }
    });

    return SizedBox.expand(
      child: SafeArea(
        minimum: const EdgeInsets.only(bottom: 16),
        child: GappedColumn(
          children: [
            Text(tr.hoyolab.serverSelect, style: Theme.of(context).textTheme.titleMedium),
            Stack(
              children: [
                AnimatedLinearProgressIndicator(show: serversSnapshot.connectionState != ConnectionState.done),
                if (serversSnapshot.connectionState == ConnectionState.done)
                  _buildServerList(context, selectedServer, serversSnapshot),
              ],
            ),
            const SizedBox(), // Spacer
            if (selectedServer.value != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: () {
                    if (loadingGameRoleServers.value.isEmpty) {
                      return errorText.value == null
                          ? _UserGameRoleWidget(gameRoles.value[selectedServer.value!])
                          : Text(errorText.value!, style: TextStyle(color: Theme.of(context).colorScheme.error));
                    } else {
                      return const SmallCircularProgressIndicator();
                    }
                  }(),
                ),
              ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.disabled)) {
                        return Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.6);
                      }
                      return Theme.of(context).colorScheme.surfaceContainerHighest;
                    }),
                  ),
                  onPressed: selectedServer.value != null && gameRoles.value[selectedServer.value!] != null ? () {
                    if (selectedServer.value == null || gameRoles.value[selectedServer.value!] == null) {
                      return;
                    }

                    final server = selectedServer.value!;
                    final gameRole = gameRoles.value[server]!;
                    ref.read(preferencesStateNotifierProvider.notifier)
                        ..setHoyolabServer(server, gameRole.nickname)
                        ..setUid(gameRole.uid);
                    Navigator.of(context).pop();
                  } : null,
                  child: Text(tr.common.ok),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServerList(BuildContext context, ValueNotifier<HyvServer?> selectedServer, AsyncSnapshot<LookupServersResult> snapshot) {
    if (snapshot.hasError) {
      return CenterText(tr.hoyolab.failedToLoadServerList);
    }
    if (!snapshot.hasData || snapshot.data!.hasError) {
      return CenterText(tr.hoyolab.failedToLoadServerList);
    }

    final servers = snapshot.data!.data!.list;

    return Column(
      children: servers.map((server) {
        return ListTile(
          title: Text(server.name),
          leading: selectedServer.value == server ? const Icon(Symbols.check) : const SizedBox(),
          selected: selectedServer.value == server,
          selectedTileColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          onTap: () async {
            selectedServer.value = server;
          },
        );
      }).toList(),
    );
  }
}

class _UserGameRoleWidget extends StatelessWidget {
  final HyvUserGameRole? gameRole;

  const _UserGameRoleWidget(this.gameRole);

  @override
  Widget build(BuildContext context) {
    if (gameRole == null) {
      return Text(tr.hoyolab.noGameRoleFound, style: TextStyle(color: Theme.of(context).colorScheme.error));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(gameRole!.nickname.toString(), style: Theme.of(context).textTheme.titleMedium),
        Text("UID: ${gameRole!.uid}  Lv.${gameRole!.level}", style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
