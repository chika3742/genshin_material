import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod/misc.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/asset_cache.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/providers/database_provider.dart";
import "package:genshin_material/providers/miscellaneous.dart";
import "package:genshin_material/providers/versions.dart";

/// Creates a [ProviderContainer] with the overrides most tests need, and
/// disposes it via `addTearDown`. (`ProviderContainer.test` registers the same
/// tear-down; disposing twice is a no-op.)
///
/// [assetData] is returned synchronously because consumers call `requireValue`
/// on [assetDataProvider]. [assetDataProvider] and [appDatabaseProvider] are
/// only overridden when the corresponding argument is given, so a test that
/// needs a different override for either can pass it through [overrides].
/// Riverpod rejects overriding the same provider twice, so never override
/// [shouldHideImagesProvider] through [overrides]; use [shouldHideImages].
ProviderContainer createTestContainer({
  AssetData? assetData,
  AppDatabase? db,
  bool shouldHideImages = false,
  List<Override> overrides = const [],
}) {
  final container = ProviderContainer.test(
    overrides: [
      shouldHideImagesProvider.overrideWithValue(shouldHideImages),
      if (assetData != null)
        assetDataProvider.overrideWith((ref) => assetData),
      if (db != null) appDatabaseProvider.overrideWithValue(db),
      ...overrides,
    ],
  );
  addTearDown(container.dispose);
  return container;
}
