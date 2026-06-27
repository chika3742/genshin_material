// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resin.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Resin)
final resinProvider = ResinProvider._();

final class ResinProvider extends $NotifierProvider<Resin, ResinSnapshot> {
  ResinProvider._()
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
  String debugGetCreateSourceHash() => _$resinHash();

  @$internal
  @override
  Resin create() => Resin();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResinSnapshot value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResinSnapshot>(value),
    );
  }
}

String _$resinHash() => r'e5b27146772c5f19563723c2e609f6110b411aee';

abstract class _$Resin extends $Notifier<ResinSnapshot> {
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
