import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

import "core/provider_error_observer.dart";
import "core/theme.dart";
import "i18n/strings.g.dart";
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

BuildContext? get routerContext => _router.routerDelegate.navigatorKey.currentContext;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = "Genshin Material";

    return MaterialApp.router(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        extensions: [
          ComponentThemeExtension(
            starColor: Colors.orange,
            rarity1Color: Colors.grey.shade600,
            rarity2Color: Colors.green,
            rarity3Color: Colors.blue,
            rarity4Color: Colors.purple,
            rarity5Color: Colors.orange.shade700,
          ),
        ],
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
        extensions: [
          ComponentThemeExtension(
            starColor: Colors.yellow,
            rarity1Color: Colors.grey,
            rarity2Color: Colors.green,
            rarity3Color: Colors.blue,
            rarity4Color: Colors.purple.shade300,
            rarity5Color: Colors.orange,
          ),
        ],
      ),
      routerConfig: _router,
    );
  }
}
