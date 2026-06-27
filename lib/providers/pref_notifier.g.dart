// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pref_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPreferencesWithCache)
final sharedPreferencesWithCacheProvider =
    SharedPreferencesWithCacheProvider._();

final class SharedPreferencesWithCacheProvider
    extends
        $FunctionalProvider<
          SharedPreferencesWithCache,
          SharedPreferencesWithCache,
          SharedPreferencesWithCache
        >
    with $Provider<SharedPreferencesWithCache> {
  SharedPreferencesWithCacheProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesWithCacheProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesWithCacheHash();

  @$internal
  @override
  $ProviderElement<SharedPreferencesWithCache> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferencesWithCache create(Ref ref) {
    return sharedPreferencesWithCache(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferencesWithCache value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferencesWithCache>(value),
    );
  }
}

String _$sharedPreferencesWithCacheHash() =>
    r'a8bb95b8fe75a76cbf8c75cdc42ddad47ec6d4d3';

@ProviderFor(PrefNotifier)
final prefProvider = PrefNotifierFamily._();

final class PrefNotifierProvider<PrefT, ConvT>
    extends $NotifierProvider<PrefNotifier<PrefT, ConvT>, ConvT> {
  PrefNotifierProvider._({
    required PrefNotifierFamily super.from,
    required PrefKey<PrefT, ConvT> super.argument,
  }) : super(
         retry: null,
         name: r'prefProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$prefNotifierHash();

  @override
  String toString() {
    return r'prefProvider'
        '<${PrefT}, ${ConvT}>'
        '($argument)';
  }

  @$internal
  @override
  PrefNotifier<PrefT, ConvT> create() => PrefNotifier<PrefT, ConvT>();

  $R _captureGenerics<$R>($R Function<PrefT, ConvT>() cb) {
    return cb<PrefT, ConvT>();
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConvT value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConvT>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PrefNotifierProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$prefNotifierHash() => r'16a5df526b5ada6e71f1911bf42cb508f37c5807';

final class PrefNotifierFamily extends $Family {
  PrefNotifierFamily._()
    : super(
        retry: null,
        name: r'prefProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PrefNotifierProvider<PrefT, ConvT> call<PrefT, ConvT>(
    PrefKey<PrefT, ConvT> key,
  ) => PrefNotifierProvider<PrefT, ConvT>._(argument: key, from: this);

  @override
  String toString() => r'prefProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    PrefNotifier<PrefT, ConvT> Function<PrefT, ConvT>() create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as PrefNotifierProvider;
      return provider._captureGenerics(<PrefT, ConvT>() {
        provider as PrefNotifierProvider<PrefT, ConvT>;
        return provider
            .$view(create: create<PrefT, ConvT>)
            .$createElement(pointer);
      });
    },
  );

  /// {@macro riverpod.override_with_build}
  Override overrideWithBuild(
    ConvT Function<PrefT, ConvT>(Ref ref, PrefNotifier<PrefT, ConvT> notifier)
    build,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as PrefNotifierProvider;
      return provider._captureGenerics(<PrefT, ConvT>() {
        provider as PrefNotifierProvider<PrefT, ConvT>;
        return provider
            .$view(runNotifierBuildOverride: build<PrefT, ConvT>)
            .$createElement(pointer);
      });
    },
  );
}

abstract class _$PrefNotifier<PrefT, ConvT> extends $Notifier<ConvT> {
  late final _$args = ref.$arg as PrefKey<PrefT, ConvT>;
  PrefKey<PrefT, ConvT> get key => _$args;

  ConvT build(PrefKey<PrefT, ConvT> key);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ConvT, ConvT>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ConvT, ConvT>,
              ConvT,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
