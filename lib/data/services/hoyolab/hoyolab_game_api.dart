import "dart:convert";
import "dart:developer";

import "../../../models/hoyolab_api.dart";
import "hoyolab_api_base.dart";

const maxBatchComputeItems = 8;

/// The HoYoLAB endpoints that read the in-game state of one account, and
/// therefore need the selected server and the uid on top of the cookie.
class HoyolabGameApi extends HoyolabAuthenticatedApi {
  HoyolabGameApi({
    required super.enabled,
    required super.cookie,
    required this.region,
    required this.uid,
    required super.client,
  });

  final String region;
  final String uid;

  Future<AvatarListResult> avatarList(int page, {List<int> elementIds = const [], List<int> weaponCatIds = const []}) {
    ensureEnabled();

    const url = "https://sg-act-public-api.hoyolab.com/event/e20200928calculate/v1/sync/avatar/list";
    return HoyolabApiBase.errorHandledThen(
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

  Future<DailyNote> getDailyNote() {
    ensureEnabled();

    const url = "https://bbs-api-os.hoyolab.com/game_record/app/genshin/api/dailyNote";

    final queryParameters = {
      "role_id": uid,
      "server": region,
    };
    return HoyolabApiBase.errorHandledThen(
      client.get(
        Uri.parse(url).replace(
          queryParameters: queryParameters,
        ),
        headers: {
          ...headers,
          ...additionalHeaders,
          "DS": getDsToken(queryParameters: queryParameters),
        },
      ),
      (obj) => DailyNote.fromJson(obj! as Map<String, dynamic>),
    );
  }

  Future<CalcResult> batchCompute(List<CalcComputeItem> items) async {
    ensureEnabled();

    if (items.length > maxBatchComputeItems) {
      throw ArgumentError("Batch compute items cannot exceed $maxBatchComputeItems items.");
    }

    const endpoint = "https://sg-act-public-api.hoyolab.com/event/e20200928calculate/v3/batch_compute";

    final body = jsonEncode({
      "items": items.map((e) => e.toJson()).toList(),
      "uid": uid,
      "region": region,
      "lang": lang,
    });

    log("Request body: $body");

    return HoyolabApiBase.errorHandledThen(
      client.post(
        Uri.parse(endpoint),
        headers: {
          ...headers,
          "x-rpc-cal_type": "0",
        },
        body: body,
      ),
      (obj) => CalcResult.fromJson(obj! as Map<String, dynamic>),
    );
  }
}
