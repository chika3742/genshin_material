import "package:collection/collection.dart";

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
