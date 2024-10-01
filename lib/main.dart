import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:go_router/go_router.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:intl/date_symbol_data_local.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:timeago/timeago.dart" as timeago;

import "core/provider_error_observer.dart";
import "core/theme.dart";
import "i18n/strings.g.dart";
import "providers/database_provider.dart";
import "providers/versions.dart";
import "routes.dart";

late final SharedPreferencesWithCache spInstance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  await initializeDateFormatting("ja_JP", null);
  timeago.setLocaleMessages("ja", timeago.JaMessages());
  timeago.setDefaultLocale(LocaleSettings.currentLocale.languageCode);
  // avoid plural resolver not configured warning
  // (Japanese doesn't have plural forms)
  LocaleSettings.setPluralResolver(
    locale: AppLocale.ja,
    cardinalResolver: (n, {few, many, one, other, two, zero}) => other!,
  );
  spInstance = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      allowList: null,
    ),
  );
  LicenseRegistry.addLicense(() async* {
    final licenses = [
      "assets/google_fonts/OFL_MPLUS2.txt",
      "assets/google_fonts/OFL_TitilliumWeb.txt",
    ];

    for (var path in licenses) {
      final license = await rootBundle.loadString(path);
      yield LicenseEntryWithLineBreaks(["google_fonts"], license);
    }
  });
  runApp(
    ProviderScope(
      observers: [ProviderErrorObserver()],
      child: const Restartable(
        child: MyApp(),
      ),
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

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(assetDataProvider);
    ref.watch(appDatabaseProvider);

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
        textTheme: GoogleFonts.mPlus2TextTheme(),
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
        textTheme: GoogleFonts.mPlus2TextTheme(ThemeData.dark().textTheme),
      ),
      routerConfig: _router,
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
    );
  }
}

class Restartable extends ConsumerStatefulWidget {
  final Widget child;

  const Restartable({super.key, required this.child});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartableState>()?.restartApp();
  }

  @override
  ConsumerState<Restartable> createState() => _RestartableState();
}

class _RestartableState extends ConsumerState<Restartable> {
  Widget currentChild = Container();

  Future<void> restartApp() async {
    await ref.read(appDatabaseProvider).close();

    setState(() {
      currentChild = const SizedBox();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        currentChild = widget.child;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    currentChild = widget.child;
  }

  @override
  Widget build(BuildContext context) {
    return currentChild;
  }
}
