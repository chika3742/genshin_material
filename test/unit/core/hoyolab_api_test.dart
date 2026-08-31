import "dart:convert";

import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/hoyolab_api.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:genshin_material/models/hoyolab_api.dart";
import "package:http/http.dart" as http;
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";

import "../../utils/stub_remote_config.dart";
import "../../utils/stub_remote_config.mocks.dart";
import "hoyolab_api_test.mocks.dart";

/// A cookie shaped the way `_getLtUid` expects: the id has to be surrounded by
/// "; " and ";" for the lookup regexp to match.
const _cookie = "ltoken_v2=token; ltuid_v2=123456;";
const _region = "os_asia";
const _uid = "800000000";

String _okBody(Object? data) =>
    jsonEncode({"retcode": 0, "message": "OK", "data": data});

String _errorBody(int retcode, String message) =>
    jsonEncode({"retcode": retcode, "message": message});

@GenerateMocks([http.Client])
void main() {
  late MockClient client;
  late MockRemoteConfigRepository remoteConfig;

  setUp(() {
    client = MockClient();
    remoteConfig = MockRemoteConfigRepository();
    stubRemoteConfig(remoteConfig, hoyolabLinkEnabled: true);
    LocaleSettings.setLocaleSync(AppLocale.ja);
  });

  HoyolabApi createApi({
    String? cookie = _cookie,
    String? region = _region,
    String? uid = _uid,
  }) {
    return HoyolabApi(
      cookie: cookie,
      region: region,
      uid: uid,
      client: client,
      remoteConfig: remoteConfig,
    );
  }

  void stubGet(String body, {int statusCode = 200}) {
    when(client.get(any, headers: anyNamed("headers")))
        .thenAnswer((_) async => http.Response(body, statusCode));
  }

  void stubPost(String body, {int statusCode = 200}) {
    when(client.post(any, headers: anyNamed("headers"), body: anyNamed("body")))
        .thenAnswer((_) async => http.Response(body, statusCode));
  }

  Map<String, String> capturePostHeaders() {
    return verify(
      client.post(
        any,
        headers: captureAnyNamed("headers"),
        body: anyNamed("body"),
      ),
    ).captured.single as Map<String, String>;
  }

  Map<String, String> captureGetHeaders() {
    return verify(client.get(any, headers: captureAnyNamed("headers")))
        .captured
        .single as Map<String, String>;
  }

  group("constructor", () {
    test("throws when the HoYoLAB link is disabled by remote config", () {
      stubRemoteConfig(remoteConfig);

      expect(createApi, throwsStateError);
    });

    test("can be built without any credential when the link is enabled", () {
      expect(
        () => createApi(cookie: null, region: null, uid: null),
        returnsNormally,
      );
    });

    test("shares a single request queue across instances", () {
      expect(HoyolabApi.queue, same(HoyolabApi.queue));
      expect(HoyolabApi.queue.interval, const Duration(milliseconds: 500));
    });
  });

  group("required parameters", () {
    test("verifyLToken needs the cookie only", () {
      stubPost(_okBody({"user_info": {"account_name": "tester"}}));

      expect(
        createApi(cookie: null).verifyLToken(),
        throwsA(isStateError("Missing cookie")),
      );
      expect(createApi(region: null, uid: null).verifyLToken(), completes);
    });

    test("logout needs the cookie only", () {
      stubPost(_okBody(null));

      expect(
        createApi(cookie: null).logout(),
        throwsA(isStateError("Missing cookie")),
      );
      expect(createApi(region: null, uid: null).logout(), completes);
    });

    test("getUserGameRoles needs the cookie and the region", () {
      stubGet(_okBody({"list": []}));

      expect(
        () => createApi(cookie: null).getUserGameRoles(),
        throwsA(isStateError("Missing cookie")),
      );
      expect(
        () => createApi(region: null).getUserGameRoles(),
        throwsA(isStateError("Missing region")),
      );
      expect(createApi(uid: null).getUserGameRoles(), completes);
    });

    test("avatarList needs the cookie, the region and the uid", () {
      stubPost(_okBody({"list": []}));

      expect(
        () => createApi(cookie: null).avatarList(1),
        throwsA(isStateError("Missing cookie")),
      );
      expect(
        () => createApi(region: null).avatarList(1),
        throwsA(isStateError("Missing region")),
      );
      expect(
        () => createApi(uid: null).avatarList(1),
        throwsA(isStateError("Missing uid")),
      );
      expect(createApi().avatarList(1), completes);
    });

    test("getDailyNote needs the cookie, the region and the uid", () {
      stubGet(_okBody({
        "current_resin": 20,
        "resin_recovery_time": "480",
        "current_home_coin": 100,
      }));

      expect(
        () => createApi(uid: null).getDailyNote(),
        throwsA(isStateError("Missing uid")),
      );
      expect(createApi().getDailyNote(), completes);
    });

    test("batchCompute needs the cookie, the region and the uid", () {
      stubPost(_okBody({"overall_consume": []}));

      expect(
        createApi(region: null).batchCompute([]),
        throwsA(isStateError("Missing region")),
      );
      expect(createApi().batchCompute([]), completes);
    });

    test("getGameRecordCards needs a cookie carrying the HoYoLAB user id", () {
      stubGet(_okBody({"list": []}));

      expect(
        () => createApi(cookie: null).getGameRecordCards(),
        throwsA(isStateError("Missing cookie")),
      );
      expect(
        () => createApi(cookie: "ltoken_v2=token;").getGameRecordCards(),
        throwsA(isA<TypeError>()),
      );
      expect(createApi().getGameRecordCards(), completes);
    });

    test("lookupServers needs no credential at all", () {
      when(client.get(any))
          .thenAnswer((_) async => http.Response(_okBody({"list": []}), 200));

      expect(
        createApi(cookie: null, region: null, uid: null).lookupServers(),
        completes,
      );
    });
  });

  group("headers", () {
    test("sends the cookie and the HoYoLAB origin", () {
      final headers = createApi().headers;

      expect(headers["Cookie"], _cookie);
      expect(headers["Origin"], "https://act.hoyolab.com");
      expect(headers["Referer"], "https://act.hoyolab.com/");
      expect(
        headers["User-Agent"],
        contains("miHoYoBBSOversea/${HoyolabApi.hoyolabAppVersion}"),
      );
    });

    test("throws when no cookie is set", () {
      expect(() => createApi(cookie: null).headers, throwsA(isA<TypeError>()));
    });

    test("reports the app version and the client type", () {
      final headers = createApi().additionalHeaders;

      expect(headers["x-rpc-app_version"], HoyolabApi.hoyolabAppVersion);
      expect(headers["x-rpc-client_type"], "2");
    });

    test("reports the language matching the current locale", () {
      LocaleSettings.setLocaleSync(AppLocale.ja);
      expect(createApi().additionalHeaders["x-rpc-language"], "ja-jp");

      LocaleSettings.setLocaleSync(AppLocale.en);
      expect(createApi().additionalHeaders["x-rpc-language"], "en-us");
    });
  });

  group("DS token", () {
    /// `salt,timestamp,md5` — the first two are generated per request, so only
    /// the shape can be asserted.
    void expectValidDsToken(String? token) {
      expect(token, isNotNull);
      final parts = token!.split(",");
      expect(parts, hasLength(3));
      expect(int.tryParse(parts[0]), isNotNull);
      final random = int.tryParse(parts[1]);
      expect(random, isNotNull);
      expect(random, inInclusiveRange(100000, 199999));
      expect(parts[2], hasLength(32));
      expect(parts[2], matches(RegExp(r"^[0-9a-f]{32}$")));
    }

    test("is attached to getGameRecordCards", () async {
      stubGet(_okBody({"list": []}));

      await createApi().getGameRecordCards();

      expectValidDsToken(captureGetHeaders()["DS"]);
    });

    test("is attached to getDailyNote alongside the additional headers",
        () async {
      stubGet(_okBody({
        "current_resin": 20,
        "resin_recovery_time": "480",
        "current_home_coin": 100,
      }));

      await createApi().getDailyNote();

      final headers = captureGetHeaders();
      expectValidDsToken(headers["DS"]);
      expect(headers["x-rpc-app_version"], HoyolabApi.hoyolabAppVersion);
      expect(headers["Cookie"], _cookie);
    });

    test("is attached to changeDataSwitch", () async {
      // `changeDataSwitch` dereferences `result.data!`, so the success response
      // has to carry a non-null payload.
      stubPost(_okBody(const <String, dynamic>{}));

      await createApi()
          .changeDataSwitch(DataSwitchType.enableRealtimeNotes, true);

      expectValidDsToken(capturePostHeaders()["DS"]);
    });

    test("differs between requests", () async {
      stubGet(_okBody({"list": []}));
      final api = createApi();

      await api.getGameRecordCards();
      await api.getGameRecordCards();

      final tokens = verify(client.get(any, headers: captureAnyNamed("headers")))
          .captured
          .map((e) => (e as Map<String, String>)["DS"])
          .toList();
      expect(tokens, hasLength(2));
      expect(tokens[0], isNot(tokens[1]));
    });

    test("is not attached to the endpoints that do not need it", () async {
      stubPost(_okBody({"list": []}));

      await createApi().avatarList(1);

      expect(capturePostHeaders().containsKey("DS"), isFalse);
    });
  });

  group("error handling", () {
    test("throws HoyolabApiException carrying the retcode and the message",
        () async {
      stubPost(_errorBody(-100, "Not logged in"));

      await expectLater(
        createApi().avatarList(1),
        throwsA(
          isA<HoyolabApiException>()
              .having((e) => e.retcode, "retcode", -100)
              .having((e) => e.originalMessage, "originalMessage",
                  "Not logged in"),
        ),
      );
    });

    test("treats the known retcodes as silent", () {
      for (final retcode in [-502002, -502001, 10102, -100]) {
        expect(
          HoyolabApiException(retcode, "message").isSilent,
          isTrue,
          reason: "$retcode",
        );
      }
    });

    test("treats an unknown retcode as not silent", () {
      expect(const HoyolabApiException(-1, "message").isSilent, isFalse);
    });

    test("renders the message and the retcode in toString", () {
      expect(
        const HoyolabApiException(10102, "boom").toString(),
        "HoyolabApiException: boom, retcode: 10102",
      );
    });

    test("does not throw for a zero retcode", () async {
      stubPost(_okBody({"list": []}));

      expect((await createApi().avatarList(1)).list, isEmpty);
    });

    test("verifyLToken reports the error through the result instead of "
        "throwing", () async {
      stubPost(_errorBody(-100, "Not logged in"));

      final result = await createApi().verifyLToken();

      expect(result.hasError, isTrue);
      expect(result.retcode, -100);
      expect(result.data, isNull);
    });
  });

  group("response parsing", () {
    test("lookupServers returns the server list", () async {
      when(client.get(any)).thenAnswer(
        (_) async => http.Response(
          _okBody({
            "list": [
              {"region": "os_asia", "name": "Asia"},
              {"region": "os_euro", "name": "Europe"},
            ],
          }),
          200,
        ),
      );

      final result = await createApi().lookupServers();

      expect(result.hasError, isFalse);
      expect(result.data!.list, hasLength(2));
      expect(result.data!.list.first.region, "os_asia");
      expect(result.data!.list.first.name, "Asia");
    });

    test("verifyLToken returns the account name", () async {
      stubPost(_okBody({"user_info": {"account_name": "tester"}}));

      final result = await createApi().verifyLToken();

      expect(result.hasError, isFalse);
      expect(result.data!.accountName, "tester");
    });

    test("getUserGameRoles returns the roles bound to the region", () async {
      stubGet(_okBody({
        "list": [
          {"game_uid": "800000000", "nickname": "Traveler", "level": 60},
        ],
      }));

      final result = await createApi().getUserGameRoles();

      expect(result.list, hasLength(1));
      expect(result.list.first.uid, "800000000");
      expect(result.list.first.nickname, "Traveler");
      expect(result.list.first.level, 60);
    });

    test("getUserGameRoles asks for the configured region", () async {
      stubGet(_okBody({"list": []}));

      await createApi().getUserGameRoles();

      final uri =
          verify(client.get(captureAny, headers: anyNamed("headers")))
              .captured
              .single as Uri;
      expect(uri.queryParameters["region"], _region);
      expect(uri.queryParameters["game_biz"], "hk4e_global");
    });

    test("avatarList returns the characters with their skills and weapon",
        () async {
      stubPost(_okBody({
        "list": [
          {
            "id": 10000021,
            "name": "Amber",
            "level_current": 80,
            "max_level": 90,
            "skill_list": [
              {"group_id": 1, "max_level": 10, "level_current": 6},
            ],
            "weapon": {
              "id": 15401,
              "max_level": 90,
              "level_current": 80,
              "weapon_cat_id": 15,
              "weapon_level": 4,
              "name": "Rust",
              "icon": "rust.png",
            },
          },
        ],
      }));

      final result = await createApi().avatarList(1);

      expect(result.list, hasLength(1));
      final avatar = result.list.single;
      expect(avatar.id, 10000021);
      expect(avatar.currentLevel, 80);
      expect(avatar.maxLevel, 90);
      expect(avatar.skills.single.groupId, 1);
      expect(avatar.weapon!.name, "Rust");
      expect(avatar.weapon!.rarity, 4);
    });

    test("avatarList sends the paging and filter parameters", () async {
      stubPost(_okBody({"list": []}));

      await createApi().avatarList(3, elementIds: [1], weaponCatIds: [2, 3]);

      final body = verify(
        client.post(
          any,
          headers: anyNamed("headers"),
          body: captureAnyNamed("body"),
        ),
      ).captured.single as String;
      expect(jsonDecode(body), {
        "region": _region,
        "lang": "ja-jp",
        "uid": _uid,
        "size": 20,
        "page": 3,
        "element_attr_ids": [1],
        "weapon_cat_ids": [2, 3],
      });
    });

    test("getGameRecordCards returns the data switches", () async {
      stubGet(_okBody({
        "list": [
          {
            "game_id": 2,
            "data_switches": [
              {"switch_id": 3, "is_public": true},
            ],
          },
        ],
      }));

      final result = await createApi().getGameRecordCards();

      expect(result.list.single.gameType, GameType.genshin);
      expect(
        result.list.single.dataSwitches.single.switchId,
        DataSwitchType.enableRealtimeNotes,
      );
      expect(result.list.single.dataSwitches.single.isPublic, isTrue);
    });

    test("getGameRecordCards looks the account up by the cookie's user id",
        () async {
      stubGet(_okBody({"list": []}));

      await createApi().getGameRecordCards();

      final uri =
          verify(client.get(captureAny, headers: anyNamed("headers")))
              .captured
              .single as Uri;
      expect(uri.queryParameters["uid"], "123456");
    });

    test("getDailyNote returns the resin state", () async {
      stubGet(_okBody({
        "current_resin": 42,
        "resin_recovery_time": "480",
        "current_home_coin": 1200,
      }));

      final note = await createApi().getDailyNote();

      expect(note.currentResin, 42);
      expect(note.resinRecoveryTime, "480");
      expect(note.currentHomeCoin, 1200);
    });

    test("batchCompute returns the overall consumption", () async {
      stubPost(_okBody({
        "overall_consume": [
          {"id": 104301, "lack_num": 2, "num": 5},
        ],
      }));

      final result = await createApi().batchCompute([
        const CalcComputeItem(avatarId: 10000021),
      ]);

      expect(result.overallConsume.single.id, 104301);
      expect(result.overallConsume.single.lackNum, 2);
      expect(result.overallConsume.single.num, 5);
    });

    test("batchCompute rejects more items than the endpoint accepts", () {
      expect(
        createApi().batchCompute(
          List.filled(maxBatchComputeItems + 1, const CalcComputeItem()),
        ),
        throwsArgumentError,
      );
      verifyNever(
        client.post(any, headers: anyNamed("headers"), body: anyNamed("body")),
      );
    });
  });

  group("HoyolabApiUtils.loopUntilCharacter", () {
    AvatarListResultItem buildAvatar(int id) => AvatarListResultItem(
          id: id,
          name: "avatar-$id",
          currentLevel: 1,
          maxLevel: 90,
          skills: const [],
        );

    test("returns the first matching character across the pages", () async {
      final pages = {
        1: [buildAvatar(1), buildAvatar(2)],
        2: [buildAvatar(3)],
      };

      final found =
          await HoyolabApiUtils.loopUntilCharacter<AvatarListResultItem>(
        [3],
        (page) async => HoyolabListData(list: pages[page] ?? const []),
      );

      expect(found?.id, 3);
    });

    test("returns null once a page comes back empty", () async {
      var calls = 0;

      final found = await HoyolabApiUtils.loopUntilCharacter<
          AvatarListResultItem>([99], (page) async {
        calls++;
        return HoyolabListData(list: page == 1 ? [buildAvatar(1)] : const []);
      });

      expect(found, isNull);
      expect(calls, 2);
    });

    test("stops paging as soon as the character is found", () async {
      var calls = 0;

      await HoyolabApiUtils.loopUntilCharacter<AvatarListResultItem>(
        [1],
        (page) async {
          calls++;
          return HoyolabListData(list: [buildAvatar(1)]);
        },
      );

      expect(calls, 1);
    });
  });
}

Matcher isStateError(String message) =>
    isA<StateError>().having((e) => e.message, "message", message);
