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
