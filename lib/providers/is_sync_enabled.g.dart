// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_sync_enabled.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(isCharacterSyncEnabled)
final isCharacterSyncEnabledProvider = IsCharacterSyncEnabledFamily._();

final class IsCharacterSyncEnabledProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsCharacterSyncEnabledProvider._({
    required IsCharacterSyncEnabledFamily super.from,
    required ({VariantId variantId, String? weaponId}) super.argument,
  }) : super(
         retry: null,
         name: r'isCharacterSyncEnabledProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isCharacterSyncEnabledHash();

  @override
  String toString() {
    return r'isCharacterSyncEnabledProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as ({VariantId variantId, String? weaponId});
    return isCharacterSyncEnabled(
      ref,
      variantId: argument.variantId,
      weaponId: argument.weaponId,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsCharacterSyncEnabledProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isCharacterSyncEnabledHash() =>
    r'b5ff4586a232272a119c04bf81f2c788cb057e42';

final class IsCharacterSyncEnabledFamily extends $Family
    with
        $FunctionalFamilyOverride<
          bool,
          ({VariantId variantId, String? weaponId})
        > {
  IsCharacterSyncEnabledFamily._()
    : super(
        retry: null,
        name: r'isCharacterSyncEnabledProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsCharacterSyncEnabledProvider call({
    required VariantId variantId,
    String? weaponId,
  }) => IsCharacterSyncEnabledProvider._(
    argument: (variantId: variantId, weaponId: weaponId),
    from: this,
  );

  @override
  String toString() => r'isCharacterSyncEnabledProvider';
}

@ProviderFor(isBagLackNumSyncEnabled)
final isBagLackNumSyncEnabledProvider = IsBagLackNumSyncEnabledFamily._();

final class IsBagLackNumSyncEnabledProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsBagLackNumSyncEnabledProvider._({
    required IsBagLackNumSyncEnabledFamily super.from,
    required VariantId super.argument,
  }) : super(
         retry: null,
         name: r'isBagLackNumSyncEnabledProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isBagLackNumSyncEnabledHash();

  @override
  String toString() {
    return r'isBagLackNumSyncEnabledProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as VariantId;
    return isBagLackNumSyncEnabled(ref, variantId: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsBagLackNumSyncEnabledProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isBagLackNumSyncEnabledHash() =>
    r'e71bd95bb9857cefd292f5c42003c0a76d76a586';

final class IsBagLackNumSyncEnabledFamily extends $Family
    with $FunctionalFamilyOverride<bool, VariantId> {
  IsBagLackNumSyncEnabledFamily._()
    : super(
        retry: null,
        name: r'isBagLackNumSyncEnabledProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsBagLackNumSyncEnabledProvider call({required VariantId variantId}) =>
      IsBagLackNumSyncEnabledProvider._(argument: variantId, from: this);

  @override
  String toString() => r'isBagLackNumSyncEnabledProvider';
}
