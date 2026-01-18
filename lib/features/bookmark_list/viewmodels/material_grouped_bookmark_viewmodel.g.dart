// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_grouped_bookmark_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MaterialGroupedBookmarkViewModel)
final materialGroupedBookmarkViewModelProvider =
    MaterialGroupedBookmarkViewModelProvider._();

final class MaterialGroupedBookmarkViewModelProvider
    extends $NotifierProvider<MaterialGroupedBookmarkViewModel, void> {
  MaterialGroupedBookmarkViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'materialGroupedBookmarkViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$materialGroupedBookmarkViewModelHash();

  @$internal
  @override
  MaterialGroupedBookmarkViewModel create() =>
      MaterialGroupedBookmarkViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$materialGroupedBookmarkViewModelHash() =>
    r'e199a25f9726f7ec9c7dbc2963d7b7cf89b81237';

abstract class _$MaterialGroupedBookmarkViewModel extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
