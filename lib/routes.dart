import "package:drift_db_viewer/drift_db_viewer.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "components/data_asset_scope.dart";
import "i18n/strings.g.dart";
import "main.dart";
import "models/common.dart";
import "pages/account.dart";
import "pages/bookmarks.dart";
import "pages/daily.dart";
import "pages/database/artifacts/artifact_details.dart";
import "pages/database/artifacts/artifact_effect_list.dart";
import "pages/database/artifacts/artifact_list.dart";
import "pages/database/characters/character_details.dart";
import "pages/database/characters/character_list.dart";
import "pages/database/database.dart";
import "pages/database/furnishing_sets/furnishing_set_details.dart";
import "pages/database/furnishing_sets/furnishing_set_list.dart";
import "pages/database/furnishing_sets/furnishings/furnishing_details.dart";
import "pages/database/furnishing_sets/furnishings/furnishing_list.dart";
import "pages/database/materials/material_details.dart";
import "pages/database/materials/material_list.dart";
import "pages/database/weapons/weapon_details.dart";
import "pages/database/weapons/weapon_list.dart";
import "pages/debug/component_gallery.dart";
import "pages/debug/debug.dart";
import "pages/debug/sp_editor.dart";
import "pages/home.dart";
import "pages/hoyolab_integration/hoyolab_integration_settings.dart";
import "pages/hoyolab_integration/hoyolab_sign_in.dart";
import "pages/more.dart";
import "pages/release_notes.dart";
import "pages/settings/farm_count_settings.dart";
import "pages/settings/settings.dart";
import "pages/tools/farming_efficiency.dart";
import "pages/tools/resin_calc.dart";
import "pages/tools/tools.dart";
import "providers/database_provider.dart";
import "providers/versions.dart";
import "ui_core/page_transition.dart";

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
                TypedGoRoute<ArtifactEffectListRoute>(path: "effects"),
                TypedGoRoute<ArtifactDetailsRoute>(path: ":id"),
              ],
            ),
            TypedGoRoute<FurnishingSetListRoute>(
              path: "furnishing-sets",
              routes: [
                TypedGoRoute<FurnishingListRoute>(path: "furnishings", routes: [
                  TypedGoRoute<FurnishingDetailsRoute>(path: ":id"),
                ]),
                TypedGoRoute<FurnishingSetDetailsRoute>(path: ":id"),
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
            TypedGoRoute<FarmingEfficiencyRoute>(path: "farming-efficiency"),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<MoreNavRoute>(
          path: "/more",
          routes: [
            TypedGoRoute<SettingsRoute>(path: "settings", routes: [
              TypedGoRoute<FarmCountSettingsRoute>(path: "farm-count"),
            ]),
            TypedGoRoute<AccountRoute>(path: "account"),
            TypedGoRoute<ReleaseNotesRoute>(path: "release-notes"),
            TypedGoRoute<HoyolabIntegrationSettingsRoute>(path: "hoyolab-integration", routes: [
              TypedGoRoute<HoyolabSignInRoute>(path: "sign-in"),
            ]),
            TypedGoRoute<LicensesRoute>(path: "licenses"),
            TypedGoRoute<DebugMenuRoute>(path: "debug", routes: [
              TypedGoRoute<DebugSharedPreferencesEditorRoute>(path: "sp-editor"),
              TypedGoRoute<DebugDriftDbViewerRoute>(path: "drift-db-viewer"),
              TypedGoRoute<DebugComponentGalleryRoute>(path: "component-gallery"),
            ]),
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
    return buildTransitionedPage(
      context: context,
      child: HomePage(navigationShell: navigationShell),
    );
  }
}

@immutable
class BookmarksNavRoute extends GoRouteData with $BookmarksNavRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: DataAssetScope(
        useScaffold: true,
        builder: (context, assetData) {
          return const BookmarksPage();
        },
      ),
    );
  }
}

@immutable
class DatabaseNavRoute extends GoRouteData with $DatabaseNavRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: const DatabasePage(),
    );
  }
}

