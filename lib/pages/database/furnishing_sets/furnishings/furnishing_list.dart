import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../../../components/list_tile.dart";
import "../../../../components/search.dart";
import "../../../../constants/dimens.dart";
import "../../../../i18n/strings.g.dart";
import "../../../../models/furnishing_set.dart";
import "../../../../providers/asset_image_resolver.dart";
import "../../../../providers/versions.dart";
import "../../../../routes.dart";
import "../../../../utils/filtering.dart";

class FurnishingListPage extends ConsumerWidget {
  const FurnishingListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).value!;
    final images = ref.watch(assetImageResolverProvider);

    final furnishings = assetData.furnishings.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.furnishings),
        actions: [
          SearchButton<Furnishing>(
            hintTargetText: tr.search.targets.furnishings,
            queryCallback: (query) {
              return filterBySearchQuery(
                assetData.furnishings.values,
                query,
              );
            },
            resultItemBuilder: (context, item) {
              return SearchResultListTile(
                image: Image.file(
                  images.getFile(item),
                  width: searchResultImageSize,
                  height: searchResultImageSize,
                ),
                title: item.name.localized,
                location: FurnishingDetailsRoute(id: item.id).location,
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: furnishings.length,
        itemBuilder: (context, index) {
          final furnishing = furnishings[index];
          return SimpleListTile(
            leading: Image.file(
              images.getFile(furnishing),
              width: listTileFurnishingImageSize,
              height: listTileFurnishingImageSize,
            ),
            title: furnishing.name.localized,
            location: FurnishingDetailsRoute(id: furnishing.id).location,
          );
        },
      ),
    );
  }
}
