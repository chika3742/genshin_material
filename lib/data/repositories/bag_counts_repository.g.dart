// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag_counts_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BagCountsNotifier)
final bagCountsProvider = BagCountsNotifierFamily._();

final class BagCountsNotifierProvider
    extends $AsyncNotifierProvider<BagCountsNotifier, BagCounts?> {
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

String _$bagCountsNotifierHash() => r'496378ad0c466a374d22d8b93e2442ead83e005c';

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

  BagCountsNotifierProvider call(BagCountRequests requests) =>
      BagCountsNotifierProvider._(argument: requests, from: this);

  @override
  String toString() => r'bagCountsProvider';
}

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