@immutable
class CharacterListRoute extends GoRouteData with $CharacterListRoute {
  const CharacterListRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: DataAssetScope(
        useScaffold: true,
        builder: (context, assetData) {
          return CharacterListPage(assetData: assetData);
        },
      ),
    );
  }
}

@immutable
class CharacterDetailsRoute extends GoRouteData with $CharacterDetailsRoute {
  final String id;
  final String? variant;

  const CharacterDetailsRoute({required this.id, this.variant});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: DataAssetScope(
        useScaffold: true,
        builder: (context, assetData) {
          return CharacterDetailsPage(assetData: assetData, id: id);
        },
      ),
    );
  }
}

@immutable
class WeaponListRoute extends GoRouteData with $WeaponListRoute {
  final String? equipCharacterId;

  const WeaponListRoute({this.equipCharacterId});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: DataAssetScope(
        useScaffold: true,
        builder: (context, assetData) {
          return WeaponListPage(
            assetData: assetData,
            equipCharacter: equipCharacterId,
          );
        },
      ),
    );
  }
}

@immutable
class WeaponDetailsRoute extends GoRouteData with $WeaponDetailsRoute {
  final String id;
  final CharacterId? initialSelectedCharacter;

  const WeaponDetailsRoute({required this.id, this.initialSelectedCharacter});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: DataAssetScope(
        useScaffold: true,
        builder: (context, assetData) {
          return WeaponDetailsPage(
            assetData: assetData,
            id: id,
            initialSelectedCharacter: initialSelectedCharacter,
          );
        },
      ),
    );
  }
}

@immutable
class MaterialListRoute extends GoRouteData with $MaterialListRoute {
  const MaterialListRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: DataAssetScope(
        useScaffold: true,
        builder: (context, assetData) {
          return MaterialListPage(assetData: assetData);
        },
      ),
    );
  }
}

@immutable
class MaterialDetailsRoute extends GoRouteData with $MaterialDetailsRoute {
  final String id;

  const MaterialDetailsRoute({required this.id});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: DataAssetScope(
        useScaffold: true,
        builder: (context, assetData) {
          return MaterialDetailsPage(assetData: assetData, id: id);
        },
      ),
    );
  }
}

@immutable
class ArtifactListRoute extends GoRouteData with $ArtifactListRoute {
  final String? equipCharacterId;

  const ArtifactListRoute({this.equipCharacterId});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: DataAssetScope(
        useScaffold: true,
        builder: (context, assetData) {
          return ArtifactListPage(
            assetData: assetData,
            equipCharacter: equipCharacterId,
          );
        },
      ),
    );
  }
}

@immutable
class ArtifactEffectListRoute extends GoRouteData with $ArtifactEffectListRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: DataAssetScope(
        useScaffold: true,
        builder: (context, assetData) {
          return ArtifactEffectListPage(assetData: assetData);
        },
      ),
    );
  }
}

@immutable
class ArtifactDetailsRoute extends GoRouteData with $ArtifactDetailsRoute {
  final String id;
  final CharacterId? initialSelectedCharacter;

  const ArtifactDetailsRoute({required this.id, this.initialSelectedCharacter});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: DataAssetScope(
        useScaffold: true,
        builder: (context, assetData) {
          return ArtifactDetailsPage(
            assetData: assetData,
            id: id,
            initialSelectedCharacter: initialSelectedCharacter,
          );
        },
      ),
    );
  }
}

class FurnishingSetListRoute extends GoRouteData with $FurnishingSetListRoute {
  const FurnishingSetListRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: DataAssetScope(
        useScaffold: true,
        builder: (context, assetData) {
          return FurnishingSetListPage(assetData: assetData);
        },
      ),
    );
  }
}

class FurnishingSetDetailsRoute extends GoRouteData with $FurnishingSetDetailsRoute {
  final String id;

