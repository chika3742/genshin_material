// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$homeRoute];

RouteBase get $homeRoute => StatefulShellRouteData.$route(
  factory: $HomeRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/bookmarks',
          factory: $BookmarksNavRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/database',
          factory: $DatabaseNavRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'characters',
              factory: $CharacterListRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: ':id',
                  factory: $CharacterDetailsRoute._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'weapons',
              factory: $WeaponListRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: ':id',
                  factory: $WeaponDetailsRoute._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'materials',
              factory: $MaterialListRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: ':id',
                  factory: $MaterialDetailsRoute._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'artifacts',
              factory: $ArtifactListRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'effects',
                  factory: $ArtifactEffectListRoute._fromState,
                ),
                GoRouteData.$route(
                  path: ':id',
                  factory: $ArtifactDetailsRoute._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'furnishing-sets',
              factory: $FurnishingSetListRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'furnishings',
                  factory: $FurnishingListRoute._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: ':id',
                      factory: $FurnishingDetailsRoute._fromState,
                    ),
                  ],
                ),
                GoRouteData.$route(
                  path: ':id',
                  factory: $FurnishingSetDetailsRoute._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(path: '/daily', factory: $DailyNavRoute._fromState),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/tools',
          factory: $ToolsNavRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'resin-calc',
              factory: $ResinCalcRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'farming-efficiency',
              factory: $FarmingEfficiencyRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/more',
          factory: $MoreNavRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'settings',
              parentNavigatorKey: SettingsRoute.$parentNavigatorKey,
              factory: $SettingsRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'farm-count',
                  parentNavigatorKey:
                      FarmCountSettingsRoute.$parentNavigatorKey,
                  factory: $FarmCountSettingsRoute._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'account',
              parentNavigatorKey: AccountRoute.$parentNavigatorKey,
              factory: $AccountRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'release-notes',
              parentNavigatorKey: ReleaseNotesRoute.$parentNavigatorKey,
              factory: $ReleaseNotesRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'hoyolab-integration',
              parentNavigatorKey:
                  HoyolabIntegrationSettingsRoute.$parentNavigatorKey,
              factory: $HoyolabIntegrationSettingsRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'sign-in',
                  parentNavigatorKey: HoyolabSignInRoute.$parentNavigatorKey,
                  factory: $HoyolabSignInRoute._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'licenses',
              parentNavigatorKey: LicensesRoute.$parentNavigatorKey,
              factory: $LicensesRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'debug',
              factory: $DebugMenuRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'sp-editor',
                  factory: $DebugSharedPreferencesEditorRoute._fromState,
                ),
                GoRouteData.$route(
                  path: 'drift-db-viewer',
                  factory: $DebugDriftDbViewerRoute._fromState,
                ),
                GoRouteData.$route(
                  path: 'component-gallery',
                  factory: $DebugComponentGalleryRoute._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();
}

