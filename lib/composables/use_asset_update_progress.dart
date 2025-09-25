
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../components/asset_update_progress_snack_bar.dart";
import "../core/asset_updater.dart";
import "../i18n/strings.g.dart";
import "../providers/asset_updating_state.dart";
import "../ui_core/error_messages.dart";
import "../ui_core/snack_bar.dart";

void useAssetUpdateProgress(WidgetRef ref) {
  final context = useContext();
  final scfMessenger = ScaffoldMessenger.of(context);

  ref.listen(assetUpdatingStateProvider.select((e) => e.state), (previous, current) {
    // show snackbar when update starts
    if (!previous!.isUpdating && current.isUpdating) {
      scfMessenger.clearSnackBars();
      scfMessenger.showSnackBar(
        const SnackBar(
          content: AssetUpdateProgressSnackBar(),
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.none,
          duration: Duration(minutes: 999),
        ),
      );
    }
    if (current == AssetUpdateProgressState.noUpdateAvailable) {
      showSnackBar(
        context: context,
        message: tr.updates.noUpdateAvailable,
      );
    }
    if (current == AssetUpdateProgressState.updated) {
      showSnackBar(
        context: context,
        message: tr.updates.completed,
      );
    }

    if (current.hasError) {
      final error = ref.read(assetUpdatingStateProvider).error;

      if (error != null) {
        showSnackBar(
          context: context,
          message: getErrorMessage(error, prefix: switch (current) {
            AssetUpdateProgressState.errorWhileChecking => tr.updates.failedToCheck,
            AssetUpdateProgressState.errorWhileDownloading => tr.updates.failedToDownload,
            AssetUpdateProgressState.errorWhileInstalling => tr.updates.failedToInstall,
            _ => "",
          }),
          error: true,
        );
      }
    }
  });
}
