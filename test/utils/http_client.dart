import "package:flutter_riverpod/misc.dart";
import "package:genshin_material/providers/http_client.dart";
import "package:http/http.dart" as http;
import "package:mockito/annotations.dart";

/// Overrides [httpClientProvider] with [client], so nothing in the test reaches
/// the network.
@GenerateMocks([http.Client])
Override overrideHttpClient(http.Client client) {
  return httpClientProvider.overrideWithValue(client);
}
