import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/center_text.dart";
import "../../../components/character_small_card.dart";
import "../../../components/furnishing_table.dart";
import "../../../components/game_item_info_box.dart";
import "../../../core/asset_cache.dart";
import "../../../core/theme.dart";
import "../../../db/furnishing_db_extension.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/character.dart";
import "../../../models/common.dart";
import "../../../providers/database_provider.dart";
import "../../../ui_core/dialog.dart";
import "../../../ui_core/layout.dart";
import "../../../ui_core/snack_bar.dart";

class FurnishingSetDetailsPage extends ConsumerWidget {
  final AssetData assetData;
  final FurnishingSetId id;

  const FurnishingSetDetailsPage({
    super.key,
    required this.id,
    required this.assetData,
  });

  static const furnishingSetImageWidth = 90.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final set = assetData.furnishingSets[id];
    if (set == null) {
      return Scaffold(
        appBar: AppBar(),
        body: CenterText(tr.common.error),
      );
    }

    final charactersFavored = assetData.characters.values.where((e) {
      return e is ListedCharacter
          && e.hyvIds.any((id) => set.favoriteCharacterHyvIds.contains(id));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.furnishingSetDetails(furnishingSet: set.name.localized)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: GameItemInfoBox(
                      itemImage: Image.file(
                        set.getImageFile(assetData.assetDir),
                        width: furnishingSetImageWidth,
                      ),
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "${tr.furnishingSetsPage.type}  ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: assetData.furnishingSetTypes[set.type]!.localized),
                        ])),
                      ],
                    ),
                  ),
                  HookConsumer(
                    builder: (context, ref, child) {
                      final db = ref.watch(appDatabaseProvider);
                      final isBookmarkedSnapshot = useStream(
                          db.watchFurnishingSetBookmark(set.id));
                      final isBookmarked = isBookmarkedSnapshot.data ?? false;
                      return IconButton(
                        icon: Icon(
                          isBookmarked ? Symbols.bookmark_remove : Symbols.bookmark_add,
                          fill: isBookmarked ? 1.0 : 0.0,
                          color: isBookmarked
                              ? Theme.of(context).extension<ComponentThemeExtension>()!.starColor
                              : null,
                        ),
                        onPressed: () {
                          db.setFurnishingSetBookmark(set.id, !isBookmarked);
                          if (context.mounted && isBookmarkedSnapshot.hasData) {
                            showSnackBar(
                              context: context,
                              message: isBookmarked
                                  ? tr.furnishingSetsPage.removedFromBookmarks
                                  : tr.furnishingSetsPage.addedToBookmarks,
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),

              Main(children: [
                Column(
                  spacing: 8.0,
                  children: [
                    Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Symbols.arrow_range,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        Text(
                          tr.furnishingSetsPage.canBeScrolledHorizontally,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),

                    // table
                    FullWidth(
                      child: FurnishingTable(
                        setId: set.id,
                        items: set.consistsOf.map((e) {
                          return FurnishingSetComponentItem(
                            furnishing: assetData.furnishings[e.furnishingId]!,
                            quantity: e.quantity,
                          );
                        }).toList(),
                      ),
                    ),

                    // reset craft count button
                    Align(
                      alignment: Alignment.centerRight,
                      child: OutlinedButton.icon(
                        icon: Icon(Symbols.reset_settings),
                        label: Text(tr.furnishingSetsPage.resetCraftCount),
                        onPressed: () => _showResetCraftCountDialog(context, ref),
                      ),
                    ),
                  ],
                ),

                if (charactersFavored.isNotEmpty)
                  Section(
                    heading: SectionHeading(tr.furnishingSetsPage.favoredBy),
                    child: Wrap(
                      children: charactersFavored.map((character) {
                        return CharacterSmallCard(character);
                      }).toList(),
                    ),
                  ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  void _showResetCraftCountDialog(BuildContext context, WidgetRef ref) {
    showSimpleDialog(
      context: context,
      title: tr.furnishingSetsPage.resetCraftCount,
      content: tr.furnishingSetsPage.resetCraftCountConfirm,
      onOkPressed: () {
        if (ref.context.mounted) {
          ref.read(appDatabaseProvider).resetFurnishingCraftCounts(id);
        }
      },
      showCancel: true,
    );
  }
}
