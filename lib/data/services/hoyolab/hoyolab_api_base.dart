import "dart:convert";
import "dart:math";

import "package:clock/clock.dart";
import "package:crypto/crypto.dart";
import "package:flutter/widgets.dart";
import "package:freezed_annotation/freezed_annotation.dart";
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
  HoyolabApiBase({
    required this._enabled,
    required this._client,
    required this._queue,
  });

  /// Whether the feature is enabled by remote. If `false`, all API methods will
  /// fail. This avoids throwing in the initializer instead of during the method
  /// calls.
  final bool _enabled;
  final http.Client _client;
  final ApiRequestQueue _queue;

  static const hoyolabAppVersion = "4.20.0";

  /// The cookie sent when a call does not name one. Authenticated APIs answer
  /// with the cookie they hold; the public API has none.
  @protected
  String? get defaultCookie => null;

  String get lang => switch (LocaleSettings.currentLocale) {
    AppLocale.ja => "ja-jp",
    AppLocale.en => "en-us",
  };

  Map<String, String> constructHeaders({
    String? cookie,
    bool withRpcHeaders = false,
    String? dsToken,
    Map<String, String> extras = const {},
    bool post = false,
  }) => {
    "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) miHoYoBBSOversea/$hoyolabAppVersion",
    "Origin": "https://act.hoyolab.com",
    "Referer": "https://act.hoyolab.com/",
    "Accept-Encoding": "gzip, deflate, br",
    if (post) "Content-Type": "application/json",

    "Cookie": ?cookie,

    "Sec-Fetch-Dest": "empty",
    "Sec-Fetch-Site": "same-site",
    "Sec-Fetch-Mode": "cors",

    "DS": ?dsToken,

    if (withRpcHeaders) ...{
      "x-rpc-client_type": "2",
      "x-rpc-app_version": hoyolabAppVersion,
      "x-rpc-language": lang,
    },

    ...extras,
  };

  /// All query parameters must be provided via [query] argument. [endpoint]
  /// should NOT include the query parameters.
  ///
  /// If [parse] is null, the result will be `null`. In that case, specify
  /// `void` for the type argument.
  Future<T> send<T>(
    String endpoint, {
    HttpMethod method = .get,
    Map<String, String> query = const {},
    Object? body,
    bool withDsToken = false,
    bool withRpcHeaders = false,
    Map<String, String> extraHeaders = const {},
    String? cookie,
    T Function(Object? obj)? parse,
  }) async {
    if (!_enabled) {
      throw const HoyolabLinkDisabledException();
    }

    final encodedBody = body == null ? null : jsonEncode(body);
    final headers = constructHeaders(
      cookie: cookie ?? defaultCookie,
      withRpcHeaders: withRpcHeaders,
      dsToken: withDsToken
          ? getDsToken(body: encodedBody ?? "", queryParameters: query)
          : null,
      extras: extraHeaders,
      post: method == .post,
    );

    final url = Uri.parse(endpoint)
        .replace(queryParameters: query.isNotEmpty ? query : null);
    final resp = await _queue.run(() => switch (method) {
      .get => _client.get(url, headers: headers),
      .post => _client.post(url, headers: headers, body: encodedBody),
    });
    final respBody = utf8.decode(resp.bodyBytes, allowMalformed: true);
    final Object? decoded;
    try {
      decoded = jsonDecode(respBody);
    } on FormatException {
      throw HoyolabInvalidResponseException(
        resp.statusCode,
        respBody.characters.take(100).string,
      );
    }
    try {
      final result = HoyolabApiResult.fromJson(
        // if decoded is null, it will caught as TypeError
        // ignore: cast_nullable_to_non_nullable
        decoded as Map<String, dynamic>,
        parse ?? (obj) => null,
      );
      if (result.hasError) {
        throw HoyolabApiException(result.retcode, result.message);
      }
      return result.data as T;
    } on FormatException catch (_) {
      throw HoyolabInvalidResponseException(resp.statusCode, respBody.characters.take(100).string);
    } on CheckedFromJsonException catch (e) {
      throw HoyolabInvalidResponseException(resp.statusCode, "Failed to parse at ${e.className}.${e.key}.");
    } on TypeError catch (e) {
      throw HoyolabInvalidResponseException(resp.statusCode, e.toString());
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
}

/// Base of the APIs that act on behalf of a signed-in HoYoLAB account.
abstract class HoyolabAuthenticatedApi extends HoyolabApiBase {
  HoyolabAuthenticatedApi({
    required super.enabled,
    required this.cookie,
    required super.client,
    required super.queue,
  });

  final String cookie;

  @override
  String? get defaultCookie => cookie;

  /// The HoYoLAB user id carried by the cookie.
  String get ltUid =>
      RegExp(r"(?:^|;\s*)(?:ltuid_v2|account_id_v2)=(\d+?)\s*(?:;|$)").firstMatch(cookie)!.group(1)!;
}

enum HttpMethod {
  get,
  post,
}
