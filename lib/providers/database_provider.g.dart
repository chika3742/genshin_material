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
String _$furnishingCraftCountHash() =>
    r'd5ad7c07d72514538b73c64477d0569cc434ae86';

/// See also [furnishingCraftCount].
@ProviderFor(furnishingCraftCount)
const furnishingCraftCountProvider = FurnishingCraftCountFamily();

/// See also [furnishingCraftCount].
class FurnishingCraftCountFamily extends Family<AsyncValue<int>> {
  /// See also [furnishingCraftCount].
  const FurnishingCraftCountFamily();

  /// See also [furnishingCraftCount].
  FurnishingCraftCountProvider call(
    String setId,
    String furnishingId,
  ) {
    return FurnishingCraftCountProvider(
      setId,
      furnishingId,
    );
  }

  @override
  FurnishingCraftCountProvider getProviderOverride(
    covariant FurnishingCraftCountProvider provider,
  ) {
    return call(
      provider.setId,
      provider.furnishingId,
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
  String? get name => r'furnishingCraftCountProvider';
}

/// See also [furnishingCraftCount].
class FurnishingCraftCountProvider extends AutoDisposeStreamProvider<int> {
  /// See also [furnishingCraftCount].
  FurnishingCraftCountProvider(
    String setId,
    String furnishingId,
  ) : this._internal(
          (ref) => furnishingCraftCount(
            ref as FurnishingCraftCountRef,
            setId,
            furnishingId,
          ),
          from: furnishingCraftCountProvider,
          name: r'furnishingCraftCountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$furnishingCraftCountHash,
          dependencies: FurnishingCraftCountFamily._dependencies,
          allTransitiveDependencies:
              FurnishingCraftCountFamily._allTransitiveDependencies,
          setId: setId,
          furnishingId: furnishingId,
        );

  FurnishingCraftCountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.setId,
    required this.furnishingId,
  }) : super.internal();

  final String setId;
  final String furnishingId;

  @override
  Override overrideWith(
    Stream<int> Function(FurnishingCraftCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FurnishingCraftCountProvider._internal(
        (ref) => create(ref as FurnishingCraftCountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        setId: setId,
        furnishingId: furnishingId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<int> createElement() {
    return _FurnishingCraftCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FurnishingCraftCountProvider &&
        other.setId == setId &&
        other.furnishingId == furnishingId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, setId.hashCode);
    hash = _SystemHash.combine(hash, furnishingId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FurnishingCraftCountRef on AutoDisposeStreamProviderRef<int> {
  /// The parameter `setId` of this provider.
  String get setId;

  /// The parameter `furnishingId` of this provider.
  String get furnishingId;
}

class _FurnishingCraftCountProviderElement
    extends AutoDisposeStreamProviderElement<int> with FurnishingCraftCountRef {
  _FurnishingCraftCountProviderElement(super.provider);

  @override
  String get setId => (origin as FurnishingCraftCountProvider).setId;
  @override
  String get furnishingId =>
      (origin as FurnishingCraftCountProvider).furnishingId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
