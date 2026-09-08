// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The single read path for a Remote Config value.
///
/// One provider per key, so a value is an ordinary node of the dependency
/// graph: consumers `watch` it and rebuild when it is invalidated, and a test
/// replaces one value with `overrideWithValue` instead of stubbing the whole
/// service. The type follows from the key, so no type argument is needed at the
/// call site:
///
/// ```dart
/// final enabled = ref.watch(
///   remoteConfigProvider(RemoteConfigKeys.hoyolabLinkEnabled),
/// );
/// ```
///
/// `useRemoteConfigListener` invalidates the whole family when the server
/// pushes an update, so every consumer that watches a value follows it — the
/// banner row on the More page is one that does. Nothing is pinned here; a
/// consumer that needs a value to stay put says so at its own level, and only
/// for what it actually has to hold: `useStartupBanner` keeps the
/// `MaterialBanner` it has already put on screen by not re-running its effect,
/// and `useBanner` binds `markAsRead` to the key the banner was built from.

@ProviderFor(remoteConfig)
final remoteConfigProvider = RemoteConfigFamily._();

/// The single read path for a Remote Config value.
///
/// One provider per key, so a value is an ordinary node of the dependency
/// graph: consumers `watch` it and rebuild when it is invalidated, and a test
/// replaces one value with `overrideWithValue` instead of stubbing the whole
/// service. The type follows from the key, so no type argument is needed at the
/// call site:
///
/// ```dart
/// final enabled = ref.watch(
///   remoteConfigProvider(RemoteConfigKeys.hoyolabLinkEnabled),
/// );
/// ```
///
/// `useRemoteConfigListener` invalidates the whole family when the server
/// pushes an update, so every consumer that watches a value follows it — the
/// banner row on the More page is one that does. Nothing is pinned here; a
/// consumer that needs a value to stay put says so at its own level, and only
/// for what it actually has to hold: `useStartupBanner` keeps the
/// `MaterialBanner` it has already put on screen by not re-running its effect,
/// and `useBanner` binds `markAsRead` to the key the banner was built from.

final class RemoteConfigProvider<T extends Object>
    extends $FunctionalProvider<T, T, T>
    with $Provider<T> {
  /// The single read path for a Remote Config value.
  ///
  /// One provider per key, so a value is an ordinary node of the dependency
  /// graph: consumers `watch` it and rebuild when it is invalidated, and a test
  /// replaces one value with `overrideWithValue` instead of stubbing the whole
  /// service. The type follows from the key, so no type argument is needed at the
  /// call site:
  ///
  /// ```dart
  /// final enabled = ref.watch(
  ///   remoteConfigProvider(RemoteConfigKeys.hoyolabLinkEnabled),
  /// );
  /// ```
  ///
  /// `useRemoteConfigListener` invalidates the whole family when the server
  /// pushes an update, so every consumer that watches a value follows it — the
  /// banner row on the More page is one that does. Nothing is pinned here; a
  /// consumer that needs a value to stay put says so at its own level, and only
  /// for what it actually has to hold: `useStartupBanner` keeps the
  /// `MaterialBanner` it has already put on screen by not re-running its effect,
  /// and `useBanner` binds `markAsRead` to the key the banner was built from.
  RemoteConfigProvider._({
    required RemoteConfigFamily super.from,
    required RemoteConfigKey<T> super.argument,
  }) : super(
         retry: null,
         name: r'remoteConfigProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$remoteConfigHash();

  @override
  String toString() {
    return r'remoteConfigProvider'
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
    return remoteConfig<T>(ref, argument);
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
    return other is RemoteConfigProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$remoteConfigHash() => r'10b8a90a403de77f110fa67eac63ae497045c7d1';

/// The single read path for a Remote Config value.
///
/// One provider per key, so a value is an ordinary node of the dependency
/// graph: consumers `watch` it and rebuild when it is invalidated, and a test
/// replaces one value with `overrideWithValue` instead of stubbing the whole
/// service. The type follows from the key, so no type argument is needed at the
/// call site:
///
/// ```dart
/// final enabled = ref.watch(
///   remoteConfigProvider(RemoteConfigKeys.hoyolabLinkEnabled),
/// );
/// ```
///
/// `useRemoteConfigListener` invalidates the whole family when the server
/// pushes an update, so every consumer that watches a value follows it — the
/// banner row on the More page is one that does. Nothing is pinned here; a
/// consumer that needs a value to stay put says so at its own level, and only
/// for what it actually has to hold: `useStartupBanner` keeps the
/// `MaterialBanner` it has already put on screen by not re-running its effect,
/// and `useBanner` binds `markAsRead` to the key the banner was built from.

final class RemoteConfigFamily extends $Family {
  RemoteConfigFamily._()
    : super(
        retry: null,
        name: r'remoteConfigProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// The single read path for a Remote Config value.
  ///
  /// One provider per key, so a value is an ordinary node of the dependency
  /// graph: consumers `watch` it and rebuild when it is invalidated, and a test
  /// replaces one value with `overrideWithValue` instead of stubbing the whole
  /// service. The type follows from the key, so no type argument is needed at the
  /// call site:
  ///
  /// ```dart
  /// final enabled = ref.watch(
  ///   remoteConfigProvider(RemoteConfigKeys.hoyolabLinkEnabled),
  /// );
  /// ```
  ///
  /// `useRemoteConfigListener` invalidates the whole family when the server
  /// pushes an update, so every consumer that watches a value follows it — the
  /// banner row on the More page is one that does. Nothing is pinned here; a
  /// consumer that needs a value to stay put says so at its own level, and only
  /// for what it actually has to hold: `useStartupBanner` keeps the
  /// `MaterialBanner` it has already put on screen by not re-running its effect,
  /// and `useBanner` binds `markAsRead` to the key the banner was built from.

  RemoteConfigProvider<T> call<T extends Object>(RemoteConfigKey<T> key) =>
      RemoteConfigProvider<T>._(argument: key, from: this);

  @override
  String toString() => r'remoteConfigProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    T Function<T extends Object>(Ref ref, RemoteConfigKey<T> args) create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as RemoteConfigProvider;
      return provider._captureGenerics(<T extends Object>() {
        provider as RemoteConfigProvider<T>;
        final argument = provider.argument as RemoteConfigKey<T>;
        return provider
            .$view(create: (ref) => create(ref, argument))
            .$createElement(pointer);
      });
    },
  );
}
