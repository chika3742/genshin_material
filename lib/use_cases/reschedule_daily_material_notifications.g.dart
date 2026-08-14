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
          AsyncValue<RescheduleDailyMaterialNotifications>,
          RescheduleDailyMaterialNotifications,
          FutureOr<RescheduleDailyMaterialNotifications>
        >
    with
        $FutureModifier<RescheduleDailyMaterialNotifications>,
        $FutureProvider<RescheduleDailyMaterialNotifications> {
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
  $FutureProviderElement<RescheduleDailyMaterialNotifications> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<RescheduleDailyMaterialNotifications> create(Ref ref) {
    return rescheduleDailyMaterialNotifications(ref);
  }
}

String _$rescheduleDailyMaterialNotificationsHash() =>
    r'b403fad457ace97abcf945858d51d95b9780aaa9';
