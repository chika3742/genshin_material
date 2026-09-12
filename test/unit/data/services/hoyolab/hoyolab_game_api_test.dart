import "dart:convert";

import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_api_base.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_exceptions.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_game_api.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:genshin_material/models/hoyolab_api.dart";
import "package:http/http.dart" as http;
import "package:mockito/mockito.dart";

import "../../../../utils/http_client.mocks.dart";

const _cookie = "ltoken_v2=token; ltuid_v2=123456;";
const _region = "os_asia";
const _uid = "800000000";

String _okBody(Object? data) =>
    jsonEncode({"retcode": 0, "message": "OK", "data": data});

String _errorBody(int retcode, String message) =>
    jsonEncode({"retcode": retcode, "message": message});

void main() {
  late MockClient client;

  setUp(() {
    client = MockClient();
    LocaleSettings.setLocaleSync(AppLocale.ja);
  });

  HoyolabGameApi createApi({bool enabled = true}) {
    return HoyolabGameApi(
      enabled: enabled,
      cookie: _cookie,
      region: _region,
      uid: _uid,
      client: client,
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

  group("avatarList", () {
    test("returns the characters with their skills and weapon", () async {
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

    test("sends the paging and filter parameters", () async {
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

    test("carries no DS token", () async {
      stubPost(_okBody({"list": []}));

      await createApi().avatarList(1);

      final headers = verify(
        client.post(
          any,
          headers: captureAnyNamed("headers"),
          body: anyNamed("body"),
        ),
      ).captured.single as Map<String, String>;
      expect(headers.containsKey("DS"), isFalse);
    });
  });

  group("getDailyNote", () {
    test("returns the resin state", () async {
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

    test("sends the DS token alongside the additional headers", () async {
      stubGet(_okBody({
        "current_resin": 20,
        "resin_recovery_time": "480",
        "current_home_coin": 100,
      }));

      await createApi().getDailyNote();

      final headers =
          verify(client.get(any, headers: captureAnyNamed("headers")))
              .captured
              .single as Map<String, String>;
      expect(headers["DS"], matches(RegExp(r"^\d+,\d+,[0-9a-f]{32}$")));
      expect(headers["x-rpc-app_version"], HoyolabApiBase.hoyolabAppVersion);
      expect(headers["Cookie"], _cookie);
    });

    test("queries the configured role and server", () async {
      stubGet(_okBody({
        "current_resin": 20,
        "resin_recovery_time": "480",
        "current_home_coin": 100,
      }));

      await createApi().getDailyNote();

      final uri = verify(client.get(captureAny, headers: anyNamed("headers")))
          .captured
          .single as Uri;
      expect(uri.queryParameters["role_id"], _uid);
      expect(uri.queryParameters["server"], _region);
    });
  });

  group("batchCompute", () {
    test("returns the overall consumption", () async {
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

    test("rejects more items than the endpoint accepts", () {
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

    test("does not throw for a zero retcode", () async {
      stubPost(_okBody({"list": []}));

      expect((await createApi().avatarList(1)).list, isEmpty);
    });
  });

  group("when the link is disabled", () {
    test("every method throws before reaching the network", () {
      final api = createApi(enabled: false);

      expect(
        () => api.avatarList(1),
        throwsA(isA<HoyolabLinkDisabledException>()),
      );
      expect(
        api.getDailyNote,
        throwsA(isA<HoyolabLinkDisabledException>()),
      );
      expect(api.batchCompute([]), throwsA(isA<HoyolabLinkDisabledException>()));
      verifyZeroInteractions(client);
    });
  });
}
