import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";
import "package:path_provider/path_provider.dart";

import "../core/asset_updater.dart";
import "../home_nav_routes.dart";
import "../i18n/strings.g.dart";
import "../routes.dart";
import "../ui_core/install_latest_assets.dart";

class HomePage extends ConsumerStatefulWidget {
  final Widget child;

  const HomePage({super.key, required this.child});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomeNavEntry {
  final NavigationDestination destination;
  final String location;

  const _HomeNavEntry({required this.destination, required this.location});
}

class _HomePageState extends ConsumerState<HomePage> {
  /// Creates new [_HomeNavEntry] class from params.
  static _HomeNavEntry createNavEntry({
    required IconData icon,
    required String label,
    required String location,
  }) {
    return _HomeNavEntry(
      destination: NavigationDestination(
        icon: Icon(icon),
        label: label,
      ),
      location: location,
    );
  }

  final navDestinations = <_HomeNavEntry>[
    createNavEntry(
      icon: Symbols.home_filled,
      label: tr.homeNavDestinations.bookmarks,
      location: BookmarksNavRoute().location,
    ),
    createNavEntry(
      icon: Symbols.database,
      label: tr.homeNavDestinations.database,
      location: DatabaseNavRoute().location,
    ),
    createNavEntry(
      icon: Symbols.today,
      label: tr.homeNavDestinations.daily,
      location: DailyNavRoute().location,
    ),
    createNavEntry(
      icon: Symbols.home_repair_service,
      label: tr.homeNavDestinations.tools,
      location: ToolsNavRoute().location,
    ),
    createNavEntry(
      icon: Symbols.more_horiz,
      label: tr.homeNavDestinations.more,
      location: MoreNavRoute().location,
    ),
  ];

  var selectedNavIndex = 0;

  @override
  void initState() {
    super.initState();

    Future(() async {
      final updater = AssetUpdater(await getLocalAssetDirectory(), tempDir: await getTemporaryDirectory());
      await updater.checkForUpdate();

      if (updater.isUpdateAvailable && mounted) {
        await installLatestAssets(
          context: context,
          ref: ref,
          updater: updater,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(navDestinations[selectedNavIndex].destination.label)),
      bottomNavigationBar: NavigationBar(
        destinations: navDestinations.map((e) => e.destination).toList(),
        selectedIndex: selectedNavIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedNavIndex = index;
            context.go(navDestinations[index].location);
          });
        },
      ),
      body: widget.child,
    );
  }
}
