// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farming_efficiency.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(farmingEfficiencyAnalysis)
const farmingEfficiencyAnalysisProvider = FarmingEfficiencyAnalysisProvider._();

final class FarmingEfficiencyAnalysisProvider
    extends
        $FunctionalProvider<
          AsyncValue<FarmingEfficiencyAnalysis>,
          FarmingEfficiencyAnalysis,
          FutureOr<FarmingEfficiencyAnalysis>
        >
    with
        $FutureModifier<FarmingEfficiencyAnalysis>,
        $FutureProvider<FarmingEfficiencyAnalysis> {
  const FarmingEfficiencyAnalysisProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'farmingEfficiencyAnalysisProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$farmingEfficiencyAnalysisHash();

  @$internal
  @override
  $FutureProviderElement<FarmingEfficiencyAnalysis> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<FarmingEfficiencyAnalysis> create(Ref ref) {
    return farmingEfficiencyAnalysis(ref);
  }
}

String _$farmingEfficiencyAnalysisHash() => r'8c9f9e5a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e';
