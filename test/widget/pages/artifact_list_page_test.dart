import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/character_select_dropdown.dart";
import "package:genshin_material/components/item_link_button.dart";
import "package:genshin_material/core/theme.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:genshin_material/models/artifact.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/pages/database/artifacts/artifact_list.dart";
import "package:genshin_material/providers/miscellaneous.dart";
import "package:genshin_material/providers/versions.dart";
import "package:genshin_material/routes.dart";
import "package:go_router/go_router.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../../utils/asset_data.dart";

/// Finds the generated route registered at [path] (relative path segments),
/// so a test can mount the real route instead of a stub.
GoRoute? _findGoRoute(List<RouteBase> routes, List<String> path) {
  for (final route in routes) {
    if (route is GoRoute && route.path == path.first) {
      if (path.length == 1) {
        return route;
      }
      final found = _findGoRoute(route.routes, path.sublist(1));
      if (found != null) {
        return found;
      }
    } else {
      // Shell routes flatten their branch routes into `routes`, so walking
      // `routes` alone reaches every registered route.
      final found = _findGoRoute(route.routes, path);
      if (found != null) {
        return found;
      }
    }
  }
  return null;
}

void main() {
  const characterId = "char";
  const setId = "set";
  const pieceId = "piece";
  const pieceTypeId = "flower";

  final piece = ArtifactPiece(
    id: pieceId,
    name: LocalizedText.untranslatable(text: "Piece"),
    jaPronunciation: "",
    parentId: setId,
    type: pieceTypeId,
    imageUrl: "img/piece.png",
  );
  // Without bonuses the details page skips the set effect and the two-and-two
  // bookmark sections, so the piece tile holds the only bookmark button.
  final set = ArtifactSet(
    id: setId,
    name: LocalizedText.untranslatable(text: "Set"),
    jaPronunciation: "",
    maxRarity: 5,
    consistsOf: const {pieceTypeId: pieceId},
    bonuses: const [],
  );

  // GameItemListTile and RarityStars read the rarity colors off the theme
  // extension without a fallback, so the extension has to be in place.
  final componentTheme = ThemeData(
    extensions: [
      ComponentThemeExtension(
        starColor: Colors.orange,
        rarity1Color: Colors.grey,
        rarity2Color: Colors.green,
        rarity3Color: Colors.blue,
        rarity4Color: Colors.purple,
        rarity5Color: Colors.orange,
      ),
    ],
  );

  late GoRouter router;

  tearDown(() {
    router.dispose();
  });

  /// Mounts the list page at its real location, with the **generated** details
  /// route hanging below it, so a tap runs the whole chain: the route the list
  /// page builds, its location, `$ArtifactDetailsRoute._fromState` and
  /// `ArtifactDetailsRoute.buildPage`.
  Future<void> pumpList(WidgetTester tester, {CharacterId? equipCharacter}) async {
    final assetData = buildTestAssetData(
      characters: {
        characterId: buildTestCharacter(
          id: characterId,
          name: LocalizedText.untranslatable(text: "Char"),
        ),
      },
      artifactSets: {set.id: set},
      artifactPieces: {piece.id: piece},
      artifactPieceTypes: {
        pieceTypeId: ArtifactPieceType(
          id: pieceTypeId,
          desc: LocalizedText.untranslatable(text: "Flower"),
          possibleMainStats: const [],
        ),
      },
    );

    router = GoRouter(
      initialLocation: const ArtifactListRoute().location,
      routes: [
        GoRoute(
          path: const ArtifactListRoute().location,
          builder: (context, state) => ArtifactListPage(
            assetData: assetData,
            equipCharacter: equipCharacter,
          ),
          routes: [_findGoRoute($appRoutes, const ["artifacts", ":id"])!],
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // No image files are laid out for this test: a widget test runs under
          // fake async, so the reads behind Image.file never resolve either way.
          shouldHideImagesProvider.overrideWithValue(true),
          // Returned synchronously: DataAssetScope and the image resolver want
          // the data to be there on the first build.
          assetDataProvider.overrideWith((ref) => assetData),
        ],
        child: MaterialApp.router(routerConfig: router, theme: componentTheme),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> openDetails(WidgetTester tester) async {
    await tester.tap(find.byType(ItemLinkButton));
    await tester.pumpAndSettle();
  }

  Future<void> openBookmarkDialog(WidgetTester tester) async {
    await tester.tap(find.byIcon(Icons.bookmark));
    await tester.pumpAndSettle();
  }

  CharacterId? dialogCharacter(WidgetTester tester) {
    return tester
        .widget<CharacterSelectDropdown>(find.byType(CharacterSelectDropdown))
        .initialValue;
  }

  /// The dialog enables saving only once a character is chosen, so this is the
  /// user-visible side of the preselection.
  VoidCallback? saveCallback(WidgetTester tester) {
    return tester
        .widget<TextButton>(find.widgetWithText(TextButton, tr.common.save))
        .onPressed;
  }

  testWidgets("preselects the selected character in the bookmark dialog", (tester) async {
    await pumpList(tester, equipCharacter: characterId);

    await openDetails(tester);
    await openBookmarkDialog(tester);

    expect(router.state.uri.path, "${const ArtifactListRoute().location}/$setId");
    expect(dialogCharacter(tester), characterId);
    expect(saveCallback(tester), isNotNull);
  });

  testWidgets("leaves the bookmark dialog unselected without a character", (tester) async {
    await pumpList(tester);

    await openDetails(tester);
    await openBookmarkDialog(tester);

    expect(dialogCharacter(tester), isNull);
    expect(saveCallback(tester), isNull);
  });
}
