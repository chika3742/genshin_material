import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../constants/dimens.dart";
import "../../i18n/strings.g.dart";
import "../../providers/versions.dart";
import "../../routes.dart";
import "../../ui_core/snack_bar.dart";
import "../../view_models/bookmarks/furnishing_set_bookmark_list_view_model.dart";
import "../async_value_widget.dart";
import "../center_text.dart";
import "../furnishing_table.dart";

class BookmarkFurnishingSetsTab extends HookConsumerWidget {
  const BookmarkFurnishingSetsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).requireValue;
    final setsAsync = ref.watch(furnishingSetBookmarkListViewModelProvider);

    return AsyncValueWidget(
      value: setsAsync,
      builder: (context, setBookmarks) {
        if (setBookmarks.isEmpty) {
          return CenterText(tr.bookmarksPage.noBookmarks);
        }

        return ListView.builder(
          itemCount: setBookmarks.length,
          itemBuilder: (context, index) {
            final set = setBookmarks[index];

            return HookConsumer(
              key: ValueKey(set.id),
              builder: (context, ref, child) {
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
                        icon: Icon(Symbols.info),
                        onPressed: () {
                          FurnishingSetDetailsRoute(id: set.id).push(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(Symbols.bookmark_remove),
                        onPressed: () async {
                          final restore = await ref.read(furnishingSetBookmarkListViewModelProvider.notifier)
                              .removeBookmark(set.id);
                          if (context.mounted) {
                            showSnackBar(
                              context: context,
                              message: tr.furnishingSetsPage.removedFromBookmarks,
                              action: SnackBarAction(
                                label: tr.common.undo,
                                onPressed: restore,
                              ),
                            );
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: AnimatedRotation(
                          duration: Durations.medium2,
                          curve: Easing.emphasizedDecelerate,
                          turns: isExpanded ? 0.5 : 0,
                          child: Icon(Symbols.keyboard_arrow_down),
                        ),
                      ),
                    ],
                  ),
                  expansionAnimationStyle: AnimationStyle(
                    curve: Easing.emphasizedDecelerate,
                    reverseCurve: Easing.emphasizedAccelerate,
                    duration: Durations.medium2,
                  ),
                  children: [FurnishingTable(
                    setId: set.id,
                    hideCompleted: true,
                    nested: true,
                    items: set.consistsOf.map((e) {
                      return FurnishingSetComponentItem(
                        furnishing: assetData.furnishings[e.furnishingId]!,
                        quantity: e.quantity,
                      );
                    }).toList(),
                  )],
                );
              },
            );
          },
        );
      },
    );
  }
}
