// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hoyolab_credential.dart';

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

@ProviderFor(HoyolabCredential)
final hoyolabCredentialProvider = HoyolabCredentialProvider._();

/// The single read/write path for the HoYoLAB server and user identity.
///
/// The preferences behind it are a persistence backend only; nothing outside
/// this notifier is allowed to touch [PrefKeys.hyvServer] and friends. That is
/// what lets the notifier own the state: it reads the preferences once in
/// [build] and afterwards emits exactly one update per mutation, instead of one
/// per written key.
final class HoyolabCredentialProvider
    extends $NotifierProvider<HoyolabCredential, HoyolabCredentialState> {
  /// The single read/write path for the HoYoLAB server and user identity.
  ///
  /// The preferences behind it are a persistence backend only; nothing outside
  /// this notifier is allowed to touch [PrefKeys.hyvServer] and friends. That is
  /// what lets the notifier own the state: it reads the preferences once in
  /// [build] and afterwards emits exactly one update per mutation, instead of one
  /// per written key.
  HoyolabCredentialProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hoyolabCredentialProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hoyolabCredentialHash();

  @$internal
  @override
  HoyolabCredential create() => HoyolabCredential();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HoyolabCredentialState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HoyolabCredentialState>(value),
    );
  }
}

String _$hoyolabCredentialHash() => r'ff81dc16c690e134de172e4e629eedae1d72778a';

/// The single read/write path for the HoYoLAB server and user identity.
///
/// The preferences behind it are a persistence backend only; nothing outside
/// this notifier is allowed to touch [PrefKeys.hyvServer] and friends. That is
/// what lets the notifier own the state: it reads the preferences once in
/// [build] and afterwards emits exactly one update per mutation, instead of one
/// per written key.

abstract class _$HoyolabCredential extends $Notifier<HoyolabCredentialState> {
  HoyolabCredentialState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<HoyolabCredentialState, HoyolabCredentialState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HoyolabCredentialState, HoyolabCredentialState>,
              HoyolabCredentialState,
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
    r'a684099733f04615e95421ffc156d233b53042f1';

@ProviderFor(isHoyolabSignedInInitial)
final isHoyolabSignedInInitialProvider = IsHoyolabSignedInInitialProvider._();

final class IsHoyolabSignedInInitialProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsHoyolabSignedInInitialProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isHoyolabSignedInInitialProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isHoyolabSignedInInitialHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isHoyolabSignedInInitial(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isHoyolabSignedInInitialHash() =>
    r'1ad5aac0e08eaa4fb16d82c7c88c71dc710a91b5';

@ProviderFor(IsHoyolabSignedIn)
final isHoyolabSignedInProvider = IsHoyolabSignedInProvider._();

final class IsHoyolabSignedInProvider
    extends $NotifierProvider<IsHoyolabSignedIn, bool> {
  IsHoyolabSignedInProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isHoyolabSignedInProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isHoyolabSignedInHash();

  @$internal
  @override
  IsHoyolabSignedIn create() => IsHoyolabSignedIn();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isHoyolabSignedInHash() => r'167734e4ce654b36fa3dbcc265368b4e9d1e45b7';

abstract class _$IsHoyolabSignedIn extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
