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
    r'beb59c3811f59c02651f379fde35fe2e838f19b8';

abstract class _$PurposeGroupedBookmarkListViewModel
    extends $Notifier<PurposeGroupedBookmarkListState> {
  PurposeGroupedBookmarkListState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
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
    return element.handleCreate(ref, build);
  }
}
