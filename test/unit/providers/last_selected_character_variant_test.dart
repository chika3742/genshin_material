import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod/misc.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/providers/last_selected_character_variant.dart";
import "package:genshin_material/providers/pref_notifier.dart";

import "../../utils/asset_data.dart";
import "../../utils/in_memory_pref.dart";
import "../../utils/provider_container.dart";

void main() {
  const travelerId = "traveler";
  const anemoId = "traveler_anemo";
  const geoId = "traveler_geo";
  const otherGroupId = "other";
  const otherVariantId = "other_pyro";
  const listedId = "listed";

  final assetData = buildTestAssetData(
    characters: {
      travelerId: buildTestCharacterGroup(id: travelerId, variantIds: const [anemoId, geoId]),
      anemoId: buildTestCharacterVariant(id: anemoId, parentId: travelerId, element: "anemo"),
      geoId: buildTestCharacterVariant(id: geoId, parentId: travelerId, element: "geo"),
      otherGroupId: buildTestCharacterGroup(id: otherGroupId, variantIds: const [otherVariantId]),
      otherVariantId: buildTestCharacterVariant(id: otherVariantId, parentId: otherGroupId, element: "pyro"),
      listedId: buildTestCharacter(id: listedId),
    },
  );

  ProviderContainer createContainer({List<String> stored = const []}) {
    return createTestContainer(
      assetData: assetData,
      overrides: [
        overridePref(PrefKeys.lastSelectedCharacterVariantIds, stored),
      ],
    );
  }

  List<String> readPref(ProviderContainer container) =>
      container.read(prefProvider(PrefKeys.lastSelectedCharacterVariantIds));

  group("LastSelectedCharacterVariant", () {
    test("returns null when nothing has been selected for the group", () {
      final container = createContainer(stored: const [otherVariantId]);

      expect(container.read(lastSelectedCharacterVariantProvider(travelerId)), isNull);
    });

    test("returns the stored variant of the group", () {
      final container = createContainer(stored: const [otherVariantId, geoId]);

      expect(container.read(lastSelectedCharacterVariantProvider(travelerId)), geoId);
      expect(container.read(lastSelectedCharacterVariantProvider(otherGroupId)), otherVariantId);
    });

    test("ignores a stored id that the group no longer lists", () {
      final container = createContainer(stored: const ["traveler_removed"]);

      expect(container.read(lastSelectedCharacterVariantProvider(travelerId)), isNull);
    });

    test("set persists the selection and exposes it", () async {
      final container = createContainer();
      final subscription = container.listen(
        lastSelectedCharacterVariantProvider(travelerId),
        (_, _) {},
      );
      addTearDown(subscription.close);

      await container.read(lastSelectedCharacterVariantProvider(travelerId).notifier).set(geoId);

      expect(container.read(lastSelectedCharacterVariantProvider(travelerId)), geoId);
      expect(readPref(container), const [geoId]);
    });

    test("set replaces the group's previous selection", () async {
      final container = createContainer(stored: const [anemoId]);

      await container.read(lastSelectedCharacterVariantProvider(travelerId).notifier).set(geoId);

      expect(readPref(container), const [geoId]);
    });

    test("set leaves other groups' selections untouched", () async {
      final container = createContainer(stored: const [otherVariantId, anemoId]);

      await container.read(lastSelectedCharacterVariantProvider(travelerId).notifier).set(geoId);

      expect(readPref(container), const [otherVariantId, geoId]);
      expect(container.read(lastSelectedCharacterVariantProvider(otherGroupId)), otherVariantId);
    });

    test("set rejects a variant that does not belong to the group", () {
      final container = createContainer();

      expect(
        () => container.read(lastSelectedCharacterVariantProvider(travelerId).notifier).set(otherVariantId),
        throwsArgumentError,
      );
      expect(readPref(container), isEmpty);
    });

    // Reading a failed synchronous provider wraps the cause in `ProviderException`.
    test("throws when the id is not a character group", () {
      final container = createContainer();

      for (final id in [listedId, anemoId, "missing"]) {
        expect(
          () => container.read(lastSelectedCharacterVariantProvider(id)),
          throwsA(isA<ProviderException>()),
          reason: id,
        );
      }
    });
  });
}
