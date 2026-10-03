import "../models/common.dart";
import "../models/pref_key.dart";
import "../providers/filter_state.dart";

abstract final class PrefKeys {
  static const resin = NullableIntPrefKey("resin");
  static const resinBaseTime = DateTimeIsoPrefKey("resinBaseTime");
  // The four HoYoLAB identity keys below are written and read as a unit.
  // Access them only through `HoyolabGameServer`, which owns their consistency.
  static const hyvServer = NullableStringPrefKey("hyvServer");
  static const hyvServerName = NullableStringPrefKey("hyvServerName");
  static const hyvUserName = NullableStringPrefKey("hyvUserName");
  static const hyvUid = NullableStringPrefKey("hyvUid");
  static const syncResin = BooleanPrefKey("syncResin", true);
  static const syncCharaState = BooleanPrefKey("syncCharaState", true);
  static const autoRemoveBookmarks = BooleanPrefKey("autoRemoveBookmarks", true);
  static const syncBagLackNums = BooleanPrefKey("syncBagLackNums", true);
  static const showItemNameOnCard = BooleanPrefKey("showItemNameOnCard", true);
  static const indexSheetTutorialShown = BooleanPrefKey("indexSheetTutorialShown", false);
  static const bannerReadKeys = StringListPrefKey("bannerReadKeys", []);
  static const adventureRank = IntPrefKey("adventureRank", 60);
  static const condensedMultiplier = DoublePrefKey("condensedMultiplier", 2.0);
  static const showFarmCount = BooleanPrefKey("showFarmCount", true);
  static const dailyResetServer = EnumPrefKey("dailyResetServer", GameServer.values, GameServer.asia);
  static const characterSortType = EnumPrefKey("characterSortType", CharacterSortType.values);
  static const characterSortMode = EnumPrefKey("characterSortMode", SortMode.values, SortMode.ascending);
  static const weaponSortType = EnumPrefKey("weaponSortType", WeaponSortType.values);
  static const dailyMaterialNotificationTime = TimeOfDayPrefKey("dailyMaterialNotificationTime");
  static const lastCharacterFetchAll = DateTimeIsoPrefKey("lastCharacterFetchAll");
  static const lastSelectedCharacterVariants = VariantIdMapPrefKey("lastSelectedCharacterVariants");
  // format: <HoYoLAB account ID (ltuid)>;<expires at (ISO8601 UTC)>;<last value>
  // This key should be accessed through loginBonusStateProvider.
  static const lastLoginBonusStateSynced = NullableStringPrefKey("lastLoginBonusStateSynced");
}
