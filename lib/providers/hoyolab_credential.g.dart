// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hoyolab_credential.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HoyolabCredential)
final hoyolabCredentialProvider = HoyolabCredentialProvider._();

final class HoyolabCredentialProvider
    extends $NotifierProvider<HoyolabCredential, HoyolabCredentialSnapshot> {
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
  Override overrideWithValue(HoyolabCredentialSnapshot value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HoyolabCredentialSnapshot>(value),
    );
  }
}

String _$hoyolabCredentialHash() => r'98020f8b552d60d4c1e170bcfaaa4c5c83d6049f';

abstract class _$HoyolabCredential
    extends $Notifier<HoyolabCredentialSnapshot> {
  HoyolabCredentialSnapshot build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<HoyolabCredentialSnapshot, HoyolabCredentialSnapshot>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HoyolabCredentialSnapshot, HoyolabCredentialSnapshot>,
              HoyolabCredentialSnapshot,
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
    r'99bdf3e2c5b3a1702d6bc1ad7a49ef4a4e5e9721';

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
