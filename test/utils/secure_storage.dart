import "package:flutter/services.dart";
import "package:flutter_test/flutter_test.dart";

const _secureStorageChannel = MethodChannel("plugins.it_nomads.com/flutter_secure_storage");
const fakeCookie = "ltoken_v2=token; ltuid_v2=123456;";

/// Sets up an in-memory mock of `flutter_secure_storage` backed by a plain [Map].
///
/// Call this in the body of `main()` or a `group()` — never inside a test or a
/// `setUp()` — because it registers its own `setUp`/`tearDown` callbacks. The
/// `setUp` installs a mock method call handler on the plugin's method channel
/// (`read` / `containsKey` / `write` / `delete` are handled; any other method
/// returns `null`), and the `tearDown` removes it again.
///
/// The returned map is the live storage seen by the code under test. It is
/// reset before every test and seeded with `hoyolab_cookie` = [fakeCookie], so
/// tests start in a signed-in state. Mutate it to set up a different state, or
/// read it to assert what the code under test wrote:
///
/// ```dart
/// void main() {
///   final storage = setUpSecureStorageMock();
///
///   test("signs out", () async {
///     storage.remove("hoyolab_cookie"); // start signed out
///     ...
///     expect(storage["hoyolab_cookie"], isNull);
///   });
/// }
/// ```
Map<String, String> setUpSecureStorageMock() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final storage = <String, String>{};

  setUp(() {
    storage["hoyolab_cookie"] = fakeCookie;

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_secureStorageChannel, (call) async {
      final key = call.arguments["key"] as String?;
      switch (call.method) {
        case "read":
          return storage[key];
        case "containsKey":
          return storage.containsKey(key);
        case "delete":
          storage.remove(key);
        case "write":
          storage[key!] = call.arguments["value"] as String;
      }
      return null;
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_secureStorageChannel, null);
  });

  return storage;
}
