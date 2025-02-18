import "package:firebase_remote_config/firebase_remote_config.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";
import "package:url_launcher/url_launcher_string.dart";

import "../../../components/list_tile.dart";
import "../../../constants/urls.dart";
import "../../../core/handle_error.dart";
import "../../../i18n/strings.g.dart";
import "../../../providers/versions.dart";
import "../../../routes.dart";
import "../../../ui_core/custom_tabs.dart";
import "../constants/remote_config_key.dart";

class MorePage extends ConsumerStatefulWidget {
  const MorePage({super.key});

  @override
  ConsumerState<MorePage> createState() => _MoreNavPageState();
}

class _MoreNavPageState extends ConsumerState<MorePage> {
  var showVersionDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.more),
      ),
      body: ListView(
        children: [
          SimpleListTile(
            title: tr.pages.settings,
            leadingIcon: Symbols.settings,
            location: SettingsRoute().location,
          ),
          // SimpleListTile(
          //   title: tr.pages.account,
          //   subtitle: tr.morePage.accountDesc,
          //   leadingIcon: Symbols.account_box,
          //   location: AccountRoute().location,
          // ),
          if (FirebaseRemoteConfig.instance.getBool(RemoteConfigKey.hoyolabLinkEnabled))
            SimpleListTile(
              title: tr.pages.hoyolabIntegrationSettings,
              subtitle: tr.morePage.hoyolabIntegrationSettingsDesc,
              leadingIcon: Symbols.sync,
              location: HoyolabIntegrationSettingsRoute().location,
            ),
          const Divider(),
          SimpleListTile(
            title: tr.pages.releaseNotes,
            leadingIcon: Symbols.new_releases,
            location: const ReleaseNotesRoute().location,
          ),
          const Divider(),
          SimpleListTile(
            title: tr.morePage.github,
            subtitle: tr.morePage.githubDesc,
            leadingIcon: Symbols.code,
            trailingIcon: Symbols.open_in_browser,
            onTap: () {
              launchCustomTab(githubUrl);
            },
          ),
          SimpleListTile(
            title: tr.morePage.buyMeACoffee,
            subtitle: tr.morePage.buyMeACoffeeDesc,
            leadingIcon: Symbols.coffee,
            trailingIcon: Symbols.open_in_new,
            onTap: () {
              launchUrlString(koFiUrl, mode: LaunchMode.externalApplication);
            },
          ),
          SimpleListTile(
            title: tr.common.tos,
            leadingIcon: Symbols.gavel,
            trailingIcon: Symbols.open_in_browser,
            onTap: () {
              launchCustomTab(tosUrl);
            },
          ),
          SimpleListTile(
            title: tr.common.privacyPolicy,
            leadingIcon: Symbols.policy,
            trailingIcon: Symbols.open_in_browser,
            onTap: () {
              launchCustomTab(privacyPolicyUrl);
            },
          ),
          if (!kReleaseMode) SimpleListTile(
            title: "Debug Menu",
            location: DebugMenuRoute().location,
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text(
                buildVersionString(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                showVersionDetails = !showVersionDetails;
              });
            },
          ),
        ],
      ),
    );
  }

  String buildVersionString() {
    final packageInfoAsync = ref.watch(packageInfoProvider);
    final dataVersion = ref.watch(assetDataProvider);

    final dataVersionText = dataVersion.hasValue ? dataVersion.value!.version.dataVersion : "Unknown";

    if (packageInfoAsync.value != null) {
      final packageInfo = packageInfoAsync.value!;
      if (!showVersionDetails) {
        return "v${packageInfo.version}_D$dataVersionText";
      } else {
        return "v${packageInfo.version} / Build ${packageInfo.buildNumber} / Data Version $dataVersionText";
      }
    } else if (packageInfoAsync.hasError) {
      handleError(packageInfoAsync.error!, packageInfoAsync.stackTrace!);
      return "Failed to load version info.";
    }

    return "";
  }
}
