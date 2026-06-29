import "dart:developer";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../components/center_text.dart";
import "../../components/list_subheader.dart";
import "../../core/hoyolab_api.dart";
import "../../core/pref_keys.dart";
import "../../core/secure_storage.dart";
import "../../i18n/strings.g.dart";
import "../../main.dart";
import "../../models/hoyolab_api.dart";
import "../../providers/hoyolab_credential.dart";
import "../../providers/miscellaneous.dart";
import "../../providers/pref_notifier.dart";
import "../../routes.dart";
import "../../ui_core/bottom_sheet.dart";
import "../../ui_core/dialog.dart";
import "../../ui_core/error_messages.dart";
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
    final cred = ref.watch(hoyolabCredentialProvider);
    final isLinked = ref.watch(isLinkedWithHoyolabProvider);
    final syncCharaState = ref.watch(prefProvider(PrefKeys.syncCharaState));
    final syncWeaponState = ref.watch(prefProvider(PrefKeys.syncWeaponState));
    final syncBagLackNums = ref.watch(prefProvider(PrefKeys.syncBagLackNums));
    final autoRemoveBookmarks = ref.watch(prefProvider(PrefKeys.autoRemoveBookmarks));
    final syncResin = ref.watch(prefProvider(PrefKeys.syncResin));

    final isSignedIn = useState(false);
    useEffect(() {
      () async {
        isSignedIn.value = await hasHoyolabCookie();
      }();
      return null;
    }, []);

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
                linkedWithHoyolab = isSignedIn.value;
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
                onOkPressed: () async {
                  if (ref.context.mounted) {
                    showLoadingModal(context);
                    try {
                      await ref.read(hoyolabCredentialProvider.notifier).clear();
                      isSignedIn.value = false;
                    } finally {
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    }
                  }
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Symbols.dns),
            title: Text(tr.hoyolab.changeServer),
            subtitle: cred.hyvServer == null || cred.hyvServerName == null
                ? Text(tr.hoyolab.noServerSelected)
                : Text(tr.hoyolab.current(server: cred.hyvServerName!)),
            trailing: const Icon(Symbols.menu_open),
            onTap: _showServerSelectBottomSheet,
          ),

          ListSubheader(tr.hoyolab.userInfo),
          if (cred.hyvServer != null && cred.hyvUserName != null && cred.hyvUid != null) ListTile(
            title: Text(cred.hyvUserName!),
            subtitle: Text("UID: ${cred.hyvUid!}"),
          ) else ListTile(
            title: Text(tr.hoyolab.plsSelectServer, style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ),

          ListSubheader(tr.hoyolab.syncSettings),
          SwitchListTile(
            title: Text(tr.hoyolab.syncCharaState),
            value: syncCharaState,
            onChanged: isLinked ? (value) {
              ref.read(prefProvider(PrefKeys.syncCharaState).notifier).set(value);
            } : null,
          ),
          SwitchListTile(
            title: Text(tr.hoyolab.syncWeaponState),
            value: syncWeaponState,
            onChanged: isLinked ? (value) {
              ref.read(prefProvider(PrefKeys.syncWeaponState).notifier).set(value);
            } : null,
          ),
          SwitchListTile(
            title: Text(tr.hoyolab.syncBagLackNums),
            value: syncBagLackNums,
            onChanged: isLinked ? (value) {
              ref.read(prefProvider(PrefKeys.syncBagLackNums).notifier).set(value);
            } : null,
          ),
          SwitchListTile(
            title: Text(tr.hoyolab.autoRemoveBookmarks),
            subtitle: Text(tr.hoyolab.autoRemoveBookmarksDesc),
            value: autoRemoveBookmarks,
            onChanged: isLinked ? (value) {
              ref.read(prefProvider(PrefKeys.autoRemoveBookmarks).notifier).set(value);
            } : null,
          ),
          SwitchListTile(
            title: Text(tr.hoyolab.syncResin),
            value: syncResin,
            onChanged: isLinked ? (value) {
              ref.read(prefProvider(PrefKeys.syncResin).notifier).set(value);
            } : null,
          ),
          ListSubheader(tr.hoyolab.accessPermission),
          // error tile
          if (isRealtimeNotesEnabled.hasError) Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: DefaultTextStyle(
              style: TextStyle(color: Theme.of(context).colorScheme.error),
              child: Text(
                getErrorMessage(isRealtimeNotesEnabled.error, prefix: tr.hoyolab.failedToLoadPermissionState),
              ),
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
      _showServerSelectBottomSheet();
    }
  }

  void _showServerSelectBottomSheet() {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => const _ServerSelectBottomSheet(),
    );
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
    useValueChanged<LookupServersResult?, void>(serversSnapshot.data, (_, _) {
      final hyvServer = ref.read(prefProvider(PrefKeys.hyvServer));
      final servers = serversSnapshot.data?.data?.list;
      if (servers != null) {
        selectedServer.value = servers.firstWhereOrNull((e) => e.region == hyvServer);
      }
    });

    // Load game roles when server is selected
    useValueChanged<HyvServer?, void>(selectedServer.value, (_, _) async {
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
        errorText.value = getErrorMessage(e, prefix: tr.hoyolab.failedToLoadGameRole);
      } catch (e, st) {
        log("Failed to load game role for server ${server.region}", error: e, stackTrace: st);
        errorText.value = tr.hoyolab.failedToLoadGameRole;
      } finally {
        loadingGameRoleServers.value = [...loadingGameRoleServers.value..remove(server)];
      }
    });

    return ScrollableBottomSheet(
      title: Text(tr.hoyolab.serverSelect, style: Theme.of(context).textTheme.titleMedium),
      actions: [
        SizedBox(
          child: IconButton.filled(
            icon: Icon(Symbols.check),
            iconSize: 32,
            onPressed: selectedServer.value != null && gameRoles.value[selectedServer.value!] != null ? () async {
              if (selectedServer.value == null || gameRoles.value[selectedServer.value!] == null) {
                return;
              }

              final server = selectedServer.value!;
              final gameRole = gameRoles.value[server]!;
              final notifier = ref.read(hoyolabCredentialProvider.notifier);
              await notifier.setServer(server, gameRole.nickname);
              await notifier.setUid(gameRole.uid);
              if (context.mounted) Navigator.of(context).pop();
            } : null,
          ),
        ),
      ],
      builder: (context) {
        return SafeArea(
          minimum: const EdgeInsets.only(bottom: 16),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 340),
            child: Column(
              spacing: 16.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    AnimatedLinearProgressIndicator(show: serversSnapshot.connectionState != ConnectionState.done),
                    if (serversSnapshot.connectionState == ConnectionState.done)
                      _buildServerList(context, selectedServer, serversSnapshot),
                  ],
                ),
                Visibility(
                  visible: selectedServer.value != null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: AnimatedSwitcher(
                      duration: Durations.medium1,
                      child: loadingGameRoleServers.value.isEmpty
                          ? _UserGameRoleWidget(gameRoles.value[selectedServer.value])
                          : const SmallCircularProgressIndicator(),
                    ) ,
                  ),
                ),
                Visibility(
                  visible: errorText.value != null,
                  child: Text(errorText.value ?? "", style: TextStyle(color: Theme.of(context).colorScheme.error)),
                ),
                SizedBox(height: 40), // size of OK button
              ],
            ),
          ),
        );
      },
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(gameRole!.nickname.toString(), style: Theme.of(context).textTheme.titleMedium),
        Text("UID: ${gameRole!.uid}  Lv.${gameRole!.level}", style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
