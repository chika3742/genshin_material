import "package:flutter_hooks/flutter_hooks.dart" hide useTabController;
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_ui/material_ui.dart";

import "../components/bookmarks_page/artifacts_tab.dart";
import "../components/bookmarks_page/furnishing_sets_tab.dart";
import "../components/bookmarks_page/material_grouped_tab.dart";
import "../components/bookmarks_page/purpose_grouped_tab.dart";
import "../components/center_text.dart";
import "../components/game_data_sync_indicator.dart";
import "../hooks/use_tab_controller.dart";
import "../i18n/strings.g.dart";
import "../providers/database_provider.dart";
import "../providers/hoyolab_game_server.dart";
import "../ui_core/error_messages.dart";
import "../ui_core/page_handoff_horizontal_scroll.dart";
import "../view_models/bookmarks/bookmark_bag_counts.dart";

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

    final selectedTabIndex = useState(0);
    useEffect(() {
      void listener() {
        selectedTabIndex.value = tabController.index;
      }
      tabController.addListener(listener);
      return () {
        tabController.removeListener(listener);
      };
    }, [tabController]);

    final bagSyncStatus = [0, 1].contains(selectedTabIndex.value)
        ? ref.watch(bookmarkBagCountsProvider.select(GameDataSyncStatus.fromAsyncValue))
        : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.bookmarks),
        actions: [
          if (ref.watch(isLinkedWithHoyolabProvider) && bagSyncStatus != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GameDataSyncIndicator(
                status: bagSyncStatus,
              ),
            ),
        ],
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
              BookmarksPurposeGroupedTab(key: PageStorageKey("bookmarks_purposes")),
              BookmarksMaterialGroupedTab(key: PageStorageKey("bookmarks_materials")),
              BookmarksArtifactsTab(key: PageStorageKey("bookmarks_artifacts")),
              BookmarkFurnishingSetsTab(key: PageStorageKey("bookmarks_furnishing-sets")),
            ],
          ),
        ),
        AsyncError(:final error) => CenterText(getErrorMessage(error)),
      },
    );
  }
}
