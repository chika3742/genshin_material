import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod/misc.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/providers/banner_notifier.dart";
import "package:genshin_material/providers/pref_notifier.dart";

import "../utils/in_memory_pref.dart";
import "../utils/remote_config.dart";

void main() {
  ProviderContainer makeContainer({
    required List<Override> remoteConfig,
    List<String> initialReadKeys = const [],
  }) {
    final container = ProviderContainer(overrides: [
      ...remoteConfig,
      overridePref(PrefKeys.bannerReadKeys, initialReadKeys),
    ]);
    addTearDown(container.dispose);
    return container;
  }

  test("returns null when bannerShown is false", () {
    final container = makeContainer(
      remoteConfig: overrideRemoteConfigs(showBanner: false),
    );

    expect(container.read(bannerProvider), isNull);
  });

  test("returns BannerData when bannerShown is true and key is unread", () {
    final container = makeContainer(
      remoteConfig: overrideRemoteConfigs(
        showBanner: true,
        bannerKey: "v1",
        bannerText: "Hello",
        bannerActionText: "Go",
        bannerActionUrl: "https://example.com",
      ),
    );

    final banner = container.read(bannerProvider);
    expect(banner, isNotNull);
    expect(banner!.text, "Hello");
    expect(banner.actionText, "Go");
    expect(banner.actionUrl, "https://example.com");
  });

  test("returns null when bannerShown is true but key is already read", () {
    final container = makeContainer(
      remoteConfig: overrideRemoteConfigs(
        showBanner: true,
        bannerKey: "v1",
        bannerText: "Hello",
      ),
      initialReadKeys: ["v1"],
    );

    expect(container.read(bannerProvider), isNull);
  });

  test("markAsRead hides the banner by adding key to read list", () async {
    final container = makeContainer(
      remoteConfig: overrideRemoteConfigs(
        showBanner: true,
        bannerKey: "v1",
        bannerText: "Hello",
      ),
    );

    expect(container.read(bannerProvider), isNotNull);

    await container.read(bannerProvider.notifier).markAsRead();

    expect(container.read(prefProvider(PrefKeys.bannerReadKeys)), contains("v1"));
    expect(container.read(bannerProvider), isNull);
  });
}
