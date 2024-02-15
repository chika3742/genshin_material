import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../i18n/strings.g.dart";
import "../providers/asset_updating_state.dart";
import "../providers/versions.dart";
import "center_text.dart";

/// Shows [CircularProgressIndicator] during loading asset,
/// and then shows [builder] widget.
class DataAssetScope extends ConsumerWidget {
  final Widget child;

  const DataAssetScope({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetVersion = ref.watch(assetVersionDataProvider);
    final updatingState = ref.watch(assetUpdatingStateNotifierProvider);

    if (assetVersion.value != null) {
      // Valid assets present
      return child;
    }
    if (updatingState.state != null) {
      // No installed assets present and installation process running
      return CenterText(tr.updates.pleaseWaitUntilComplete);
    }
    if (assetVersion.isLoading) {
      // Asset version is loading
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // Asset installation failed
    return CenterText(tr.updates.failed);
  }
}
