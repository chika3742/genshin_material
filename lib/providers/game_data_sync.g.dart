// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_data_sync.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$bagLackNumHash() => r'bc0ff61489fd999e19a3b58fd5efffe095613c2c';

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

String _$gameDataSyncStateHash() => r'baa8e849ecb98830b0097e9840fb2db84f885571';

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
    r'614bf850deda7f3056e20313231807333b6d18a2';

abstract class _$ResinSyncStateNotifier extends $Notifier<GameDataSyncStatus> {
  GameDataSyncStatus build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<GameDataSyncStatus, GameDataSyncStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GameDataSyncStatus, GameDataSyncStatus>,
              GameDataSyncStatus,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
