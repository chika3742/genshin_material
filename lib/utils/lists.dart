import "dart:collection";

import "package:collection/collection.dart";

import "../components/level_slider.dart";
import "../models/common.dart";
import "../models/weapon.dart";

extension WeaponListExtension on List<Weapon> {
  List<Weapon> sortedDescendingByRarity() {
    return groupListsBy((e) => e.rarity).entries
        .sorted((a, b) => b.key.compareTo(a.key))
        .map((e) => e.value)
        .flattenedToList;
  }

  Map<WeaponType, List<Weapon>> groupByType(List<WeaponType> weaponTypes) {
    return SplayTreeMap.from(groupListsBy((e) => e.type), (a, b) => weaponTypes.indexOf(a) - weaponTypes.indexOf(b));
  }
}

extension MapExtension<T> on Map<int, T> {
  Iterable<R> mapInLevelRange<R>(LevelRangeValues range, R Function(int key, T value) callback) {
    return entries
        .where((e) => e.key > range.start && e.key <= range.end)
        .map((e) => callback(e.key, e.value));
  }
}

extension IndexOfCeilToNearestExtension on List<int> {
  int indexOfCeilToNearest(int target) {
    return indexWhere((e) => e >= target);
  }
}

/// A list wrapper that provides deep equal operators for lists of type [T].
///
/// This class is used for parameters passed to Providers that require a
/// consistent == operator.
class EqualityList<T> extends ListMixin<T> {
  static const _listEquality = ListEquality();

  final List<T> _list;

  EqualityList(this._list);

  @override
  bool operator ==(Object other) {
    if (other is! EqualityList<T>) return false;
    return _listEquality.equals(_list, other._list);
  }

  @override
  int get hashCode => _listEquality.hash(_list);

  @override
  int get length => _list.length;

  @override
  set length(int newLength) {
    _list.length = newLength;
  }

  @override
  T operator [](int index) => _list[index];

  @override
  void operator []=(int index, T value) => _list[index] = value;
}
