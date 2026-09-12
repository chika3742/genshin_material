import "package:http/http.dart" as http;
import "package:riverpod_annotation/riverpod_annotation.dart";

part "http_client.g.dart";

/// The one HTTP client of the app.
///
/// Everything that talks to the network takes a client rather than building
/// one, so that a test can hand out a stub without reaching for
/// `HttpOverrides`, and so that the client is closed exactly once.
@Riverpod(keepAlive: true)
http.Client httpClient(Ref ref) {
  final client = http.Client();
  ref.onDispose(client.close);
  return client;
}
