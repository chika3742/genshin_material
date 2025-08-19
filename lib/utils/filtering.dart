import "package:collection/collection.dart";

import "../models/character.dart";
import "../models/common.dart";

Iterable<CharacterOrVariant> filterCharactersByWeaponType(Iterable<Character> characters, WeaponType? weaponType) {
  return characters.where(
        (e) =>
            e is CharacterOrVariant &&
            (weaponType == null || e.weaponType == weaponType),
      ).cast();
}

List<T> filterBySearchQuery<T extends Searchable>(Iterable<T> items, String query) {
  if (query.isEmpty) return [];

  final nQuery = normalizeForSearch(query);
  return items.where((item) {
    return normalizeForSearch(item.name.localized).contains(nQuery) ||
        item.jaPronunciation.contains(nQuery);
  }).sorted((a, b) {
    return (normalizeForSearch(a.name.localized).startsWith(nQuery) ? 0 : 1)
        - (normalizeForSearch(b.name.localized).startsWith(nQuery) ? 0 : 1);
  }).toList();
}

String normalizeForSearch(String input) {
  return input.toLowerCase().toKatakana();
}

extension _HiraganaToKatakanaExtension on String {
  String toKatakana() {
    return replaceAllMapped(RegExp("[\u3041-\u3094]"), (m) {
      return String.fromCharCode(m.group(0)!.codeUnitAt(0) + 0x60);
    });
  }
}
