import "package:http/http.dart" as http;

import "../models/hoyolab_api.dart";
import "hoyolab_api.dart";

class GachaLogApi {
  GachaLogApi({
    required this.userAgent,
    http.Client? client,
  }) : client = client ?? http.Client();

  final http.Client client;
  final String userAgent;

  static const _defaultHeaders = {
    "Accept": "application/json, text/plain, */*",
    "Accept-Encoding": "gzip, deflate, br",
    "sec-fetch-site": "same-site",
    "sec-fetch-mode": "cors",
    "sec-fetch-dest": "empty",
    "Origin": "https://gs.hoyoverse.com",
    "Referer": "https://gs.hoyoverse.com/",
    "Accept-Language": "en",
  };

  Future<GachaLogResult> getGachaLog(Map<String, String> params) {
    final endpoint = "https://public-operation-hk4e-sg.hoyoverse.com/gacha_info/api/getGachaLog";

    final url = Uri.parse(endpoint).replace(queryParameters: {
      ...params,
      "lang": "en",
      "timestamp": (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString(),
    });
    return HoyolabApi.errorHandledThen(
      client.get(url, headers: {
        ..._defaultHeaders,
        "User-Agent": userAgent,
      }),
      (json) => HoyolabListData.fromJsonT(json, GachaLogResultItem.fromJson),
    );
  }
}

class GachaLogFetcher {
  GachaLogFetcher({
    required this.userAgent,
    this.onProgress,
    GachaLogApi? api,
  }) : _api = api ?? GachaLogApi(userAgent: userAgent);

  final String userAgent;

  final GachaLogApi _api;

  /// Callback for progress updates
  final void Function()? onProgress;

  /// Interval between requests to avoid rate limit
  static const _interval = Duration(milliseconds: 250);

  /// Number of records to fetch per request
  static const _size = 20;

  /// Total number of gacha types to fetch
  int totalGachaTypes = 0;

  /// Number of gacha types already fetched
  int doneGachaTypes = 0;

  /// Number of records already fetched
  int fetchedRecords = 0;

  Future<List<GachaLogResultItem>> _getAllForGachaType(Map<String, String> params, String gachaType, bool untilRareItem) async {
    final results = <GachaLogResultItem>[];

    int page = 1;
    String? endId;
    while(true) {
      final result = await _api.getGachaLog({
        ...params,
        "gacha_type": gachaType,
        "page": page.toString(),
        "size": _size.toString(),
        "end_id": endId ?? "0",
      });
      results.addAll(result.list);

      // update progress
      fetchedRecords += result.list.length;
      onProgress?.call();

      if (result.list.length < _size || (untilRareItem && results.any((e) => e.rankType == "5"))) {
        break;
      }
      if (result.list.isNotEmpty) {
        endId = result.list.last.id;
      }
      await Future.delayed(_interval); // avoid rate limit
      page++;
    }
    return results;
  }

  Future<List<GachaLogResultItem>> getAllGachaTypes(
    Map<String, String> params,
    bool untilRareItem,
    List<String> gachaTypes,
  ) async {
    totalGachaTypes = gachaTypes.length;
    doneGachaTypes = 0;
    fetchedRecords = 0;

    final results = <GachaLogResultItem>[];
    for (final type in gachaTypes) {
      results.addAll(await _getAllForGachaType(params, type, untilRareItem));

      // update progress
      doneGachaTypes++;
      onProgress?.call();

      await Future.delayed(_interval); // avoid rate limit
    }
    return results;
  }
}
