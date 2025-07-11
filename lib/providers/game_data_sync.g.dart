// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_data_sync.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gameDataSyncHash() => r'0e2f544f694314e04bb6cd1e4d3c21738b04cabb';

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

/// See also [gameDataSync].
@ProviderFor(gameDataSync)
const gameDataSyncProvider = GameDataSyncFamily();

/// See also [gameDataSync].
class GameDataSyncFamily extends Family<AsyncValue<GameDataSyncResult>> {
  /// See also [gameDataSync].
  const GameDataSyncFamily();

  /// See also [gameDataSync].
  GameDataSyncProvider call({
    required String variantId,
    String? weaponId,
  }) {
    return GameDataSyncProvider(
      variantId: variantId,
      weaponId: weaponId,
    );
  }

  @override
  GameDataSyncProvider getProviderOverride(
    covariant GameDataSyncProvider provider,
  ) {
    return call(
      variantId: provider.variantId,
      weaponId: provider.weaponId,
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
  String? get name => r'gameDataSyncProvider';
}

/// See also [gameDataSync].
class GameDataSyncProvider
    extends AutoDisposeFutureProvider<GameDataSyncResult> {
  /// See also [gameDataSync].
  GameDataSyncProvider({
    required String variantId,
    String? weaponId,
  }) : this._internal(
          (ref) => gameDataSync(
            ref as GameDataSyncRef,
            variantId: variantId,
            weaponId: weaponId,
          ),
          from: gameDataSyncProvider,
          name: r'gameDataSyncProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gameDataSyncHash,
          dependencies: GameDataSyncFamily._dependencies,
          allTransitiveDependencies:
              GameDataSyncFamily._allTransitiveDependencies,
          variantId: variantId,
          weaponId: weaponId,
        );

  GameDataSyncProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.variantId,
    required this.weaponId,
  }) : super.internal();

  final String variantId;
  final String? weaponId;

