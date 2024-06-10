import "dart:convert";
import "dart:typed_data";

import "package:http/http.dart" as http;

import "../i18n/strings.g.dart";
import "../models/hoyolab_api.dart";

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

  Map<String, String> get headers => {
    "Cookie": cookie!,
    "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko)",
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

  Future<AvatarDetail> avatarDetail(int avatarId) {
    _ensureRequiredParams();

    const url = "https://sg-public-api.hoyolab.com/event/calculateos/sync/avatar/detail";
    final queryParams = {
      "avatar_id": avatarId.toString(),
      "uid": uid!,
      "region": region!,
      "lang": lang,
    };
    final uri = Uri.parse(url).replace(queryParameters: queryParams);

    return _errorHandledThen(client.get(
      uri,
      headers: headers,
    ), (obj) => AvatarDetail.fromJson(obj as Map<String, dynamic>),);
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

  void _ensureRequiredParams({List<HoyolabApiParams> params = HoyolabApiParams.values}) {
    if (params.contains(HoyolabApiParams.cookie) && cookie == null) {
      throw ArgumentError("Missing cookie");
    }
    if (params.contains(HoyolabApiParams.region) && region == null) {
      throw ArgumentError("Missing region");
    }
    if (params.contains(HoyolabApiParams.uid) && uid == null) {
      throw ArgumentError("Missing uid");
    }
  }

  static dynamic _toJson(Uint8List bytes) {
    return const JsonCodec().decode(utf8.decode(bytes));
  }

  static Future<T> _errorHandledThen<T>(Future<http.Response> response, T Function(Object?) fromJsonT) {
    return response.then((value) {
      final result = HoyolabApiResult.fromJson(_toJson(value.bodyBytes), fromJsonT);
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
    _ => "($retcode)",
  }}";

  @override
  String toString() {
    return "HoyolabApiException: $originalMessage, retcode: $retcode";
  }
}

class HoyolabApiUtils {
  static Future<T?> loopUntilCharacter<T extends WithId>(int characterId, Future<HoyolabListData<T>> Function(int page) apiCall) async {
    var page = 1;
    while (true) {
      final result = await apiCall(page);

      if (result.list.isEmpty) {
        break;
      }

      for (final item in result.list) {
        if (item.id == characterId) {
          return item;
        }
      }
      page++;
    }

    return null;
  }
}

enum HoyolabApiParams {
  cookie,
  region,
  uid,
}
