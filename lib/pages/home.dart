import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../composables/use_asset_update_progress.dart";
import "../i18n/strings.g.dart";
import "../providers/asset_updating_state.dart";

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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(assetUpdatingStateNotifierProvider.notifier).checkForUpdate();
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: HookConsumer(
        builder: (context, ref, child) {
          useAssetUpdateProgress(ref);

          return child!;
        },
        child: widget.navigationShell,
      ),
    );
  }
}
