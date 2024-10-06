// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_data_sync.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$characterSyncStateNotifierHash() =>
    r'911747a239884fec3211248cee42d07a283f04cb';

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

abstract class _$CharacterSyncStateNotifier
    extends BuildlessAutoDisposeNotifier<GameDataSyncStatus> {
  late final String variantId;

  GameDataSyncStatus build(
    String variantId,
  );
}

/// See also [CharacterSyncStateNotifier].
@ProviderFor(CharacterSyncStateNotifier)
const characterSyncStateNotifierProvider = CharacterSyncStateNotifierFamily();

/// See also [CharacterSyncStateNotifier].
class CharacterSyncStateNotifierFamily extends Family<GameDataSyncStatus> {
  /// See also [CharacterSyncStateNotifier].
  const CharacterSyncStateNotifierFamily();

  /// See also [CharacterSyncStateNotifier].
  CharacterSyncStateNotifierProvider call(
    String variantId,
  ) {
    return CharacterSyncStateNotifierProvider(
      variantId,
    );
  }

  @override
  CharacterSyncStateNotifierProvider getProviderOverride(
    covariant CharacterSyncStateNotifierProvider provider,
  ) {
    return call(
      provider.variantId,
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
  String? get name => r'characterSyncStateNotifierProvider';
}

/// See also [CharacterSyncStateNotifier].
class CharacterSyncStateNotifierProvider
    extends AutoDisposeNotifierProviderImpl<CharacterSyncStateNotifier,
        GameDataSyncStatus> {
  /// See also [CharacterSyncStateNotifier].
  CharacterSyncStateNotifierProvider(
    String variantId,
  ) : this._internal(
          () => CharacterSyncStateNotifier()..variantId = variantId,
          from: characterSyncStateNotifierProvider,
          name: r'characterSyncStateNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$characterSyncStateNotifierHash,
          dependencies: CharacterSyncStateNotifierFamily._dependencies,
          allTransitiveDependencies:
              CharacterSyncStateNotifierFamily._allTransitiveDependencies,
          variantId: variantId,
        );

  CharacterSyncStateNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.variantId,
  }) : super.internal();

  final String variantId;

  @override
  GameDataSyncStatus runNotifierBuild(
    covariant CharacterSyncStateNotifier notifier,
  ) {
    return notifier.build(
      variantId,
    );
  }

  @override
  Override overrideWith(CharacterSyncStateNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CharacterSyncStateNotifierProvider._internal(
        () => create()..variantId = variantId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        variantId: variantId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CharacterSyncStateNotifier,
      GameDataSyncStatus> createElement() {
    return _CharacterSyncStateNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CharacterSyncStateNotifierProvider &&
        other.variantId == variantId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, variantId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CharacterSyncStateNotifierRef
    on AutoDisposeNotifierProviderRef<GameDataSyncStatus> {
  /// The parameter `variantId` of this provider.
  String get variantId;
}

class _CharacterSyncStateNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<CharacterSyncStateNotifier,
        GameDataSyncStatus> with CharacterSyncStateNotifierRef {
  _CharacterSyncStateNotifierProviderElement(super.provider);

  @override
  String get variantId =>
      (origin as CharacterSyncStateNotifierProvider).variantId;
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
