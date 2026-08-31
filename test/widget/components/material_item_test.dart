import "dart:convert";
import "dart:io";

import "package:flutter/material.dart" hide Material;
import "package:flutter_riverpod/misc.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/material_item.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/core/theme.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/bookmark_db_extension.dart";
import "package:genshin_material/db/material_card_to_companions.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/models/drop_rates.dart";
import "package:genshin_material/models/localized_text.dart";
import "package:genshin_material/models/material.dart";
import "package:genshin_material/models/material_bookmark_frame.dart";
import "package:genshin_material/providers/database_provider.dart";
import "package:genshin_material/providers/miscellaneous.dart";
import "package:genshin_material/providers/pref_notifier.dart";
import "package:genshin_material/providers/versions.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:path/path.dart" as path;

import "../../utils.dart";
import "../../utils/asset_data.dart";
import "../../utils/db.dart";
import "../../utils/in_memory_pref_notifier.dart";

void main() {
  // The card renders the material image with Image.file, so the files it
  // points at have to exist and to decode.
  final onePixelPng = base64Decode(
    "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
  );

  const materialId = "mat";
  const imageUrl = "img/mat.png";
  const materialName = "Mat";
  const usage = MaterialUsage(characterId: "char_1");

  // MaterialCard reads the rarity color off the theme extension without a
  // fallback, so the extension has to be in place for the card to build.
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
  const purposeTypes = [Purpose.ascension];

  final material = buildTestMaterial(
    id: materialId,
    name: LocalizedText.untranslatable(text: materialName),
    imageUrl: imageUrl,
    category: "cat",
    rarity: 3,
  );
  final dropRate = DropRateEntry(
    description: LocalizedText.untranslatable(text: "drop"),
    target: const DropRateTarget(ids: [materialId]),
    originalRate: const [DropRate(lowerAR: 1, rate: 2.0)],
    condensedAvailable: false,
  );

  // Two levels, so the bookmark state can be partial as well.
  final item = MaterialCardMaterial(
    id: materialId,
    levels: const [
      MaterialBookmarkFrame(
        materialId: materialId,
        level: 40,
        quantity: 8,
        purposeType: Purpose.ascension,
      ),
      MaterialBookmarkFrame(
        materialId: materialId,
        level: 50,
        quantity: 4,
        purposeType: Purpose.ascension,
      ),
    ],
  );

  late AppDatabase db;
  late Directory assetDir;

  setUp(() {
    db = createTestDatabase();
    assetDir = Directory.systemTemp.createTempSync("material_item_test");
    final imageFile = File(path.join(assetDir.path, imageUrl));
    imageFile.parent.createSync(recursive: true);
    imageFile.writeAsBytesSync(onePixelPng);
    File(getBlankImagePath(assetDir.path)).writeAsBytesSync(onePixelPng);
  });

  tearDown(() async {
    await db.close();
    assetDir.deleteSync(recursive: true);
  });

  List<Override> prefOverrides({
    bool showFarmCount = false,
    bool showItemName = true,
  }) {
    return [
      prefProvider(PrefKeys.showFarmCount)
          .overrideWith(() => InMemoryPrefNotifier(showFarmCount)),
      prefProvider(PrefKeys.showItemNameOnCard)
          .overrideWith(() => InMemoryPrefNotifier(showItemName)),
      prefProvider(PrefKeys.adventureRank)
          .overrideWith(() => InMemoryPrefNotifier(60)),
      prefProvider(PrefKeys.condensedMultiplier)
          .overrideWith(() => InMemoryPrefNotifier(2.0)),
      prefProvider(PrefKeys.dailyResetServer)
          .overrideWith(() => InMemoryPrefNotifier(GameServer.asia)),
    ];
  }

  Future<void> pumpItem(
    WidgetTester tester, {
    bool hideImages = false,
    bool showFarmCount = false,
    bool showItemName = true,
    bool withDropRate = true,
    int? lackNum,
    bool bookmarkable = false,
    List<Material> materials = const [],
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(db),
          shouldHideImagesProvider.overrideWithValue(hideImages),
          // Returned synchronously: the card calls `requireValue` on it.
          assetDataProvider.overrideWith((ref) => buildTestAssetData(
            assetDir: assetDir.path,
            materials: {
              for (final material in [material, ...materials]) material.id: material,
            },
            dropRates: withDropRate ? [dropRate] : [],
          )),
          ...prefOverrides(
            showFarmCount: showFarmCount,
            showItemName: showItemName,
          ),
        ],
        child: createScreenWithApp(
          Theme(
            data: componentTheme,
            child: Scaffold(
              body: MaterialItem(
                item: item,
                targetType: MaterialTargetType.character,
                lackNum: lackNum,
                usage: bookmarkable ? usage : null,
                possiblePurposeTypes: bookmarkable ? purposeTypes : null,
                hashes: bookmarkable ? null : const [],
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  // Cancelling a drift query stream schedules a zero-duration timer, which the
  // test framework flags as pending unless the tree goes away during the test.
  Future<void> disposeTree(WidgetTester tester) async {
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(Duration.zero);
  }

  String imagePathOf(WidgetTester tester) {
    final image = tester.widget<Image>(find.byType(Image));
    return (image.image as FileImage).file.path;
  }

  group("quantity", () {
    testWidgets("sums the quantities of every level", (tester) async {
      await pumpItem(tester);

      expect(find.text("x12", findRichText: true), findsOne);

      await disposeTree(tester);
    });

    testWidgets("shows how many items are still missing", (tester) async {
      await pumpItem(tester, lackNum: 5);

      expect(find.text("-5", findRichText: true), findsOne);
      expect(find.byIcon(Symbols.shopping_bag), findsOne);

      await disposeTree(tester);
    });

    testWidgets("shows a check instead once nothing is missing", (tester) async {
      await pumpItem(tester, lackNum: 0);

      expect(find.text("-0", findRichText: true), findsNothing);
      expect(find.byIcon(Symbols.check), findsOne);

      await disposeTree(tester);
    });

    testWidgets("omits the missing count when it is unknown", (tester) async {
      await pumpItem(tester);

      expect(find.byIcon(Symbols.shopping_bag), findsNothing);
      expect(find.byIcon(Symbols.check), findsNothing);

      await disposeTree(tester);
    });
  });

  group("images", () {
    testWidgets("points at the material image by default", (tester) async {
      await pumpItem(tester);

      expect(imagePathOf(tester), path.join(assetDir.path, imageUrl));

      await disposeTree(tester);
    });

    testWidgets("falls back to the blank image while images are hidden", (tester) async {
      await pumpItem(tester, hideImages: true);

      expect(imagePathOf(tester), getBlankImagePath(assetDir.path));
      expect(imagePathOf(tester), isNot(path.join(assetDir.path, imageUrl)));

      await disposeTree(tester);
    });
  });

  group("name", () {
    testWidgets("shows the material name", (tester) async {
      await pumpItem(tester);

      expect(find.text(materialName), findsOne);

      await disposeTree(tester);
    });

    testWidgets("hides the material name when the preference is off", (tester) async {
      await pumpItem(tester, showItemName: false);

      expect(find.text(materialName), findsNothing);

      await disposeTree(tester);
    });
  });

  group("farm count", () {
    testWidgets("shows the runs needed for the missing quantity", (tester) async {
      await pumpItem(tester, showFarmCount: true);

      // 12 items at a rate of 2.0 per run.
      expect(find.text("6"), findsOne);
      expect(find.byIcon(Symbols.agriculture), findsOne);

      await disposeTree(tester);
    });

    testWidgets("hides the farm count when the preference is off", (tester) async {
      await pumpItem(tester, showFarmCount: false);

      expect(find.byIcon(Symbols.agriculture), findsNothing);

      await disposeTree(tester);
    });

    testWidgets("hides the farm count when no drop rate is known", (tester) async {
      await pumpItem(tester, showFarmCount: true, withDropRate: false);

      expect(find.byIcon(Symbols.agriculture), findsNothing);

      await disposeTree(tester);
    });
  });

  group("bookmarks", () {
    testWidgets("offers no bookmark button without a usage", (tester) async {
      await pumpItem(tester);

      expect(find.byIcon(Symbols.bookmark_add), findsNothing);

      await disposeTree(tester);
    });

    testWidgets("starts unbookmarked", (tester) async {
      await pumpItem(tester, bookmarkable: true);

      expect(find.byIcon(Symbols.bookmark_add), findsOne);

      await disposeTree(tester);
    });

    testWidgets("shows a partial state when only some levels are bookmarked", (tester) async {
      await db.addMaterialBookmarks(materialCardToCompanions(item, usage).take(1).toList());
      await pumpItem(tester, bookmarkable: true);

      expect(find.byIcon(Symbols.bookmark_remove), findsOne);

      await disposeTree(tester);
    });

    testWidgets("shows a bookmarked state when every level is bookmarked", (tester) async {
      await db.addMaterialBookmarks(materialCardToCompanions(item, usage));
      await pumpItem(tester, bookmarkable: true);

      expect(find.byIcon(Symbols.bookmark_added), findsOne);

      await disposeTree(tester);
    });

    testWidgets("bookmarks every level when the button is tapped", (tester) async {
      await pumpItem(tester, bookmarkable: true);

      await tester.tap(find.byIcon(Symbols.bookmark_add));
      await tester.pumpAndSettle();

      expect(find.byIcon(Symbols.bookmark_added), findsOne);
      expect(await db.select(db.bookmarkMaterialItemTable).get(), hasLength(2));

      await disposeTree(tester);
    });
  });

  testWidgets("renders nothing while the asset data is not ready", (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(db),
          shouldHideImagesProvider.overrideWithValue(false),
          assetDataProvider.overrideWith((ref) => Future.any([])),
          ...prefOverrides(),
        ],
        child: createScreenWithApp(
          Theme(
            data: componentTheme,
            child: Scaffold(
              body: MaterialItem(
                item: item,
                targetType: MaterialTargetType.character,
                hashes: const [],
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(Image), findsNothing);
    expect(tester.takeException(), isNull);

    await disposeTree(tester);
  });

  test("requires either hashes or a usage", () {
    expect(
      () => MaterialItem(
        item: item,
        targetType: MaterialTargetType.character,
      ),
      throwsAssertionError,
    );
  });
}
