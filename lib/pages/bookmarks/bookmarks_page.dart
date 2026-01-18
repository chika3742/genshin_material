import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../../components/center_text.dart";
import "../../i18n/strings.g.dart";
import "../../providers/database_provider.dart";
import "../../ui_core/error_messages.dart";
import "furnishing_list.dart";
import "material_grouped_list.dart";
import "purpose_grouped_list.dart";

class BookmarksPage extends HookConsumerWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 3);

    final bookmarks = ref.watch(bookmarksProvider());

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.bookmarks),
        bottom: bookmarks.value != null
            ? TabBar(
                controller: tabController,
                tabs: [
                  Tab(text: tr.bookmarksPage.byPurpose),
                  Tab(text: tr.bookmarksPage.byMaterial),
                  Tab(text: tr.bookmarksPage.furnishings),
                ],
              )
            : null,
      ),
      body: switch(bookmarks) {
        AsyncLoading() => const Center(child: CircularProgressIndicator()),
        AsyncData() => TabBarView(
          controller: tabController,
          children: const [
            PurposeGroupedBookmarkList(),
            MaterialGroupedBookmarkList(),
            FurnishingBookmarkList(),
          ],
        ),
        AsyncError(:final error) => CenterText(getErrorMessage(error)),
      },
    );
  }
}
