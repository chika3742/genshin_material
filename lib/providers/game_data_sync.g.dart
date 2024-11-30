// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_data_sync.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$levelBagSyncStateNotifierHash() =>
    r'27df631d4676340eb86435e08768f7df2c16b087';

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

abstract class _$LevelBagSyncStateNotifier
    extends BuildlessAutoDisposeNotifier<GameDataSyncStatus> {
  late final String? variantId;
  late final String? weaponId;

  GameDataSyncStatus build({
    String? variantId,
    String? weaponId,
  });
}

/// See also [LevelBagSyncStateNotifier].
@ProviderFor(LevelBagSyncStateNotifier)
const levelBagSyncStateNotifierProvider = LevelBagSyncStateNotifierFamily();

/// See also [LevelBagSyncStateNotifier].
class LevelBagSyncStateNotifierFamily extends Family<GameDataSyncStatus> {
  /// See also [LevelBagSyncStateNotifier].
  const LevelBagSyncStateNotifierFamily();

  /// See also [LevelBagSyncStateNotifier].
  LevelBagSyncStateNotifierProvider call({
    String? variantId,
    String? weaponId,
  }) {
    return LevelBagSyncStateNotifierProvider(
      variantId: variantId,
      weaponId: weaponId,
    );
  }

  @override
  LevelBagSyncStateNotifierProvider getProviderOverride(
    covariant LevelBagSyncStateNotifierProvider provider,
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
  String? get name => r'levelBagSyncStateNotifierProvider';
}

/// See also [LevelBagSyncStateNotifier].
class LevelBagSyncStateNotifierProvider extends AutoDisposeNotifierProviderImpl<
    LevelBagSyncStateNotifier, GameDataSyncStatus> {
  /// See also [LevelBagSyncStateNotifier].
  LevelBagSyncStateNotifierProvider({
    String? variantId,
    String? weaponId,
  }) : this._internal(
          () => LevelBagSyncStateNotifier()
            ..variantId = variantId
            ..weaponId = weaponId,
          from: levelBagSyncStateNotifierProvider,
          name: r'levelBagSyncStateNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$levelBagSyncStateNotifierHash,
          dependencies: LevelBagSyncStateNotifierFamily._dependencies,
          allTransitiveDependencies:
              LevelBagSyncStateNotifierFamily._allTransitiveDependencies,
          variantId: variantId,
          weaponId: weaponId,
        );

  LevelBagSyncStateNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.variantId,
    required this.weaponId,
  }) : super.internal();

  final String? variantId;
  final String? weaponId;

  @override
  GameDataSyncStatus runNotifierBuild(
    covariant LevelBagSyncStateNotifier notifier,
  ) {
    return notifier.build(
      variantId: variantId,
      weaponId: weaponId,
    );
  }

  @override
  Override overrideWith(LevelBagSyncStateNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: LevelBagSyncStateNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<LevelBagSyncStateNotifier,
      GameDataSyncStatus> createElement() {
    return _LevelBagSyncStateNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LevelBagSyncStateNotifierProvider &&
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
mixin LevelBagSyncStateNotifierRef
    on AutoDisposeNotifierProviderRef<GameDataSyncStatus> {
  /// The parameter `variantId` of this provider.
  String? get variantId;

  /// The parameter `weaponId` of this provider.
  String? get weaponId;
}

class _LevelBagSyncStateNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<LevelBagSyncStateNotifier,
        GameDataSyncStatus> with LevelBagSyncStateNotifierRef {
  _LevelBagSyncStateNotifierProviderElement(super.provider);

  @override
  String? get variantId =>
      (origin as LevelBagSyncStateNotifierProvider).variantId;
  @override
  String? get weaponId =>
      (origin as LevelBagSyncStateNotifierProvider).weaponId;
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
