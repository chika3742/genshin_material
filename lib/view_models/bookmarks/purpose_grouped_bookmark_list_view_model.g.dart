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
    r'1229659b8acaf395b22a263f176c251e1a6b3124';

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
