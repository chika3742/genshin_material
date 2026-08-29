import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod/misc.dart" show Override;
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/asset_cache.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/providers/database_provider.dart";
import "package:genshin_material/providers/miscellaneous.dart";
import "package:genshin_material/providers/versions.dart";

/// Creates a [ProviderContainer] with the overrides most tests need, disposing
/// it automatically at the end of the test.
///
/// Anything passed in [overrides] is applied last, so callers can override the
/// defaults set up here.
ProviderContainer createTestContainer({
  AssetData? assetData,
  AppDatabase? db,
  bool shouldHideImages = false,
  List<Override> overrides = const [],
}) {
  final container = ProviderContainer.test(
    overrides: [
      if (assetData != null)
        // Returned synchronously: consumers call `requireValue` on it.
        assetDataProvider.overrideWith((ref) => assetData),
      if (db != null) appDatabaseProvider.overrideWithValue(db),
      shouldHideImagesProvider.overrideWithValue(shouldHideImages),
      ...overrides,
    ],
  );
  // `ProviderContainer.test` already registers this, but `dispose` is
  // idempotent and this keeps the guarantee explicit.
  addTearDown(container.dispose);

  return container;
}
