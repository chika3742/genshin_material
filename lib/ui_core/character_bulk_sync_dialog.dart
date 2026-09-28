import "package:flutter/widgets.dart";

import "../data/repositories/character_state_repository.dart";
import "../i18n/strings.g.dart";
import "dialog.dart";

void showCharacterBulkSyncConfirmDialog(BuildContext context, {required void Function() onConfirmed}) {
  showSimpleDialog(
    context: context,
    title: tr.characterBulkSync.confirmDialog.title,
    content: tr.characterBulkSync.confirmDialog.content(ttlMinutes: characterFetchAllCooldown.inMinutes),
    showCancel: true,
    onOkPressed: onConfirmed,
  );
}
