import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../core/asset_updater.dart";
import "../i18n/strings.g.dart";
import "../providers/asset_updating_state.dart";

class AssetUpdateProgressSnackBar extends ConsumerWidget {
  const AssetUpdateProgressSnackBar({super.key});

  static final stateTexts = {
    AssetUpdateProgressState.downloading: tr.updates.downloading,
    AssetUpdateProgressState.installing: tr.updates.installing,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(assetUpdatingStateNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(stateTexts[state.state] ?? ""),
        Text(_buildProgressString(state), textAlign: TextAlign.end),
        const SizedBox(height: 8),
        ProgressIndicatorTheme(
          data: ProgressIndicatorThemeData(
            color: Theme.of(context).colorScheme.inversePrimary,
            linearTrackColor: Theme.of(context).colorScheme.primary,
          ),
          child: LinearProgressIndicator(
            value: state.progress,
          ),
        ),
      ],
    );
  }

  String _buildProgressString(AssetUpdatingState state) {
    final strings = <String>[];

    if (state.progress != null) {
      strings.add("${(state.progress! * 100).toStringAsFixed(2)}%");
    }
    if (state.totalBytes != null) {
      strings.add("${(state.totalBytes! / 1024 / 1024).toStringAsFixed(2)} MB");
    }

    if (strings.isEmpty) {
      return "";
    }

    return "(${strings.join(" / ")})";
  }
}
