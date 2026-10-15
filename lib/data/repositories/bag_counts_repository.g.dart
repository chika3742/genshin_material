// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag_counts_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Returns `null` if sync is disabled.

@ProviderFor(BagCountsNotifier)
final bagCountsProvider = BagCountsNotifierFamily._();

/// Returns `null` if sync is disabled.
final class BagCountsNotifierProvider
    extends $AsyncNotifierProvider<BagCountsNotifier, BagCounts?> {
  /// Returns `null` if sync is disabled.
  BagCountsNotifierProvider._({
    required BagCountsNotifierFamily super.from,
    required BagCountRequests super.argument,
  }) : super(
         retry: null,
         name: r'bagCountsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bagCountsNotifierHash();

  @override
  String toString() {
    return r'bagCountsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BagCountsNotifier create() => BagCountsNotifier();

  @override
  bool operator ==(Object other) {
    return other is BagCountsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bagCountsNotifierHash() => r'5a95e0238e031015a59324fb4d77e8d470b69c9e';

/// Returns `null` if sync is disabled.

final class BagCountsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          BagCountsNotifier,
          AsyncValue<BagCounts?>,
          BagCounts?,
          FutureOr<BagCounts?>,
          BagCountRequests
        > {
  BagCountsNotifierFamily._()
    : super(
        retry: null,
        name: r'bagCountsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Returns `null` if sync is disabled.

  BagCountsNotifierProvider call(BagCountRequests requests) =>
      BagCountsNotifierProvider._(argument: requests, from: this);

  @override
  String toString() => r'bagCountsProvider';
}

/// Returns `null` if sync is disabled.

abstract class _$BagCountsNotifier extends $AsyncNotifier<BagCounts?> {
  late final _$args = ref.$arg as BagCountRequests;
  BagCountRequests get requests => _$args;

  FutureOr<BagCounts?> build(BagCountRequests requests);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<BagCounts?>, BagCounts?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<BagCounts?>, BagCounts?>,
              AsyncValue<BagCounts?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
