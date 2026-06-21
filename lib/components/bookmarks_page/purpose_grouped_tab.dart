import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../i18n/strings.g.dart";
import "../../models/material_bookmark_frame.dart";
import "../../view_models/bookmarks/purpose_grouped_bookmark_list_view_model.dart";
import "../center_text.dart";
import "../material_item.dart";
import "list_item_container.dart";
import "purpose_detail_bottom_sheet.dart";

class BookmarksPurposeGroupedTab extends ConsumerWidget {
  const BookmarksPurposeGroupedTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(purposeGroupedBookmarkListViewModelProvider);

    if (state.groups.isEmpty) {
      return CenterText(tr.bookmarksPage.noBookmarks);
    }

    return ReorderableListView.builder(
      itemCount: state.groups.length,
      padding: const EdgeInsets.only(top: 8),
      onReorderItem: ref.read(purposeGroupedBookmarkListViewModelProvider.notifier).reorder,
      buildDefaultDragHandles: false,
      itemBuilder: (context, index) {
        final group = state.groups[index];

        return Column(
          key: ValueKey(group.hash),
          children: [
            BookmarkListItemContainer(
              index: index,
              group: group,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  for (final MapEntry(key: materialId, value: items) in state.sortedBookmarks[group.hash]!.entries)
                    MaterialItem(
                      key: ValueKey("${group.hash}:$materialId"),
                      item: MaterialCardMaterial.fromBookmarks(items),
                      usage: MaterialUsage(
                        characterId: group.characterId,
                        weaponId: items.first.group.weaponId,
                      ),
                      hashes: items.map((e) => e.item.hash).toList(),
                      targetType: .fromWeaponNullity(items.first.group.weaponId),
                    ),
                  IconButton(
                    icon: const Icon(Symbols.expand_content),
                    iconSize: 28,
                    onPressed: () {
                      showPurposeBookmarkDetailBottomSheet(
                        context: context,
                        groupHash: group.hash,
                      );
                    },
                  ),
                ],
              ),
            ),
            if (index < state.groups.length - 1)
              Divider(indent: 16, endIndent: 16),
          ],
        );
      },
    );
  }
}
