import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../components/bookmarks_page/artifacts_tab.dart";
import "../components/bookmarks_page/furnishing_sets_tab.dart";
import "../components/bookmarks_page/material_grouped_tab.dart";
import "../components/bookmarks_page/purpose_grouped_tab.dart";
import "../components/center_text.dart";
import "../i18n/strings.g.dart";
import "../providers/database_provider.dart";
import "../ui_core/error_messages.dart";

class BookmarksPage extends HookConsumerWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 4);

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
                  Tab(text: tr.bookmarksPage.artifacts),
                  Tab(text: tr.bookmarksPage.furnishings),
                ],
              )
            : null,
      ),
      body: switch(bookmarks) {
        AsyncLoading() => const Center(child: CircularProgressIndicator()),
        AsyncData() => TabBarView(
          controller: tabController,
          children: [
            BookmarksPurposeGroupedTab(),
            BookmarksMaterialGroupedTab(),
            BookmarksArtifactsTab(),
            BookmarkFurnishingSetsTab(),
          ],
        ),
        AsyncError(:final error) => CenterText(getErrorMessage(error)),
      },
    );
  }
}
