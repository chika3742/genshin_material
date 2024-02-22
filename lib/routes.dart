import "package:animations/animations.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "main.dart";
import "pages/account.dart";
import "pages/bookmarks.dart";
import "pages/daily.dart";
import "pages/database/characters/character_details.dart";
import "pages/database/characters/character_list.dart";
import "pages/database/database.dart";
import "pages/home.dart";
import "pages/more.dart";
import "pages/release_notes.dart";
import "pages/settings.dart";
import "pages/tools.dart";

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
          routes: [
            TypedGoRoute<CharacterListRoute>(
              path: "characters",
              routes: [
                TypedGoRoute<CharacterDetailsRoute>(path: ":id"),
              ],
            ),
          ],
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
      child: const BookmarksPage(),
    );
  }
}

@immutable
class DatabaseNavRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: const DatabasePage(),
    );
  }
}

@immutable
class CharacterListRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: const CharacterListPage(),
    );
  }
}

@immutable
class CharacterDetailsRoute extends GoRouteData {
  final String id;

  const CharacterDetailsRoute({required this.id});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: CharacterDetailsPage(id: id),
    );
  }
}

@immutable
class DailyNavRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: const DailyPage(),
    );
  }
}

@immutable
class ToolsNavRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: const ToolsPage(),
    );
  }
}

@immutable
class MoreNavRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: const MorePage(),
    );
  }
}

@immutable
class SettingsRoute extends GoRouteData {
  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: const SettingsPage(),
    );
  }
}

@immutable
class AccountRoute extends GoRouteData {
  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: const AccountPage(),
    );
  }
}

@immutable
class ReleaseNotesRoute extends GoRouteData {
  static final $parentNavigatorKey = rootNavigatorKey;

  final int tabIndex;

  const ReleaseNotesRoute({this.tabIndex = 0});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: ReleaseNotesPage(initialTabIndex: tabIndex),
    );
  }
}

Page _buildTransitionPage({
  required BuildContext context,
  required Widget child,
}) {
  return switch (Theme.of(context).platform) {
    TargetPlatform.iOS || TargetPlatform.macOS => CupertinoPage(child: child),
    _ => CustomTransitionPage(
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
      )
  };
}
