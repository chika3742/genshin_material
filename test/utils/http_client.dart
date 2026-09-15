import "dart:convert";

import "package:flutter_riverpod/misc.dart";
import "package:genshin_material/providers/http_client.dart";
import "package:http/http.dart" as http;
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";

import "http_client.mocks.dart";

/// Overrides [httpClientProvider] with [client], so nothing in the test reaches
/// the network.
@GenerateMocks([http.Client])
Override overrideHttpClient(http.Client client) {
  return httpClientProvider.overrideWithValue(client);
}

/// The body is handed over as UTF-8 bytes: `http.Response(String, int)` encodes
/// it with latin1 when the headers carry no charset, which would corrupt
/// anything outside ASCII before it is ever sent.
void stubGet(MockClient client, String body, {int statusCode = 200}) {
  when(client.get(any, headers: anyNamed("headers")))
      .thenAnswer((_) async => http.Response.bytes(utf8.encode(body), statusCode));
}

/// See [stubGet] for why the body is encoded rather than passed as a string.
void stubPost(MockClient client, String body, {int statusCode = 200}) {
  when(client.post(any, headers: anyNamed("headers"), body: anyNamed("body")))
      .thenAnswer((_) async => http.Response.bytes(utf8.encode(body), statusCode));
}
