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
          List<BookmarkGroup>,
          List<BookmarkGroup>,
          List<BookmarkGroup>
        >
    with $Provider<List<BookmarkGroup>> {
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
  $ProviderElement<List<BookmarkGroup>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<BookmarkGroup> create(Ref ref) {
    return bookmarkGroups(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<BookmarkGroup> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<BookmarkGroup>>(value),
    );
  }
}

String _$bookmarkGroupsHash() => r'609b7007be3a09576fbd069388fb062405e00388';
