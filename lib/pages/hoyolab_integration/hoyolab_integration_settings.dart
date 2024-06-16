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
import "../../providers/preferences.dart";
import "../../routes.dart";
import "../../ui_core/dialog.dart";
import "../../ui_core/snack_bar.dart";
import "../../utils/show_loading_modal.dart";

class HoyolabIntegrationSettingsPage extends HookConsumerWidget {
  const HoyolabIntegrationSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(preferencesStateNotifierProvider);
    final isSignedIn = prefs.hasValue && prefs.value!.cookie.isNotEmpty;

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
              if (prefs.value == null || prefs.value!.hyvServer.isEmpty) {
                return Text(tr.hoyolab.noServerSelected);
              }
              return Text(tr.hoyolab.current(server: prefs.value!.hyvServerName));
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
          if (prefs.value!.hyvServer.isNotEmpty) ListTile(
            title: Text(prefs.value!.hyvUserName),
            subtitle: Text("UID: ${prefs.value!.hyvUid}"),
          ) else ListTile(
            title: Text(tr.hoyolab.noServerSelected),
          ),
        ],
      ),
    );
  }

  Future<void> _signInToHoyolab(String cookie, BuildContext context, WidgetRef ref) async {
    // verify whether the credential is valid
    showLoadingModal(context);
    try {
      final verificationResult = await HoyolabApi(cookie: cookie).verifyLToken();
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

    // set initial selected server
    useValueChanged<LookupServersResult?, void>(serversSnapshot.data, (_, __) {
      final prefs = ref.read(preferencesStateNotifierProvider).value;
      final servers = serversSnapshot.data?.data?.list;
      if (prefs != null && servers != null) {
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

      final api = HoyolabApi(cookie: ref.read(preferencesStateNotifierProvider).value!.cookie, region: server.region);
      try {
        final result = await api.getUserGameRoles();

        gameRoles.value[server] = result.list.firstOrNull;
      } on HoyolabApiException catch (e, st) {
        log("Failed to load game role for server ${server.region}", error: e, stackTrace: st);
        if (context.mounted) showSnackBar(context: context, message: e.getMessage(tr.hoyolab.failedToLoadGameRole), error: true);
      } catch (e, st) {
        log("Failed to load game role for server ${server.region}", error: e, stackTrace: st);
        if (context.mounted) showSnackBar(context: context, message: tr.hoyolab.failedToLoadGameRole, error: true);
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
            switch (serversSnapshot.connectionState) {
              ConnectionState.done => _buildServerList(context, selectedServer, serversSnapshot),
              _ => const CircularProgressIndicator(),
            },
            const SizedBox(), // Spacer
            if (selectedServer.value != null)
              loadingGameRoleServers.value.isEmpty
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: _UserGameRoleWidget(gameRoles.value[selectedServer.value!]),
                      ),
                    )
                  : const CircularProgressIndicator(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: const Icon(Icons.check),
                  iconSize: 28,
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
