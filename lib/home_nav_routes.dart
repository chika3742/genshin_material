import "package:flutter/material.dart";
import "package:genshin_material/pages/home/navigation_pages/bookmarks.dart";
import "package:genshin_material/pages/home/navigation_pages/daily.dart";
import "package:genshin_material/pages/home/navigation_pages/database.dart";
import "package:genshin_material/pages/home/navigation_pages/more.dart";
import "package:genshin_material/pages/home/navigation_pages/tools.dart";
import "package:go_router/go_router.dart";

@immutable
class BookmarksNavRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: BookmarksNavPage());
  }
}

@immutable
class DatabaseNavRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: DatabaseNavPage());
  }
}

@immutable
class DailyNavRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: DailyNavPage());
  }
}

@immutable
class ToolsNavRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: ToolsNavPage());
  }
}

@immutable
class MoreNavRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: MoreNavPage());
  }
}
