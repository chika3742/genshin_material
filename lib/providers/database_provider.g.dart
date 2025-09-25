// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appDatabase)
const appDatabaseProvider = AppDatabaseProvider._();

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  const AppDatabaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'appDatabaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'949aad4bd88cefe20d76eb16900b182b5fcb494c';

@ProviderFor(bookmarks)
const bookmarksProvider = BookmarksFamily._();

final class BookmarksProvider extends $FunctionalProvider<
        AsyncValue<List<BookmarkWithDetails>>,
        List<BookmarkWithDetails>,
        Stream<List<BookmarkWithDetails>>>
    with
        $FutureModifier<List<BookmarkWithDetails>>,
        $StreamProvider<List<BookmarkWithDetails>> {
  const BookmarksProvider._(
      {required BookmarksFamily super.from,
      required ({
        String? groupHash,
        List<String>? hashes,
        ({
          bool hasWeapon,
          String? materialId,
        })? materialFilter,
      })
          super.argument})
      : super(
          retry: null,
          name: r'bookmarksProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$bookmarksHash();

  @override
  String toString() {
    return r'bookmarksProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<List<BookmarkWithDetails>> $createElement(
          $ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<BookmarkWithDetails>> create(Ref ref) {
    final argument = this.argument as ({
      String? groupHash,
      List<String>? hashes,
      ({
        bool hasWeapon,
        String? materialId,
      })? materialFilter,
    });
    return bookmarks(
      ref,
      groupHash: argument.groupHash,
      hashes: argument.hashes,
      materialFilter: argument.materialFilter,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BookmarksProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookmarksHash() => r'd654e804aa5c83dc60a31da780e225fed6aec8c6';

final class BookmarksFamily extends $Family
    with
        $FunctionalFamilyOverride<
            Stream<List<BookmarkWithDetails>>,
            ({
              String? groupHash,
              List<String>? hashes,
              ({
                bool hasWeapon,
                String? materialId,
              })? materialFilter,
            })> {
  const BookmarksFamily._()
      : super(
          retry: null,
          name: r'bookmarksProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  BookmarksProvider call({
    String? groupHash,
    List<String>? hashes,
    ({
      bool hasWeapon,
      String? materialId,
    })? materialFilter,
  }) =>
      BookmarksProvider._(argument: (
        groupHash: groupHash,
        hashes: hashes,
        materialFilter: materialFilter,
      ), from: this);

  @override
  String toString() => r'bookmarksProvider';
}

@ProviderFor(bookmarkOrder)
const bookmarkOrderProvider = BookmarkOrderProvider._();

final class BookmarkOrderProvider extends $FunctionalProvider<
        AsyncValue<List<String>>, List<String>, Stream<List<String>>>
    with $FutureModifier<List<String>>, $StreamProvider<List<String>> {
  const BookmarkOrderProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'bookmarkOrderProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$bookmarkOrderHash();

  @$internal
  @override
  $StreamProviderElement<List<String>> $createElement(
          $ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<String>> create(Ref ref) {
    return bookmarkOrder(ref);
  }
}

String _$bookmarkOrderHash() => r'b987d2b163a21db585bdaa0ee431a24c4b6f50ce';
