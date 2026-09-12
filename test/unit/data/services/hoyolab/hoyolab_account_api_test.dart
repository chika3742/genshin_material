import "dart:convert";

import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_account_api.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_api_base.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_exceptions.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:genshin_material/models/hoyolab_api.dart";
import "package:http/http.dart" as http;
import "package:mockito/mockito.dart";

import "../../../../utils/http_client.mocks.dart";

/// A cookie shaped the way `ltUid` expects: the id has to be surrounded by
/// "; " and ";" for the lookup regexp to match.
const _cookie = "ltoken_v2=token; ltuid_v2=123456;";
const _region = "os_asia";

String _okBody(Object? data) =>
    jsonEncode({"retcode": 0, "message": "OK", "data": data});

void main() {
  late MockClient client;

  setUp(() {
    client = MockClient();
    LocaleSettings.setLocaleSync(AppLocale.ja);
  });

  HoyolabAccountApi createApi({String cookie = _cookie, bool enabled = true}) {
    return HoyolabAccountApi(
      enabled: enabled,
      cookie: cookie,
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

  group("headers", () {
    test("sends the cookie and the HoYoLAB origin", () {
      final headers = createApi().headers;

      expect(headers["Cookie"], _cookie);
      expect(headers["Origin"], "https://act.hoyolab.com");
      expect(headers["Referer"], "https://act.hoyolab.com/");
      expect(
        headers["User-Agent"],
        contains("miHoYoBBSOversea/${HoyolabApiBase.hoyolabAppVersion}"),
      );
    });

    test("reports the app version and the client type", () {
      final headers = createApi().additionalHeaders;

      expect(headers["x-rpc-app_version"], HoyolabApiBase.hoyolabAppVersion);
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
    /// `timestamp,random,md5` — the first two are generated per request, so
    /// only the shape can be asserted.
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
      stubGet(_okBody({"list": []}));

      await createApi().getUserGameRoles(_region);

      expect(captureGetHeaders().containsKey("DS"), isFalse);
    });
  });

  group("getUserGameRoles", () {
    test("returns the roles bound to the region", () async {
      stubGet(_okBody({
        "list": [
          {"game_uid": "800000000", "nickname": "Traveler", "level": 60},
        ],
      }));

      final result = await createApi().getUserGameRoles(_region);

      expect(result.list, hasLength(1));
      expect(result.list.first.uid, "800000000");
      expect(result.list.first.nickname, "Traveler");
      expect(result.list.first.level, 60);
    });

    // The server-select sheet queries servers the user has not committed to,
    // so the region comes from the argument rather than from stored state.
    test("asks for the region it was given", () async {
      stubGet(_okBody({"list": []}));

      await createApi().getUserGameRoles("os_euro");

      final uri = verify(client.get(captureAny, headers: anyNamed("headers")))
          .captured
          .single as Uri;
      expect(uri.queryParameters["region"], "os_euro");
      expect(uri.queryParameters["game_biz"], "hk4e_global");
    });

    test("throws HoyolabApiException carrying the retcode and the message",
        () async {
      stubGet(jsonEncode({"retcode": -100, "message": "Not logged in"}));

      await expectLater(
        createApi().getUserGameRoles(_region),
        throwsA(
          isA<HoyolabApiException>()
              .having((e) => e.retcode, "retcode", -100)
              .having((e) => e.originalMessage, "originalMessage",
                  "Not logged in"),
        ),
      );
    });
  });

  group("getGameRecordCards", () {
    test("returns the data switches", () async {
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

    test("looks the account up by the cookie's user id", () async {
      stubGet(_okBody({"list": []}));

      await createApi().getGameRecordCards();

      final uri = verify(client.get(captureAny, headers: anyNamed("headers")))
          .captured
          .single as Uri;
      expect(uri.queryParameters["uid"], "123456");
    });

    test("fails when the cookie carries no user id", () {
      stubGet(_okBody({"list": []}));

      expect(
        () => createApi(cookie: "ltoken_v2=token;").getGameRecordCards(),
        throwsA(isA<TypeError>()),
      );
    });
  });

  group("logout", () {
    test("posts with the cookie", () async {
      stubPost(_okBody(null));

      await createApi().logout();

      expect(capturePostHeaders()["Cookie"], _cookie);
    });
  });

  group("when the link is disabled", () {
    test("every method throws before reaching the network", () {
      final api = createApi(enabled: false);

      expect(api.logout(), throwsA(isA<HoyolabLinkDisabledException>()));
      expect(
        () => api.getUserGameRoles(_region),
        throwsA(isA<HoyolabLinkDisabledException>()),
      );
      expect(
        api.getGameRecordCards,
        throwsA(isA<HoyolabLinkDisabledException>()),
      );
      expect(
        () => api.changeDataSwitch(DataSwitchType.enableRealtimeNotes, true),
        throwsA(isA<HoyolabLinkDisabledException>()),
      );
      verifyZeroInteractions(client);
    });
  });
}