  const FurnishingSetDetailsRoute({required this.id});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: DataAssetScope(
        useScaffold: true,
        builder: (context, assetData) {
          return FurnishingSetDetailsPage(id: id, assetData: assetData);
        },
      ),
    );
  }
}

class FurnishingListRoute extends GoRouteData with $FurnishingListRoute {
  const FurnishingListRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: DataAssetScope(
        useScaffold: true,
        builder: (context, _) {
          return FurnishingListPage();
        },
      ),
    );
  }
}

class FurnishingDetailsRoute extends GoRouteData with $FurnishingDetailsRoute {
  final String id;

  const FurnishingDetailsRoute({required this.id});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: DataAssetScope(
        useScaffold: true,
        builder: (context, _) {
          return FurnishingDetailsPage(id: id);
        },
      ),
    );
  }
}

@immutable
class DailyNavRoute extends GoRouteData with $DailyNavRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: DataAssetScope(
        useScaffold: true,
        builder: (context, assetData) {
          return DailyPage(assetData: assetData);
        },
      ),
    );
  }
}

@immutable
class ToolsNavRoute extends GoRouteData with $ToolsNavRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: const ToolsPage(),
    );
  }
}

@immutable
class ResinCalcRoute extends GoRouteData with $ResinCalcRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: const ResinCalcPage(),
    );
  }
}

class FarmingEfficiencyRoute extends GoRouteData with $FarmingEfficiencyRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: const FarmingEfficiencyPage(),
    );
  }
}

@immutable
class MoreNavRoute extends GoRouteData with $MoreNavRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: const MorePage(),
    );
  }
}

@immutable
class SettingsRoute extends GoRouteData with $SettingsRoute {
  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: const SettingsPage(),
    );
  }
}

class FarmCountSettingsRoute extends GoRouteData with $FarmCountSettingsRoute {
  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: DataAssetScope(
        useScaffold: true,
        builder: (context, assetData) {
          return FarmCountSettingsPage(assetData: assetData);
        },
      ),
    );
  }
}

@immutable
class AccountRoute extends GoRouteData with $AccountRoute {
  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: const AccountPage(),
    );
  }
}

@immutable
class ReleaseNotesRoute extends GoRouteData with $ReleaseNotesRoute {
  static final $parentNavigatorKey = rootNavigatorKey;

  final int tabIndex;

  const ReleaseNotesRoute({this.tabIndex = 0});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: ReleaseNotesPage(initialTabIndex: tabIndex),
    );
  }
}

@immutable
class HoyolabIntegrationSettingsRoute extends GoRouteData with $HoyolabIntegrationSettingsRoute {
  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: const HoyolabIntegrationSettingsPage(),
    );
  }
}

@immutable
class HoyolabSignInRoute extends GoRouteData with $HoyolabSignInRoute {
  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: const HoyolabSignInPage(),
    );
  }
}

@immutable
class LicensesRoute extends GoRouteData with $LicensesRoute {
  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: Consumer(
        builder: (context, ref, _) {
          return LicensePage(
            applicationLegalese: "©2024 cq / Images & data ©COGNOSPHERE",
            applicationName: tr.appName,
            applicationVersion: ref.watch(packageInfoProvider).value?.version,
          );
        },
      ),
    );
  }
}

@immutable
class DebugMenuRoute extends GoRouteData with $DebugMenuRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: const DebugMenuPage(),
    );
  }
}

@immutable
class DebugSharedPreferencesEditorRoute extends GoRouteData with $DebugSharedPreferencesEditorRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: const SharedPreferencesEditorPage(),
    );
  }
}

@immutable
class DebugDriftDbViewerRoute extends GoRouteData with $DebugDriftDbViewerRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: Consumer(
        builder: (context, ref, _) {
          return DriftDbViewer(
            ref.watch(appDatabaseProvider),
          );
        },
      ),
    );
  }
}

@immutable
class DebugComponentGalleryRoute extends GoRouteData with $DebugComponentGalleryRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransitionedPage(
      context: context,
      child: const ComponentGalleryPage(),
    );
  }
}
