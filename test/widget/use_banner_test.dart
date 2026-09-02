import "package:flutter/material.dart";
import "package:flutter_riverpod/misc.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/data/services/remote_config_service.dart";
import "package:genshin_material/hooks/use_banner.dart";
import "package:genshin_material/providers/pref_notifier.dart";
import "package:genshin_material/providers/remote_config.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:mockito/mockito.dart";

import "../utils/in_memory_pref.dart";
import "../utils/remote_config.dart";

class _Host extends HookConsumerWidget {
  const _Host({required this.onBuild});

  final void Function(BannerHandle handle) onBuild;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onBuild(useBanner(ref));
    return const SizedBox();
  }
}

void main() {
  /// The hook reads all five banner keys, so each of them has to be overridden
  /// even when a test only cares about one.
  List<Override> bannerConfig({
    bool shown = true,
    String key = "v1",
    String text = "",
    String actionText = "",
    String actionUrl = "",
  }) {
    return [
      overrideRemoteConfig(RemoteConfigKeys.showBanner, shown),
      overrideRemoteConfig(RemoteConfigKeys.bannerKey, key),
      overrideRemoteConfig(RemoteConfigKeys.bannerText, text),
      overrideRemoteConfig(RemoteConfigKeys.bannerActionText, actionText),
      overrideRemoteConfig(RemoteConfigKeys.bannerActionUrl, actionUrl),
    ];
  }

  late BannerHandle handle;

  Future<ProviderContainer> pumpHost(
    WidgetTester tester, {
    required List<Override> remoteConfig,
    List<String> initialReadKeys = const [],
  }) async {
    final container = ProviderContainer(overrides: [
      ...remoteConfig,
      overridePref(PrefKeys.bannerReadKeys, initialReadKeys),
    ]);
    addTearDown(container.dispose);

    await tester.pumpWidget(UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        home: _Host(onBuild: (value) => handle = value),
      ),
    ));
    return container;
  }

  testWidgets("returns null when the banner is switched off", (tester) async {
    await pumpHost(tester, remoteConfig: bannerConfig(shown: false));

    expect(handle.banner, isNull);
  });

  testWidgets("returns the banner when it is switched on and unread",
      (tester) async {
    await pumpHost(tester, remoteConfig: bannerConfig(
      text: "Hello",
      actionText: "Go",
      actionUrl: "https://example.com",
    ));

    expect(handle.banner, isNotNull);
    expect(handle.banner!.text, "Hello");
    expect(handle.banner!.actionText, "Go");
    expect(handle.banner!.actionUrl, "https://example.com");
  });

  testWidgets("returns null when the key was already read", (tester) async {
    await pumpHost(
      tester,
      remoteConfig: bannerConfig(text: "Hello"),
      initialReadKeys: ["v1"],
    );

    expect(handle.banner, isNull);
  });

  testWidgets("markAsRead hides the banner by adding the key to the read list",
      (tester) async {
    final container = await pumpHost(
      tester,
      remoteConfig: bannerConfig(text: "Hello"),
    );
    expect(handle.banner, isNotNull);

    await handle.markAsRead();
    await tester.pump();

    expect(container.read(prefProvider(PrefKeys.bannerReadKeys)), contains("v1"));
    expect(handle.banner, isNull);
  });

  testWidgets("markAsRead records the key the banner was built from",
      (tester) async {
    // A config push can replace the key while the banner is on screen. What the
    // user dismisses is the banner they were shown, so that key is the one that
    // has to end up in the read list.
    var key = "shown";
    final service = createRemoteConfigServiceMock();
    when(service.get<bool>(RemoteConfigKeys.showBanner)).thenReturn(true);
    when(service.get<String>(RemoteConfigKeys.bannerKey)).thenAnswer((_) => key);
    when(service.get<String>(RemoteConfigKeys.bannerText)).thenReturn("Hello");
    when(service.get<String>(RemoteConfigKeys.bannerActionText)).thenReturn("");
    when(service.get<String>(RemoteConfigKeys.bannerActionUrl)).thenReturn("");
    final container = await pumpHost(tester, remoteConfig: [
      remoteConfigServiceProvider.overrideWithValue(service),
    ]);
    final shownBanner = handle;

    key = "pushed";
    container.invalidate(remoteConfigProvider);
    await tester.pump();
    expect(handle.banner, isNotNull, reason: "the pushed banner is unread too");

    await shownBanner.markAsRead();

    expect(
      container.read(prefProvider(PrefKeys.bannerReadKeys)),
      ["shown"],
      reason: "the pushed key was never displayed, so it must not be suppressed",
    );
  });
}
