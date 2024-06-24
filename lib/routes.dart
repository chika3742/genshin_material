import "package:animations/animations.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "main.dart";
import "pages/account.dart";
import "pages/bookmarks.dart";
import "pages/daily.dart";
import "pages/database/artifacts/artifact_details.dart";
import "pages/database/artifacts/artifact_list.dart";
import "pages/database/characters/character_details.dart";
import "pages/database/characters/character_list.dart";
import "pages/database/database.dart";
import "pages/database/materials/material_details.dart";
import "pages/database/materials/material_list.dart";
import "pages/database/weapons/weapon_details.dart";
import "pages/database/weapons/weapon_list.dart";
import "pages/debug/debug.dart";
import "pages/debug/sp_editor.dart";
import "pages/home.dart";
import "pages/hoyolab_integration/hoyolab_integration_settings.dart";
import "pages/hoyolab_integration/hoyolab_sign_in.dart";
import "pages/more.dart";
import "pages/release_notes.dart";
import "pages/settings.dart";
import "pages/tools/resin_calc.dart";
import "pages/tools/tools.dart";

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
            TypedGoRoute<WeaponListRoute>(
              path: "weapons",
              routes: [
                TypedGoRoute<WeaponDetailsRoute>(path: ":id"),
              ],
            ),
            TypedGoRoute<MaterialListRoute>(
              path: "materials",
              routes: [
                TypedGoRoute<MaterialDetailsRoute>(path: ":id"),
              ],
            ),
            TypedGoRoute<ArtifactListRoute>(
              path: "artifacts",
              routes: [
                TypedGoRoute<ArtifactDetailsRoute>(path: ":id"),
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
        TypedGoRoute<ToolsNavRoute>(
          path: "/tools",
          routes: [
            TypedGoRoute<ResinCalcRoute>(path: "resin-calc"),
          ],
        ),
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
            TypedGoRoute<HoyolabIntegrationSettingsRoute>(path: "hoyolab-integration", routes: [
              TypedGoRoute<HoyolabSignInRoute>(path: "sign-in"),
            ],),
            TypedGoRoute<DebugMenuRoute>(path: "debug", routes: [
              TypedGoRoute<DebugSharedPreferencesEditorRoute>(path: "sp-editor"),
            ],),
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
  Page<void> pageBuilder(BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
    return _buildTransitionPage(
      context: context,
      child: HomePage(navigationShell: navigationShell),
    );
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
      child: CharacterDetailsPage(id),
    );
  }
}

@immutable
class WeaponListRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: WeaponListPage(),
    );
  }
}

@immutable
class WeaponDetailsRoute extends GoRouteData {
  final String id;

  const WeaponDetailsRoute({required this.id});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: WeaponDetailsPage(id),
    );
  }
}

@immutable
class MaterialListRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: MaterialListPage(),
    );
  }
}

@immutable
class MaterialDetailsRoute extends GoRouteData {
  final String id;

  const MaterialDetailsRoute({required this.id});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: MaterialDetailsPage(id),
    );
  }
}

@immutable
class ArtifactListRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: const ArtifactListPage(),
    );
  }
}

@immutable
class ArtifactDetailsRoute extends GoRouteData {
  final String id;

  const ArtifactDetailsRoute({required this.id});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: ArtifactDetailsPage(id: id),
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
class ResinCalcRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: const ResinCalcPage(),
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

@immutable
class HoyolabIntegrationSettingsRoute extends GoRouteData {
  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: const HoyolabIntegrationSettingsPage(),
    );
  }
}

@immutable
class HoyolabSignInRoute extends GoRouteData {
  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: const HoyolabSignInPage(),
    );
  }
}

@immutable
class DebugMenuRoute extends GoRouteData {
  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: const DebugMenuPage(),
    );
  }
}

@immutable
class DebugSharedPreferencesEditorRoute extends GoRouteData {
  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildTransitionPage(
      context: context,
      child: const SharedPreferencesEditorPage(),
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
