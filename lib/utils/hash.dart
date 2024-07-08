import "../models/common.dart";

String combineMaterialBookmarkElements(
  String characterId,
  Purpose purposeType,
  String? weaponId,
  String? materialId,
  int level,
) {
  return "${materialId ?? ""}:$characterId:$purposeType:${weaponId ?? ""}:$level";
}
