import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_riverpod/experimental/mutation.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../data/repositories/character_state_repository.dart";
import "../i18n/strings.g.dart";
import "../ui_core/error_messages.dart";
import "../ui_core/snack_bar.dart";

void useCharacterBulkSyncResult(WidgetRef ref) {
  final context = useContext();

  ref.listen(CharacterStateRepository.fetchAllMutation, (_, next) {
    if (next is MutationSuccess) {
      showSnackBar(context: context, message: tr.characterBulkSync.completed);
    }
    if (next case MutationError(:final error)) {
      showSnackBar(
        context: context,
        message: getErrorMessage(error, prefix: tr.characterBulkSync.failed),
        error: true,
      );
    }
  });
}
