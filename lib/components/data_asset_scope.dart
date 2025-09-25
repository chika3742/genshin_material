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
  final Widget Function(BuildContext context, AssetData assetData) builder;
  /// If true, wraps **loading indicator or error message** with a [Scaffold].
  final bool useScaffold;

  const DataAssetScope({super.key, required this.builder, required this.useScaffold});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider);
    final updatingState = ref.watch(assetUpdatingStateProvider);

    if (assetData is AsyncData) {
      // Valid assets present
      return builder(context, assetData.value!);
    }
    if (updatingState.state.isUpdating) {
      // No installed assets present and installation process running
      return _wrapWithScaffoldIfNeeded(CenterText(tr.updates.pleaseWaitUntilComplete));
    }
    if (assetData.isLoading) {
      // Asset version is loading
      return _wrapWithScaffoldIfNeeded(const Center(
        child: CircularProgressIndicator(),
      ),);
    }

    // Asset installation failed
    return _wrapWithScaffoldIfNeeded(CenterText(tr.updates.failedToLoad));
  }

  Widget _wrapWithScaffoldIfNeeded(Widget child) {
    if (useScaffold) {
      return Scaffold(
        appBar: AppBar(),
        body: child,
      );
    } else {
      return child;
    }
  }
}
