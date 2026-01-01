// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_data_sync.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GameDataSyncCached)
final gameDataSyncCachedProvider = GameDataSyncCachedFamily._();

final class GameDataSyncCachedProvider
    extends $AsyncNotifierProvider<GameDataSyncCached, GameDataSyncResult?> {
  GameDataSyncCachedProvider._({
    required GameDataSyncCachedFamily super.from,
    required ({String variantId, String? weaponId}) super.argument,
  }) : super(
         retry: null,
         name: r'gameDataSyncCachedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$gameDataSyncCachedHash();

  @override
  String toString() {
    return r'gameDataSyncCachedProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  GameDataSyncCached create() => GameDataSyncCached();

  @override
  bool operator ==(Object other) {
    return other is GameDataSyncCachedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$gameDataSyncCachedHash() =>
    r'70b2859e6c90f3195658a36ac0903afc208a73de';

final class GameDataSyncCachedFamily extends $Family
    with
        $ClassFamilyOverride<
          GameDataSyncCached,
          AsyncValue<GameDataSyncResult?>,
          GameDataSyncResult?,
          FutureOr<GameDataSyncResult?>,
          ({String variantId, String? weaponId})
        > {
  GameDataSyncCachedFamily._()
    : super(
        retry: null,
        name: r'gameDataSyncCachedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GameDataSyncCachedProvider call({
    required String variantId,
    String? weaponId,
  }) => GameDataSyncCachedProvider._(
    argument: (variantId: variantId, weaponId: weaponId),
    from: this,
  );

  @override
  String toString() => r'gameDataSyncCachedProvider';
}

abstract class _$GameDataSyncCached
    extends $AsyncNotifier<GameDataSyncResult?> {
  late final _$args = ref.$arg as ({String variantId, String? weaponId});
  String get variantId => _$args.variantId;
  String? get weaponId => _$args.weaponId;

  FutureOr<GameDataSyncResult?> build({
    required String variantId,
    String? weaponId,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<GameDataSyncResult?>, GameDataSyncResult?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<GameDataSyncResult?>, GameDataSyncResult?>,
              AsyncValue<GameDataSyncResult?>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(variantId: _$args.variantId, weaponId: _$args.weaponId),
    );
  }
}

@ProviderFor(_gameDataSync)
final _gameDataSyncProvider = _GameDataSyncFamily._();

final class _GameDataSyncProvider
    extends
        $FunctionalProvider<
          AsyncValue<GameDataSyncResult>,
          GameDataSyncResult,
          FutureOr<GameDataSyncResult>
        >
    with
        $FutureModifier<GameDataSyncResult>,
        $FutureProvider<GameDataSyncResult> {
  _GameDataSyncProvider._({
    required _GameDataSyncFamily super.from,
    required ({String variantId, String? weaponId}) super.argument,
  }) : super(
         retry: null,
         name: r'_gameDataSyncProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$_gameDataSyncHash();

  @override
  String toString() {
    return r'_gameDataSyncProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<GameDataSyncResult> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<GameDataSyncResult> create(Ref ref) {
    final argument = this.argument as ({String variantId, String? weaponId});
    return _gameDataSync(
      ref,
      variantId: argument.variantId,
      weaponId: argument.weaponId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _GameDataSyncProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$_gameDataSyncHash() => r'dd48d3a3a593279016bd22ddbbea47abee914297';

final class _GameDataSyncFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<GameDataSyncResult>,
          ({String variantId, String? weaponId})
        > {
  _GameDataSyncFamily._()
    : super(
        retry: null,
        name: r'_gameDataSyncProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  _GameDataSyncProvider call({required String variantId, String? weaponId}) =>
      _GameDataSyncProvider._(
        argument: (variantId: variantId, weaponId: weaponId),
        from: this,
      );

  @override
  String toString() => r'_gameDataSyncProvider';
}

@ProviderFor(bagLackNum)
final bagLackNumProvider = BagLackNumFamily._();

final class BagLackNumProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, int>?>,
          Map<String, int>?,
          FutureOr<Map<String, int>?>
        >
    with
        $FutureModifier<Map<String, int>?>,
        $FutureProvider<Map<String, int>?> {
  BagLackNumProvider._({
    required BagLackNumFamily super.from,
    required List<GameDataSyncCharacter> super.argument,
  }) : super(
         retry: null,
         name: r'bagLackNumProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bagLackNumHash();

  @override
  String toString() {
    return r'bagLackNumProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Map<String, int>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, int>?> create(Ref ref) {
    final argument = this.argument as List<GameDataSyncCharacter>;
    return bagLackNum(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BagLackNumProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bagLackNumHash() => r'd3f3ff2b19d48c91c5985a4e2090a9b17c128e37';

final class BagLackNumFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Map<String, int>?>,
          List<GameDataSyncCharacter>
        > {
  BagLackNumFamily._()
    : super(
        retry: null,
        name: r'bagLackNumProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BagLackNumProvider call(List<GameDataSyncCharacter> entries) =>
      BagLackNumProvider._(argument: entries, from: this);

  @override
  String toString() => r'bagLackNumProvider';
}

@ProviderFor(gameDataSyncState)
final gameDataSyncStateProvider = GameDataSyncStateFamily._();

final class GameDataSyncStateProvider
    extends
        $FunctionalProvider<
          GameDataSyncStatus?,
          GameDataSyncStatus?,
          GameDataSyncStatus?
        >
    with $Provider<GameDataSyncStatus?> {
  GameDataSyncStateProvider._({
    required GameDataSyncStateFamily super.from,
    required ({String variantId, String? weaponId}) super.argument,
  }) : super(
         retry: null,
         name: r'gameDataSyncStateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$gameDataSyncStateHash();

  @override
  String toString() {
    return r'gameDataSyncStateProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<GameDataSyncStatus?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GameDataSyncStatus? create(Ref ref) {
    final argument = this.argument as ({String variantId, String? weaponId});
    return gameDataSyncState(
      ref,
      variantId: argument.variantId,
      weaponId: argument.weaponId,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameDataSyncStatus? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameDataSyncStatus?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GameDataSyncStateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$gameDataSyncStateHash() => r'90265465213d5cd7f2380c7b60369116ae47fc95';

final class GameDataSyncStateFamily extends $Family
    with
        $FunctionalFamilyOverride<
          GameDataSyncStatus?,
          ({String variantId, String? weaponId})
        > {
  GameDataSyncStateFamily._()
    : super(
        retry: null,
        name: r'gameDataSyncStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GameDataSyncStateProvider call({
    required String variantId,
    String? weaponId,
  }) => GameDataSyncStateProvider._(
    argument: (variantId: variantId, weaponId: weaponId),
    from: this,
  );

  @override
  String toString() => r'gameDataSyncStateProvider';
}

@ProviderFor(ResinSyncStateNotifier)
final resinSyncStateProvider = ResinSyncStateNotifierProvider._();

final class ResinSyncStateNotifierProvider
    extends $NotifierProvider<ResinSyncStateNotifier, GameDataSyncStatus> {
  ResinSyncStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resinSyncStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resinSyncStateNotifierHash();

  @$internal
  @override
  ResinSyncStateNotifier create() => ResinSyncStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameDataSyncStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameDataSyncStatus>(value),
    );
  }
}

String _$resinSyncStateNotifierHash() =>
    r'069da6b2a805864ced78cd515fae57ee505cb663';

abstract class _$ResinSyncStateNotifier extends $Notifier<GameDataSyncStatus> {
  GameDataSyncStatus build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<GameDataSyncStatus, GameDataSyncStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GameDataSyncStatus, GameDataSyncStatus>,
              GameDataSyncStatus,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
