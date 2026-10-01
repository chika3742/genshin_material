import "dart:io";

import "package:clock/clock.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/api_request_queue.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/providers/hoyolab_api.dart";
import "package:genshin_material/providers/login_bonus_state.dart";
import "package:genshin_material/providers/pref_notifier.dart";
import "package:mockito/mockito.dart";
import "package:timezone/data/latest_10y.dart" as tz;

import "../../utils/hoyolab_api.dart";
import "../../utils/http_client.dart";
import "../../utils/http_client.mocks.dart";
import "../../utils/in_memory_pref.dart";
import "../../utils/provider_container.dart";
import "../../utils/remote_config.dart";
import "../../utils/secure_storage.dart";

/// The ltuid carried by [fakeCookie].
const _ltUid = "123456";

/// Noon on 2026-10-01 in UTC+8, well before that day's reset.
final _noon = DateTime.utc(2026, 10, 1, 4);

/// The end of 2026-10-01 in UTC+8, which is when that day's claim expires.
final _reset = DateTime.utc(2026, 10, 1, 16);

String _cache(DateTime expiresAt, {required bool signed, String ltUid = _ltUid}) {
  return "$ltUid;${expiresAt.toIso8601String()};$signed";
}

void main() {
  final storage = setUpSecureStorageMock();
  late MockClient client;

  setUpAll(tz.initializeTimeZones);

  setUp(() {
    client = MockClient();
  });

  ProviderContainer createContainer({bool linkEnabled = true, String? cache}) {
    final container = createTestContainer(overrides: [
      overrideRemoteConfig(RemoteConfigKeys.hoyolabLinkEnabled, linkEnabled),
      overrideHttpClient(client),
      // The real queue holds requests 500ms apart.
      hoyolabRequestQueueProvider.overrideWithValue(ApiRequestQueue(interval: Duration.zero)),
      overridePref(PrefKeys.lastLoginBonusStateSynced, cache),
    ]);
    // Keeps the auto-disposed subject alive between the steps of a test, as
    // the app root does.
    container.listen(loginBonusStateProvider, (_, _) {});
    return container;
  }

  Future<bool?> readState(ProviderContainer container) {
    return container.read(loginBonusStateProvider.future);
  }

  String? cacheOf(ProviderContainer container) {
    return container.read(prefProvider(PrefKeys.lastLoginBonusStateSynced));
  }

  void verifyRequests(int count) {
    verify(client.get(any, headers: anyNamed("headers"))).called(count);
  }

  group("without a link", () {
    test("returns null without a request while the link is disabled", () async {
      final container = createContainer(linkEnabled: false);

      expect(await readState(container), isNull);
      verifyZeroInteractions(client);
    });

    test("returns null without a request while signed out", () async {
      storage.remove("hoyolab_cookie");
      final container = createContainer();

      expect(await readState(container), isNull);
      verifyZeroInteractions(client);
    });
  });

  group("cache", () {
    test("fetches once when nothing is cached, and caches the result under the account", () {
      return withClock(Clock.fixed(_noon), () async {
        stubGet(client, signInfoResponse(isSign: false, today: "2026-10-01"));
        final container = createContainer();

        expect(await readState(container), isFalse);
        verifyRequests(1);
        expect(cacheOf(container), allOf(startsWith("$_ltUid;"), endsWith(";false")));
      });
    });

    test("returns a claimed result before the reset without a request", () {
      return withClock(Clock.fixed(_noon), () async {
        final cache = _cache(_reset, signed: true);
        final container = createContainer(cache: cache);

        expect(await readState(container), isTrue);
        verifyZeroInteractions(client);
        expect(cacheOf(container), cache);
      });
    });

    test("returns an unclaimed result within its interval without a request", () {
      return withClock(Clock.fixed(_noon), () async {
        final cache = _cache(_noon.add(const Duration(minutes: 10)), signed: false);
        final container = createContainer(cache: cache);

        expect(await readState(container), isFalse);
        verifyZeroInteractions(client);
        expect(cacheOf(container), cache);
      });
    });

    test("fetches again once a claimed result has passed the reset", () {
      return withClock(Clock.fixed(_reset.add(const Duration(microseconds: 1))), () async {
        stubGet(client, signInfoResponse(isSign: false, today: "2026-10-02"));
        final container = createContainer(cache: _cache(_reset, signed: true));

        expect(await readState(container), isFalse);
        verifyRequests(1);
      });
    });

    test("ignores the cache of another account and overwrites it", () {
      return withClock(Clock.fixed(_noon), () async {
        stubGet(client, signInfoResponse(isSign: false, today: "2026-10-01"));
        final container = createContainer(cache: _cache(_reset, signed: true, ltUid: "999"));

        expect(await readState(container), isFalse);
        verifyRequests(1);
        expect(cacheOf(container), startsWith("$_ltUid;"));
      });
    });
  });

  group("expiry", () {
    test("a claimed result expires when the server's check-in day ends", () {
      return withClock(Clock.fixed(_noon), () async {
        stubGet(client, signInfoResponse(isSign: true, today: "2026-10-01"));
        final container = createContainer();

        await readState(container);
        expect(cacheOf(container), "$_ltUid;2026-10-01T16:00:00.000Z;true");
      });
    });

    test("follows the server's day even when the device clock is behind", () {
      // 23:59 on 2026-10-01 in UTC+8 by the device, while the server has
      // already moved on to 2026-10-02.
      return withClock(Clock.fixed(_reset.subtract(const Duration(minutes: 1))), () async {
        stubGet(client, signInfoResponse(isSign: true, today: "2026-10-02"));
        final container = createContainer();

        await readState(container);
        expect(cacheOf(container), "$_ltUid;2026-10-02T16:00:00.000Z;true");
      });
    });

    test("keeps a claimed result of a day the device has already left for the unclaimed interval", () {
      // 00:00:30 on 2026-10-01 in UTC+8 by the device, while the server is
      // still on 2026-09-30.
      return withClock(Clock.fixed(DateTime.utc(2026, 9, 30, 16, 0, 30)), () async {
        stubGet(client, signInfoResponse(isSign: true, today: "2026-09-30"));
        final container = createContainer();

        expect(await readState(container), isTrue);
        expect(cacheOf(container), "$_ltUid;2026-09-30T16:15:30.000Z;true");

        // Not fetched again on every re-check until the server catches up.
        container.invalidate(loginBonusStateProvider);
        expect(await readState(container), isTrue);
        verifyRequests(1);
      });
    });

    test("an unclaimed result expires 15 minutes after the fetch", () {
      return withClock(Clock.fixed(_noon), () async {
        stubGet(client, signInfoResponse(isSign: false, today: "2026-10-01"));
        final container = createContainer();

        await readState(container);
        expect(cacheOf(container), "$_ltUid;2026-10-01T04:15:00.000Z;false");
      });
    });
  });

  group("failure", () {
    final failures = <String, void Function(MockClient)>{
      "an error code": (client) => stubGet(
        client,
        '{"retcode": -100, "message": "Please log in", "data": null}',
      ),
      "a server error": (client) => stubGet(client, "Internal Server Error", statusCode: 500),
      "a network error": (client) => when(client.get(any, headers: anyNamed("headers")))
          .thenThrow(const SocketException("offline")),
    };

    for (final MapEntry(key: name, value: stub) in failures.entries) {
      test("fails on $name after a single request, and keeps the cache", () {
        return withClock(Clock.fixed(_noon), () async {
          stub(client);
          final expired = _cache(_noon, signed: false);
          final container = createContainer(cache: expired);

          await expectLater(readState(container), throwsA(anything));
          // A scheduled retry would leave the state loading instead.
          expect(
            container.read(loginBonusStateProvider),
            isA<AsyncError<bool?>>().having((s) => s.isLoading, "isLoading", isFalse),
          );
          verifyRequests(1);
          expect(cacheOf(container), expired);
        });
      });
    }
  });

  group("refresh", () {
    test("fetches again within the unclaimed interval", () {
      return withClock(Clock.fixed(_noon), () async {
        final container = createContainer(
          cache: _cache(_noon.add(const Duration(minutes: 10)), signed: false),
        );
        expect(await readState(container), isFalse);
        stubGet(client, signInfoResponse(isSign: true, today: "2026-10-01"));

        container.read(loginBonusStateProvider.notifier).refresh();

        expect(await readState(container), isTrue);
        verifyRequests(1);
      });
    });

    test("does nothing once claimed", () {
      return withClock(Clock.fixed(_noon), () async {
        final cache = _cache(_reset, signed: true);
        final container = createContainer(cache: cache);
        expect(await readState(container), isTrue);

        container.read(loginBonusStateProvider.notifier).refresh();

        expect(await readState(container), isTrue);
        verifyZeroInteractions(client);
        expect(cacheOf(container), cache);
      });
    });

    test("fetches again after a failure, even when the value before it was claimed", () async {
      var now = _noon;
      await withClock(Clock(() => now), () async {
        final container = createContainer(cache: _cache(_reset, signed: true));
        expect(await readState(container), isTrue);

        // The claim expires at the reset, and fetching the new day fails.
        now = _reset.add(const Duration(minutes: 1));
        when(client.get(any, headers: anyNamed("headers")))
            .thenThrow(const SocketException("offline"));
        container.invalidate(loginBonusStateProvider);
        await expectLater(readState(container), throwsA(isA<SocketException>()));
        expect(
          container.read(loginBonusStateProvider),
          isA<AsyncError<bool?>>().having((s) => s.value, "value", isTrue),
        );

        stubGet(client, signInfoResponse(isSign: false, today: "2026-10-02"));
        container.read(loginBonusStateProvider.notifier).refresh();

        expect(await readState(container), isFalse);
        verifyRequests(2);
      });
    });
  });
}
