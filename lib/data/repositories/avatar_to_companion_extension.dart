import "package:collection/collection.dart";
import "package:drift/drift.dart";

import "../../database.dart";
import "../../models/common.dart";
import "../models/hoyolab_api.dart";

extension AvatarToCompanionExtension on AvatarListResultItem {
  InGameCharacterStateCompanion toDbCompanion(String uid, DateTime lastUpdated) {
    return InGameCharacterStateCompanion.insert(
      characterId: id,
      elementId: elementAttrId,
      purposes: _toCharacterLevels(),
      weaponPurposes: { Purpose.ascension: weapon.currentLevel },
      uid: uid,
      equippedWeaponId: weapon.id,
      lastUpdated: Value(lastUpdated),
    );
  }

  Map<Purpose, int> _toCharacterLevels() {
    final result = <Purpose, int>{};

    result[Purpose.ascension] = currentLevel;

    final filteredSkills = skills
        .where((element) => element.maxLevel != 1); // exclude skills which cannot be leveled
    filteredSkills.forEachIndexed((index, element) {
      final purpose = switch (index) {
        0 => Purpose.normalAttack,
        1 => Purpose.elementalSkill,
        2 => Purpose.elementalBurst,
        _ => throw ArgumentError("Invalid talent index"),
      };
      result[purpose] = element.currentLevel;
    });

    return result;
  }
}
