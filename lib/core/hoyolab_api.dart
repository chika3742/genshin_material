import "dart:convert";

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

  Future<LookupServersResult> lookupServers() async {
    const url = "https://api-account-os.hoyolab.com/account/binding/api/getAllRegions?game_biz=hk4e_global";
    final result = await client.get(Uri.parse(url));
    return HoyolabApiResult.fromJsonList(const JsonCodec().decode(result.body), (e) => HyvServer.fromJson(e as Map<String, dynamic>));
  }

  Future<VerifyLTokenResult> verifyLToken() async {
    const url = "https://sg-public-api.hoyolab.com/account/ma-passport/token/verifyLToken";

    ensureRequiredParams(params: [HoyolabApiParams.cookie]);

    final result = await client.post(
      Uri.parse(url),
      headers: {
        "Cookie": cookie!,
      },
    );

    return HoyolabApiResult.fromJson(const JsonCodec().decode(result.body), (obj) => HyvUserInfo.fromJson((obj as Map<String, dynamic>)["user_info"]));
  }

  Future<String> avatarList() {
    ensureRequiredParams(params: [HoyolabApiParams.cookie, HoyolabApiParams.region]);

    const url = "https://sg-public-api.hoyolab.com/event/calculateos/sync/avatar/list";
    return client.post(
      Uri.parse(url),
      headers: {
        "Cookie": cookie!,
        "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) miHoYoBBSOversea/2.55.1",
      },
      body: jsonEncode({
        "region": region,
        "lang": lang,
        "uid": uid,
        "size": 20,
        "page": 1,
      }),
    ).then((value) => utf8.decode(value.bodyBytes));
  }

  Future<GetUserGameRolesResult> getUserGameRoles() {
    ensureRequiredParams(params: [HoyolabApiParams.cookie, HoyolabApiParams.region]);

    final url = "https://api-account-os.hoyolab.com/binding/api/getUserGameRolesByLtoken?game_biz=hk4e_global&region=$region";
    return client.get(
      Uri.parse(url),
      headers: {
        "Cookie": cookie!,
      },
    ).then(
      (value) => HoyolabApiResult.fromJsonList(
        const JsonCodec().decode(utf8.decode(value.bodyBytes)),
        (e) => HyvUserGameRole.fromJson(e as Map<String, dynamic>),
      ),
    );
  }

  void ensureRequiredParams({List<HoyolabApiParams> params = HoyolabApiParams.values}) {
    if (params.contains(HoyolabApiParams.cookie) && cookie == null) {
      throw Exception("Missing cookie");
    }
    if (params.contains(HoyolabApiParams.region) && region == null) {
      throw Exception("Missing region");
    }
  }
}

enum HoyolabApiParams {
  cookie,
  region,
  uid,
}
