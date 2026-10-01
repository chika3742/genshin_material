import "dart:async";

import "package:clock/clock.dart";
import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/api_request_queue.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/hooks/use_login_bonus_state_refresher.dart";
import "package:genshin_material/providers/hoyolab_api.dart";
import "package:genshin_material/providers/login_bonus_state.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:mockito/mockito.dart";
import "package:timezone/data/latest_10y.dart" as tz;

import "../utils/fake_login_bonus_state.dart";
import "../utils/hoyolab_api.dart";
import "../utils/http_client.dart";
import "../utils/http_client.mocks.dart";
import "../utils/in_memory_pref.dart";
import "../utils/remote_config.dart";
import "../utils/secure_storage.dart";

class _Host extends HookConsumerWidget {
  const _Host({required this.onBuild});

  final VoidCallback onBuild;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onBuild();
    useLoginBonusStateRefresher(ref);
    return const SizedBox();
  }
}

/// Reports [states] one after another, as the engine does on its way between
/// two states.
Future<void> _transition(WidgetTester tester, List<AppLifecycleState> states) async {
  for (final state in states) {
    tester.binding.handleAppLifecycleStateChanged(state);
  }
  await tester.pump();
}

void main() {
  group("with a stand-in provider", () {
    late int builds;
    late int hostBuilds;

    /// What the next build of the provider returns.
    late Future<bool?> Function() nextResult;

    Future<ProviderContainer> pumpHost(WidgetTester tester, {AppLifecycleState? lifecycle}) async {
      builds = 0;
      hostBuilds = 0;
      if (lifecycle != null) {
        tester.binding.handleAppLifecycleStateChanged(lifecycle);
      }
      await tester.pumpWidget(ProviderScope(
        overrides: [
          loginBonusStateProvider.overrideWith(() => FakeLoginBonusState(() {
            builds++;
            return nextResult();
          })),
        ],
        child: _Host(onBuild: () => hostBuilds++),
      ));
      await tester.pump();
      return ProviderScope.containerOf(tester.element(find.byType(_Host)));
    }

    testWidgets("builds the provider once at mount without rebuilding the caller", (tester) async {
      final result = Completer<bool?>();
      nextResult = () => result.future;
      final container = await pumpHost(tester, lifecycle: .resumed);
      expect(builds, 1);

      result.complete(true);
      await tester.pump();

      expect(container.read(loginBonusStateProvider).value, isTrue);
      expect(hostBuilds, 1);
    });

    for (final initial in [null, AppLifecycleState.inactive]) {
      testWidgets("ignores the resume from $initial at launch while the first fetch is in flight", (tester) async {
        final result = Completer<bool?>();
        nextResult = () => result.future;
        await pumpHost(tester, lifecycle: initial);

        await _transition(tester, [.resumed]);

        expect(builds, 1);
      });
    }

    testWidgets("ignores a resume while a re-check is in flight", (tester) async {
      nextResult = () async => false;
      await pumpHost(tester, lifecycle: .resumed);
      final recheck = Completer<bool?>();
      nextResult = () => recheck.future;
      await tester.pump(const Duration(minutes: 1));
      expect(builds, 2);

      await _transition(tester, [.inactive, .resumed]);

      expect(builds, 2);
    });

    testWidgets("re-checks every minute in the foreground", (tester) async {
      nextResult = () async => false;
      await pumpHost(tester, lifecycle: .resumed);

      await tester.pump(const Duration(seconds: 59));
      expect(builds, 1);

      await tester.pump(const Duration(seconds: 1));
      expect(builds, 2);
    });

    final backgroundPaths = <AppLifecycleState, (List<AppLifecycleState>, List<AppLifecycleState>)>{
      .hidden: ([.inactive, .hidden], [.inactive, .resumed]),
      .paused: ([.inactive, .hidden, .paused], [.hidden, .inactive, .resumed]),
      .detached: ([.inactive, .hidden, .paused, .detached], [.resumed]),
    };
    for (final MapEntry(key: state, value: (away, back)) in backgroundPaths.entries) {
      testWidgets("stops re-checking while $state, and re-checks once on resume", (tester) async {
        nextResult = () async => false;
        await pumpHost(tester, lifecycle: .resumed);
        await _transition(tester, away);

        await tester.pump(const Duration(minutes: 10));
        expect(builds, 1);

        await _transition(tester, back);
        expect(builds, 2);
      });
    }

    testWidgets("does not retry a failure every minute, but does on resume", (tester) async {
      nextResult = () => Future.error(Exception("offline"));
      final container = await pumpHost(tester, lifecycle: .resumed);
      expect(container.read(loginBonusStateProvider).hasError, isTrue);

      await tester.pump(const Duration(minutes: 3));
      expect(builds, 1);

      await _transition(tester, [.inactive, .resumed]);
      expect(builds, 2);
    });

    testWidgets("re-checks once after a round trip through the background", (tester) async {
      nextResult = () async => false;
      await pumpHost(tester, lifecycle: .resumed);

      await _transition(tester, [.inactive, .hidden, .paused, .hidden, .inactive, .resumed]);

      expect(builds, 2);
    });
  });

  group("with the real provider", () {
    setUpSecureStorageMock();
    late MockClient client;

    setUpAll(tz.initializeTimeZones);

    setUp(() {
      client = MockClient();
    });

    /// Runs [body] with `clock.now()` starting at [start] and advancing with
    /// `tester.pump`, which otherwise only moves the binding's own clock.
    Future<void> runAt(WidgetTester tester, DateTime start, Future<void> Function() body) {
      final origin = tester.binding.clock.now();
      return withClock(Clock(() => start.add(tester.binding.clock.now().difference(origin))), body);
    }

    Future<ProviderContainer> pumpApp(WidgetTester tester, {required String cache}) async {
      tester.binding.handleAppLifecycleStateChanged(.resumed);
      await tester.pumpWidget(ProviderScope(
        overrides: [
          overrideRemoteConfig(RemoteConfigKeys.hoyolabLinkEnabled, true),
          overrideHttpClient(client),
          hoyolabRequestQueueProvider.overrideWithValue(ApiRequestQueue(interval: Duration.zero)),
          overridePref(PrefKeys.lastLoginBonusStateSynced, cache),
        ],
        child: _Host(onBuild: () {}),
      ));
      // Lets the first build resolve the cookie and the API.
      for (var i = 0; i < 5; i++) {
        await tester.pump();
      }
      return ProviderScope.containerOf(tester.element(find.byType(_Host)));
    }

    // The claim of 2026-10-01 in UTC+8 holds until 2026-10-01T16:00Z.
    const claimedCache = "123456;2026-10-01T16:00:00.000Z;true";

    testWidgets("sends no request for an hour while claimed", (tester) async {
      await runAt(tester, DateTime.utc(2026, 10, 1, 4), () async {
        final container = await pumpApp(tester, cache: claimedCache);

        await tester.pump(const Duration(hours: 1));

        expect(container.read(loginBonusStateProvider).value, isTrue);
        verifyZeroInteractions(client);
      });
    });

    testWidgets("fetches within a minute after the reset", (tester) async {
      stubGet(client, signInfoResponse(isSign: false, today: "2026-10-02"));
      await runAt(tester, DateTime.utc(2026, 10, 1, 15, 58, 30), () async {
        final container = await pumpApp(tester, cache: claimedCache);

        await tester.pump(const Duration(minutes: 1));
        verifyZeroInteractions(client);

        await tester.pump(const Duration(minutes: 1));
        await tester.pump();

        expect(container.read(loginBonusStateProvider).value, isFalse);
        verify(client.get(any, headers: anyNamed("headers"))).called(1);
      });
    });
  });
}
