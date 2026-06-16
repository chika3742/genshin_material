import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../i18n/strings.g.dart";
import "../../models/bookmark.dart";
import "../../models/character.dart";
import "../../models/common.dart";
import "../../providers/versions.dart";
import "../../routes.dart";
import "item_link_button.dart";

class BookmarkPurposeHeader extends ConsumerWidget {
  const BookmarkPurposeHeader({super.key, required this.group});

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
          child: Image.file(assetData.characters[group.characterId]!.getSmallImageFile(assetData.assetDir), width: 35, height: 35),
        ),
        const Spacer(),
        _GroupTypeText(group),
        if (group.type == BookmarkType.material)
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: "Lv.", style: TextStyle(fontSize: 18)),
                TextSpan(text: group.levelRange!.start.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                const WidgetSpan(
                  child: Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Icon(Symbols.double_arrow),
                  ),
                  alignment: PlaceholderAlignment.middle,
                ),
                TextSpan(text: group.levelRange!.end.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            style: GoogleFonts.titilliumWeb(fontSize: 24),
          ),
      ],
    );
  }
}

class _GroupTypeText extends HookConsumerWidget {
  final BookmarkGroup group;

  const _GroupTypeText(this.group);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetDataAsync = ref.watch(assetDataProvider);
    assert(assetDataAsync.value != null, "Must be used in a DataAssetScope");

    final assetData = assetDataAsync.value!;

    final first = group.bookmarks.first as BookmarkWithMaterialDetails;
    if (first.group.weaponId == null) {
      final purposeType = first.group.purposeType;
      return switch (purposeType) {
        Purpose.ascension => _buildText(tr.bookmarksPage.character),
        Purpose.normalAttack || Purpose.elementalSkill || Purpose.elementalBurst => _buildText(tr.talentTypes[purposeType.name]!),
      };
    } else {
      final weapon = assetData.weapons[first.group.weaponId]!;
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
            Image.file(weapon.getImageFile(assetData.assetDir), width: 35, height: 35),
          ],
        ),
      );
    }
  }

  Widget _buildText(String text) {
    final context = useContext();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium!),
    );
  }
}
