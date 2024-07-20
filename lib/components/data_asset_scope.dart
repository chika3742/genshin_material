import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../core/asset_cache.dart";
import "../i18n/strings.g.dart";
import "../providers/asset_updating_state.dart";
import "../providers/versions.dart";
import "center_text.dart";

/// Shows [CircularProgressIndicator] during loading asset,
/// and then shows [builder] widget.
class DataAssetScope extends ConsumerWidget {
  final Widget Function(AssetData assetData, String assetDir) builder;
  final bool wrapCenterTextWithScaffold;

  const DataAssetScope({super.key, required this.builder, this.wrapCenterTextWithScaffold = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider);
    final updatingState = ref.watch(assetUpdatingStateNotifierProvider);

    if (assetData is AsyncData && assetData.value?.data != null) {
      // Valid assets present
      return builder(assetData.value!.data!, assetData.value!.assetDir);
    }
    if (updatingState.state != null) {
      // No installed assets present and installation process running
      return _wrapWithScaffold(CenterText(tr.updates.pleaseWaitUntilComplete));
    }
    if (assetData.isLoading) {
      // Asset version is loading
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // Asset installation failed
    return _wrapWithScaffold(CenterText(tr.updates.failedToLoad));
  }

  Widget _wrapWithScaffold(Widget child) {
    if (wrapCenterTextWithScaffold) {
      return Scaffold(
        appBar: AppBar(),
        body: child,
      );
    } else {
      return child;
    }
  }
}
