
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../components/character_small_card.dart";
import "../components/data_asset_scope.dart";
import "../components/layout.dart";
import "../components/list_tile.dart";
import "../components/weekday_tab.dart";
import "../i18n/strings.g.dart";
import "../models/common.dart";
import "../models/material.dart";
import "../providers/versions.dart";
import "../routes.dart";
import "../utils/lists.dart";
import "../utils/material_usage.dart";

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> with TickerProviderStateMixin {
  late final TabController _tabController;

  final tabs = [
    DailyTab(
      id: "monday|thursday",
      title: tr.dailyPage.mondayAndThursday,
      days: const [DayOfWeek.monday, DayOfWeek.thursday, DayOfWeek.sunday],
    ),
    DailyTab(
      id: "tuesday|friday",
      title: tr.dailyPage.tuesdayAndFriday,
      days: const [DayOfWeek.tuesday, DayOfWeek.friday, DayOfWeek.sunday],
    ),
    DailyTab(
      id: "wednesday|saturday",
      title: tr.dailyPage.wednesdayAndSaturday,
      days: const [DayOfWeek.wednesday, DayOfWeek.saturday, DayOfWeek.sunday],
    ),
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: tabs.length,
      initialIndex: tabs.indexWhere((tab) => tab.isToday),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.daily),
        bottom: WeekdayTab(tabController: _tabController, tabs: tabs),
      ),
      body: DataAssetScope(
        builder: (assetData, assetDir) {
          return TabBarView(
            controller: _tabController,
            children: [
              for (final tab in tabs)
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: GappedColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeading(tr.dailyPage.talentMaterials),
                      for (final dm in assetData.dailyMaterials.talent[tab.id]!)
                        ...[
                          _DailyMaterialHeading(dailyMaterial: dm),
                          Wrap(
                            children: [
                              for (final character in getCharactersUsingMaterial(
                                assetData.materials[dm.items.first]!,
                                assetData.characters.values,
                              ))
                                CharacterSmallCard(character),
                            ],
                          ),
                        ],
                      const Divider(),
                      SectionHeading(tr.dailyPage.weaponMaterials),
                      for (final dm in assetData.dailyMaterials.weapon[tab.id]!) ...[
                        _DailyMaterialHeading(dailyMaterial: dm),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (final e in getWeaponsUsingMaterial(
                              assetData.materials[dm.items.first]!,
                              assetData.weapons.values,
                            ).toList().sortedDescendingByRarity().groupByType().entries) ...[
                              SectionHeading(
                                assetData.weaponTypes[e.key]!.name.localized,
                                indent: 8,
                              ),
                              for (final weapon in e.value)
                                GameItemListTile(
                                  name: weapon.name.localized,
                                  image: weapon.getImageFile(assetDir),
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
    final assetDataCache = ref.watch(assetDataProvider).value;
    final assetData = assetDataCache?.data;
    if (assetData == null) {
      return const SizedBox();
    }

    return Card(
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
                  assetData.materials[dm]!.getImageFile(assetDataCache!.assetDir),
                  width: 35,
                  height: 35,
                ),
              ),
            const SizedBox(width: 16),
            Text(
              dailyMaterial.description.localized,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
