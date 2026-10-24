// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_bag_counts.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bookmarkBagCounts)
final bookmarkBagCountsProvider = BookmarkBagCountsProvider._();

final class BookmarkBagCountsProvider
    extends
        $FunctionalProvider<
          AsyncValue<BookmarkBagCountsResult?>,
          BookmarkBagCountsResult?,
          FutureOr<BookmarkBagCountsResult?>
        >
    with
        $FutureModifier<BookmarkBagCountsResult?>,
        $FutureProvider<BookmarkBagCountsResult?> {
  BookmarkBagCountsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookmarkBagCountsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookmarkBagCountsHash();

  @$internal
  @override
  $FutureProviderElement<BookmarkBagCountsResult?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<BookmarkBagCountsResult?> create(Ref ref) {
    return bookmarkBagCounts(ref);
  }
}

String _$bookmarkBagCountsHash() => r'1fd80fbaa60f1a6a52c120ca90ff823fe5b5820f';
