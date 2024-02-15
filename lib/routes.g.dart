// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
    ];

RouteBase get $homeRoute => ShellRouteData.$route(
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/bookmarks',
          factory: $BookmarksNavRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/database',
          factory: $DatabaseNavRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/daily',
          factory: $DailyNavRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/tools',
          factory: $ToolsNavRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/more',
          factory: $MoreNavRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'settings',
              parentNavigatorKey: SettingsRoute.$parentNavigatorKey,
              factory: $SettingsRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'account',
              parentNavigatorKey: AccountRoute.$parentNavigatorKey,
              factory: $AccountRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'release-notes',
              parentNavigatorKey: ReleaseNotesRoute.$parentNavigatorKey,
              factory: $ReleaseNotesRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();
}

extension $BookmarksNavRouteExtension on BookmarksNavRoute {
  static BookmarksNavRoute _fromState(GoRouterState state) =>
      BookmarksNavRoute();

  String get location => GoRouteData.$location(
        '/bookmarks',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DatabaseNavRouteExtension on DatabaseNavRoute {
  static DatabaseNavRoute _fromState(GoRouterState state) => DatabaseNavRoute();

  String get location => GoRouteData.$location(
        '/database',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DailyNavRouteExtension on DailyNavRoute {
  static DailyNavRoute _fromState(GoRouterState state) => DailyNavRoute();

  String get location => GoRouteData.$location(
        '/daily',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ToolsNavRouteExtension on ToolsNavRoute {
  static ToolsNavRoute _fromState(GoRouterState state) => ToolsNavRoute();

  String get location => GoRouteData.$location(
        '/tools',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MoreNavRouteExtension on MoreNavRoute {
  static MoreNavRoute _fromState(GoRouterState state) => MoreNavRoute();

  String get location => GoRouteData.$location(
        '/more',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => SettingsRoute();

  String get location => GoRouteData.$location(
        '/more/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AccountRouteExtension on AccountRoute {
  static AccountRoute _fromState(GoRouterState state) => AccountRoute();

  String get location => GoRouteData.$location(
        '/more/account',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ReleaseNotesRouteExtension on ReleaseNotesRoute {
  static ReleaseNotesRoute _fromState(GoRouterState state) => ReleaseNotesRoute(
        tabIndex: _$convertMapValue(
                'tab-index', state.uri.queryParameters, int.parse) ??
            0,
      );

  String get location => GoRouteData.$location(
        '/more/release-notes',
        queryParams: {
          if (tabIndex != 0) 'tab-index': tabIndex.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}
