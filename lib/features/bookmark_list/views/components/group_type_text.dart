import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../../db/bookmark_db_extension.dart";
import "../../../../i18n/strings.g.dart";
import "../../../../models/bookmark.dart";
import "../../../../models/common.dart";
import "../../../../providers/database_provider.dart";
import "../../../../providers/versions.dart";
import "../../../../routes.dart";
import "../../../../ui_core/dialog.dart";
import "item_link_button.dart";

/// Widget that displays the type text for a bookmark group
class GroupTypeText extends HookConsumerWidget {
  final BookmarkGroup group;

  const GroupTypeText(this.group, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetDataAsync = ref.watch(assetDataProvider);
    assert(assetDataAsync.value != null, "Must be used in a DataAssetScope");

    final assetData = assetDataAsync.value!;

    switch (group.type) {
      case BookmarkType.material:
        final materialDetails =
            (group.bookmarks.first as BookmarkWithMaterialDetails)
                .materialDetails;
        if (materialDetails.weaponId == null) {
          final purposeType = materialDetails.purposeType;
          return switch (purposeType) {
            Purpose.ascension => _buildText(tr.bookmarksPage.character),
            Purpose.normalAttack ||
            Purpose.elementalSkill ||
            Purpose.elementalBurst =>
              _buildText(tr.talentTypes[purposeType.name]!),
          };
        } else {
          final weapon = assetData.weapons[materialDetails.weaponId]!;
          return ItemLinkButton(
            onTap: () {
              WeaponDetailsRoute(
                id: weapon.id,
                initialSelectedCharacter: group.characterId,
              ).push(context);
            },
            child: Row(
              children: [
                _buildText(tr.bookmarksPage.weapon),
                Image.file(weapon.getImageFile(assetData.assetDir),
                    width: 35, height: 35),
              ],
            ),
          );
        }
      case BookmarkType.artifactSet:
        return _buildTextWithUnBookmarkButton(
            tr.bookmarksPage.artifactSet, ref);
      case BookmarkType.artifactPiece:
        return _buildTextWithUnBookmarkButton(
            tr.bookmarksPage.artifactPiece, ref);
    }
  }

  Widget _buildText(String text) {
    final context = useContext();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium!),
    );
  }

  Widget _buildTextWithUnBookmarkButton(String text, WidgetRef ref) {
    final context = useContext();

    return Row(
      children: [
        _buildText(text),
        IconButton(
          icon: const Icon(Symbols.bookmark_remove),
          onPressed: () {
            showSimpleDialog(
              context: context,
              title: tr.bookmarksPage.unBookmark,
              content: tr.bookmarksPage.unBookmarkConfirm,
              showCancel: true,
              onOkPressed: () {
                if (context.mounted) {
                  final db = ref.read(appDatabaseProvider);
                  db.removeBookmarks([group.bookmarks.first.metadata.id]);
                }
              },
            );
          },
        ),
      ],
    );
  }
}
