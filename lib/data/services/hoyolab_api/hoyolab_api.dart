import "dart:async";
import "dart:convert";
import "dart:developer";

import "package:http/http.dart" as http;
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../core/errors.dart";
import "../../../core/pref_keys.dart";
import "../../../core/remote_config_keys.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/hoyolab_api.dart";
import "../../../providers/pref_notifier.dart";
import "../../repositories/remote_config_repository.dart";
import "../../repositories/secure_storage_repository.dart";
import "hoyolab_api_internal_utils.dart";

part "hoyolab_api.g.dart";

base class HoyolabApi {
  final http.Client _client;

  HoyolabApi([http.Client? client]) : _client = client ?? http.Client();

  static final queue = ApiRequestQueue(
    interval: const Duration(milliseconds: 500),
  );

  static const _hoyolabAppVersion = "4.13.0";

  String get _lang => switch (LocaleSettings.currentLocale) {
    AppLocale.ja => "ja-jp",
    AppLocale.en => "en-us",
  };

  Map<String, String> get _additionalHeaders => {
    "x-rpc-client_type": "2",
    "x-rpc-app_version": _hoyolabAppVersion,
    "x-rpc-language": _lang,
  };

  Map<String, String> _buildHeaders(String cookie) => {
    "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) miHoYoBBSOversea/$_hoyolabAppVersion",
    "Origin": "https://act.hoyolab.com",
    "Referer": "https://act.hoyolab.com/",
    "Accept-Encoding": "gzip, deflate, br",

    "Cookie": cookie,

    "Sec-Fetch-Dest": "empty",
    "Sec-Fetch-Site": "same-site",
    "Sec-Fetch-Mode": "cors",
  };
}

final class HoyolabPreAuthApi extends HoyolabApi {
  HoyolabPreAuthApi([super.client]);

  Future<LookupServersResult> lookupServers() async {
    const url = "https://api-account-os.hoyolab.com/account/binding/api/getAllRegions?game_biz=hk4e_global";
    final result = await _client.get(Uri.parse(url));
    return HoyolabApiResult.fromJsonList(const JsonCodec().decode(result.body), (e) => HyvServer.fromJson(e! as Map<String, dynamic>));
  }

  Future<VerifyLTokenResult> verifyLToken(String cookie) async {
    const url = "https://passport-api-sg.hoyolab.com/account/ma-passport/token/verifyLToken";

    final result = await _client.post(
      Uri.parse(url),
      headers: _buildHeaders(cookie),
    );

    return HoyolabApiResult.fromJson(const JsonCodec().decode(result.body), (obj) => HyvUserInfo.fromJson((obj! as Map<String, dynamic>)["user_info"]));
  }
}

final class HoyolabAuthenticatedApi extends HoyolabApi {
  final String cookie;

  HoyolabAuthenticatedApi(this.cookie, [super.client]);

  Future<void> logout() async {
    const url = "https://passport-api-sg.hoyolab.com/account/ma-passport/api/logout";

    await _client.post(
      Uri.parse(url),
      headers: _buildHeaders(cookie),
      body: jsonEncode({}),
    );
  }

  Future<GetUserGameRolesResult> getUserGameRoles(String region) {
    final url = "https://api-account-os.hoyolab.com/binding/api/getUserGameRolesByLtoken?game_biz=hk4e_global&region=$region";
    return errorHandledThen(
      _client.get(
        Uri.parse(url),
        headers: _buildHeaders(cookie),
      ), (obj) => HoyolabListData.fromJsonT(obj, HyvUserGameRole.fromJson),
    );
  }

  Future<GameRecordCardList> getGameRecordCards() {
    const url = "https://sg-public-api.hoyolab.com/event/game_record/app/card/wapi/getGameRecordCard";
    final queryParameters = {
      "uid": _getLtUid(),
    };
    return errorHandledThen(
      _client.get(
        Uri.parse(url).replace(queryParameters: queryParameters),
        headers: {
          ..._buildHeaders(cookie),
          "DS": getDsToken(queryParameters: queryParameters),
          ..._additionalHeaders,
        },
      ), (obj) => HoyolabListData.fromJsonT(obj, GameRecordCard.fromJson),
    );
  }