mixin $BookmarksNavRoute on GoRouteData {
  static BookmarksNavRoute _fromState(GoRouterState state) =>
      BookmarksNavRoute();

  @override
  String get location => GoRouteData.$location('/bookmarks');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $DatabaseNavRoute on GoRouteData {
  static DatabaseNavRoute _fromState(GoRouterState state) => DatabaseNavRoute();

  @override
  String get location => GoRouteData.$location('/database');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CharacterListRoute on GoRouteData {
  static CharacterListRoute _fromState(GoRouterState state) =>
      const CharacterListRoute();

  @override
  String get location => GoRouteData.$location('/database/characters');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CharacterDetailsRoute on GoRouteData {
  static CharacterDetailsRoute _fromState(GoRouterState state) =>
      CharacterDetailsRoute(
        id: state.pathParameters['id']!,
        variant: state.uri.queryParameters['variant'],
      );

  CharacterDetailsRoute get _self => this as CharacterDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/database/characters/${Uri.encodeComponent(_self.id)}',
    queryParams: {if (_self.variant != null) 'variant': _self.variant},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $WeaponListRoute on GoRouteData {
  static WeaponListRoute _fromState(GoRouterState state) => WeaponListRoute(
    equipCharacterId: state.uri.queryParameters['equip-character-id'],
  );

  WeaponListRoute get _self => this as WeaponListRoute;

  @override
  String get location => GoRouteData.$location(
    '/database/weapons',
    queryParams: {
      if (_self.equipCharacterId != null)
        'equip-character-id': _self.equipCharacterId,
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $WeaponDetailsRoute on GoRouteData {
  static WeaponDetailsRoute _fromState(GoRouterState state) =>
      WeaponDetailsRoute(
        id: state.pathParameters['id']!,
        initialSelectedCharacter:
            state.uri.queryParameters['initial-selected-character'],
      );

  WeaponDetailsRoute get _self => this as WeaponDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/database/weapons/${Uri.encodeComponent(_self.id)}',
    queryParams: {
      if (_self.initialSelectedCharacter != null)
        'initial-selected-character': _self.initialSelectedCharacter,
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $MaterialListRoute on GoRouteData {
  static MaterialListRoute _fromState(GoRouterState state) =>
      const MaterialListRoute();

  @override
  String get location => GoRouteData.$location('/database/materials');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $MaterialDetailsRoute on GoRouteData {
  static MaterialDetailsRoute _fromState(GoRouterState state) =>
      MaterialDetailsRoute(id: state.pathParameters['id']!);

  MaterialDetailsRoute get _self => this as MaterialDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/database/materials/${Uri.encodeComponent(_self.id)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ArtifactListRoute on GoRouteData {
  static ArtifactListRoute _fromState(GoRouterState state) => ArtifactListRoute(
    equipCharacterId: state.uri.queryParameters['equip-character-id'],
  );

  ArtifactListRoute get _self => this as ArtifactListRoute;

  @override
  String get location => GoRouteData.$location(
    '/database/artifacts',
    queryParams: {
      if (_self.equipCharacterId != null)
        'equip-character-id': _self.equipCharacterId,
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ArtifactEffectListRoute on GoRouteData {
  static ArtifactEffectListRoute _fromState(GoRouterState state) =>
      ArtifactEffectListRoute();

  @override
  String get location => GoRouteData.$location('/database/artifacts/effects');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ArtifactDetailsRoute on GoRouteData {
  static ArtifactDetailsRoute _fromState(GoRouterState state) =>
      ArtifactDetailsRoute(
        id: state.pathParameters['id']!,
        initialSelectedCharacter:
            state.uri.queryParameters['initial-selected-character'],
      );

  ArtifactDetailsRoute get _self => this as ArtifactDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/database/artifacts/${Uri.encodeComponent(_self.id)}',
    queryParams: {
      if (_self.initialSelectedCharacter != null)
        'initial-selected-character': _self.initialSelectedCharacter,
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $FurnishingSetListRoute on GoRouteData {
  static FurnishingSetListRoute _fromState(GoRouterState state) =>
      const FurnishingSetListRoute();

  @override
  String get location => GoRouteData.$location('/database/furnishing-sets');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $FurnishingListRoute on GoRouteData {
  static FurnishingListRoute _fromState(GoRouterState state) =>
      const FurnishingListRoute();

  @override
  String get location =>
      GoRouteData.$location('/database/furnishing-sets/furnishings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $FurnishingDetailsRoute on GoRouteData {
  static FurnishingDetailsRoute _fromState(GoRouterState state) =>
      FurnishingDetailsRoute(id: state.pathParameters['id']!);

  FurnishingDetailsRoute get _self => this as FurnishingDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/database/furnishing-sets/furnishings/${Uri.encodeComponent(_self.id)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $FurnishingSetDetailsRoute on GoRouteData {
  static FurnishingSetDetailsRoute _fromState(GoRouterState state) =>
      FurnishingSetDetailsRoute(id: state.pathParameters['id']!);

  FurnishingSetDetailsRoute get _self => this as FurnishingSetDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/database/furnishing-sets/${Uri.encodeComponent(_self.id)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $DailyNavRoute on GoRouteData {
  static DailyNavRoute _fromState(GoRouterState state) => DailyNavRoute();

  @override
  String get location => GoRouteData.$location('/daily');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ToolsNavRoute on GoRouteData {
  static ToolsNavRoute _fromState(GoRouterState state) => ToolsNavRoute();

  @override
  String get location => GoRouteData.$location('/tools');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ResinCalcRoute on GoRouteData {
  static ResinCalcRoute _fromState(GoRouterState state) => ResinCalcRoute();

  @override
  String get location => GoRouteData.$location('/tools/resin-calc');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $FarmingEfficiencyRoute on GoRouteData {
  static FarmingEfficiencyRoute _fromState(GoRouterState state) => FarmingEfficiencyRoute();

  @override
  String get location => GoRouteData.$location('/tools/farming-efficiency');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $MoreNavRoute on GoRouteData {
  static MoreNavRoute _fromState(GoRouterState state) => MoreNavRoute();

  @override
  String get location => GoRouteData.$location('/more');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => SettingsRoute();

  @override
  String get location => GoRouteData.$location('/more/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $FarmCountSettingsRoute on GoRouteData {
  static FarmCountSettingsRoute _fromState(GoRouterState state) =>
      FarmCountSettingsRoute();

  @override
  String get location => GoRouteData.$location('/more/settings/farm-count');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AccountRoute on GoRouteData {
  static AccountRoute _fromState(GoRouterState state) => AccountRoute();

  @override
  String get location => GoRouteData.$location('/more/account');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ReleaseNotesRoute on GoRouteData {
  static ReleaseNotesRoute _fromState(GoRouterState state) => ReleaseNotesRoute(
    tabIndex:
        _$convertMapValue('tab-index', state.uri.queryParameters, int.parse) ??
        0,
  );

  ReleaseNotesRoute get _self => this as ReleaseNotesRoute;

  @override
  String get location => GoRouteData.$location(
    '/more/release-notes',
    queryParams: {
      if (_self.tabIndex != 0) 'tab-index': _self.tabIndex.toString(),
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $HoyolabIntegrationSettingsRoute on GoRouteData {
  static HoyolabIntegrationSettingsRoute _fromState(GoRouterState state) =>
      HoyolabIntegrationSettingsRoute();

  @override
  String get location => GoRouteData.$location('/more/hoyolab-integration');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $HoyolabSignInRoute on GoRouteData {
  static HoyolabSignInRoute _fromState(GoRouterState state) =>
      HoyolabSignInRoute();

  @override
  String get location =>
      GoRouteData.$location('/more/hoyolab-integration/sign-in');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $LicensesRoute on GoRouteData {
  static LicensesRoute _fromState(GoRouterState state) => LicensesRoute();

  @override
  String get location => GoRouteData.$location('/more/licenses');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $DebugMenuRoute on GoRouteData {
  static DebugMenuRoute _fromState(GoRouterState state) => DebugMenuRoute();

  @override
  String get location => GoRouteData.$location('/more/debug');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $DebugSharedPreferencesEditorRoute on GoRouteData {
  static DebugSharedPreferencesEditorRoute _fromState(GoRouterState state) =>
      DebugSharedPreferencesEditorRoute();

  @override
  String get location => GoRouteData.$location('/more/debug/sp-editor');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $DebugDriftDbViewerRoute on GoRouteData {
  static DebugDriftDbViewerRoute _fromState(GoRouterState state) =>
      DebugDriftDbViewerRoute();

  @override
  String get location => GoRouteData.$location('/more/debug/drift-db-viewer');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $DebugComponentGalleryRoute on GoRouteData {
  static DebugComponentGalleryRoute _fromState(GoRouterState state) =>
      DebugComponentGalleryRoute();

  @override
  String get location => GoRouteData.$location('/more/debug/component-gallery');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T? Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}
