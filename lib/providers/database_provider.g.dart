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
String _$bookmarksHash() => r'86dd4ed01a2dd48177a5ff58aa3c290147d5ac06';

/// See also [bookmarks].
@ProviderFor(bookmarks)
final bookmarksProvider =
    AutoDisposeStreamProvider<List<BookmarkWithDetails>>.internal(
  bookmarks,
  name: r'bookmarksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$bookmarksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BookmarksRef = AutoDisposeStreamProviderRef<List<BookmarkWithDetails>>;
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
