import "dart:convert";

import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/api_request_queue.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_exceptions.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_public_api.dart";
import "package:mockito/mockito.dart";

import "../../../../utils/http_client.dart";
import "../../../../utils/http_client.mocks.dart";
import "../../../../utils/secure_storage.dart";

String _okBody(Object? data) =>
    jsonEncode({"retcode": 0, "message": "OK", "data": data});

String _errorBody(int retcode, String message) =>
    jsonEncode({"retcode": retcode, "message": message});

void main() {
  late MockClient client;

  setUp(() {
    client = MockClient();
  });

  HoyolabPublicApi createApi() => HoyolabPublicApi(
    client: client,
    queue: ApiRequestQueue(interval: Duration.zero),
  );

  group("lookupServers", () {
    test("returns the server list", () async {
      stubGet(client, _okBody({
        "list": [
          {"region": "os_asia", "name": "Asia"},
          {"region": "os_euro", "name": "Europe"},
        ],
      }));

      final result = await createApi().lookupServers();

      expect(result.list, hasLength(2));
      expect(result.list.first.region, "os_asia");
      expect(result.list.first.name, "Asia");
    });

    test("sends no credential", () async {
      stubGet(client, _okBody({"list": []}));

      await createApi().lookupServers();

      final headers = verify(client.get(any, headers: captureAnyNamed("headers")))
          .captured
          .single as Map<String, String>;
      expect(headers.containsKey("Cookie"), isFalse);
    });
  });

  group("verifyLToken", () {
    test("returns the account name", () async {
      stubPost(client, _okBody({"user_info": {"account_name": "tester"}}));

      final result = await createApi().verifyLToken(fakeCookie);

      expect(result.accountName, "tester");
    });

    test("sends the cookie it was handed, not a stored one", () async {
      stubPost(client, _okBody({"user_info": {"account_name": "tester"}}));

      await createApi().verifyLToken(fakeCookie);

      final headers = verify(
        client.post(any, headers: captureAnyNamed("headers")),
      ).captured.single as Map<String, String>;
      expect(headers["Cookie"], fakeCookie);
    });

    // The sign-in flow shows the message HoYoLAB sent back, so the rejection
    // has to carry it. `signIn` turns this into a
    // CredentialVerificationException.
    test("throws with the message HoYoLAB sent back", () async {
      stubPost(client, _errorBody(-100, "Not logged in"));

      await expectLater(
        createApi().verifyLToken(fakeCookie),
        throwsA(
          isA<HoyolabApiException>()
              .having((e) => e.retcode, "retcode", -100)
              .having((e) => e.originalMessage, "originalMessage", "Not logged in"),
        ),
      );
    });
  });
}
