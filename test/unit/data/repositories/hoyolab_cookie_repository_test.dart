import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/data/repositories/hoyolab_cookie_repository.dart";

import "../../../utils/secure_storage.dart";

void main() {
  final storage = setUpSecureStorageMock();

  /// Builds the repository and waits for its first storage read.
  ///
  /// The notifier is an [AsyncNotifier], so the synchronous snapshot is
  /// `AsyncLoading` until this resolves — every assertion on the state, and
  /// every call that reads it back, has to come after it.
  Future<ProviderContainer> createLoadedContainer() async {
    final container = ProviderContainer.test();
    await container.read(hoyolabCookieRepositoryProvider.future);
    return container;
  }

  group("build", () {
    test("resolves to the stored cookie", () async {
      final container = ProviderContainer.test();

      expect(
        await container.read(hoyolabCookieRepositoryProvider.future),
        fakeCookie,
      );
    });

    test("resolves to null when nothing is stored", () async {
      storage.clear();
      final container = ProviderContainer.test();

      expect(
        await container.read(hoyolabCookieRepositoryProvider.future),
        isNull,
      );
    });
  });

  group("store", () {
    test("writes the cookie and publishes it", () async {
      storage.clear();
      final container = await createLoadedContainer();

      await container
          .read(hoyolabCookieRepositoryProvider.notifier)
          .store(fakeCookie);

      expect(storage["hoyolab_cookie"], fakeCookie);
      expect(container.read(hoyolabCookieRepositoryProvider).value, fakeCookie);
    });
  });

  group("delete", () {
    test("deletes the cookie and clears the state", () async {
      final container = await createLoadedContainer();

      await container.read(hoyolabCookieRepositoryProvider.notifier).delete();

      expect(storage, isEmpty);
      expect(container.read(hoyolabCookieRepositoryProvider).value, isNull);
    });
  });
}
