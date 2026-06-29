// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_notification.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localNotification)
final localNotificationProvider = LocalNotificationProvider._();

final class LocalNotificationProvider
    extends
        $FunctionalProvider<
          LocalNotification,
          LocalNotification,
          LocalNotification
        >
    with $Provider<LocalNotification> {
  LocalNotificationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localNotificationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localNotificationHash();

  @$internal
  @override
  $ProviderElement<LocalNotification> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalNotification create(Ref ref) {
    return localNotification(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalNotification value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalNotification>(value),
    );
  }
}

String _$localNotificationHash() => r'83c24c677999d559c56a8679592a83a2bec758f3';
