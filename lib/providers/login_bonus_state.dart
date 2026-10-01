import "dart:async";

import "package:clock/clock.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:timezone/timezone.dart" as tz;

import "../core/pref_keys.dart";
import "../core/remote_config_keys.dart";
import "../data/repositories/hoyolab_cookie_repository.dart";
import "hoyolab_api.dart";
import "pref_notifier.dart";
import "remote_config.dart";

part "login_bonus_state.g.dart";

final _loginBonusTimeZone = tz.getLocation("Asia/Shanghai");
const _fetchIntervalWhenUnclaimed = Duration(minutes: 15);

typedef _Cache = ({DateTime expiresAt, bool signed});

/// When the check-in day [today], a date in [_loginBonusTimeZone], ends.
tz.TZDateTime _endOfDay(DateTime today) =>
    tz.TZDateTime(_loginBonusTimeZone, today.year, today.month, today.day + 1);

/// The cached state of the account [ltUid], if any.
_Cache? _readCache(String? cache, String ltUid) {
  if (cache?.split(";") case [final key, final rawExpiresAt, final signed] when key == ltUid) {
    if (DateTime.tryParse(rawExpiresAt) case final expiresAt?) {
      return (expiresAt: expiresAt, signed: signed == "true");
    }
  }
  return null;
}

/// A failed fetch is retried on the next launch or resume instead, so that a
/// failure does not multiply the requests.
Duration? _noRetry(int retryCount, Object error) => null;

/// Whether today's login bonus has been claimed, or `null` while HoYoLAB is not
/// linked.
///
/// The result is cached in preferences and fetched again only once it has
/// expired. "Claimed" holds until the server's check-in day ends. "Unclaimed"
/// may change outside the app, but it does not change that often, so it is not
/// refetched within [_fetchIntervalWhenUnclaimed] either.
@Riverpod(retry: _noRetry)
class LoginBonusState extends _$LoginBonusState {
  @override
  Future<bool?> build() async {
    // Checked here instead of letting hoyolabAccountApiProvider throw: this
    // provider runs from launch for every user, and failures go to Crashlytics.
    if (!ref.watch(remoteConfigProvider(RemoteConfigKeys.hoyolabLinkEnabled)) ||
        await ref.watch(hoyolabCookieRepositoryProvider.future) == null) {
      return null;
    }

    final api = await ref.watch(hoyolabAccountApiProvider.future);
    final cache = _readCache(ref.read(prefProvider(PrefKeys.lastLoginBonusStateSynced)), api.ltUid);
    if (cache != null && cache.expiresAt.isAfter(clock.now())) {
      return cache.signed;
    }

    final result = await api.loginBonusStatus();
    final signed = result.isSign;
    final now = clock.now();
    final endOfDay = _endOfDay(result.today);
    final expiresAt = signed && endOfDay.isAfter(now)
        ? endOfDay
        : now.add(_fetchIntervalWhenUnclaimed);
    ref.read(prefProvider(PrefKeys.lastLoginBonusStateSynced).notifier)
        .set("${api.ltUid};${expiresAt.toUtc().toIso8601String()};$signed");
    return signed;
  }

  /// Fetches again regardless of the cache. Use when the state may have just
  /// changed, e.g. after the sign-in WebView is closed. A claimed state cannot
  /// change until the next reset, so it is kept.
  void refresh() {
    if (state case AsyncData(value: true)) {
      return;
    }
    ref.read(prefProvider(PrefKeys.lastLoginBonusStateSynced).notifier).set(null);
    ref.invalidateSelf();
  }
}