  @override
  Override overrideWith(
    FutureOr<GameDataSyncResult> Function(GameDataSyncRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GameDataSyncProvider._internal(
        (ref) => create(ref as GameDataSyncRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        variantId: variantId,
        weaponId: weaponId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GameDataSyncResult> createElement() {
    return _GameDataSyncProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameDataSyncProvider &&
        other.variantId == variantId &&
        other.weaponId == weaponId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, variantId.hashCode);
    hash = _SystemHash.combine(hash, weaponId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GameDataSyncRef on AutoDisposeFutureProviderRef<GameDataSyncResult> {
  /// The parameter `variantId` of this provider.
  String get variantId;

  /// The parameter `weaponId` of this provider.
  String? get weaponId;
}

class _GameDataSyncProviderElement
    extends AutoDisposeFutureProviderElement<GameDataSyncResult>
    with GameDataSyncRef {
  _GameDataSyncProviderElement(super.provider);

  @override
  String get variantId => (origin as GameDataSyncProvider).variantId;
  @override
  String? get weaponId => (origin as GameDataSyncProvider).weaponId;
}

String _$gameDataSyncStateHash() => r'4388195eeb5e3676229c30ce10c6c440113e5807';

/// See also [gameDataSyncState].
@ProviderFor(gameDataSyncState)
const gameDataSyncStateProvider = GameDataSyncStateFamily();

/// See also [gameDataSyncState].
class GameDataSyncStateFamily extends Family<GameDataSyncStatus> {
  /// See also [gameDataSyncState].
  const GameDataSyncStateFamily();

  /// See also [gameDataSyncState].
  GameDataSyncStateProvider call({
    required String variantId,
    String? weaponId,
  }) {
    return GameDataSyncStateProvider(
      variantId: variantId,
      weaponId: weaponId,
    );
  }

  @override
  GameDataSyncStateProvider getProviderOverride(
    covariant GameDataSyncStateProvider provider,
  ) {
    return call(
      variantId: provider.variantId,
      weaponId: provider.weaponId,
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
  String? get name => r'gameDataSyncStateProvider';
}

/// See also [gameDataSyncState].
class GameDataSyncStateProvider
    extends AutoDisposeProvider<GameDataSyncStatus> {
  /// See also [gameDataSyncState].
  GameDataSyncStateProvider({
    required String variantId,
    String? weaponId,
  }) : this._internal(
          (ref) => gameDataSyncState(
            ref as GameDataSyncStateRef,
            variantId: variantId,
            weaponId: weaponId,
          ),
          from: gameDataSyncStateProvider,
          name: r'gameDataSyncStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gameDataSyncStateHash,
          dependencies: GameDataSyncStateFamily._dependencies,
          allTransitiveDependencies:
              GameDataSyncStateFamily._allTransitiveDependencies,
          variantId: variantId,
          weaponId: weaponId,
        );

  GameDataSyncStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.variantId,
    required this.weaponId,
  }) : super.internal();

  final String variantId;
  final String? weaponId;

  @override
  Override overrideWith(
    GameDataSyncStatus Function(GameDataSyncStateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GameDataSyncStateProvider._internal(
        (ref) => create(ref as GameDataSyncStateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        variantId: variantId,
        weaponId: weaponId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<GameDataSyncStatus> createElement() {
    return _GameDataSyncStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameDataSyncStateProvider &&
        other.variantId == variantId &&
        other.weaponId == weaponId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, variantId.hashCode);
    hash = _SystemHash.combine(hash, weaponId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GameDataSyncStateRef on AutoDisposeProviderRef<GameDataSyncStatus> {
  /// The parameter `variantId` of this provider.
  String get variantId;

  /// The parameter `weaponId` of this provider.
  String? get weaponId;
}

class _GameDataSyncStateProviderElement
    extends AutoDisposeProviderElement<GameDataSyncStatus>
    with GameDataSyncStateRef {
  _GameDataSyncStateProviderElement(super.provider);

  @override
  String get variantId => (origin as GameDataSyncStateProvider).variantId;
  @override
  String? get weaponId => (origin as GameDataSyncStateProvider).weaponId;
}

String _$gameDataSyncCachedHash() =>
    r'e7d57802dab4abf71287f2fbcfce1ba367b07ea0';

abstract class _$GameDataSyncCached
    extends BuildlessAutoDisposeAsyncNotifier<GameDataSyncResult?> {
  late final String variantId;
  late final String? weaponId;

  FutureOr<GameDataSyncResult?> build({
    required String variantId,
    String? weaponId,
  });
}

/// See also [GameDataSyncCached].
@ProviderFor(GameDataSyncCached)
const gameDataSyncCachedProvider = GameDataSyncCachedFamily();

/// See also [GameDataSyncCached].
class GameDataSyncCachedFamily extends Family<AsyncValue<GameDataSyncResult?>> {
  /// See also [GameDataSyncCached].
  const GameDataSyncCachedFamily();

  /// See also [GameDataSyncCached].
  GameDataSyncCachedProvider call({
    required String variantId,
    String? weaponId,
  }) {
    return GameDataSyncCachedProvider(
      variantId: variantId,
      weaponId: weaponId,
    );
  }

  @override
  GameDataSyncCachedProvider getProviderOverride(
    covariant GameDataSyncCachedProvider provider,
  ) {
    return call(
      variantId: provider.variantId,
      weaponId: provider.weaponId,
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
  String? get name => r'gameDataSyncCachedProvider';
}

/// See also [GameDataSyncCached].
class GameDataSyncCachedProvider extends AutoDisposeAsyncNotifierProviderImpl<
    GameDataSyncCached, GameDataSyncResult?> {
  /// See also [GameDataSyncCached].
  GameDataSyncCachedProvider({
    required String variantId,
    String? weaponId,
  }) : this._internal(
          () => GameDataSyncCached()
            ..variantId = variantId
            ..weaponId = weaponId,
          from: gameDataSyncCachedProvider,
          name: r'gameDataSyncCachedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gameDataSyncCachedHash,
          dependencies: GameDataSyncCachedFamily._dependencies,
          allTransitiveDependencies:
              GameDataSyncCachedFamily._allTransitiveDependencies,
          variantId: variantId,
          weaponId: weaponId,
        );

  GameDataSyncCachedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.variantId,
    required this.weaponId,
  }) : super.internal();

  final String variantId;
  final String? weaponId;

  @override
  FutureOr<GameDataSyncResult?> runNotifierBuild(
    covariant GameDataSyncCached notifier,
  ) {
    return notifier.build(
      variantId: variantId,
      weaponId: weaponId,
    );
  }

  @override
  Override overrideWith(GameDataSyncCached Function() create) {
    return ProviderOverride(
      origin: this,
      override: GameDataSyncCachedProvider._internal(
        () => create()
          ..variantId = variantId
          ..weaponId = weaponId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        variantId: variantId,
        weaponId: weaponId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<GameDataSyncCached,
      GameDataSyncResult?> createElement() {
    return _GameDataSyncCachedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameDataSyncCachedProvider &&
        other.variantId == variantId &&
        other.weaponId == weaponId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, variantId.hashCode);
    hash = _SystemHash.combine(hash, weaponId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GameDataSyncCachedRef
    on AutoDisposeAsyncNotifierProviderRef<GameDataSyncResult?> {
  /// The parameter `variantId` of this provider.
  String get variantId;

  /// The parameter `weaponId` of this provider.
  String? get weaponId;
}

class _GameDataSyncCachedProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GameDataSyncCached,
        GameDataSyncResult?> with GameDataSyncCachedRef {
  _GameDataSyncCachedProviderElement(super.provider);

  @override
  String get variantId => (origin as GameDataSyncCachedProvider).variantId;
  @override
  String? get weaponId => (origin as GameDataSyncCachedProvider).weaponId;
}

String _$resinSyncStateNotifierHash() =>
    r'98ba1eb809d08f0973e582aa017f89845efb2af3';

/// See also [ResinSyncStateNotifier].
@ProviderFor(ResinSyncStateNotifier)
final resinSyncStateNotifierProvider = AutoDisposeNotifierProvider<
    ResinSyncStateNotifier, GameDataSyncStatus>.internal(
  ResinSyncStateNotifier.new,
  name: r'resinSyncStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$resinSyncStateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ResinSyncStateNotifier = AutoDisposeNotifier<GameDataSyncStatus>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
