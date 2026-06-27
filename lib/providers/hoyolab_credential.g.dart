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

String _$hoyolabCredentialHash() => r'f4e0c988370f77a1a39d1c9ff95747c5218ab107';

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
    r'8e9ae7368f79158576a6120b9f81a10d1574ac90';
