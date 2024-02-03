// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeScreenRoute,
    ];

RouteBase get $homeScreenRoute => ShellRouteData.$route(
      factory: $HomeScreenRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/bookmarks',
          factory: $BookmarksNavPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/database',
          factory: $DatabaseNavPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/daily',
          factory: $DailyNavPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/tools',
          factory: $ToolsNavPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/more',
          factory: $MoreNavPageRouteExtension._fromState,
        ),
      ],
    );

extension $HomeScreenRouteExtension on HomeScreenRoute {
  static HomeScreenRoute _fromState(GoRouterState state) => HomeScreenRoute();
}

extension $BookmarksNavPageRouteExtension on BookmarksNavPageRoute {
  static BookmarksNavPageRoute _fromState(GoRouterState state) =>
      BookmarksNavPageRoute();

  String get location => GoRouteData.$location(
        '/bookmarks',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DatabaseNavPageRouteExtension on DatabaseNavPageRoute {
  static DatabaseNavPageRoute _fromState(GoRouterState state) =>
      DatabaseNavPageRoute();

  String get location => GoRouteData.$location(
        '/database',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DailyNavPageRouteExtension on DailyNavPageRoute {
  static DailyNavPageRoute _fromState(GoRouterState state) =>
      DailyNavPageRoute();

  String get location => GoRouteData.$location(
        '/daily',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ToolsNavPageRouteExtension on ToolsNavPageRoute {
  static ToolsNavPageRoute _fromState(GoRouterState state) =>
      ToolsNavPageRoute();

  String get location => GoRouteData.$location(
        '/tools',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MoreNavPageRouteExtension on MoreNavPageRoute {
  static MoreNavPageRoute _fromState(GoRouterState state) => MoreNavPageRoute();

  String get location => GoRouteData.$location(
        '/more',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
