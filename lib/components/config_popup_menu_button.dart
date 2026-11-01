import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:material_ui/material_ui.dart";

import "../core/pref_keys.dart";
import "../core/remote_config_keys.dart";
import "../i18n/strings.g.dart";
import "../providers/hoyolab_game_server.dart";
import "../providers/pref_notifier.dart";
import "../providers/remote_config.dart";
import "../routes.dart";

class ConfigPopupMenuButton extends ConsumerWidget {
  const ConfigPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isServerSelected = ref.watch(hoyolabGameServerProvider).uidOrNull != null;
    final isLinked = ref.watch(isLinkedWithHoyolabProvider);
    final showCraftedLackNum = ref.watch<bool>(prefProvider(PrefKeys.showCraftConvertedLackNum));
    final syncBagLackNums = ref.watch<bool>(prefProvider(PrefKeys.syncBagLackNums));
    final isHoyolabLinkEnabled = ref.watch(remoteConfigProvider(RemoteConfigKeys.hoyolabLinkEnabled));

    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          if (isHoyolabLinkEnabled) PopupMenuItem(
            onTap: () {
              HoyolabIntegrationSettingsRoute().push(context);
            },
            child: Text(tr.pages.hoyolabIntegrationSettings),
          ),
          if (isServerSelected && isLinked && syncBagLackNums) CheckedPopupMenuItem(
            checked: showCraftedLackNum,
            onTap: () {
              ref.read(prefProvider(PrefKeys.showCraftConvertedLackNum).notifier)
                  .set(!showCraftedLackNum);
            },
            child: Text(tr.popupMenu.useCraftConverted),
          ),
          PopupMenuItem(
            onTap: () {
              FarmCountSettingsRoute().push(context);
            },
            child: Text(tr.pages.farmCountSettings),
          ),
        ];
      },
    );
  }
}
