// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purpose_grouped_bookmark_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PurposeGroupedBookmarkListViewModel)
final purposeGroupedBookmarkListViewModelProvider =
    PurposeGroupedBookmarkListViewModelProvider._();

final class PurposeGroupedBookmarkListViewModelProvider
    extends
        $NotifierProvider<
          PurposeGroupedBookmarkListViewModel,
          PurposeGroupedBookmarkListState
        > {
  PurposeGroupedBookmarkListViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'purposeGroupedBookmarkListViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$purposeGroupedBookmarkListViewModelHash();

  @$internal
  @override
  PurposeGroupedBookmarkListViewModel create() =>
      PurposeGroupedBookmarkListViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PurposeGroupedBookmarkListState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PurposeGroupedBookmarkListState>(
        value,
      ),
    );
  }
}

String _$purposeGroupedBookmarkListViewModelHash() =>
    r'056b1b6d557df2360980a32d6f8d821bbcaaf262';

abstract class _$PurposeGroupedBookmarkListViewModel
    extends $Notifier<PurposeGroupedBookmarkListState> {
  PurposeGroupedBookmarkListState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              PurposeGroupedBookmarkListState,
              PurposeGroupedBookmarkListState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                PurposeGroupedBookmarkListState,
                PurposeGroupedBookmarkListState
              >,
              PurposeGroupedBookmarkListState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
