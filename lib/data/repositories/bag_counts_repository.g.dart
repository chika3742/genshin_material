// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag_counts_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Returns `null` if sync is disabled.

@ProviderFor(bagCounts)
final bagCountsProvider = BagCountsFamily._();

/// Returns `null` if sync is disabled.

final class BagCountsProvider
    extends
        $FunctionalProvider<
          AsyncValue<BagCounts?>,
          BagCounts?,
          FutureOr<BagCounts?>
        >
    with $FutureModifier<BagCounts?>, $FutureProvider<BagCounts?> {
  /// Returns `null` if sync is disabled.
  BagCountsProvider._({
    required BagCountsFamily super.from,
    required BagCountRequests super.argument,
  }) : super(
         retry: null,
         name: r'bagCountsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bagCountsHash();

  @override
  String toString() {
    return r'bagCountsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<BagCounts?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<BagCounts?> create(Ref ref) {
    final argument = this.argument as BagCountRequests;
    return bagCounts(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BagCountsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bagCountsHash() => r'7012e96d8158d80f2029095b6631ba75d0380b33';

/// Returns `null` if sync is disabled.

final class BagCountsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<BagCounts?>, BagCountRequests> {
  BagCountsFamily._()
    : super(
        retry: null,
        name: r'bagCountsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Returns `null` if sync is disabled.

  BagCountsProvider call(BagCountRequests requests) =>
      BagCountsProvider._(argument: requests, from: this);

  @override
  String toString() => r'bagCountsProvider';
}