  Future<void> changeDataSwitch(DataSwitchType switchType, bool value) {
    const url = "https://sg-act-public-api.hoyolab.com/event/game_record/app/card/wapi/changeDataSwitch";
    final sw = DataSwitchMetadata(switchId: switchType, isPublic: value);
    final body = jsonEncode({
      "game_id": 2,
      ...sw.toJson(),
    });
    return errorHandledThen(
      _client.post(
        Uri.parse(url),
        headers: {
          ..._buildHeaders(cookie),
          "DS": getDsToken(body: body),
          ..._additionalHeaders,
        },
        body: body,
      ), (_) => {},
    );
  }

  String _getLtUid() {
    return RegExp("; (?:ltuid_v2|account_id_v2)=(\\d+);").firstMatch(cookie)!.group(1)!;
  }
}

final class HoyolabAuthenticatedServerApi extends HoyolabApi {
  final String cookie;
  final String region;
  final String uid;

  HoyolabAuthenticatedServerApi(this.cookie, this.region, this.uid, [super.client]);

  Future<AvatarListResult> avatarList(int page, {List<int> elementIds = const [], List<int> weaponCatIds = const []}) {
    const url = "https://sg-act-public-api.hoyolab.com/event/e20200928calculate/v1/sync/avatar/list";
    return errorHandledThen(
      _client.post(
        Uri.parse(url),
        headers: _buildHeaders(cookie),
        body: jsonEncode({
          "region": region,
          "lang": _lang,
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
    const url = "https://bbs-api-os.hoyolab.com/game_record/app/genshin/api/dailyNote";

    final queryParameters = {
      "role_id": uid,
      "server": region,
    };
    return errorHandledThen(
      _client.get(
        Uri.parse(url).replace(
          queryParameters: queryParameters,
        ),
        headers: {
          ..._buildHeaders(cookie),
          ..._additionalHeaders,
          "DS": getDsToken(queryParameters: queryParameters),
        },
      ),
      (obj) => DailyNote.fromJson(obj! as Map<String, dynamic>),
    );
  }

  Future<CalcResult> batchCompute(List<CalcComputeItem> items) async {
    const maxBatchComputeItems = 8;

    const endpoint = "https://sg-act-public-api.hoyolab.com/event/e20200928calculate/v3/batch_compute";

    final body = jsonEncode({
      "items": items.map((e) => e.toJson()).toList(),
      "uid": uid,
      "region": region,
      "lang": _lang,
    });

    if (items.length > maxBatchComputeItems) {
      throw ArgumentError("Batch compute items cannot exceed $maxBatchComputeItems items.");
    }

    log("Request body: $body");

    return errorHandledThen(
      _client.post(
        Uri.parse(endpoint),
        headers: {
          ..._buildHeaders(cookie),
          "x-rpc-cal_type": "0",
        },
        body: body,
      ),
      (obj) => CalcResult.fromJson(obj! as Map<String, dynamic>),
    );
  }
}

@Riverpod(keepAlive: true)
HoyolabPreAuthApi hoyolabPreAuthApi(Ref ref) {
  if (!ref.watch(remoteConfigProvider).get(RemoteConfigKeys.hoyolabLinkEnabled)) {
    throw HoyolabLinkDisabledException();
  }

  return HoyolabPreAuthApi();
}

@riverpod
Future<HoyolabAuthenticatedApi> hoyolabAuthenticatedApi(Ref ref) async {
  if (!ref.watch(remoteConfigProvider).get(RemoteConfigKeys.hoyolabLinkEnabled)) {
    throw HoyolabLinkDisabledException();
  }

  final secureStorage = ref.watch(secureStorageRepositoryProvider);

  final cookie = await secureStorage.getHoyolabCookie();
  if (cookie == null) {
    throw HoyolabUnauthenticatedException();
  }

  return HoyolabAuthenticatedApi(cookie);
}

@riverpod
Future<HoyolabAuthenticatedServerApi> hoyolabAuthenticatedServerApi(Ref ref) async {
  if (!ref.watch(remoteConfigProvider).get(RemoteConfigKeys.hoyolabLinkEnabled)) {
    throw HoyolabLinkDisabledException();
  }

  final secureStorage = ref.watch(secureStorageRepositoryProvider);

  final cookie = await secureStorage.getHoyolabCookie();
  if (cookie == null) {
    throw HoyolabUnauthenticatedException();
  }

  final region = ref.watch(prefProvider(PrefKeys.hyvServer));
  final uid = ref.watch(prefProvider(PrefKeys.hyvUid));
  if (region == null || uid == null) {
    throw HoyolabServerNotSelectedException();
  }

  return HoyolabAuthenticatedServerApi(cookie, region, uid);
}
