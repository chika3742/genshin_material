import "dart:convert";
import "dart:developer";
import "dart:math" hide log;
import "dart:typed_data";

import "package:crypto/crypto.dart";
import "package:http/http.dart" as http;

import "../i18n/strings.g.dart";
import "../models/hoyolab_api.dart";
import "secure_storage.dart";

class HoyolabApi {
  HoyolabApi({this.cookie, this.region, this.uid, http.Client? client}) : client = client ?? http.Client();

  final http.Client client;
  final String lang = switch (LocaleSettings.currentLocale) {
    AppLocale.ja => "ja-jp",
    AppLocale.en => "en-us",
  };

  final String? cookie;
  final String? region;
  final String? uid;

  static const hoyolabAppVersion = "3.0.1";

  Map<String, String> get headers => {
    "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) miHoYoBBSOversea/$hoyolabAppVersion",
    "Origin": "https://act.hoyolab.com",
    "Referer": "https://act.hoyolab.com/",
    "Accept-Encoding": "gzip, deflate, br",

    "Cookie": cookie!,

    "Sec-Fetch-Dest": "empty",
    "Sec-Fetch-Site": "same-site",
    "Sec-Fetch-Mode": "cors",
  };

  Map<String, String> get additionalHeaders => {
    "x-rpc-client_type": "2",
    "x-rpc-app_version": hoyolabAppVersion,
    "x-rpc-language": lang,
  };

  Future<LookupServersResult> lookupServers() async {
    const url = "https://api-account-os.hoyolab.com/account/binding/api/getAllRegions?game_biz=hk4e_global";
    final result = await client.get(Uri.parse(url));
    return HoyolabApiResult.fromJsonList(const JsonCodec().decode(result.body), (e) => HyvServer.fromJson(e as Map<String, dynamic>));
  }

  Future<VerifyLTokenResult> verifyLToken() async {
    const url = "https://sg-public-api.hoyolab.com/account/ma-passport/token/verifyLToken";

    _ensureRequiredParams(params: [HoyolabApiParams.cookie]);

    final result = await client.post(
      Uri.parse(url),
      headers: headers,
    );

    return HoyolabApiResult.fromJson(const JsonCodec().decode(result.body), (obj) => HyvUserInfo.fromJson((obj as Map<String, dynamic>)["user_info"]));
  }

