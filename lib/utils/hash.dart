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

/// [bookmarkId] is required only if [type] is [BookmarkType.artifactPiece] or [BookmarkType.artifactSet].
String generateBookmarkGroupHash({
  required String characterId,
  required BookmarkType type,
  Purpose? purposeType,
  String? weaponId,
  int? bookmarkId,
}) {
  return "$characterId:${type.name}:${purposeType?.name ?? ""}:${weaponId ?? ""}:${bookmarkId ?? ""}";
}
