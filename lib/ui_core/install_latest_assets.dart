import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

import "../components/asset_update_progress_snack_bar.dart";
import "../core/asset_updater.dart";
import "../i18n/strings.g.dart";
import "../main.dart";
import "../providers/asset_updating_state.dart";
import "../routes.dart";
import "snack_bar.dart";

Future<void> installLatestAssets({
  required BuildContext context,
  required WidgetRef ref,
  required AssetUpdater updater,
}) async {
  final messenger = ScaffoldMessenger.of(context);

  // show progress snack bar
  messenger.showSnackBar(
    const SnackBar(
      content: AssetUpdateProgressSnackBar(),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.none,
      duration: Duration(minutes: 1),
    ),
  );

  final updatingState = ref.read(assetUpdatingStateNotifierProvider.notifier);

  try {
    // execute update
    await updatingState.executeUpdate(updater);

    // hide progress snack bar
    messenger.hideCurrentSnackBar();
    // Display a snack bar to indicate SUCCESS
    messenger.showSnackBar(
      createSnackBar(
        message: tr.updates.completed,
        action: SnackBarAction(
          label: tr.pages.releaseNotes,
          onPressed: () {
            routerContext?.go(const ReleaseNotesRoute(tabIndex: 1).location);
          },
        ),
      ),
    );
  } catch (e, st) {
    debugPrint(e.toString());
    debugPrintStack(stackTrace: st);

    // hide progress snack bar
    messenger.hideCurrentSnackBar();
    // Display a snack bar to indicate FAILURE
    messenger.showSnackBar(
      SnackBar(
        content: Text(tr.updates.failed),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
