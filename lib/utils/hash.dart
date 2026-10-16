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

String generateBookmarkGroupHash({
  required String characterId,
  required BookmarkType type,
  Purpose? purposeType,
  String? weaponId,
}) {
  // The trailing colon is a leftover of the removed artifact bookmark ID segment.
  // Keep it so that the hashes already stored in the database stay valid.
  return "$characterId:${type.name}:${purposeType?.name ?? ""}:${weaponId ?? ""}:";
}
