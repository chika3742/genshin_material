// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resin.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ResinNotifier)
final resinProvider = ResinNotifierProvider._();

final class ResinNotifierProvider
    extends $NotifierProvider<ResinNotifier, ResinSnapshot> {
  ResinNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resinProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resinNotifierHash();

  @$internal
  @override
  ResinNotifier create() => ResinNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResinSnapshot value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResinSnapshot>(value),
    );
  }
}

String _$resinNotifierHash() => r'f29c93f8b91ece03a5acbc7656aee24035042cf1';

abstract class _$ResinNotifier extends $Notifier<ResinSnapshot> {
  ResinSnapshot build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ResinSnapshot, ResinSnapshot>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ResinSnapshot, ResinSnapshot>,
              ResinSnapshot,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
