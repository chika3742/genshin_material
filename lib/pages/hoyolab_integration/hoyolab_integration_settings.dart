import "dart:developer";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../components/center_text.dart";
import "../../components/layout.dart";
import "../../components/list_subheader.dart";
import "../../core/hoyolab_api.dart";
import "../../i18n/strings.g.dart";
import "../../models/hoyolab_api.dart";
import "../../providers/miscellaneous.dart";
import "../../providers/preferences.dart";
import "../../routes.dart";
import "../../ui_core/dialog.dart";
import "../../ui_core/progress_indicator.dart";
import "../../ui_core/snack_bar.dart";
import "../../utils/show_loading_modal.dart";

class HoyolabIntegrationSettingsPage extends HookConsumerWidget {
  const HoyolabIntegrationSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(preferencesStateNotifierProvider);
    final isSignedIn = prefs.hyvCookie != null;

    final isCharaAccessAllowed = ref.watch(charaAccessPermissionStateProvider);
    final isRealtimeNotesEnabled = ref.watch(realtimeNotesActivationStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.hoyolabIntegrationSettings),
      ),
      body: !isSignedIn ? ListView(
        children: [
          ListTile(
            leading: const Icon(Symbols.login),
            title: Text(tr.hoyolab.signIn),
            onTap: () async {
              final result =
                  await HoyolabSignInRoute().push<String>(context);
              if (result != null && context.mounted) {
                _signInToHoyolab(result, context, ref);
              }
            },
          ),
        ],
      ) : ListView(
        children: [
          ListTile(
            leading: const Icon(Symbols.logout),
            title: Text(tr.hoyolab.signOut),
            onTap: () async {
              showSimpleDialog(
                context: context,
                title: tr.common.signOut,
                content: tr.hoyolab.signOutConfirm,
                showCancel: true,
                onOkPressed: () {
                  if (ref.context.mounted) {
                    ref.read(preferencesStateNotifierProvider.notifier).clearHoyolabCredential();
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
            title: Text(tr.hoyolab.noServerSelected),
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
            title: Text(tr.hoyolab.syncResin),
            value: prefs.syncResin,
            onChanged: prefs.isLinkedWithHoyolab ? (value) {
              ref.read(preferencesStateNotifierProvider.notifier)
                  .setSyncResin(value);
            } : null,
          ),

          ListSubheader(tr.hoyolab.accessPermission),
          // error tile
          if (isCharaAccessAllowed.hasError) Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: DefaultTextStyle(
              style: TextStyle(color: Theme.of(context).colorScheme.error),
              child: () {
                final error = isCharaAccessAllowed.error;
                if (error is HoyolabApiException) {
                  return Text(error.getMessage(tr.hoyolab.failedToLoadPermissionState));
                }
                return Text(tr.hoyolab.failedToLoadPermissionState);
              }(),
            ),
          ),
          SwitchListTile(
            title: Text(tr.hoyolab.characterDataAccess),
            subtitle: Text(tr.hoyolab.charaDataAccessDesc),
            value: isCharaAccessAllowed is! AsyncError && (isCharaAccessAllowed.value ?? false),
            onChanged: !isCharaAccessAllowed.isLoading && !isCharaAccessAllowed.hasError ? (value) {
              ref.read(charaAccessPermissionStateProvider.notifier).updateValue(value);
            } : null,
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

  Future<void> _signInToHoyolab(String cookie, BuildContext context, WidgetRef ref) async {
    // verify whether the credential is valid
    showLoadingModal(context);

    final api = HoyolabApi(cookie: cookie);
    try {
      final verificationResult = await api.verifyLToken();
      if (verificationResult.hasError) {
        throw Exception("Credential verification failed: ${verificationResult.message}");
      }
    } catch (e) {
      debugPrint(e.toString());
      if (context.mounted) showSnackBar(context: context, message: tr.hoyolab.credentialVerificationFailed, error: true);
      return;
    } finally {
      // close the loading modal
      if (context.mounted) Navigator.of(context, rootNavigator: true).pop();
    }

    ref.read(preferencesStateNotifierProvider.notifier)
        .setHoyolabCookie(cookie);

    bool? isCharaAccessGranted;
    try {
      if (context.mounted) showLoadingModal(context);
      isCharaAccessGranted = await ref.read(charaAccessPermissionStateProvider.future);
    } catch (e, st) {
      log("Failed to check chara access permission", error: e, stackTrace: st);
      // do nothing
    } finally {
      // close the loading modal
      if (context.mounted) Navigator.of(context, rootNavigator: true).pop();
    }
    if (isCharaAccessGranted != null && !isCharaAccessGranted && context.mounted) {
      await showSimpleDialog(
        context: context,
        title: tr.hoyolab.doYouWantToAllowCharaDataAccess,
        content: tr.hoyolab.charaDataAccessDesc,
        showCancel: true,
        onOkPressed: () async {
          await ref
              .read(charaAccessPermissionStateProvider.notifier)
              .updateValue(true);
        },
      );
    }

    bool? isRealtimeNotesEnabled;
    try {
      if (context.mounted) showLoadingModal(context);
      isRealtimeNotesEnabled = await ref.read(realtimeNotesActivationStateProvider.future);
    } catch (e) {
      // do nothing
    } finally {
      // close the loading modal
      if (context.mounted) Navigator.of(context, rootNavigator: true).pop();
    }
    if (isRealtimeNotesEnabled != null && !isRealtimeNotesEnabled && context.mounted) {
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
    if (context.mounted) {
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

      final api = HoyolabApi(cookie: ref.read(preferencesStateNotifierProvider).hyvCookie, region: server.region);
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
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.6);
                      }
                      return Theme.of(context).colorScheme.surfaceVariant;
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
          leading: selectedServer.value == server ? const Icon(Icons.check) : const SizedBox(),
          selected: selectedServer.value == server,
          selectedTileColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
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
