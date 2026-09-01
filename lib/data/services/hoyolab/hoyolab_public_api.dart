import "dart:convert";

import "../../../models/hoyolab_api.dart";
import "hoyolab_api_base.dart";

/// The HoYoLAB endpoints that need no stored credential.
///
/// [verifyLToken] takes the cookie as an argument instead of holding on to it,
/// because it runs before the cookie is persisted.
class HoyolabPublicApi extends HoyolabApiBase {
  HoyolabPublicApi({required super.enabled, required super.client});

  Future<LookupServersResult> lookupServers() async {
    ensureEnabled();

    const url = "https://api-account-os.hoyolab.com/account/binding/api/getAllRegions?game_biz=hk4e_global";
    final result = await client.get(Uri.parse(url));
    return HoyolabApiResult.fromJsonList(const JsonCodec().decode(result.body), (e) => HyvServer.fromJson(e! as Map<String, dynamic>));
  }

  /// Checks whether [cookie] is a valid HoYoLAB credential.
  ///
  /// The failure is reported through the returned result rather than thrown,
  /// so the caller can surface the message HoYoLAB sent back.
  Future<VerifyLTokenResult> verifyLToken(String cookie) async {
    ensureEnabled();

    const url = "https://passport-api-sg.hoyolab.com/account/ma-passport/token/verifyLToken";

    final result = await client.post(
      Uri.parse(url),
      headers: headersWithCookie(cookie),
    );

    return HoyolabApiResult.fromJson(const JsonCodec().decode(result.body), (obj) => HyvUserInfo.fromJson((obj! as Map<String, dynamic>)["user_info"]));
  }
}
