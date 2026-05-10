// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'furnishing_set_bookmark_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FurnishingSetBookmarkListViewModel)
final furnishingSetBookmarkListViewModelProvider =
    FurnishingSetBookmarkListViewModelProvider._();

final class FurnishingSetBookmarkListViewModelProvider
    extends
        $StreamNotifierProvider<
          FurnishingSetBookmarkListViewModel,
          List<FurnishingSet>
        > {
  FurnishingSetBookmarkListViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'furnishingSetBookmarkListViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$furnishingSetBookmarkListViewModelHash();

  @$internal
  @override
  FurnishingSetBookmarkListViewModel create() =>
      FurnishingSetBookmarkListViewModel();
}

String _$furnishingSetBookmarkListViewModelHash() =>
    r'cdfc05270e473b31badd9ca3730ab6fd2d9a9a6e';

abstract class _$FurnishingSetBookmarkListViewModel
    extends $StreamNotifier<List<FurnishingSet>> {
  Stream<List<FurnishingSet>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<FurnishingSet>>, List<FurnishingSet>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<FurnishingSet>>, List<FurnishingSet>>,
              AsyncValue<List<FurnishingSet>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
