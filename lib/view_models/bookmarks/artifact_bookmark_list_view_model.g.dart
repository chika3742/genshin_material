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
        $StreamNotifierProvider<
          ArtifactBookmarkListViewModel,
          List<ArtifactBookmarkItemState>
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
}

String _$artifactBookmarkListViewModelHash() =>
    r'90117d7cf15326871f75bea41c5a5de19b7a39a6';

abstract class _$ArtifactBookmarkListViewModel
    extends $StreamNotifier<List<ArtifactBookmarkItemState>> {
  Stream<List<ArtifactBookmarkItemState>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<ArtifactBookmarkItemState>>,
              List<ArtifactBookmarkItemState>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ArtifactBookmarkItemState>>,
                List<ArtifactBookmarkItemState>
              >,
              AsyncValue<List<ArtifactBookmarkItemState>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
