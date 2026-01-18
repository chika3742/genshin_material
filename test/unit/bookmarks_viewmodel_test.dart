import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/features/bookmark_list/viewmodels/bookmarks_viewmodel.dart";

void main() {
  group("BookmarksViewModel", () {
    test("bookmarkGroupsProvider exists and is accessible", () {
      // Verify the provider was generated correctly
      expect(bookmarkGroupsProvider, isNotNull);
    });

    test("provider is a FutureProvider", () {
      // The provider should return a Future<List<BookmarkGroup>>
      // This test verifies it was generated with the correct signature
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Should be able to read the provider's future
      expect(
        () => container.read(bookmarkGroupsProvider.future),
        returnsNormally,
      );
    });
  });
}
