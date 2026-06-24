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
import "../ui_core/page_handoff_horizontal_scroll.dart";

class BookmarksPage extends HookConsumerWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 4);
    final pageController = usePageController();

    // PageView → TabBar: smoothly track the page offset on the TabBar
    // indicator. `tabController.indexIsChanging` filters out animations the
    // TabBar itself is driving, preventing feedback loops.
    useEffect(() {
      void sync() {
        if (!pageController.hasClients) return;
        final page = pageController.page;
        if (page == null) return;
        if (tabController.indexIsChanging) return;
        final newIndex = page.round();
        if (tabController.index != newIndex) {
          tabController.index = newIndex;
        }
        tabController.offset = (page - newIndex).clamp(-1.0, 1.0);
      }
      pageController.addListener(sync);
      return () => pageController.removeListener(sync);
    }, [pageController, tabController]);

    // TabBar tap → PageView: animate the PageView when the TabBar requests
    // an animated index change (i.e., user tapped a tab).
    useEffect(() {
      void sync() {
        if (!tabController.indexIsChanging) return;
        if (!pageController.hasClients) return;
        pageController.animateToPage(
          tabController.index,
          duration: const Duration(milliseconds: 300),
          curve: Easing.standard,
        );
      }
      tabController.addListener(sync);
      return () => tabController.removeListener(sync);
    }, [tabController, pageController]);

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
        AsyncData() => PageHandoffScope(
          controller: pageController,
          child: PageView(
            controller: pageController,
            children: [
              BookmarksPurposeGroupedTab(),
              BookmarksMaterialGroupedTab(),
              BookmarksArtifactsTab(),
              BookmarkFurnishingSetsTab(),
            ],
          ),
        ),
        AsyncError(:final error) => CenterText(getErrorMessage(error)),
      },
    );
  }
}
