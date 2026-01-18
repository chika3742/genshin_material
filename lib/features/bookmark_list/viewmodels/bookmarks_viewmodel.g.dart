// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmarks_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for bookmark groups (transformed and cached)
///
/// Watches the database directly and caches transformation results.
/// Does not hold derived data in state; DB is the single source of truth.
///
/// This provider follows the same pattern as the existing bookmarks.dart page,
/// watching the database providers and transforming the data reactively.

@ProviderFor(bookmarkGroups)
final bookmarkGroupsProvider = BookmarkGroupsProvider._();

/// Provider for bookmark groups (transformed and cached)
///
/// Watches the database directly and caches transformation results.
/// Does not hold derived data in state; DB is the single source of truth.
///
/// This provider follows the same pattern as the existing bookmarks.dart page,
/// watching the database providers and transforming the data reactively.

final class BookmarkGroupsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BookmarkGroup>>,
          List<BookmarkGroup>,
          FutureOr<List<BookmarkGroup>>
        >
    with
        $FutureModifier<List<BookmarkGroup>>,
        $FutureProvider<List<BookmarkGroup>> {
  /// Provider for bookmark groups (transformed and cached)
  ///
  /// Watches the database directly and caches transformation results.
  /// Does not hold derived data in state; DB is the single source of truth.
  ///
  /// This provider follows the same pattern as the existing bookmarks.dart page,
  /// watching the database providers and transforming the data reactively.
  BookmarkGroupsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookmarkGroupsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookmarkGroupsHash();

  @$internal
  @override
  $FutureProviderElement<List<BookmarkGroup>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BookmarkGroup>> create(Ref ref) {
    return bookmarkGroups(ref);
  }
}

String _$bookmarkGroupsHash() => r'7d524c1e54d3129f6ef7ba252d7e3af15f54dcfd';
