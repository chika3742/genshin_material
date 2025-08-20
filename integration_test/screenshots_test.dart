import "dart:async";
import "dart:io";

import "package:drift/native.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/game_data_sync_indicator.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/bookmark_db_extension.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:genshin_material/main.dart";
import "package:genshin_material/models/bookmark.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/providers/asset_updating_state.dart";
import "package:genshin_material/providers/database_provider.dart";
import "package:genshin_material/providers/game_data_sync.dart";
import "package:genshin_material/providers/versions.dart";
import "package:integration_test/integration_test.dart";
import "package:intl/date_symbol_data_local.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";
import "package:path/path.dart" as p;
import "package:shared_preferences/shared_preferences.dart";

void main() {
  late AppDatabase db;
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());

    Firebase.initializeApp();
  });
  tearDown(() async {
    await db.close();
  });

  testWidgets("take screenshots", (tester) async {
    int index = 1;
    Future<void> takeScreenshot() async {
      const screenshotDir = String.fromEnvironment("SCREENSHOT_DIR");
      await binding.takeScreenshot(p.join(screenshotDir, "${index.toString().padLeft(2, "0")}.png"));
      index++;
    }

    // initialize the app
    const locale = String.fromEnvironment("LOCALE", defaultValue: "ja");
    await LocaleSettings.setLocale(AppLocale.values.firstWhere((e) => e.name == locale));
    await initializeDateFormatting();
    // avoid plural resolver not configured warning
    // (Japanese doesn't have plural forms)
    LocaleSettings.setPluralResolver(
      locale: AppLocale.ja,
      cardinalResolver: (n, {few, many, one, other, two, zero}) => other!,
    );
    spInstance = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: null,
      ),
    );

    await tester.pumpWidget(ProviderScope(
      overrides: [
        appDatabaseProvider.overrideWithValue(db),
        gameDataSyncStateProvider(variantId: "amber").overrideWithValue(GameDataSyncStatus.synced()),
      ],
      child: const MyApp(),
    ));

    final container = ProviderScope.containerOf(tester.element(find.byType(MyApp)));

    // wait until assets are downloaded
    final completer = Completer();
    container.listen(assetUpdatingStateNotifierProvider.select((e) => e.state), (_, curr) {
      if (!curr.isBusy) {
        completer.complete();
      }
    });
    await completer.future;

    // wait for assets to be loaded
    await container.read(assetDataProvider.future);

    // initialize db with the fake data
    await db.addMaterialBookmarks([
      MaterialBookmarkInsertable(
        characterId: "amber",
        weaponId: null,
        materialId: "everflame-seed",
        quantity: 12,
        purposeType: Purpose.ascension,
        upperLevel: 80,
      ),
      MaterialBookmarkInsertable(
        characterId: "amber",
        weaponId: null,
        materialId: "small-lamp-grass",
        quantity: 45,
        purposeType: Purpose.ascension,
        upperLevel: 80,
      ),
      MaterialBookmarkInsertable(
        characterId: "amber",
        weaponId: null,
        materialId: "everflame-seed",
        quantity: 20,
        purposeType: Purpose.ascension,
        upperLevel: 90,
      ),
      MaterialBookmarkInsertable(
        characterId: "amber",
        weaponId: null,
        materialId: "small-lamp-grass",
        quantity: 60,
        purposeType: Purpose.ascension,
        upperLevel: 90,
      ),
      MaterialBookmarkInsertable(
        characterId: "amber",
        weaponId: null,
        materialId: "philosophies-of-freedom",
        quantity: 4,
        purposeType: Purpose.elementalSkill,
        upperLevel: 7,
      ),
      MaterialBookmarkInsertable(
        characterId: "amber",
        weaponId: null,
        materialId: "philosophies-of-freedom",
        quantity: 6,
        purposeType: Purpose.elementalSkill,
        upperLevel: 8,
      ),
      MaterialBookmarkInsertable(
        characterId: "amber",
        weaponId: null,
        materialId: "philosophies-of-freedom",
        quantity: 12,
        purposeType: Purpose.elementalSkill,
        upperLevel: 9,
      ),
      MaterialBookmarkInsertable(
        characterId: "amber",
        weaponId: null,
        materialId: "philosophies-of-freedom",
        quantity: 16,
        purposeType: Purpose.elementalSkill,
        upperLevel: 10,
      ),
    ]);

    await db.addArtifactSetBookmark(ArtifactSetBookmarkInsertable(
      characterId: "amber",
      sets: ["wanderers-troupe"],
      mainStats: {
        "sands": "atkPercent",
        "goblet": "pyroDamageBonus",
        "circlet": "critRate",
      },
      subStats: ["critDamage", "critRate"],
    ),);

    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 5)); // wait until the snackbar is dismissed

    if (Platform.isAndroid) {
      await binding.convertFlutterSurfaceToImage();
    }

    // top screen (bookmarks)
    await takeScreenshot();

    // character details page
    await tester.tap(find.text(tr.pages.database));
    await tester.pumpAndSettle();
    await tester.tap(find.text(tr.pages.characters));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(ValueKey("amber")));
    await tester.pumpAndSettle();

    await takeScreenshot();

    // artifact details page
    await tester.tap(find.text(tr.pages.database));
    await tester.pumpAndSettle();
    await tester.tap(find.text(tr.pages.artifacts));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(ValueKey("blizzard-strayer")));
    await tester.pumpAndSettle();

    await takeScreenshot();

    // material details page
    await tester.tap(find.text(tr.pages.database));
    await tester.pumpAndSettle();
    await tester.tap(find.text(tr.pages.materials));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(ValueKey("damaged-mask")));
    await tester.pumpAndSettle();

    await takeScreenshot();

    // furnishing set
    await tester.tap(find.text(tr.pages.database));
    await tester.pumpAndSettle();
    await tester.tap(find.text(tr.pages.furnishingSets));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(ValueKey("adventurer-camp")));
    await tester.pumpAndSettle();

    await takeScreenshot();

    // daily materials page
    await tester.tap(find.byIcon(Symbols.today));
    await tester.pumpAndSettle();

    await takeScreenshot();
  });
}
