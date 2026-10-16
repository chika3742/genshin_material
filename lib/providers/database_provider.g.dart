// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appDatabase)
final appDatabaseProvider = AppDatabaseProvider._();

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: false,
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

String _$appDatabaseHash() => r'44154e51c3f3079ee293d8ad0ebd1e17cca871ed';

@ProviderFor(bookmarks)
final bookmarksProvider = BookmarksFamily._();

final class BookmarksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MaterialBookmark>>,
          List<MaterialBookmark>,
          Stream<List<MaterialBookmark>>
        >
    with
        $FutureModifier<List<MaterialBookmark>>,
        $StreamProvider<List<MaterialBookmark>> {
  BookmarksProvider._({
    required BookmarksFamily super.from,
    required ({
      String? groupHash,
      List<String>? hashes,
      ({bool hasWeapon, String? materialId})? materialFilter,
    })
    super.argument,
  }) : super(
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
  $StreamProviderElement<List<MaterialBookmark>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<MaterialBookmark>> create(Ref ref) {
    final argument =
        this.argument
            as ({
              String? groupHash,
              List<String>? hashes,
              ({bool hasWeapon, String? materialId})? materialFilter,
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

String _$bookmarksHash() => r'004b937a485f051ef5096db5af0424733b400ce8';

final class BookmarksFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<List<MaterialBookmark>>,
          ({
            String? groupHash,
            List<String>? hashes,
            ({bool hasWeapon, String? materialId})? materialFilter,
          })
        > {
  BookmarksFamily._()
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
    ({bool hasWeapon, String? materialId})? materialFilter,
  }) => BookmarksProvider._(
    argument: (
      groupHash: groupHash,
      hashes: hashes,
      materialFilter: materialFilter,
    ),
    from: this,
  );

  @override
  String toString() => r'bookmarksProvider';
}
