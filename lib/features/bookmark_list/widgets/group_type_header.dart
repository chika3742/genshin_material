import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../common/widgets/item_link_button.dart";
import "../../../i18n/strings.g.dart";
import "../../../models/bookmark.dart";
import "../../../models/common.dart";
import "../../../providers/database_provider.dart";
import "../../../providers/versions.dart";
import "../../../routes.dart";
import "../../../ui_core/dialog.dart";

/// Header component displaying the bookmark group's character, type, and level range.
///
/// Shows character avatar, bookmark type (material/artifact), and level progression
/// for material bookmarks. Provides navigation to character/weapon details.
class GroupTypeHeader extends ConsumerWidget {
  const GroupTypeHeader({required this.group, super.key});

  final BookmarkGroup group;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).value!;

    return Row(
      children: [
        ItemLinkButton(
          onTap: () {
            CharacterDetailsRoute(id: group.characterId).push(context);
          },
          child: Image.file(
            assetData.characters[group.characterId]!.getSmallImageFile(assetData.assetDir),
            width: 35,
            height: 35,
          ),
        ),
        const Spacer(),
        _GroupTypeText(group),
        if (group.type == BookmarkType.material)
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: "Lv.", style: TextStyle(fontSize: 18)),
                TextSpan(
                  text: group.levelRange!.start.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const WidgetSpan(
                  child: Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Icon(Symbols.double_arrow),
                  ),
                  alignment: PlaceholderAlignment.middle,
                ),
                TextSpan(
                  text: group.levelRange!.end.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            style: GoogleFonts.titilliumWeb(fontSize: 24),
          ),
      ],
    );
  }
}

/// Displays the type text for a bookmark group (e.g., "Character", "Weapon", "Artifact Set").
///
/// For weapons, shows weapon icon with link to details.
/// For artifacts, includes unbookmark button.
class _GroupTypeText extends HookConsumerWidget {
  final BookmarkGroup group;

  const _GroupTypeText(this.group);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetDataAsync = ref.watch(assetDataProvider);
    assert(assetDataAsync.value != null, "Must be used in a DataAssetScope");

    final assetData = assetDataAsync.value!;

    switch (group.type) {
      case BookmarkType.material:
        final materialDetails =
            (group.bookmarks.first as BookmarkWithMaterialDetails).materialDetails;
        if (materialDetails.weaponId == null) {
          final purposeType = materialDetails.purposeType;
          return switch (purposeType) {
            Purpose.ascension => _buildText(tr.bookmarksPage.character),
            Purpose.normalAttack || Purpose.elementalSkill || Purpose.elementalBurst =>
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
                Image.file(
                  weapon.getImageFile(assetData.assetDir),
                  width: 35,
                  height: 35,
                ),
              ],
            ),
          );
        }
      case BookmarkType.artifactSet:
        return _buildTextWithUnBookmarkButton(tr.bookmarksPage.artifactSet, ref);
      case BookmarkType.artifactPiece:
        return _buildTextWithUnBookmarkButton(tr.bookmarksPage.artifactPiece, ref);
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
