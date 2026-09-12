import "dart:convert";

import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_exceptions.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_public_api.dart";
import "package:http/http.dart" as http;
import "package:mockito/mockito.dart";

import "../../../../utils/http_client.mocks.dart";

const _cookie = "ltoken_v2=token; ltuid_v2=123456;";

String _okBody(Object? data) =>
    jsonEncode({"retcode": 0, "message": "OK", "data": data});

String _errorBody(int retcode, String message) =>
    jsonEncode({"retcode": retcode, "message": message});

void main() {
  late MockClient client;

  setUp(() {
    client = MockClient();
  });

  HoyolabPublicApi createApi({bool enabled = true}) =>
      HoyolabPublicApi(enabled: enabled, client: client);

  group("lookupServers", () {
    test("returns the server list", () async {
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

    test("sends no credential", () async {
      when(client.get(any))
          .thenAnswer((_) async => http.Response(_okBody({"list": []}), 200));

      await createApi().lookupServers();

      verify(client.get(any)).called(1);
    });
  });

  group("verifyLToken", () {
    test("returns the account name", () async {
      when(client.post(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response(
          _okBody({"user_info": {"account_name": "tester"}}),
          200,
        ),
      );

      final result = await createApi().verifyLToken(_cookie);

      expect(result.hasError, isFalse);
      expect(result.data!.accountName, "tester");
    });

    test("sends the cookie it was handed, not a stored one", () async {
      when(client.post(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response(
          _okBody({"user_info": {"account_name": "tester"}}),
          200,
        ),
      );

      await createApi().verifyLToken(_cookie);

      final headers = verify(
        client.post(any, headers: captureAnyNamed("headers")),
      ).captured.single as Map<String, String>;
      expect(headers["Cookie"], _cookie);
    });

    // The sign-in flow shows the message HoYoLAB sent back, so a rejected
    // cookie has to arrive as a result rather than as an exception.
    test("reports the error through the result instead of throwing", () async {
      when(client.post(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response(_errorBody(-100, "Not logged in"), 200),
      );

      final result = await createApi().verifyLToken(_cookie);

      expect(result.hasError, isTrue);
      expect(result.retcode, -100);
      expect(result.data, isNull);
    });
  });

  group("when the link is disabled", () {
    test("every method throws before reaching the network", () {
      final api = createApi(enabled: false);

      expect(api.lookupServers(), throwsA(isA<HoyolabLinkDisabledException>()));
      expect(
        api.verifyLToken(_cookie),
        throwsA(isA<HoyolabLinkDisabledException>()),
      );
      verifyZeroInteractions(client);
    });
  });
}
