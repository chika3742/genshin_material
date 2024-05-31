import "../database.dart";
import "../models/common.dart";

String combineMaterialBookmarkElements(
  String characterId,
  Purpose purposeType,
  MaterialBookmarkType bookmarkType,
  String? materialId,
  int level,
) {
  return "${materialId ?? ""}:$characterId:$purposeType:$bookmarkType:$level}";
}
