// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'miscellaneous.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appStartup)
final appStartupProvider = AppStartupProvider._();

final class AppStartupProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  AppStartupProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appStartupProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appStartupHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return appStartup(ref);
  }
}

String _$appStartupHash() => r'6d5ef009fcf643595614d28955c20e02ef4015a8';

@ProviderFor(RealtimeNotesActivationState)
final realtimeNotesActivationStateProvider =
    RealtimeNotesActivationStateProvider._();

final class RealtimeNotesActivationStateProvider
    extends $AsyncNotifierProvider<RealtimeNotesActivationState, bool> {
  RealtimeNotesActivationStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'realtimeNotesActivationStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$realtimeNotesActivationStateHash();

  @$internal
  @override
  RealtimeNotesActivationState create() => RealtimeNotesActivationState();
}

String _$realtimeNotesActivationStateHash() =>
    r'2ca8efc2c27e416059b11cbaee3ce439d08f3219';

abstract class _$RealtimeNotesActivationState extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(ownedCharacters)
final ownedCharactersProvider = OwnedCharactersProvider._();

final class OwnedCharactersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CharacterId>?>,
          List<CharacterId>?,
          FutureOr<List<CharacterId>?>
        >
    with
        $FutureModifier<List<CharacterId>?>,
        $FutureProvider<List<CharacterId>?> {
  OwnedCharactersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ownedCharactersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ownedCharactersHash();

  @$internal
  @override
  $FutureProviderElement<List<CharacterId>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CharacterId>?> create(Ref ref) {
    return ownedCharacters(ref);
  }
}

String _$ownedCharactersHash() => r'e9693b8c8121bbb44d5d37a35bb2576025b61e6b';

@ProviderFor(shouldHideImages)
final shouldHideImagesProvider = ShouldHideImagesProvider._();

final class ShouldHideImagesProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  ShouldHideImagesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shouldHideImagesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shouldHideImagesHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return shouldHideImages(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$shouldHideImagesHash() => r'2dbacfc1cd4d157c69629165c1a68a1d8b3af97e';
