import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:genshin_material/components/progress_snack_bar.dart";
import "package:genshin_material/core/asset_updater.dart";
import "package:genshin_material/core/versions.dart";
import "package:genshin_material/home_nav_routes.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:genshin_material/routes.dart";
import "package:genshin_material/ui_core/snack_bar.dart";
import "package:go_router/go_router.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";
import "package:path_provider/path_provider.dart";

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
  final progressSnackBarKey = GlobalKey<ProgressSnackBarState>();

  @override
  void initState() {
    super.initState();

    Future(() async {
      final messenger = ScaffoldMessenger.of(context);

      final updater = AssetUpdater(await getLocalAssetDirectory(), tempDir: await getTemporaryDirectory());
      final foundUpdate = await updater.checkForUpdates();
      if (foundUpdate != null) {
        messenger.showSnackBar(
          SnackBar(
            content: ProgressSnackBar(
              key: progressSnackBarKey,
              initialText: tr.updates.downloading,
            ),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(minutes: 1),
          ),
        );

        updater.onProgress = () {
          final snackBarState = progressSnackBarKey.currentState;
          snackBarState?.setState(() {
            if (updater.state == ProgressState.downloading && updater.totalBytes != 0) {
              snackBarState.totalSize = "${(updater.totalBytes / 1024 / 1024).toStringAsFixed(2)} MB";
              snackBarState.progress = updater.receivedBytes / updater.totalBytes;
            } else if (updater.state == ProgressState.unzipping) {
              snackBarState.text = tr.updates.installing;
              snackBarState.totalSize = null;
              snackBarState.progress = null;
            }
          });
        };
        try {
          await updater.installRelease(foundUpdate);

          ref.invalidate(assetVersionDataProvider);

          messenger.hideCurrentSnackBar();
          messenger.showSnackBar(createSnackBar(
            message: tr.updates.complete,
          ),);
        } catch (e, st) {
          debugPrint(e.toString());
          debugPrintStack(stackTrace: st);

          messenger.hideCurrentSnackBar();
          messenger.showSnackBar(SnackBar(
            content: Text(tr.updates.failed),
            behavior: SnackBarBehavior.floating,
          ),);
        }
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
