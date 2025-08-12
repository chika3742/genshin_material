import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../../../components/center_text.dart";
import "../../../../components/item_source_widget.dart";
import "../../../../components/list_tile.dart";
import "../../../../constants/dimens.dart";
import "../../../../i18n/strings.g.dart";
import "../../../../providers/versions.dart";
import "../../../../routes.dart";
import "../../../../ui_core/layout.dart";

class FurnishingDetailsPage extends ConsumerWidget {
  final String id;

  const FurnishingDetailsPage({super.key, required this.id});

  static const furnishingImageSize = 70.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).value!;
    final furnishing = assetData.furnishings[id];
    if (furnishing == null) {
      return Scaffold(
        appBar: AppBar(),
        body: CenterText(tr.common.error),
      );
    }

    final includedInSets = assetData.furnishingSets.values
        .where((set) => set.consistsOf.any((c) => c.furnishingId == id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr.pages.furnishingDetails(furnishing: furnishing.name.localized),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Image.file(
                furnishing.getImageFile(assetData.assetDir),
                width: furnishingImageSize,
                height: furnishingImageSize,
              ),

              Main(children: [
                if (furnishing.source != null)
                  Section(
                    heading: SectionHeading(tr.materialDetailsPage.source),
                    child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.bodyLarge!,
                      child: ItemSourceWidget(furnishing.source!),
                    ),
                  ),

                if (includedInSets.isNotEmpty)
                  Section(
                    heading: SectionHeading(tr.furnishingSetsPage.furnishingSetsUsingThisFurnishing),
                    child: FullWidth(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: includedInSets.map((set) {
                          return SimpleListTile(
                            leading: Image.file(
                              set.getImageFile(assetData.assetDir),
                              width: listTileFurnishingSetImageWidth,
                            ),
                            title: set.name.localized,
                            location: FurnishingSetDetailsRoute(id: set.id).location,
                            routingStrategy: RoutingStrategy.push,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
