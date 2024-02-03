import "package:flutter/material.dart";
import "package:genshin_material/home_nav_routes.dart";
import "package:genshin_material/routes.dart";
import "package:go_router/go_router.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

class HomePage extends StatefulWidget {
  final Widget child;

  const HomePage({super.key, required this.child});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomeNavEntry {
  final NavigationDestination destination;
  final String location;

  const _HomeNavEntry({required this.destination, required this.location});
}

class _HomePageState extends State<HomePage> {
  final navDestinations = <_HomeNavEntry>[
    _HomeNavEntry(
      destination: const NavigationDestination(
        icon: Icon(Symbols.home_filled),
        label: "Bookmarks",
      ),
      location: BookmarksNavPageRoute().location,
    ),
    _HomeNavEntry(
      destination: const NavigationDestination(
        icon: Icon(Symbols.database),
        label: "Database",
      ),
      location: DatabaseNavPageRoute().location,
    ),
    _HomeNavEntry(
      destination: const NavigationDestination(
        icon: Icon(Symbols.today),
        label: "Daily",
      ),
      location: DailyNavPageRoute().location,
    ),
    _HomeNavEntry(
      destination: const NavigationDestination(
        icon: Icon(Symbols.home_repair_service),
        label: "Tools",
      ),
      location: ToolsNavPageRoute().location,
    ),
    _HomeNavEntry(
      destination: const NavigationDestination(
        icon: Icon(Symbols.more_horiz),
        label: "More",
      ),
      location: MoreNavPageRoute().location,
    ),
  ];

  var selectedNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
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
