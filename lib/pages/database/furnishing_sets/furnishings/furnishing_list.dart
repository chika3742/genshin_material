import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../../../components/list_tile.dart";
import "../../../../constants/dimens.dart";
import "../../../../i18n/strings.g.dart";
import "../../../../providers/versions.dart";
import "../../../../routes.dart";

class FurnishingListPage extends ConsumerWidget {
  const FurnishingListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).value!;

    final furnishings = assetData.furnishings.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.furnishings),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: furnishings.length,
          itemBuilder: (context, index) {
            final furnishing = furnishings[index];
            return SimpleListTile(
              leading: Image.file(
                furnishing.getImageFile(assetData.assetDir),
                width: listTileFurnishingImageSize,
                height: listTileFurnishingImageSize,
              ),
              title: furnishing.name.localized,
              location: FurnishingDetailsRoute(id: furnishing.id).location,
            );
          },
        ),
      ),
    );
  }
}
