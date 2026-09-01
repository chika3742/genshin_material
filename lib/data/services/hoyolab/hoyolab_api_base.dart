import "dart:convert";
import "dart:math";
import "dart:typed_data";

import "package:clock/clock.dart";
import "package:crypto/crypto.dart";
import "package:http/http.dart" as http;

import "../../../core/api_request_queue.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/hoyolab_api.dart";
import "hoyolab_exceptions.dart";

/// Everything the HoYoLAB APIs share: the enabled flag, the HTTP client, the
/// headers and the DS token.
///
/// The concrete APIs are split by the credentials they need, so this class is
/// not meant to be used directly. See [HoyolabPublicApi],
/// [HoyolabAccountApi] and [HoyolabGameApi].
abstract class HoyolabApiBase {
  /// [enabled] mirrors `RemoteConfigKeys.hoyolabLinkEnabled`. It is injected
  /// rather than read from Firebase so that these classes stay testable and
  /// free of a Firebase dependency.
  HoyolabApiBase({
    required this.enabled,
    http.Client? client,
  }) : client = client ?? http.Client();

  final bool enabled;
  final http.Client client;

  static const hoyolabAppVersion = "4.13.0";

  static final queue = ApiRequestQueue(
    interval: const Duration(milliseconds: 500),
  );

  String get lang => switch (LocaleSettings.currentLocale) {
    AppLocale.ja => "ja-jp",
    AppLocale.en => "en-us",
  };

  Map<String, String> headersWithCookie(String cookie) => {
    "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) miHoYoBBSOversea/$hoyolabAppVersion",
    "Origin": "https://act.hoyolab.com",
    "Referer": "https://act.hoyolab.com/",
    "Accept-Encoding": "gzip, deflate, br",

    "Cookie": cookie,

    "Sec-Fetch-Dest": "empty",
    "Sec-Fetch-Site": "same-site",
    "Sec-Fetch-Mode": "cors",
  };

  Map<String, String> get additionalHeaders => {
    "x-rpc-client_type": "2",
    "x-rpc-app_version": hoyolabAppVersion,
    "x-rpc-language": lang,
  };

  /// Every public API method starts with this, so a link that is switched off
  /// remotely fails on the call instead of on construction.
  void ensureEnabled() {
    if (!enabled) {
      throw const HoyolabLinkDisabledException();
    }
  }

  String getDsToken({String body = "", Map<String, String> queryParameters = const {}}) {
    const salt = "okr4obncj8bw5a65hbnn5oo6ixjc3l9w"; // global region (NOT APPLICABLE FOR MAINLAND CHINA)

    final t = (clock.now().millisecondsSinceEpoch / 1000).floor();
    final r = 100000 + Random().nextInt(100000);
    final q = queryParameters.entries.map((e) => "${e.key}=${Uri.encodeQueryComponent(e.value)}").join("&");
    final c = md5.convert(utf8.encode("salt=$salt&t=$t&r=$r&b=$body&q=$q"));

    return "$t,$r,${c.toString()}";
  }

  static dynamic parseJson(Uint8List bytes) {
    return const JsonCodec().decode(utf8.decode(bytes));
  }

  static Future<T> errorHandledThen<T>(Future<http.Response> response, T Function(Object? obj) fromJsonT) {
    return response.then((value) {
      final result = HoyolabApiResult.fromJson(parseJson(value.bodyBytes), fromJsonT);
      if (result.hasError) {
        throw HoyolabApiException(result.retcode, result.message);
      }
      return result.data!;
    });
  }
}

/// Base of the APIs that act on behalf of a signed-in HoYoLAB account.
abstract class HoyolabAuthenticatedApi extends HoyolabApiBase {
  HoyolabAuthenticatedApi({
    required super.enabled,
    required this.cookie,
    super.client,
  });

  final String cookie;

  Map<String, String> get headers => headersWithCookie(cookie);

  /// The HoYoLAB user id carried by the cookie.
  String get ltUid =>
      RegExp("; (?:ltuid_v2|account_id_v2)=(\\d+);").firstMatch(cookie)!.group(1)!;
}
