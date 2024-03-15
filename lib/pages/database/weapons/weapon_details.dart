import "package:collection/collection.dart";
import "package:flutter/material.dart";

import "../../../components/center_text.dart";
import "../../../components/data_asset_scope.dart";
import "../../../components/game_item_info_box.dart";
import "../../../components/layout.dart";
import "../../../components/rarity_stars.dart";
import "../../../i18n/strings.g.dart";

class WeaponDetailsPage extends StatelessWidget {
  final String id;

  const WeaponDetailsPage(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return DataAssetScope(
      wrapCenterTextWithScaffold: true,
      builder: (assetData) {
        final weapon = assetData.weapons!.firstWhereOrNull((element) => element.id == id);
        if (weapon == null) {
          return Scaffold(
            appBar: AppBar(),
            body: const CenterText("Weapon not found"),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(tr.pages.weaponDetails(weapon: weapon.name.localized)),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: GappedColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              gap: 16,
              children: [
                GameItemInfoBox(
                  itemImage: Image.file(
                    weapon.getImageFile(assetData.assetDir!),
                    width: 50,
                    height: 50,
                  ),
                  children: [
                    RarityStars(count: weapon.rarity),
                    Text(
                      assetData.weaponTypes![weapon.type]!.localized,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
