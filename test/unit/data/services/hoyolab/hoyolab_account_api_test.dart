import "dart:convert";

import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/api_request_queue.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_account_api.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_exceptions.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:genshin_material/models/hoyolab_api.dart";
import "package:mockito/mockito.dart";

import "../../../../utils/http_client.dart";
import "../../../../utils/http_client.mocks.dart";
import "../../../../utils/secure_storage.dart";

/// A cookie shaped the way `ltUid` expects: the id has to be surrounded by
/// "; " and ";" for the lookup regexp to match.
const _region = "os_asia";

String _okBody(Object? data) =>
    jsonEncode({"retcode": 0, "message": "OK", "data": data});

void main() {
  late MockClient client;

  setUp(() {
    client = MockClient();
    LocaleSettings.setLocaleSync(AppLocale.ja);
  });

  HoyolabAccountApi createApi({String cookie = fakeCookie}) {
    return HoyolabAccountApi(
      enabled: true,
      cookie: cookie,
      client: client,
      queue: ApiRequestQueue(interval: Duration.zero),
    );
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

  group("DS token", () {
    // The token's own format is asserted in hoyolab_api_base_test.dart; here
    // only the per-endpoint decision to send it at all is under test.
    test("is attached to getGameRecordCards", () async {
      stubGet(client, _okBody({"list": []}));

      await createApi().getGameRecordCards();

      expect(captureGetHeaders().containsKey("DS"), isTrue);
    });

    test("is attached to changeDataSwitch", () async {
      stubPost(client, _okBody(null));

      await createApi()
          .changeDataSwitch(DataSwitchType.enableRealtimeNotes, true);

      expect(capturePostHeaders().containsKey("DS"), isTrue);
    });

    test("differs between requests", () async {
      stubGet(client, _okBody({"list": []}));
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
      stubGet(client, _okBody({"list": []}));

      await createApi().getUserGameRoles(_region);

      expect(captureGetHeaders().containsKey("DS"), isFalse);
    });
  });

  group("getUserGameRoles", () {
    test("returns the roles bound to the region", () async {
      stubGet(client, _okBody({
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
      stubGet(client, _okBody({"list": []}));

      await createApi().getUserGameRoles("os_euro");

      final uri = verify(client.get(captureAny, headers: anyNamed("headers")))
          .captured
          .single as Uri;
      expect(uri.queryParameters["region"], "os_euro");
      expect(uri.queryParameters["game_biz"], "hk4e_global");
    });

    test("throws HoyolabApiException carrying the retcode and the message",
        () async {
      stubGet(client, jsonEncode({"retcode": -100, "message": "Not logged in"}));

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
      stubGet(client, _okBody({
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
      stubGet(client, _okBody({"list": []}));

      await createApi().getGameRecordCards();

      final uri = verify(client.get(captureAny, headers: anyNamed("headers")))
          .captured
          .single as Uri;
      expect(uri.queryParameters["uid"], "123456");
    });

    test("fails when the cookie carries no user id", () {
      stubGet(client, _okBody({"list": []}));

      expect(
        () => createApi(cookie: "ltoken_v2=token;").getGameRecordCards(),
        throwsA(isA<TypeError>()),
      );
    });
  });

  group("logout", () {
    test("posts with the cookie", () async {
      stubPost(client, _okBody(null));

      await createApi().logout();

      expect(capturePostHeaders()["Cookie"], fakeCookie);
    });
  });
}
