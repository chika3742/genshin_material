import "package:riverpod_annotation/riverpod_annotation.dart";
import "../../../database.dart";
import "../../../providers/database_provider.dart";

part "furnishing_viewmodel.g.dart";

/// Removes a furnishing set bookmark (with undo functionality)
///
/// Removes from database. UI updates automatically.
Future<void Function()> removeFurnishingSetBookmark(
  Ref ref,
  FurnishingSetBookmark bookmark,
) async {
  final db = ref.read(appDatabaseProvider);
  return await db.removeFurnishingSetBookmark(bookmark);
}

/// Updates furnishing craft count
///
/// Persists to database. UI updates automatically.
Future<void> updateFurnishingCraftCount(
  Ref ref, {
  required String setId,
  required String furnishingId,
  required int count,
}) async {
  if (count < 0) {
    throw ArgumentError("Count cannot be negative: $count");
  }

  final db = ref.read(appDatabaseProvider);
  await db.updateFurnishingCraftCount(setId, furnishingId, count);
}
