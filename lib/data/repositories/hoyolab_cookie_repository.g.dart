// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hoyolab_cookie_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HoyolabCookieRepository)
final hoyolabCookieRepositoryProvider = HoyolabCookieRepositoryProvider._();

final class HoyolabCookieRepositoryProvider
    extends $AsyncNotifierProvider<HoyolabCookieRepository, String?> {
  HoyolabCookieRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hoyolabCookieRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hoyolabCookieRepositoryHash();

  @$internal
  @override
  HoyolabCookieRepository create() => HoyolabCookieRepository();
}

String _$hoyolabCookieRepositoryHash() =>
    r'45e918d18e862486b2d0fd46cc7ab7cb881957fb';

abstract class _$HoyolabCookieRepository extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, String?>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
