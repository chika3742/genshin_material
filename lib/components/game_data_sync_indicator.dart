import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../i18n/strings.g.dart";
import "../ui_core/bubble.dart";


class GameDataSyncIndicator extends HookWidget {
  final GameDataSyncStatus status;

  const GameDataSyncIndicator({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final iconKey = useMemoized(() => GlobalKey(), [status]);

    return Row(
      children: [
        Icon(Symbols.sync, size: 20, color: Theme.of(context).colorScheme.secondary),
        const SizedBox(width: 4),
        SizedBox(
          width: 22,
          height: 22,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Easing.standardDecelerate,
            switchOutCurve: Easing.standardAccelerate,
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              );
            },
            child: status == GameDataSyncStatus.syncing
                ? _buildProgressIndicator()
                : _buildStatusIcon(iconKey, context),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressIndicator() {
    return const Padding(
      padding: EdgeInsets.all(4.0),
      child: CircularProgressIndicator(
        strokeWidth: 2,
      ),
    );
  }

  Widget _buildStatusIcon(GlobalKey key, BuildContext context) {
    final icon = switch (status) {
      GameDataSyncStatus.synced => Symbols.check,
      GameDataSyncStatus.error => Symbols.error,
      GameDataSyncStatus.characterNotExists => Symbols.person_alert,
      GameDataSyncStatus.mustBeResonatedWithStatue => Symbols.warning,
      _ => throw "Invalid status: $status",
    };
    return GestureDetector(
      onTap: () {
        final message = switch (status) {
          GameDataSyncStatus.synced => tr.hoyolab.charaSyncSuccess,
          GameDataSyncStatus.characterNotExists => tr.hoyolab.characterDoesNotExist,
          GameDataSyncStatus.mustBeResonatedWithStatue => tr.hoyolab.mustBeResonatedWithStatue,
          _ => tr.hoyolab.failedToSyncGameData,
        };

        showModalBubbleText(
          context: context,
          targetKey: key,
          text: message,
          color: status == GameDataSyncStatus.synced
              ? Theme.of(context).colorScheme.surfaceContainerHighest
              : Theme.of(context).colorScheme.errorContainer,
        );
      },
      child: Icon(icon, key: key, size: 22, color: Theme.of(context).colorScheme.primary),
    );
  }
}

enum GameDataSyncStatus {
  syncing,
  synced,
  error,
  characterNotExists,
  mustBeResonatedWithStatue,
}
