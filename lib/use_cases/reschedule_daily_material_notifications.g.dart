// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reschedule_daily_material_notifications.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(rescheduleDailyMaterialNotifications)
final rescheduleDailyMaterialNotificationsProvider =
    RescheduleDailyMaterialNotificationsProvider._();

final class RescheduleDailyMaterialNotificationsProvider
    extends
        $FunctionalProvider<
          RescheduleDailyMaterialNotifications,
          RescheduleDailyMaterialNotifications,
          RescheduleDailyMaterialNotifications
        >
    with $Provider<RescheduleDailyMaterialNotifications> {
  RescheduleDailyMaterialNotificationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rescheduleDailyMaterialNotificationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$rescheduleDailyMaterialNotificationsHash();

  @$internal
  @override
  $ProviderElement<RescheduleDailyMaterialNotifications> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RescheduleDailyMaterialNotifications create(Ref ref) {
    return rescheduleDailyMaterialNotifications(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RescheduleDailyMaterialNotifications value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<RescheduleDailyMaterialNotifications>(value),
    );
  }
}

String _$rescheduleDailyMaterialNotificationsHash() =>
    r'52f0773878018cf0f18563cc8badef5eed63021d';
