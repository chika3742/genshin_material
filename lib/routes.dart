import "package:animations/animations.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "main.dart";
import "pages/account.dart";
import "pages/home.dart";
import "pages/home/navigation_pages/bookmarks.dart";
import "pages/home/navigation_pages/daily.dart";
import "pages/home/navigation_pages/database.dart";
import "pages/home/navigation_pages/more.dart";
import "pages/home/navigation_pages/tools.dart";
import "pages/release_notes.dart";
import "pages/settings.dart";

part "routes.g.dart";

@TypedStatefulShellRoute<HomeRoute>(
  branches: [
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<BookmarksNavRoute>(path: "/bookmarks"),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<DatabaseNavRoute>(
          path: "/database",
          routes: [],
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<DailyNavRoute>(path: "/daily"),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<ToolsNavRoute>(path: "/tools"),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<MoreNavRoute>(
          path: "/more",
          routes: [
            TypedGoRoute<SettingsRoute>(path: "settings"),
            TypedGoRoute<AccountRoute>(path: "account"),
            TypedGoRoute<ReleaseNotesRoute>(path: "release-notes"),
          ],
        ),
      ],
    ),
  ],
)
@immutable
class HomeRoute extends StatefulShellRouteData {
  const HomeRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
    return HomePage(navigationShell: navigationShell);
  }
}

@immutable
class BookmarksNavRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: const BookmarksNavPage(),
    );
  }
}

@immutable
class DatabaseNavRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: const DatabaseNavPage(),
    );
  }
}

@immutable
class DailyNavRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: const DailyNavPage(),
    );
  }
}

@immutable
class ToolsNavRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: const ToolsNavPage(),
    );
  }
}

@immutable
class MoreNavRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: const MoreNavPage(),
    );
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

Page _buildTransitionPage({
  required BuildContext context,
  required Widget child,
}) {
  return CustomTransitionPage(
    child: child,
    barrierColor: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SharedAxisTransition(
        transitionType: SharedAxisTransitionType.horizontal,
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        child: child,
      );
    },
  );
}