import "package:flutter_riverpod/flutter_riverpod.dart";

import "../data/repositories/character_state_repository.dart";
import "../data/services/crashlytics_service.dart";
import "../i18n/strings.g.dart";
import "dialog.dart";

void showCharacterBulkSyncConfirmDialog(WidgetRef ref) {
  showSimpleDialog(
    context: ref.context,
    title: tr.characterBulkSync.confirmDialog.title,
    content: tr.characterBulkSync.confirmDialog.content(ttlMinutes: characterFetchAllCooldown.inMinutes),
    showCancel: true,
    onOkPressed: () {
      if (!ref.context.mounted) return;

      CharacterStateRepository.executeFetchAll(ref).catchError(
        ref.read(crashlyticsServiceProvider).logAndReport,
      );
    },
  );
}
