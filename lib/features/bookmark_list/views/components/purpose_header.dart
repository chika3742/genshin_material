import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../../models/bookmark.dart";
import "../../../../models/character.dart";
import "../../../../models/common.dart";
import "../../../../providers/versions.dart";
import "../../../../routes.dart";
import "group_type_text.dart";
import "item_link_button.dart";

/// Header widget for a bookmark group showing character image and type
class PurposeHeader extends ConsumerWidget {
  const PurposeHeader({super.key, required this.group});

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
              assetData.characters[group.characterId]!
                  .getSmallImageFile(assetData.assetDir),
              width: 35,
              height: 35),
        ),
        const Spacer(),
        GroupTypeText(group),
        if (group.type == BookmarkType.material)
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: "Lv.", style: TextStyle(fontSize: 18)),
                TextSpan(
                    text: group.levelRange!.start.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const WidgetSpan(
                  child: Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Icon(Symbols.double_arrow),
                  ),
                  alignment: PlaceholderAlignment.middle,
                ),
                TextSpan(
                    text: group.levelRange!.end.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            style: GoogleFonts.titilliumWeb(fontSize: 24),
          ),
      ],
    );
  }
}
