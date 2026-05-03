// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artifact_bookmark_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ArtifactBookmarkListViewModel)
final artifactBookmarkListViewModelProvider =
    ArtifactBookmarkListViewModelProvider._();

final class ArtifactBookmarkListViewModelProvider
    extends
        $NotifierProvider<
          ArtifactBookmarkListViewModel,
          ArtifactBookmarkListState
        > {
  ArtifactBookmarkListViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'artifactBookmarkListViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$artifactBookmarkListViewModelHash();

  @$internal
  @override
  ArtifactBookmarkListViewModel create() => ArtifactBookmarkListViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ArtifactBookmarkListState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ArtifactBookmarkListState>(value),
    );
  }
}

String _$artifactBookmarkListViewModelHash() =>
    r'c2d3e2533c69bb7ac1fa425ab27ab22b0bbbc251';

abstract class _$ArtifactBookmarkListViewModel
    extends $Notifier<ArtifactBookmarkListState> {
  ArtifactBookmarkListState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<ArtifactBookmarkListState, ArtifactBookmarkListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ArtifactBookmarkListState, ArtifactBookmarkListState>,
              ArtifactBookmarkListState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
