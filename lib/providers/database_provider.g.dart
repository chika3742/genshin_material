// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'949aad4bd88cefe20d76eb16900b182b5fcb494c';

/// See also [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = AutoDisposeProvider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppDatabaseRef = AutoDisposeProviderRef<AppDatabase>;
String _$bookmarksHash() => r'd654e804aa5c83dc60a31da780e225fed6aec8c6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [bookmarks].
@ProviderFor(bookmarks)
const bookmarksProvider = BookmarksFamily();

/// See also [bookmarks].
class BookmarksFamily extends Family<AsyncValue<List<BookmarkWithDetails>>> {
  /// See also [bookmarks].
  const BookmarksFamily();

  /// See also [bookmarks].
  BookmarksProvider call({
    String? groupHash,
    List<String>? hashes,
    ({bool hasWeapon, String? materialId})? materialFilter,
  }) {
    return BookmarksProvider(
      groupHash: groupHash,
      hashes: hashes,
      materialFilter: materialFilter,
    );
  }

  @override
  BookmarksProvider getProviderOverride(
    covariant BookmarksProvider provider,
  ) {
    return call(
      groupHash: provider.groupHash,
      hashes: provider.hashes,
      materialFilter: provider.materialFilter,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'bookmarksProvider';
}

/// See also [bookmarks].
class BookmarksProvider
    extends AutoDisposeStreamProvider<List<BookmarkWithDetails>> {
  /// See also [bookmarks].
  BookmarksProvider({
    String? groupHash,
    List<String>? hashes,
    ({bool hasWeapon, String? materialId})? materialFilter,
  }) : this._internal(
          (ref) => bookmarks(
            ref as BookmarksRef,
            groupHash: groupHash,
            hashes: hashes,
            materialFilter: materialFilter,
          ),
          from: bookmarksProvider,
          name: r'bookmarksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bookmarksHash,
          dependencies: BookmarksFamily._dependencies,
          allTransitiveDependencies: BookmarksFamily._allTransitiveDependencies,
          groupHash: groupHash,
          hashes: hashes,
          materialFilter: materialFilter,
        );

  BookmarksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupHash,
    required this.hashes,
    required this.materialFilter,
  }) : super.internal();

  final String? groupHash;
  final List<String>? hashes;
  final ({bool hasWeapon, String? materialId})? materialFilter;

  @override
  Override overrideWith(
    Stream<List<BookmarkWithDetails>> Function(BookmarksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BookmarksProvider._internal(
        (ref) => create(ref as BookmarksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupHash: groupHash,
        hashes: hashes,
        materialFilter: materialFilter,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<BookmarkWithDetails>> createElement() {
    return _BookmarksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BookmarksProvider &&
        other.groupHash == groupHash &&
        other.hashes == hashes &&
        other.materialFilter == materialFilter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupHash.hashCode);
    hash = _SystemHash.combine(hash, hashes.hashCode);
    hash = _SystemHash.combine(hash, materialFilter.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BookmarksRef on AutoDisposeStreamProviderRef<List<BookmarkWithDetails>> {
  /// The parameter `groupHash` of this provider.
  String? get groupHash;

  /// The parameter `hashes` of this provider.
  List<String>? get hashes;

  /// The parameter `materialFilter` of this provider.
  ({bool hasWeapon, String? materialId})? get materialFilter;
}

class _BookmarksProviderElement
    extends AutoDisposeStreamProviderElement<List<BookmarkWithDetails>>
    with BookmarksRef {
  _BookmarksProviderElement(super.provider);

  @override
  String? get groupHash => (origin as BookmarksProvider).groupHash;
  @override
  List<String>? get hashes => (origin as BookmarksProvider).hashes;
  @override
  ({bool hasWeapon, String? materialId})? get materialFilter =>
      (origin as BookmarksProvider).materialFilter;
}

String _$bookmarkOrderHash() => r'b987d2b163a21db585bdaa0ee431a24c4b6f50ce';

/// See also [bookmarkOrder].
@ProviderFor(bookmarkOrder)
final bookmarkOrderProvider = AutoDisposeStreamProvider<List<String>>.internal(
  bookmarkOrder,
  name: r'bookmarkOrderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bookmarkOrderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BookmarkOrderRef = AutoDisposeStreamProviderRef<List<String>>;
String _$bagCountHash() => r'74b3d241af5da3b656dfb1f0cdf221fe1fae2914';

/// See also [bagCount].
@ProviderFor(bagCount)
const bagCountProvider = BagCountFamily();

/// See also [bagCount].
class BagCountFamily extends Family<AsyncValue<int?>> {
  /// See also [bagCount].
  const BagCountFamily();

  /// See also [bagCount].
  BagCountProvider call(
    int hyvId,
  ) {
    return BagCountProvider(
      hyvId,
    );
  }

  @override
  BagCountProvider getProviderOverride(
    covariant BagCountProvider provider,
  ) {
    return call(
      provider.hyvId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'bagCountProvider';
}

/// See also [bagCount].
class BagCountProvider extends AutoDisposeStreamProvider<int?> {
  /// See also [bagCount].
  BagCountProvider(
    int hyvId,
  ) : this._internal(
          (ref) => bagCount(
            ref as BagCountRef,
            hyvId,
          ),
          from: bagCountProvider,
          name: r'bagCountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bagCountHash,
          dependencies: BagCountFamily._dependencies,
          allTransitiveDependencies: BagCountFamily._allTransitiveDependencies,
          hyvId: hyvId,
        );

  BagCountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.hyvId,
  }) : super.internal();

  final int hyvId;

  @override
  Override overrideWith(
    Stream<int?> Function(BagCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BagCountProvider._internal(
        (ref) => create(ref as BagCountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        hyvId: hyvId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<int?> createElement() {
    return _BagCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BagCountProvider && other.hyvId == hyvId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hyvId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BagCountRef on AutoDisposeStreamProviderRef<int?> {
  /// The parameter `hyvId` of this provider.
  int get hyvId;
}

class _BagCountProviderElement extends AutoDisposeStreamProviderElement<int?>
    with BagCountRef {
  _BagCountProviderElement(super.provider);

  @override
  int get hyvId => (origin as BagCountProvider).hyvId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
