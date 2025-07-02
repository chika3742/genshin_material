import "dart:async";
import "dart:io";

import "package:drift/native.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/db/bookmark_db_extension.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:genshin_material/main.dart";
import "package:genshin_material/models/bookmark.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/providers/asset_updating_state.dart";
import "package:genshin_material/providers/database_provider.dart";
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
    LocaleSettings.useDeviceLocale();
    await initializeDateFormatting("ja_JP", null);
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
      ],
      child: const MyApp(),
    ),);

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
    await tester.tap(find.text("データベース"));
    await tester.pumpAndSettle();
    await tester.tap(find.text("キャラクター"));
    await tester.pumpAndSettle();
    await tester.tap(find.text("アンバー"));
    await tester.pumpAndSettle();

    await takeScreenshot();

    // artifact details page
    await tester.tap(find.text("データベース"));
    await tester.pumpAndSettle();
    await tester.tap(find.text("聖遺物"));
    await tester.pumpAndSettle();
    await tester.tap(find.text("氷風を彷徨う勇士"));
    await tester.pumpAndSettle();

    await takeScreenshot();

    // material details page
    await tester.tap(find.text("データベース"));
    await tester.pumpAndSettle();
    await tester.tap(find.text("素材一覧(逆引き)"));
    await tester.pumpAndSettle();
    await tester.tap(find.text("破損した仮面"));
    await tester.pumpAndSettle();

    await takeScreenshot();

    // daily materials page
    await tester.tap(find.byIcon(Symbols.today));
    await tester.pumpAndSettle();

    await takeScreenshot();
  });
}
