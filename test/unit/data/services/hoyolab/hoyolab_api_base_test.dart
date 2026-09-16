import "dart:async";
import "dart:convert";

import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/api_request_queue.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_api_base.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_exceptions.dart";
import "package:genshin_material/models/hoyolab_api.dart";
import "package:http/http.dart" as http;
import "package:mockito/mockito.dart";

import "../../../../utils/hoyolab_api.dart";
import "../../../../utils/http_client.dart";
import "../../../../utils/http_client.mocks.dart";
import "../../../../utils/secure_storage.dart";

class _FakeHoyolabApiBase extends HoyolabApiBase {
  _FakeHoyolabApiBase({
    required super.client,
    required super.queue,
  });
}

class FakeHoyolabAuthenticatedApi extends HoyolabAuthenticatedApi {
  FakeHoyolabAuthenticatedApi({
    required super.cookie,
  }) : super(client: MockClient(), queue: ApiRequestQueue(interval: Duration.zero));
}

void main() {
  group("HoyolabApiBase", () {
    late MockClient client;

    setUp(() {
      client = MockClient();

      stubGet(client, successResponse);
      stubPost(client, successResponse);
    });

    HoyolabApiBase createApi() {
      return _FakeHoyolabApiBase(
        client: client,
        queue: ApiRequestQueue(interval: Duration.zero),
      );
    }

    const exampleEp = "https://example.com";

    test("query is passed to client", () async {
      final api = createApi();

      final query = {"foo": "bar"};
      await expectLater(api.send(exampleEp, query: query), completes);

      verify(client.get(
        argThat(isA<Uri>().having((u) => u.queryParameters, "queryParameters", query)),
        headers: anyNamed("headers"),
      ));
    });

    test("does not end with '?' when empty query map was passed", () async {
      final api = createApi();

      final query = <String, String>{};
      await expectLater(api.send(exampleEp, query: query), completes);

      verify(client.get(
        argThat(isA<Uri>()
            .having((h) => h.queryParameters, "queryParameters", query)
            .having((u) => u.toString().endsWith("?"), "ends with ?", isFalse)),
        headers: anyNamed("headers"),
      ));
    });

    test("GET request", () async {
      final api = createApi();

      await expectLater(api.send(exampleEp, method: .get), completes);

      verify(client.get(
        argThat(isA<Uri>().having((u) => u.toString(), "uri", exampleEp)),
        headers: anyNamed("headers"),
      ));
    });

    test("POST request with body", () async {
      final api = createApi();

      final body = {"foo": "bar"};
      await expectLater(api.send(exampleEp, method: .post, body: body), completes);

      verify(client.post(
        argThat(isA<Uri>().having((u) => u.toString(), "uri", exampleEp)),
        headers: anyNamed("headers"),
        body: '{"foo":"bar"}',
      ));
    });

    test("POST request without body", () async {
      final api = createApi();

      await expectLater(api.send(exampleEp, method: .post), completes);

      verify(client.post(
        any,
        headers: anyNamed("headers"),
        body: argThat(isNull, named: "body"),
      ));
    });

    test("POST request with list body", () async {
      final api = createApi();

      final body = ["foo", "bar"];
      await expectLater(api.send(exampleEp, method: .post, body: body), completes);

      verify(client.post(
        any,
        headers: anyNamed("headers"),
        body: '["foo","bar"]',
      ));
    });

    test("requests go through the queue", () async {
      // The spacing itself belongs to ApiRequestQueue and is covered by its
      // own test. What matters here is that send() does not call the client
      // directly: the first response is held open, so a second request
      // reaching the client at all means the queue was bypassed.
      final response = http.Response(successResponse, 200);
      final held = Completer<http.Response>();
      var started = 0;
      when(client.get(any, headers: anyNamed("headers"))).thenAnswer((_) {
        started++;
        return started == 1 ? held.future : Future.value(response);
      });

      final api = createApi();

      final first = api.send(exampleEp);
      final second = api.send(exampleEp);

      await pumpEventQueue();
      expect(started, 1, reason: "the second request must wait for the first");

      held.complete(response);

      await expectLater(first, completes);
      await expectLater(second, completes);
      expect(started, 2);
    });

    group("headers", () {
      test("common headers are always sent", () async {
        final api = createApi();

        await expectLater(api.send(exampleEp), completes);

        verify(client.get(
          any,
          headers: argThat(
            isA<Map<String, String>>()
              .having((h) => h.containsKey("User-Agent"), "has User-Agent", isTrue)
              .having((h) => h.containsKey("Origin"), "has Origin", isTrue)
              .having((h) => h.containsKey("Referer"), "has Referer", isTrue)
              .having((h) => h.containsKey("Sec-Fetch-Dest"), "has Sec-Fetch-Dest", isTrue),
            named: "headers",
          ),
        ));
      });

      test("Cookie header is sent when provided", () async {
        final api = createApi();

        await expectLater(api.send(exampleEp, cookie: "foo"), completes);

        verify(client.get(
          any,
          headers: argThat(
            isA<Map<String, String>>()
              .having((h) => h["Cookie"], "Cookie", "foo"),
            named: "headers",
          ),
        ));
      });

      test("no Cookie header is sent when null", () async {
        final api = createApi();

        await expectLater(api.send(exampleEp, cookie: null), completes);

        verify(client.get(
          any,
          headers: argThat(
            isA<Map<String, String>>()
              .having((h) => h.containsKey("Cookie"), "has Cookie", isFalse),
            named: "headers",
          ),
        ));
      });

      test("RPC headers are sent when withRpcHeaders is true", () async {
        final api = createApi();

        await expectLater(api.send(exampleEp, withRpcHeaders: true), completes);

        verify(client.get(
          any,
          headers: argThat(
            isA<Map<String, String>>()
              .having((h) => h.containsKey("x-rpc-client_type"), "has x-rpc-client_type", isTrue)
              .having((h) => h.containsKey("x-rpc-app_version"), "has x-rpc-app_version", isTrue)
              .having((h) => h.containsKey("x-rpc-language"), "has x-rpc-language", isTrue),
            named: "headers",
          ),
        ));
      });

      test("RPC headers are not sent when withRpcHeaders is false", () async {
        final api = createApi();

        await expectLater(api.send(exampleEp, withRpcHeaders: false), completes);

        verify(client.get(
          any,
          headers: argThat(
            isA<Map<String, String>>()
              .having((h) => h.containsKey("x-rpc-client_type"), "has x-rpc-client_type", isFalse)
              .having((h) => h.containsKey("x-rpc-app_version"), "has x-rpc-app_version", isFalse)
              .having((h) => h.containsKey("x-rpc-language"), "has x-rpc-language", isFalse),
            named: "headers",
          ),
        ));
      });

      test("Content-Type is sent for POST requests", () async {
        final api = createApi();

        await expectLater(api.send(exampleEp, method: .post), completes);

        verify(client.post(
          any,
          headers: argThat(
            isA<Map<String, String>>()
              .having((h) => h["Content-Type"], "Content-Type", "application/json"),
            named: "headers",
          ),
          body: anyNamed("body"),
        ));
      });

      test("no Content-Type is sent for GET requests", () async {
        final api = createApi();

        await expectLater(api.send(exampleEp), completes);

        verify(client.get(
          any,
          headers: argThat(
            isA<Map<String, String>>()
              .having((h) => h.containsKey("Content-Type"), "has Content-Type", isFalse),
            named: "headers",
          ),
        ));
      });

      test("extraHeaders are added on top of the common headers", () async {
        final api = createApi();

        await expectLater(
          api.send(exampleEp, extraHeaders: {"x-rpc-cal_type": "0"}),
          completes,
        );

        verify(client.get(
          any,
          headers: argThat(
            isA<Map<String, String>>()
              .having((h) => h["x-rpc-cal_type"], "x-rpc-cal_type", "0")
              .having((h) => h.containsKey("User-Agent"), "has User-Agent", isTrue),
            named: "headers",
          ),
        ));
      });

      test("extraHeaders override an existing header", () async {
        final api = createApi();

        await expectLater(
          api.send(exampleEp, cookie: "foo", extraHeaders: {"Cookie": "bar"}),
          completes,
        );

        verify(client.get(
          any,
          headers: argThat(
            isA<Map<String, String>>()
              .having((h) => h["Cookie"], "Cookie", "bar"),
            named: "headers",
          ),
        ));
      });
    });

    group("DS token", () {
      test("no DS token is sent when withDsToken is false", () async {
        final api = createApi();

        await expectLater(
          api.send(exampleEp, withDsToken: false),
          completes,
        );

        verify(client.get(
          any,
          headers: argThat(
            isA<Map<String, String>>()
                .having((h) => h.containsKey("DS"), "has DS", isFalse),
            named: "headers",
          ),
        ));
      });

      test("DS token is sent with proper format when withDsToken is true", () async {
        final api = createApi();

        await expectLater(
          api.send(exampleEp, withDsToken: true),
          completes,
        );

        verify(client.get(
          any,
          headers: argThat(
            isA<Map<String, String>>()
                .having((h) => h.containsKey("DS"), "has DS", isTrue)
                .having((h) => h["DS"], "DS", matches(r"^\d+,\d+,[0-9a-f]+$")),
            named: "headers",
          ),
        ));
      });

    });

    group("response", () {
      test("returns the parsed data when retcode is zero", () async {
        stubGet(client, jsonEncode({
          "retcode": 0,
          "message": "OK",
          "data": {"value": 42},
        }));

        final api = createApi();

        final result = await api.send<int>(
          exampleEp,
          parse: (obj) => (obj! as Map<String, dynamic>)["value"] as int,
        );

        expect(result, 42);
      });

      test("decodes the body as UTF-8 even without a charset", () async {
        const name = "テスト";
        stubGet(client, jsonEncode({
          "retcode": 0,
          "message": "OK",
          "data": {"name": name},
        }));

        final api = createApi();

        final result = await api.send<String>(
          exampleEp,
          parse: (obj) => (obj! as Map<String, dynamic>)["name"] as String,
        );

        expect(result, name);
      });

      test("survives malformed UTF-8 bytes in the body", () async {
        // Only the leading byte of a three-byte character, so the sequence is
        // cut short. The JSON structure around it stays valid.
        final truncated = utf8.encode("水").first;
        final bytes = <int>[
          ...utf8.encode('{"retcode":0,"message":"OK","data":{"name":"'),
          truncated,
          ...utf8.encode('"}}'),
        ];

        when(client.get(any, headers: anyNamed("headers")))
            .thenAnswer((_) async => http.Response.bytes(bytes, 200));

        final api = createApi();

        final result = await api.send<String>(
          exampleEp,
          parse: (obj) => (obj! as Map<String, dynamic>)["name"] as String,
        );

        expect(
          result,
          contains(String.fromCharCode(unicodeReplacementCharacterRune)),
        );
      });
    });

    group("HoyolabApiException", () {
      test("carries the retcode and the message when retcode is not zero", () async {
        stubGet(client, jsonEncode({
          "retcode": -100,
          "message": "Not logged in",
          "data": null,
        }));

        final api = createApi();

        await expectLater(
          api.send(exampleEp),
          throwsA(
            isA<HoyolabApiException>()
                .having((e) => e.retcode, "retcode", -100)
                .having((e) => e.originalMessage, "originalMessage", "Not logged in"),
          ),
        );
      });

      test("wins over the HTTP status when the envelope parses", () async {
        // A non-2xx response can still carry a usable envelope, so the status
        // must not short-circuit the retcode. Adding a status check ahead of
        // the parsing would turn this into a HoyolabInvalidResponseException.
        stubGet(client, jsonEncode({
          "retcode": -100,
          "message": "Not logged in",
          "data": null,
        }), statusCode: 401);

        final api = createApi();

        await expectLater(
          api.send(exampleEp),
          throwsA(
            isA<HoyolabApiException>().having((e) => e.retcode, "retcode", -100),
          ),
        );
      });
    });

    group("HoyolabInvalidResponseException", () {
      test("reports the status and the body when the body is not JSON", () async {
        const body = "<html><body>503 Service Unavailable</body></html>";

        stubGet(client, body, statusCode: 503);

        final api = createApi();

        await expectLater(
          api.send(exampleEp),
          throwsA(
            isA<HoyolabInvalidResponseException>()
                .having((e) => e.statusCode, "statusCode", 503)
                .having((e) => e.detail, "detail", body),
          ),
        );
      });

      test("truncates a long body", () async {
        stubGet(client, "x" * 200, statusCode: 500);

        final api = createApi();

        await expectLater(
          api.send(exampleEp),
          throwsA(
            isA<HoyolabInvalidResponseException>()
                .having((e) => e.detail.length, "detail length", 100),
          ),
        );
      });

      test("does not split a surrogate pair when truncating", () async {
        const emoji = "🎉";
        // The truncation lands right after the 100th grapheme, which is an
        // emoji here. A code-unit based cut would leave a lone surrogate.
        final body = "${"x" * 99}$emoji$emoji";

        stubGet(client, body, statusCode: 500);

        final api = createApi();

        await expectLater(
          api.send(exampleEp),
          throwsA(
            isA<HoyolabInvalidResponseException>()
                .having((e) => e.detail, "detail", endsWith(emoji)),
          ),
        );
      });

      test("reports a top-level value that is not an object", () async {
        final api = createApi();

        for (final body in ["null", "[1,2]", "42", '"text"', "true"]) {
          stubGet(client, body);

          await expectLater(
            api.send(exampleEp),
            throwsA(
              isA<HoyolabInvalidResponseException>()
                  .having((e) => e.statusCode, "statusCode", 200),
            ),
            reason: "body: $body",
          );
        }
      });

      test("reports the nested key when the payload fails to parse", () async {
        // The envelope itself is fine; only DailyNote fails. The checked
        // codegen rethrows the inner CheckedFromJsonException untouched, so
        // the report must name the missing field rather than "data".
        stubGet(client, jsonEncode({
          "retcode": 0,
          "message": "OK",
          "data": {"current_resin": 10, "current_home_coin": 20},
        }));

        final api = createApi();

        await expectLater(
          api.send<DailyNote>(
            exampleEp,
            parse: (obj) => DailyNote.fromJson(obj! as Map<String, dynamic>),
          ),
          throwsA(
            isA<HoyolabInvalidResponseException>()
                .having((e) => e.detail, "detail", contains("resin_recovery_time"))
                .having((e) => e.detail, "detail", contains("DailyNote")),
          ),
        );
      });
    });
  });

  group("HoyolabAuthenticatedApi", () {
    test("can parse ltuid", () {
      final api = FakeHoyolabAuthenticatedApi(cookie: fakeCookie);

      expect(api.ltUid, "123456");
    });

    test("can parse when ltuid key is at the top", () {
      final api = FakeHoyolabAuthenticatedApi(
        cookie: "ltuid_v2=123456; ltoken_v2=token;",
      );

      expect(api.ltUid, "123456");
    });

    test("can parse when missing semicolon", () {
      final api = FakeHoyolabAuthenticatedApi(
        cookie: "ltoken_v2=token; ltuid_v2=123456",
      );

      expect(api.ltUid, "123456");
    });
  });
}
