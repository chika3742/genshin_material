import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod/misc.dart" show Override;
import "package:genshin_material/core/asset_cache.dart";
import "package:genshin_material/database.dart";
import "package:genshin_material/providers/database_provider.dart";
import "package:genshin_material/providers/miscellaneous.dart";
import "package:genshin_material/providers/versions.dart";

/// Creates a [ProviderContainer] with the overrides most tests need.
///
/// Built with `ProviderContainer.test`, so it is disposed at the end of the
/// test and left-behind containers are reported. Call it from a test body or
/// `setUp`; the `addTearDown` behind that is unavailable in `setUpAll`.
///
/// Riverpod rejects overriding the same provider twice within one container
/// while asserts are enabled — and `flutter test` always runs with asserts
/// enabled — so it throws `AssertionError: Tried to override a provider twice
/// within the same container`. That means:
///
/// - never pass `shouldHideImagesProvider` through [overrides]; it is always
///   overridden here, so use [shouldHideImages] instead;
/// - `assetDataProvider` and `appDatabaseProvider` are only overridden when
///   [assetData] / [db] are given, so pass either the named parameter or your
///   own override through [overrides] — not both.
ProviderContainer createTestContainer({
  AssetData? assetData,
  AppDatabase? db,
  bool shouldHideImages = false,
  List<Override> overrides = const [],
}) {
  return ProviderContainer.test(
    overrides: [
      if (assetData != null)
        // Returned synchronously: consumers call `requireValue` on it.
        assetDataProvider.overrideWith((ref) => assetData),
      if (db != null) appDatabaseProvider.overrideWithValue(db),
      shouldHideImagesProvider.overrideWithValue(shouldHideImages),
      ...overrides,
    ],
  );
}
