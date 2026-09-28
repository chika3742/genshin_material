import "package:clock/clock.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:material_symbols_icons/symbols.dart";

import "../core/pref_keys.dart";
import "../data/repositories/character_state_repository.dart";
import "../data/services/crashlytics_service.dart";
import "../i18n/strings.g.dart";
import "../providers/pref_notifier.dart";
import "../ui_core/character_bulk_sync_dialog.dart";
import "../ui_core/snack_bar.dart";

class CharacterBulkSyncButton extends ConsumerWidget {
  const CharacterBulkSyncButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchState = ref.watch(CharacterStateRepository.fetchAllMutation);
    final isAvailable = ref.watch(isFetchAllCharactersAvailableProvider);

    return GestureDetector(
      onTap: !isAvailable ? () {
        final lastRun = ref.read(prefProvider(PrefKeys.lastCharacterFetchAll))!;
        final unavailableFor = lastRun.add(characterFetchAllCooldown).difference(clock.now());
        final minutes = (unavailableFor.inMicroseconds / Duration.microsecondsPerMinute).ceil();
        showSnackBar(context: context, message: tr.characterBulkSync.tryAgainInMinutes(ttlMinutes: minutes));
      } : null,
      child: IconButton(
        icon: fetchState.isPending
            ? SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(strokeWidth: 2.5),
              )
            : Icon(Symbols.sync),
        tooltip: tr.hoyolab.characterBulkSync,
        onPressed: !fetchState.isPending && isAvailable ? () {
          showCharacterBulkSyncConfirmDialog(
            context,
            onConfirmed: () {
              CharacterStateRepository.executeFetchAll(ref).catchError(
                ref.read(crashlyticsServiceProvider).logAndReport,
              );
            },
          );
        } : null,
      ),
    );
  }
}
