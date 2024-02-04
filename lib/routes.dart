import "package:flutter/material.dart";
import "package:genshin_material/home_nav_routes.dart";
import "package:genshin_material/pages/home.dart";
import "package:go_router/go_router.dart";

part "routes.g.dart";

@TypedShellRoute<HomeRoute>(
  routes: [
    TypedGoRoute<BookmarksNavRoute>(path: "/bookmarks"),
    TypedGoRoute<DatabaseNavRoute>(path: "/database"),
    TypedGoRoute<DailyNavRoute>(path: "/daily"),
    TypedGoRoute<ToolsNavRoute>(path: "/tools"),
    TypedGoRoute<MoreNavRoute>(path: "/more"),
  ],
)
@immutable
class HomeRoute extends ShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return HomePage(child: navigator);
  }
}

