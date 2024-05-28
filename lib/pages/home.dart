import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";
import "package:path_provider/path_provider.dart";

import "../core/asset_updater.dart";
import "../core/handle_error.dart";
import "../i18n/strings.g.dart";
import "../main.dart";
import "../providers/versions.dart";
import "../ui_core/install_latest_assets.dart";
import "../ui_core/snack_bar.dart";

class HomePage extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const HomePage({super.key, required this.navigationShell});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final navDestinations = <NavigationDestination>[
    NavigationDestination(
      icon: const Icon(Symbols.home_filled),
      label: tr.pages.bookmarks,
    ),
    NavigationDestination(
      icon: const Icon(Symbols.database),
      label: tr.pages.database,
    ),
    NavigationDestination(
      icon: const Icon(Symbols.today),
      label: tr.pages.daily,
    ),
    NavigationDestination(
      icon: const Icon(Symbols.home_repair_service),
      label: tr.pages.tools,
    ),
    NavigationDestination(
      icon: const Icon(Symbols.more_horiz),
      label: tr.pages.more,
    ),
  ];

  @override
  void initState() {
    super.initState();

    Future(() async {
      // try {
      //   (await getLocalAssetDirectory()).delete(recursive: true);
      // } catch (_) {}

      final assetDir = (await getLocalAssetDirectory()).path;

      final updater = AssetUpdater(assetDir, tempDir: (await getTemporaryDirectory()).path);
      try {
        await updater.checkForUpdate();
      } catch (e, st) {
        handleError(e, st);
        showSnackBar(context: routerContext!, message: tr.updates.failed);
        return;
      }

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
    ref.watch(assetDataProvider);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: navDestinations,
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: (index) {
          widget.navigationShell.goBranch(
            index,
            initialLocation: index == widget.navigationShell.currentIndex,
          );
        },
      ),
      body: widget.navigationShell,
    );
  }
}
