import "dart:async";

import "package:flutter/material.dart";
import "package:genshin_material/home_nav_routes.dart";
import "package:genshin_material/pages/home.dart";
import "package:go_router/go_router.dart";

part "generated/routes.g.dart";

@TypedShellRoute<HomeScreenRoute>(
  routes: [
    TypedGoRoute<BookmarksNavPageRoute>(path: "/bookmarks"),
    TypedGoRoute<DatabaseNavPageRoute>(path: "/database"),
    TypedGoRoute<DailyNavPageRoute>(path: "/daily"),
    TypedGoRoute<ToolsNavPageRoute>(path: "/tools"),
    TypedGoRoute<MoreNavPageRoute>(path: "/more"),
  ],
)
@immutable
class HomeScreenRoute extends ShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return HomePage(child: navigator);
  }
}

