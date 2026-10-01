import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";
import "package:url_launcher/url_launcher_string.dart";

import "../../components/list_tile.dart";
import "../../constants/urls.dart";
import "../../core/remote_config_keys.dart";
import "../../data/repositories/hoyolab_cookie_repository.dart";
import "../../i18n/strings.g.dart";
import "../../providers/login_bonus_state.dart";
import "../../providers/remote_config.dart";
import "../../routes.dart";
import "../../ui_core/error_messages.dart";

class ToolsPage extends ConsumerWidget {
  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cookie = ref.watch(hoyolabCookieRepositoryProvider);
    final loginBonus = ref.watch(loginBonusStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.tools),
      ),
      body: ListView(
        children: [
          SimpleListTile(
            leadingIcon: Symbols.diamond,
            title: tr.pages.resinCalc,
            location: ResinCalcRoute().location,
          ),
          SimpleListTile(
            leadingIcon: Symbols.history,
            title: tr.pages.wishes,
            trailingIcon: Symbols.open_in_new,
            onTap: () {
              launchUrlString(wishesPageUrl, mode: LaunchMode.externalApplication);
            },
          ),
          if (cookie case AsyncData(:final value) when value != null
              && ref.watch(remoteConfigProvider(RemoteConfigKeys.hoyolabLinkEnabled)))
            SimpleListTile(
              leading: Badge(
                isLabelVisible: loginBonus.value == false,
                child: Icon(Symbols.crown),
              ),
              trailingIcon: Symbols.chevron_right,
              // `value` is matched before loading, so that a re-check keeps
              // showing the previous state.
              title: switch (loginBonus) {
                AsyncError(:final error) => getErrorMessage(error, prefix: tr.errors.failedToFetchSignState),
                AsyncValue(value: true) => tr.tools.loginBonusClaimed,
                AsyncValue(value: false) => tr.tools.loginBonusUnclaimed,
                _ => tr.tools.loginBonusLoading,
              },
              onTap: () async {
                await LoginBonusRoute().push(context);
                ref.read(loginBonusStateProvider.notifier).refresh();
              },
            ),
        ],
      ),
    );
  }
}
