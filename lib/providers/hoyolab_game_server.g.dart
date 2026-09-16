// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hoyolab_game_server.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The single read/write path for the HoYoLAB server and user identity.
///
/// The preferences behind it are a persistence backend only; nothing outside
/// this notifier is allowed to touch [PrefKeys.hyvServer] and friends. That is
/// what lets the notifier own the state: it reads the preferences once in
/// [build] and afterwards emits exactly one update per mutation, instead of one
/// per written key.

@ProviderFor(HoyolabGameServer)
final hoyolabGameServerProvider = HoyolabGameServerProvider._();

/// The single read/write path for the HoYoLAB server and user identity.
///
/// The preferences behind it are a persistence backend only; nothing outside
/// this notifier is allowed to touch [PrefKeys.hyvServer] and friends. That is
/// what lets the notifier own the state: it reads the preferences once in
/// [build] and afterwards emits exactly one update per mutation, instead of one
/// per written key.
final class HoyolabGameServerProvider
    extends $NotifierProvider<HoyolabGameServer, HoyolabGameServerState> {
  /// The single read/write path for the HoYoLAB server and user identity.
  ///
  /// The preferences behind it are a persistence backend only; nothing outside
  /// this notifier is allowed to touch [PrefKeys.hyvServer] and friends. That is
  /// what lets the notifier own the state: it reads the preferences once in
  /// [build] and afterwards emits exactly one update per mutation, instead of one
  /// per written key.
  HoyolabGameServerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hoyolabGameServerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hoyolabGameServerHash();

  @$internal
  @override
  HoyolabGameServer create() => HoyolabGameServer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HoyolabGameServerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HoyolabGameServerState>(value),
    );
  }
}

String _$hoyolabGameServerHash() => r'73de854f92d71e3c6d084bd6032ddb0d16a35a25';

/// The single read/write path for the HoYoLAB server and user identity.
///
/// The preferences behind it are a persistence backend only; nothing outside
/// this notifier is allowed to touch [PrefKeys.hyvServer] and friends. That is
/// what lets the notifier own the state: it reads the preferences once in
/// [build] and afterwards emits exactly one update per mutation, instead of one
/// per written key.

abstract class _$HoyolabGameServer extends $Notifier<HoyolabGameServerState> {
  HoyolabGameServerState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<HoyolabGameServerState, HoyolabGameServerState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HoyolabGameServerState, HoyolabGameServerState>,
              HoyolabGameServerState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(isLinkedWithHoyolab)
final isLinkedWithHoyolabProvider = IsLinkedWithHoyolabProvider._();

final class IsLinkedWithHoyolabProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsLinkedWithHoyolabProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isLinkedWithHoyolabProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isLinkedWithHoyolabHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isLinkedWithHoyolab(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isLinkedWithHoyolabHash() =>
    r'e592fcfffbe1e80fdb1f1e55aa40900bee12e559';
