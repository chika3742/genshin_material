import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../components/character_small_card.dart";
import "../components/data_asset_scope.dart";
import "../components/list_tile.dart";
import "../components/weekday_tab.dart";
import "../i18n/strings.g.dart";
import "../models/material.dart";
import "../providers/preferences.dart";
import "../providers/versions.dart";
import "../routes.dart";
import "../ui_core/layout.dart";
import "../utils/lists.dart";
import "../utils/material_usage.dart";

class DailyPage extends HookConsumerWidget {
  const DailyPage({super.key});

  List<DailyTab> get tabs => [
    DailyTab(
      id: "monday|thursday",
      title: tr.dailyPage.mondayAndThursday,
      days: const [DateTime.monday, DateTime.thursday, DateTime.sunday],
    ),
    DailyTab(
      id: "tuesday|friday",
      title: tr.dailyPage.tuesdayAndFriday,
      days: const [DateTime.tuesday, DateTime.friday, DateTime.sunday],
    ),
    DailyTab(
      id: "wednesday|saturday",
      title: tr.dailyPage.wednesdayAndSaturday,
      days: const [DateTime.wednesday, DateTime.saturday, DateTime.sunday],
    ),
  ];
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pref = ref.watch(preferencesStateNotifierProvider);

    final tabController = useTabController(
      initialLength: tabs.length,
      initialIndex: tabs.indexWhere((tab) => tab.getIsToday(pref.dailyResetServer)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.daily),
        bottom: WeekdayTab(tabController: tabController, tabs: tabs),
      ),
      body: DataAssetScope(
        builder: (context, assetData) {
          return TabBarView(
            controller: tabController,
            children: [
              for (final tab in tabs)
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: GappedColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Section(
                        heading: SectionHeading(tr.dailyPage.talentMaterials),
                        child: GappedColumn(
                          children: [
                            for (final dm in assetData.dailyMaterials.talent[tab.id]!)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _DailyMaterialHeading(dailyMaterial: dm),
                                  Wrap(
                                    children: [
                                      for (final character in getCharactersUsingMaterial(
                                        assetData.materials[dm.items.first]!,
                                        assetData.characters.values,
                                        assetData.specialCharactersUsingMaterials,
                                      ))
                                        if (!character.id.startsWith("traveler"))
                                          CharacterSmallCard(character),
                                    ],
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),

                      const Divider(),

                      Section(
                        heading: SectionHeading(tr.dailyPage.weaponMaterials),
                        child: GappedColumn(
                          children: [
                            for (final dm in assetData.dailyMaterials.weapon[tab.id]!)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _DailyMaterialHeading(dailyMaterial: dm),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      for (final e in getWeaponsUsingMaterial(
                                        assetData.materials[dm.items.first]!,
                                        assetData.weapons.values,
                                      ).toList().sortedDescendingByRarity().groupByType(assetData.weaponTypes.keys.toList()).entries) ...[
                                        SectionInnerHeading(
                                          assetData.weaponTypes[e.key]!.name.localized,
                                        ),
                                        for (final weapon in e.value)
                                          GameItemListTile(
                                            name: weapon.name.localized,
                                            image: weapon.getImageFile(assetData.assetDir),
                                            rounded: true,
                                            rarity: weapon.rarity,
                                            onTap: () {
                                              WeaponDetailsRoute(id: weapon.id)
                                                  .push(context);
                                            },
                                          ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _DailyMaterialHeading extends ConsumerWidget {
  final DailyMaterial dailyMaterial;

  const _DailyMaterialHeading({required this.dailyMaterial});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).value;
    if (assetData == null) {
      return const SizedBox();
    }

    return Card(
      color: Theme.of(context).colorScheme.tertiaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            for (final dm in dailyMaterial.items)
              GestureDetector(
                onTap: () {
                  MaterialDetailsRoute(id: dm).push(context);
                },
                child: Image.file(
                  assetData.materials[dm]!.getImageFile(assetData.assetDir),
                  width: 35,
                  height: 35,
                ),
              ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                dailyMaterial.description.localized,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
