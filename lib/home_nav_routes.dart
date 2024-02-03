import "package:flutter/material.dart";
import "package:genshin_material/pages/home/navigation_pages/bookmarks.dart";
import "package:genshin_material/pages/home/navigation_pages/daily.dart";
import "package:genshin_material/pages/home/navigation_pages/database.dart";
import "package:genshin_material/pages/home/navigation_pages/more.dart";
import "package:genshin_material/pages/home/navigation_pages/tools.dart";
import "package:go_router/go_router.dart";

@immutable
class BookmarksNavPageRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: BookmarksNavPage());
  }
}

@immutable
class DatabaseNavPageRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: DatabaseNavPage());
  }
}

@immutable
class DailyNavPageRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: DailyNavPage());
  }
}

@immutable
class ToolsNavPageRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: ToolsNavPage());
  }
}

@immutable
class MoreNavPageRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: MoreNavPage());
  }
}
