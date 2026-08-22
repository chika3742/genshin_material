// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secure_storage_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(secureStorageRepository)
final secureStorageRepositoryProvider = SecureStorageRepositoryProvider._();

final class SecureStorageRepositoryProvider
    extends
        $FunctionalProvider<
          SecureStorageRepository,
          SecureStorageRepository,
          SecureStorageRepository
        >
    with $Provider<SecureStorageRepository> {
  SecureStorageRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'secureStorageRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$secureStorageRepositoryHash();

  @$internal
  @override
  $ProviderElement<SecureStorageRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SecureStorageRepository create(Ref ref) {
    return secureStorageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SecureStorageRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SecureStorageRepository>(value),
    );
  }
}

String _$secureStorageRepositoryHash() =>
    r'95cdb6049535e3ecd4f5edf992dd49d92661f676';
