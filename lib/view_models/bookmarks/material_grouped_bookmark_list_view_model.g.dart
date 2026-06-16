// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_grouped_bookmark_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MaterialGroupedBookmarkListViewModel)
final materialGroupedBookmarkListViewModelProvider =
    MaterialGroupedBookmarkListViewModelProvider._();

final class MaterialGroupedBookmarkListViewModelProvider
    extends
        $NotifierProvider<
          MaterialGroupedBookmarkListViewModel,
          MaterialGroupedBookmarkListState
        > {
  MaterialGroupedBookmarkListViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'materialGroupedBookmarkListViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$materialGroupedBookmarkListViewModelHash();

  @$internal
  @override
  MaterialGroupedBookmarkListViewModel create() =>
      MaterialGroupedBookmarkListViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MaterialGroupedBookmarkListState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MaterialGroupedBookmarkListState>(
        value,
      ),
    );
  }
}

String _$materialGroupedBookmarkListViewModelHash() =>
    r'4bda97e75a1ecae89a4ba892bf755524d0bff804';

abstract class _$MaterialGroupedBookmarkListViewModel
    extends $Notifier<MaterialGroupedBookmarkListState> {
  MaterialGroupedBookmarkListState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              MaterialGroupedBookmarkListState,
              MaterialGroupedBookmarkListState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                MaterialGroupedBookmarkListState,
                MaterialGroupedBookmarkListState
              >,
              MaterialGroupedBookmarkListState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
