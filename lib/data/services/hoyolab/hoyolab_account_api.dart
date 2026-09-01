import "dart:convert";

import "../../../models/hoyolab_api.dart";
import "hoyolab_api_base.dart";

/// The HoYoLAB endpoints that act on the account itself, before a server has
/// been picked.
///
/// [getUserGameRoles] takes the region as an argument because the server
/// selection UI queries servers the user has not committed to yet.
class HoyolabAccountApi extends HoyolabAuthenticatedApi {
  HoyolabAccountApi({
    required super.enabled,
    required super.cookie,
    super.client,
  });

  Future<void> logout() async {
    ensureEnabled();

    const url = "https://passport-api-sg.hoyolab.com/account/ma-passport/api/logout";

    await client.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode({}),
    );
  }

  Future<GetUserGameRolesResult> getUserGameRoles(String region) {
    ensureEnabled();

    final url = "https://api-account-os.hoyolab.com/binding/api/getUserGameRolesByLtoken?game_biz=hk4e_global&region=$region";
    return HoyolabApiBase.errorHandledThen(
      client.get(
        Uri.parse(url),
        headers: headers,
      ), (obj) => HoyolabListData.fromJsonT(obj, HyvUserGameRole.fromJson),
    );
  }

  Future<GameRecordCardList> getGameRecordCards() {
    ensureEnabled();

    const url = "https://sg-public-api.hoyolab.com/event/game_record/app/card/wapi/getGameRecordCard";
    final queryParameters = {
      "uid": ltUid,
    };
    return HoyolabApiBase.errorHandledThen(
      client.get(
        Uri.parse(url).replace(queryParameters: queryParameters),
        headers: {
          ...headers,
          "DS": getDsToken(queryParameters: queryParameters),
          ...additionalHeaders,
        },
      ), (obj) => HoyolabListData.fromJsonT(obj, GameRecordCard.fromJson),
    );
  }

  Future<void> changeDataSwitch(DataSwitchType switchType, bool value) {
    ensureEnabled();

    const url = "https://sg-act-public-api.hoyolab.com/event/game_record/app/card/wapi/changeDataSwitch";
    final sw = DataSwitchMetadata(switchId: switchType, isPublic: value);
    final body = jsonEncode({
      "game_id": 2,
      ...sw.toJson(),
    });
    return HoyolabApiBase.errorHandledThen(
      client.post(
        Uri.parse(url),
        headers: {
          ...headers,
          "DS": getDsToken(body: body),
          ...additionalHeaders,
        },
        body: body,
      ), (_) => {},
    );
  }
}
