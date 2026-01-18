import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../components/center_text.dart";
import "../../components/furnishing_counter.dart";
import "../../constants/dimens.dart";
import "../../core/asset_cache.dart";
import "../../db/furnishing_db_extension.dart";
import "../../i18n/strings.g.dart";
import "../../providers/database_provider.dart";
import "../../providers/versions.dart";
import "../../routes.dart";
import "../../ui_core/snack_bar.dart";

class FurnishingBookmarkList extends HookConsumerWidget {
  const FurnishingBookmarkList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(appDatabaseProvider);
    final assetData = ref.watch(assetDataProvider).value!;

    final furnishingSetBookmarksSnapshot = useStream(
      useMemoized(() => db.watchFurnishingSetBookmarks()),
    );
    if (furnishingSetBookmarksSnapshot.data == null
        || furnishingSetBookmarksSnapshot.data!.isEmpty) {
      return CenterText(tr.bookmarksPage.noBookmarks);
    }
    final furnishingSetBookmarks = furnishingSetBookmarksSnapshot.data!;

    return ListView.builder(
      itemCount: furnishingSetBookmarks.length,
      itemBuilder: (context, index) {
        final bookmark = furnishingSetBookmarks[index];
        final set = assetData.furnishingSets[bookmark.setId];
        if (set == null) {
          return Text("error: unknown furnishing set ${bookmark.setId}");
        }

        return HookBuilder(
          key: ValueKey(set.id),
          builder: (context) {
            final counts = useStream(
              useMemoized(() => db.watchFurnishingCraftCounts(set.id)),
            ).data ?? [];
            final insufficientComponents = set.consistsOf
                .where((e) => (counts.firstWhereOrNull((c) => c.furnishingId == e.furnishingId)?.count ?? 0) < e.quantity);

            final controller = useExpansibleController();
            final isExpanded = useListenable(controller).isExpanded;

            return ExpansionTile(
              controller: controller,
              leading: Image.file(
                set.getImageFile(assetData.assetDir),
                width: listTileFurnishingSetImageWidth,
              ),
              title: Text(set.name.localized),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Symbols.info),
                    onPressed: () {
                      FurnishingSetDetailsRoute(id: set.id).push(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Symbols.bookmark_remove),
                    onPressed: () {
                      db.removeFurnishingSetBookmark(bookmark).then((restore) {
                        if (context.mounted) {
                          showSnackBar(
                            context: context,
                            message: tr.furnishingSetsPage.removedFromBookmarks,
                            action: SnackBarAction(
                              label: tr.common.undo,
                              onPressed: () {
                                restore();
                              },
                            ),
                          );
                        }
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: AnimatedRotation(
                      duration: Durations.medium2,
                      curve: Easing.emphasizedDecelerate,
                      turns: isExpanded ? 0.5 : 0,
                      child: const Icon(Symbols.keyboard_arrow_down),
                    ),
                  ),
                ],
              ),
              expansionAnimationStyle: AnimationStyle(
                curve: Easing.emphasizedDecelerate,
                reverseCurve: Easing.emphasizedAccelerate,
                duration: Durations.medium2,
              ),
              children: insufficientComponents.isNotEmpty
                ? insufficientComponents.map((e) {
                    final furnishing = assetData.furnishings[e.furnishingId]!;

                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: ListTile(
                        leading: Image.file(
                          furnishing.getImageFile(assetData.assetDir),
                          width: 50,
                          height: 50,
                        ),
                        title: Text(furnishing.name.localized),
                        trailing: FurnishingCounter(
                            currentCount: counts
                                .firstWhereOrNull((c) => c.furnishingId == e.furnishingId)
                                ?.count ?? 0,
                            requiredCount: e.quantity,
                            onChanged: (value) {
                              db.updateFurnishingCraftCount(
                                  set.id, e.furnishingId, value);
                            }),
                      ),
                    );
                  }).toList()
                : [
                  ListTile(
                    title: Text(tr.bookmarksPage.allFurnishingsAreCrafted),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
