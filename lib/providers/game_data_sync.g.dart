// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_data_sync.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