  Future<AvatarListResult> avatarList(int page, {List<int> elementIds = const [], List<int> weaponCatIds = const []}) {
    _ensureRequiredParams();

    const url = "https://sg-public-api.hoyolab.com/event/calculateos/sync/avatar/list";
    return _errorHandledThen(
      client.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode({
          "region": region,
          "lang": lang,
          "uid": uid,
          "size": 20,
          "page": page,
          "element_attr_ids": elementIds,
          "weapon_cat_ids": weaponCatIds,
        }),
      ),
      (obj) => HoyolabListData.fromJsonT(obj, AvatarListResultItem.fromJson),
    );
  }

  Future<GetUserGameRolesResult> getUserGameRoles() {
    _ensureRequiredParams(params: [HoyolabApiParams.cookie, HoyolabApiParams.region]);

    final url = "https://api-account-os.hoyolab.com/binding/api/getUserGameRolesByLtoken?game_biz=hk4e_global&region=$region";
    return _errorHandledThen(
      client.get(
        Uri.parse(url),
        headers: headers,
      ), (obj) => HoyolabListData.fromJsonT(obj, HyvUserGameRole.fromJson),
    );
  }

  Future<GameRecordCardList> getGameRecordCards() {
    const url = "https://bbs-api-os.hoyolab.com/game_record/app/card/wapi/getGameRecordCard";
    final queryParameters = {
      "uid": _getLtUid(),
    };
    return _errorHandledThen(
      client.get(
        Uri.parse(url).replace(queryParameters: queryParameters),
        headers: {
          ...headers,
          "DS": _getDsToken(queryParameters: queryParameters),
          ...additionalHeaders,
        },
      ), (obj) => HoyolabListData.fromJsonT(obj, GameRecordCard.fromJson),
    );
  }

  Future<void> changeDataSwitch(DataSwitchType switchType, bool value) {
    const url = "https://bbs-api-os.hoyolab.com/game_record/app/card/wapi/changeDataSwitch";
    final sw = DataSwitchMetadata(switchId: switchType, isPublic: value);
    final body = jsonEncode({
      "game_id": 2,
      ...sw.toJson(),
    });
    return _errorHandledThen(
      client.post(
        Uri.parse(url),
        headers: {
          ...headers,
          "DS": _getDsToken(body: body),
          ...additionalHeaders,
        },
        body: body,
      ), (_) => {},
    );
  }

  Future<DailyNote> getDailyNote() {
    _ensureRequiredParams();

    const url = "https://bbs-api-os.hoyolab.com/game_record/app/genshin/api/dailyNote";

    final queryParameters = {
      "role_id": uid!,
      "server": region!,
    };
    return _errorHandledThen(
      client.get(
        Uri.parse(url).replace(
          queryParameters: queryParameters,
        ),
        headers: {
          ...headers,
          ...additionalHeaders,
          "DS": _getDsToken(queryParameters: queryParameters),
        },
      ),
      (obj) => DailyNote.fromJson(obj as Map<String, dynamic>),
    );
  }

  Future<CalcResult> batchCompute(List<CalcComputeItem> items) async {
    _ensureRequiredParams();

    const endpoint = "https://sg-public-api.hoyolab.com/event/calculateos/batch_compute";

    log("Request body: ${jsonEncode({
      "items": items.map((e) => e.toJson()).toList(),
      "uid": uid,
      "region": region,
      "lang": lang,
    })}");

    return _errorHandledThen(
      client.post(
        Uri.parse(endpoint),
        headers: {
          ...headers,
        },
        body: jsonEncode({
          "items": items.map((e) => e.toJson()).toList(),
          "uid": uid,
          "region": region,
          "lang": lang,
        }),
      ),
      (obj) => CalcResult.fromJson(obj as Map<String, dynamic>),
    );
  }

  String _getDsToken({String body = "", Map<String, String> queryParameters = const {}}) {
    const salt = "okr4obncj8bw5a65hbnn5oo6ixjc3l9w"; // global region (NOT APPLICABLE FOR MAINLAND CHINA)

    final t = (DateTime.now().millisecondsSinceEpoch / 1000).floor();
    final r = 100000 + Random().nextInt(100000);
    final q = queryParameters.entries.map((e) => "${e.key}=${Uri.encodeQueryComponent(e.value)}").join("&");
    final c = md5.convert(utf8.encode("salt=$salt&t=$t&r=$r&b=$body&q=$q"));

    return "$t,$r,${c.toString()}";
  }

  String _getLtUid() {
    _ensureRequiredParams(params: [HoyolabApiParams.cookie]);
    return RegExp("; (?:ltuid_v2|account_id_v2)=(\\d+);").firstMatch(cookie!)!.group(1)!;
  }

  void _ensureRequiredParams({List<HoyolabApiParams> params = HoyolabApiParams.values}) {
    if (params.contains(HoyolabApiParams.cookie) && cookie == null) {
      throw StateError("Missing cookie");
    }
    if (params.contains(HoyolabApiParams.region) && region == null) {
      throw StateError("Missing region");
    }
    if (params.contains(HoyolabApiParams.uid) && uid == null) {
      throw StateError("Missing uid");
    }
  }

  static dynamic _parseJson(Uint8List bytes) {
    return const JsonCodec().decode(utf8.decode(bytes));
  }

  static Future<T> _errorHandledThen<T>(Future<http.Response> response, T Function(Object? obj) fromJsonT) {
    return response.then((value) {
      final result = HoyolabApiResult.fromJson(_parseJson(value.bodyBytes), fromJsonT);
      if (result.hasError) {
        throw HoyolabApiException(result.retcode, result.message);
      }
      return result.data!;
    });
  }
}

class HoyolabApiException implements Exception {
  final int retcode;
  final String originalMessage;

  const HoyolabApiException(this.retcode, this.originalMessage);

  String getMessage(String prepend) => "$prepend\n${switch (retcode) {
    -502002 => tr.hoyolab.characterDataAccessNotAllowed,
    Retcode.characterDoesNotExist => tr.hoyolab.characterDoesNotExist,
    -100 => tr.hoyolab.loginExpired,
    10102 => tr.hoyolab.realtimeNotesNotEnabled,
    _ => "($retcode: $originalMessage)",
  }}";

  @override
  String toString() {
    return "HoyolabApiException: $originalMessage, retcode: $retcode";
  }
}

class Retcode {
  static const characterDoesNotExist = -502001;
}

class HoyolabApiUtils {
  const HoyolabApiUtils._();

  static Future<T?> loopUntilCharacter<T extends WithId>(List<int> characterIds, Future<HoyolabListData<T>> Function(int page) apiCall) async {
    var page = 1;
    while (true) {
      final result = await apiCall(page);

      if (result.list.isEmpty) {
        break;
      }

      for (final item in result.list) {
        if (characterIds.contains(item.id)) {
          return item;
        }
      }
      page++;
    }

    return null;
  }

  static Future<List<AvatarListResultItem>> fetchAllCharacters(String region, String uid) async {
    Future<List<AvatarListResultItem>> apiCall(int page) async {
      final result = await HoyolabApi(cookie: await getHoyolabCookie(), region: region, uid: uid).avatarList(page);
      return result.list;
    }

    var page = 1;
    final result = <AvatarListResultItem>[];
    while (true) {
      final callResult = await apiCall(page);

      if (callResult.isEmpty) {
        break;
      }

      result.addAll(callResult);
      page++;
    }

    return result;
  }
}

enum HoyolabApiParams {
  cookie,
  region,
  uid,
}
