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
    required super.queue,
  });

  final String region;
  final String uid;

  Future<AvatarListResult> avatarList(int page, {List<int> elementIds = const [], List<int> weaponCatIds = const []}) => send(
    "https://sg-act-public-api.hoyolab.com/event/e20200928calculate/v1/sync/avatar/list",
    method: .post,
    body: {
      "region": region,
      "lang": lang,
      "uid": uid,
      "size": 20,
      "page": page,
      "element_attr_ids": elementIds,
      "weapon_cat_ids": weaponCatIds,
    },
    parse: (obj) => HoyolabListData.fromJsonT(obj, AvatarListResultItem.fromJson),
  );

  Future<DailyNote> getDailyNote() => send(
    "https://bbs-api-os.hoyolab.com/game_record/app/genshin/api/dailyNote",
    query: {
      "role_id": uid,
      "server": region,
    },
    withDsToken: true,
    withRpcHeaders: true,
    parse: (obj) => DailyNote.fromJson(obj! as Map<String, dynamic>),
  );

  Future<CalcResult> batchCompute(List<CalcComputeItem> items) async {
    if (items.length > maxBatchComputeItems) {
      throw ArgumentError("Batch compute items cannot exceed $maxBatchComputeItems items.");
    }

    return send(
      "https://sg-act-public-api.hoyolab.com/event/e20200928calculate/v3/batch_compute",
      method: .post,
      body: {
        "items": items.map((e) => e.toJson()).toList(),
        "uid": uid,
        "region": region,
        "lang": lang,
      },
      extraHeaders: const {"x-rpc-cal_type": "0"},
      parse: (obj) => CalcResult.fromJson(obj! as Map<String, dynamic>),
    );
  }
}
