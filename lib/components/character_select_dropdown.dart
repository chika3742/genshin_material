import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../core/asset_cache.dart";
import "../models/character.dart";
import "../models/common.dart";
import "../providers/versions.dart";

class CharacterSelectDropdown extends HookConsumerWidget {
  final CharacterId? value;
  final void Function(CharacterId? value) onChanged;
  final List<CharacterOrVariant> characters;
  final WeaponType? weaponTypeFilter;
  final String? label;

  const CharacterSelectDropdown({
    super.key,
    this.value,
    required this.onChanged,
    required this.characters,
    this.weaponTypeFilter,
    this.label,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ac = ref.watch(assetDataProvider);
    if (ac.value == null) {
      throw "Must be used within an DataAssetScope.";
    }

    return DropdownButtonFormField(
      value: value,
      items: [
        for (final character in characters)
          DropdownMenuItem(
            value: character.id,
            child: Row(
              children: [
                Image.file(
                  character.getSmallImageFile(ac.value!.assetDir),
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                Text(character.name.localized),
              ],
            ),
          ),
      ],
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
