import "package:flutter/material.dart";
import "package:genshin_material/home_nav_routes.dart";
import "package:genshin_material/main.dart";
import "package:genshin_material/pages/account.dart";
import "package:genshin_material/pages/home.dart";
import "package:genshin_material/pages/release_notes.dart";
import "package:genshin_material/pages/settings.dart";
import "package:go_router/go_router.dart";

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

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ReleaseNotesPage();
  }
}
