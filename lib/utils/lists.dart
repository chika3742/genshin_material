import "package:collection/collection.dart";

import "../components/level_slider.dart";
import "../models/common.dart";
import "../models/weapon.dart";

extension WeaponListExtension on List<Weapon> {
  List<Weapon> sortedDescendingByRarity() {
    return sorted((a, b) => b.rarity.compareTo(a.rarity));
  }

  Map<WeaponType, List<Weapon>> groupByType() {
    return groupListsBy((e) => e.type);
  }
}

extension MapExtension<T> on Map<int, T> {
  Iterable<R> mapInLevelRange<R>(LevelRangeValues range, R Function(int key, T value) callback) {
    return entries
        .where((e) => e.key > range.start && e.key <= range.end)
        .map((e) => callback(e.key, e.value));
  }
}
