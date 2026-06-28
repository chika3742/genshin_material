import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/data/repositories/remote_config_repository.dart";
import "package:genshin_material/providers/banner_notifier.dart";
import "package:genshin_material/providers/pref_notifier.dart";

import "../utils/banner_mocks.dart";
import "../utils/banner_mocks.mocks.dart";

void main() {
  ProviderContainer makeContainer(
    MockRemoteConfigRepository mockRc, {
    List<String> initialReadKeys = const [],
  }) {
    final container = ProviderContainer(overrides: [
      remoteConfigProvider.overrideWithValue(mockRc),
      prefProvider(PrefKeys.bannerReadKeys).overrideWith(
        () => InMemoryPrefNotifier<List<String>, List<String>>(initialReadKeys),
      ),
    ]);
    addTearDown(container.dispose);
    return container;
  }

  test("returns null when bannerShown is false", () {
    final mockRc = MockRemoteConfigRepository();
    stubBannerRemoteConfig(mockRc, bannerShown: false);

    final container = makeContainer(mockRc);

    expect(container.read(bannerProvider), isNull);
  });

  test("returns BannerData when bannerShown is true and key is unread", () {
    final mockRc = MockRemoteConfigRepository();
    stubBannerRemoteConfig(mockRc,
      bannerShown: true,
      bannerKey: "v1",
      bannerText: "Hello",
      bannerActionText: "Go",
      bannerActionUrl: "https://example.com",
    );

    final container = makeContainer(mockRc);

    final banner = container.read(bannerProvider);
    expect(banner, isNotNull);
    expect(banner!.text, "Hello");
    expect(banner.actionText, "Go");
    expect(banner.actionUrl, "https://example.com");
  });

  test("returns null when bannerShown is true but key is already read", () {
    final mockRc = MockRemoteConfigRepository();
    stubBannerRemoteConfig(mockRc,
      bannerShown: true,
      bannerKey: "v1",
      bannerText: "Hello",
    );

    final container = makeContainer(mockRc, initialReadKeys: ["v1"]);

    expect(container.read(bannerProvider), isNull);
  });

  test("markAsRead hides the banner by adding key to read list", () async {
    final mockRc = MockRemoteConfigRepository();
    stubBannerRemoteConfig(mockRc,
      bannerShown: true,
      bannerKey: "v1",
      bannerText: "Hello",
    );

    final container = makeContainer(mockRc);

    expect(container.read(bannerProvider), isNotNull);

    await container.read(bannerProvider.notifier).markAsRead();

    expect(container.read(prefProvider(PrefKeys.bannerReadKeys)), contains("v1"));
    expect(container.read(bannerProvider), isNull);
  });
}
