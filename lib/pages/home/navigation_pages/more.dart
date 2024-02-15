import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/simple_list_item.dart";
import "../../../constants/urls.dart";
import "../../../i18n/strings.g.dart";
import "../../../providers/versions.dart";
import "../../../routes.dart";
import "../../../ui_core/custom_tabs.dart";

class MoreNavPage extends ConsumerStatefulWidget {
  const MoreNavPage({super.key});

  @override
  ConsumerState<MoreNavPage> createState() => _MoreNavPageState();
}

class _MoreNavPageState extends ConsumerState<MoreNavPage> {
  var showVersionDetails = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SimpleListItem(
          title: tr.pages.settings,
          leadingIcon: Symbols.settings,
          location: SettingsRoute().location,
        ),
        SimpleListItem(
          title: tr.pages.account,
          subtitle: tr.morePage.accountDesc,
          leadingIcon: Symbols.account_box,
          location: AccountRoute().location,
        ),
        const Divider(),
        SimpleListItem(
          title: tr.pages.releaseNotes,
          leadingIcon: Symbols.new_releases,
          location: ReleaseNotesRoute().location,
        ),
        const Divider(),
        SimpleListItem(
          title: tr.common.tos,
          leadingIcon: Symbols.gavel,
          trailingIcon: Symbols.open_in_browser,
          onTap: () {
            launchCustomTab(tosUrl);
          },
        ),
        SimpleListItem(
          title: tr.common.privacyPolicy,
          leadingIcon: Symbols.policy,
          trailingIcon: Symbols.open_in_browser,
          onTap: () {
            launchCustomTab(privacyPolicyUrl);
          },
        ),
        InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text(
              buildVersionString(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
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
    );
  }

  String buildVersionString() {
    final packageInfoAsync = ref.watch(packageInfoProvider);
    final dataVersion = ref.watch(assetVersionDataProvider);

    final dataVersionText = dataVersion.value?.dataVersion ?? "Unknown";

    if (packageInfoAsync.value != null) {
      final packageInfo = packageInfoAsync.value!;
      if (!showVersionDetails) {
        return "v${packageInfo.version}_D$dataVersionText";
      } else {
        return "v${packageInfo.version} / Build ${packageInfo.buildNumber} / Data Version $dataVersionText";
      }
    } else if (packageInfoAsync.hasError) {
      debugPrint(packageInfoAsync.error.toString());
      return "Failed to load version info.";
    }

    return "";
  }
}
