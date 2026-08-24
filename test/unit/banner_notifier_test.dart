import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/data/repositories/remote_config_value.dart";
import "package:genshin_material/providers/banner_notifier.dart";
import "package:genshin_material/providers/pref_notifier.dart";

import "../utils/in_memory_pref_notifier.dart";

void main() {
  ProviderContainer makeContainer({
    required bool bannerShown,
    String bannerKey = "",
    String bannerText = "",
    String bannerActionText = "",
    String bannerActionUrl = "",
    List<String> initialReadKeys = const [],
  }) {
    final container = ProviderContainer(overrides: [
      remoteConfigValueProvider(RemoteConfigKeys.showBanner).overrideWithValue(bannerShown),
      remoteConfigValueProvider(RemoteConfigKeys.bannerKey).overrideWithValue(bannerKey),
      remoteConfigValueProvider(RemoteConfigKeys.bannerText).overrideWithValue(bannerText),
      remoteConfigValueProvider(RemoteConfigKeys.bannerActionText).overrideWithValue(bannerActionText),
      remoteConfigValueProvider(RemoteConfigKeys.bannerActionUrl).overrideWithValue(bannerActionUrl),
      prefProvider(PrefKeys.bannerReadKeys).overrideWith(
        () => InMemoryPrefNotifier<List<String>, List<String>>(initialReadKeys),
      ),
    ]);
    addTearDown(container.dispose);
    return container;
  }

  test("returns null when bannerShown is false", () {
    final container = makeContainer(bannerShown: false);

    expect(container.read(bannerProvider), isNull);
  });

  test("returns BannerData when bannerShown is true and key is unread", () {
    final container = makeContainer(
      bannerShown: true,
      bannerKey: "v1",
      bannerText: "Hello",
      bannerActionText: "Go",
      bannerActionUrl: "https://example.com",
    );

    final banner = container.read(bannerProvider);
    expect(banner, isNotNull);
    expect(banner!.text, "Hello");
    expect(banner.actionText, "Go");
    expect(banner.actionUrl, "https://example.com");
  });

  test("returns null when bannerShown is true but key is already read", () {
    final container = makeContainer(
      bannerShown: true,
      bannerKey: "v1",
      bannerText: "Hello",
      initialReadKeys: ["v1"],
    );

    expect(container.read(bannerProvider), isNull);
  });

  test("markAsRead hides the banner by adding key to read list", () async {
    final container = makeContainer(
      bannerShown: true,
      bannerKey: "v1",
      bannerText: "Hello",
    );

    expect(container.read(bannerProvider), isNotNull);

    await container.read(bannerProvider.notifier).markAsRead();

    expect(container.read(prefProvider(PrefKeys.bannerReadKeys)), contains("v1"));
    expect(container.read(bannerProvider), isNull);
  });
}
