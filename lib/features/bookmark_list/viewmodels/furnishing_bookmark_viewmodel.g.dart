// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'furnishing_bookmark_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FurnishingBookmarkViewModel)
final furnishingBookmarkViewModelProvider =
    FurnishingBookmarkViewModelProvider._();

final class FurnishingBookmarkViewModelProvider
    extends $NotifierProvider<FurnishingBookmarkViewModel, void> {
  FurnishingBookmarkViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'furnishingBookmarkViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$furnishingBookmarkViewModelHash();

  @$internal
  @override
  FurnishingBookmarkViewModel create() => FurnishingBookmarkViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$furnishingBookmarkViewModelHash() =>
    r'9d0e6ae01b77befc6b667195e7b0f0266b9aac60';

abstract class _$FurnishingBookmarkViewModel extends $Notifier<void> {
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
