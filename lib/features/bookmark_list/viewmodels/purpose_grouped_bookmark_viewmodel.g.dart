// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purpose_grouped_bookmark_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PurposeGroupedBookmarkViewModel)
final purposeGroupedBookmarkViewModelProvider =
    PurposeGroupedBookmarkViewModelProvider._();

final class PurposeGroupedBookmarkViewModelProvider
    extends $NotifierProvider<PurposeGroupedBookmarkViewModel, void> {
  PurposeGroupedBookmarkViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'purposeGroupedBookmarkViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$purposeGroupedBookmarkViewModelHash();

  @$internal
  @override
  PurposeGroupedBookmarkViewModel create() => PurposeGroupedBookmarkViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$purposeGroupedBookmarkViewModelHash() =>
    r'3eee0ddc8cf1af0df6e7857e8f81ced9272db581';

abstract class _$PurposeGroupedBookmarkViewModel extends $Notifier<void> {
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
