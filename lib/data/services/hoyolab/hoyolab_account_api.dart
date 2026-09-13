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
    required super.client,
    required super.queue,
  });

  Future<void> logout() => send(
    "https://passport-api-sg.hoyolab.com/account/ma-passport/api/logout",
    method: .post,
    body: const <String, dynamic>{},
  );

  Future<GetUserGameRolesResult> getUserGameRoles(String region) => send(
    "https://api-account-os.hoyolab.com/binding/api/getUserGameRolesByLtoken",
    query: {"game_biz": "hk4e_global", "region": region},
    parse: (obj) => HoyolabListData.fromJsonT(obj, HyvUserGameRole.fromJson),
  );

  Future<GameRecordCardList> getGameRecordCards() => send(
    "https://sg-public-api.hoyolab.com/event/game_record/app/card/wapi/getGameRecordCard",
    query: {"uid": ltUid},
    withDsToken: true,
    withRpcHeaders: true,
    parse: (obj) => HoyolabListData.fromJsonT(obj, GameRecordCard.fromJson),
  );

  Future<void> changeDataSwitch(DataSwitchType switchType, bool value) => send(
    "https://sg-act-public-api.hoyolab.com/event/game_record/app/card/wapi/changeDataSwitch",
    method: .post,
    body: {
      "game_id": 2,
      ...DataSwitchMetadata(switchId: switchType, isPublic: value).toJson(),
    },
    withDsToken: true,
    withRpcHeaders: true,
  );
}
