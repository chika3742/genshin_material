// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_bonus_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Whether today's login bonus has been claimed, or `null` while HoYoLAB is not
/// linked.
///
/// The result is cached in preferences and fetched again only once it has
/// expired. "Claimed" holds until the server's check-in day ends. "Unclaimed"
/// may change outside the app, but it does not change that often, so it is not
/// refetched within [_fetchIntervalWhenUnclaimed] either.

@ProviderFor(LoginBonusState)
final loginBonusStateProvider = LoginBonusStateProvider._();

/// Whether today's login bonus has been claimed, or `null` while HoYoLAB is not
/// linked.
///
/// The result is cached in preferences and fetched again only once it has
/// expired. "Claimed" holds until the server's check-in day ends. "Unclaimed"
/// may change outside the app, but it does not change that often, so it is not
/// refetched within [_fetchIntervalWhenUnclaimed] either.
final class LoginBonusStateProvider
    extends $AsyncNotifierProvider<LoginBonusState, bool?> {
  /// Whether today's login bonus has been claimed, or `null` while HoYoLAB is not
  /// linked.
  ///
  /// The result is cached in preferences and fetched again only once it has
  /// expired. "Claimed" holds until the server's check-in day ends. "Unclaimed"
  /// may change outside the app, but it does not change that often, so it is not
  /// refetched within [_fetchIntervalWhenUnclaimed] either.
  LoginBonusStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: _noRetry,
        name: r'loginBonusStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginBonusStateHash();

  @$internal
  @override
  LoginBonusState create() => LoginBonusState();
}

String _$loginBonusStateHash() => r'5507d9c2e02feb9ba1396767fcd866896760b831';

/// Whether today's login bonus has been claimed, or `null` while HoYoLAB is not
/// linked.
///
/// The result is cached in preferences and fetched again only once it has
/// expired. "Claimed" holds until the server's check-in day ends. "Unclaimed"
/// may change outside the app, but it does not change that often, so it is not
/// refetched within [_fetchIntervalWhenUnclaimed] either.

abstract class _$LoginBonusState extends $AsyncNotifier<bool?> {
  FutureOr<bool?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool?>, bool?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool?>, bool?>,
              AsyncValue<bool?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
