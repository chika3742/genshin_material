import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:genshin_material/core/provider_error_observer.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:go_router/go_router.dart";

import "routes.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  runApp(
    ProviderScope(
      observers: [ProviderErrorObserver()],
      child: const MyApp(),
    ),
  );
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  initialLocation: "/bookmarks",
  navigatorKey: rootNavigatorKey,
  routes: $appRoutes,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = "Genshin Material";

    return MaterialApp.router(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      routerConfig: _router,
    );
  }
}
