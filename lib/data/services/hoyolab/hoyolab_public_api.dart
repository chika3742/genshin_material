import "../../../models/hoyolab_api.dart";
import "hoyolab_api_base.dart";

/// The HoYoLAB endpoints that need no stored credential.
///
/// [verifyLToken] takes the cookie as an argument instead of holding on to it,
/// because it runs before the cookie is persisted.
class HoyolabPublicApi extends HoyolabApiBase {
  HoyolabPublicApi({
    required super.client,
    required super.queue,
  });

  Future<LookupServersResult> lookupServers() => send(
    "https://api-account-os.hoyolab.com/account/binding/api/getAllRegions",
    query: {"game_biz": "hk4e_global"},
    parse: (obj) => HoyolabListData.fromJsonT(obj, HyvServer.fromJson),
  );

  /// Checks whether [cookie] is a valid HoYoLAB credential.
  ///
  /// A rejected cookie arrives as a [HoyolabApiException]; the sign-in flow
  /// turns it into the message it shows the user.
  Future<HyvUserInfo> verifyLToken(String cookie) => send(
    "https://passport-api-sg.hoyolab.com/account/ma-passport/token/verifyLToken",
    method: .post,
    cookie: cookie,
    parse: (obj) => HyvUserInfo.fromJson(
      (obj! as Map<String, dynamic>)["user_info"] as Map<String, dynamic>,
    ),
  );
}
