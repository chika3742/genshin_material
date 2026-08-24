// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_value.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(remoteConfigValue)
final remoteConfigValueProvider = RemoteConfigValueFamily._();

final class RemoteConfigValueProvider<T extends Object>
    extends $FunctionalProvider<T, T, T>
    with $Provider<T> {
  RemoteConfigValueProvider._({
    required RemoteConfigValueFamily super.from,
    required RemoteConfigKey<T> super.argument,
  }) : super(
         retry: null,
         name: r'remoteConfigValueProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$remoteConfigValueHash();

  @override
  String toString() {
    return r'remoteConfigValueProvider'
        '<${T}>'
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<T> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  T create(Ref ref) {
    final argument = this.argument as RemoteConfigKey<T>;
    return remoteConfigValue<T>(ref, argument);
  }

  $R _captureGenerics<$R>($R Function<T extends Object>() cb) {
    return cb<T>();
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(T value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<T>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RemoteConfigValueProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$remoteConfigValueHash() => r'f856a4ba8936e095e9d11f4e382d6d2f25521dd3';

final class RemoteConfigValueFamily extends $Family {
  RemoteConfigValueFamily._()
    : super(
        retry: null,
        name: r'remoteConfigValueProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  RemoteConfigValueProvider<T> call<T extends Object>(RemoteConfigKey<T> key) =>
      RemoteConfigValueProvider<T>._(argument: key, from: this);

  @override
  String toString() => r'remoteConfigValueProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    T Function<T extends Object>(Ref ref, RemoteConfigKey<T> args) create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as RemoteConfigValueProvider;
      return provider._captureGenerics(<T extends Object>() {
        provider as RemoteConfigValueProvider<T>;
        final argument = provider.argument as RemoteConfigKey<T>;
        return provider
            .$view(create: (ref) => create(ref, argument))
            .$createElement(pointer);
      });
    },
  );
}

/// This should be watched once in ProviderScope.

@ProviderFor(initializeRemoteConfig)
final initializeRemoteConfigProvider = InitializeRemoteConfigProvider._();

/// This should be watched once in ProviderScope.

final class InitializeRemoteConfigProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// This should be watched once in ProviderScope.
  InitializeRemoteConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'initializeRemoteConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$initializeRemoteConfigHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return initializeRemoteConfig(ref);
  }
}

String _$initializeRemoteConfigHash() =>
    r'de6e24255d64591660eeb0565f5954906207faad';
