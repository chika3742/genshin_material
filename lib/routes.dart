import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "home_nav_routes.dart";
import "main.dart";
import "pages/account.dart";
import "pages/home.dart";
import "pages/release_notes.dart";
import "pages/settings.dart";

part "routes.g.dart";

@TypedShellRoute<HomeRoute>(
  routes: [
    TypedGoRoute<BookmarksNavRoute>(path: "/bookmarks"),
    TypedGoRoute<DatabaseNavRoute>(path: "/database"),
    TypedGoRoute<DailyNavRoute>(path: "/daily"),
    TypedGoRoute<ToolsNavRoute>(path: "/tools"),
    TypedGoRoute<MoreNavRoute>(
      path: "/more",
      routes: [
        TypedGoRoute<SettingsRoute>(path: "settings"),
        TypedGoRoute<AccountRoute>(path: "account"),
        TypedGoRoute<ReleaseNotesRoute>(path: "release-notes"),
      ],
    ),
  ],
)
@immutable
class HomeRoute extends ShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return HomePage(child: navigator);
  }
}

@immutable
class SettingsRoute extends GoRouteData {
  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsPage();
  }
}

@immutable
class AccountRoute extends GoRouteData {
  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AccountPage();
  }
}

@immutable
class ReleaseNotesRoute extends GoRouteData {
  static final $parentNavigatorKey = rootNavigatorKey;

  final int tabIndex;

  const ReleaseNotesRoute({this.tabIndex = 0});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ReleaseNotesPage(initialTabIndex: tabIndex);
  }
}
