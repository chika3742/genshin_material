import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:genshin_material/components/simple_list_item.dart";
import "package:genshin_material/constants/urls.dart";
import "package:genshin_material/core/versions.dart";
import "package:genshin_material/generated/strings.g.dart";
import "package:genshin_material/routes.dart";
import "package:genshin_material/ui_core/custom_tabs.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

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
        SimpleListItem(
          subtitle: buildVersionString(),
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
    const dataVersion = "4.4.0"; // placeholder

    if (packageInfoAsync.value != null) {
      final packageInfo = packageInfoAsync.value!;
      if (!showVersionDetails) {
        return "v${packageInfo.version}_D$dataVersion";
      } else {
        return "v${packageInfo.version} / Build ${packageInfo.buildNumber} / Data Version $dataVersion";
      }
    } else if (packageInfoAsync.hasError) {
      debugPrint(packageInfoAsync.error.toString());
      return "Failed to load version info.";
    }

    return "";
  }
}
