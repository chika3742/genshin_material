import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_riverpod/experimental/mutation.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../data/repositories/single_character_state_repository.dart";
import "../i18n/strings.g.dart";
import "../ui_core/bubble.dart";
import "../ui_core/error_messages.dart";
import "../ui_core/snack_bar.dart";


class GameDataSyncIndicator extends HookWidget {
  final GameDataSyncStatus status;

  const GameDataSyncIndicator({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final iconKey = useMemoized(GlobalKey.new, [status]);

    useValueChanged<GameDataSyncStatus, void>(status, (_, _) {
      if (status is _Error) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showSnackBar(
            context: context,
            message: getErrorMessage((status as _Error).error, prefix: tr.hoyolab.failedToSyncGameData),
            error: true,
          );
        });
      }
    });

    return Row(
      mainAxisSize: MainAxisSize.min,
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
            child: status is _Syncing
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
      _Synced() => Symbols.check,
      _Error() => Symbols.error,
      _CharacterNotExists() => Symbols.person_alert,
      _MustBeResonatedWithStatue() => Symbols.warning,
      _WeaponNotEquipped() => Symbols.warning,
      _ => throw StateError("Invalid status: $status"),
    };
    return GestureDetector(
      onTap: () {
        final message = switch (status) {
          _Synced() => tr.hoyolab.charaSyncSuccess,
          _CharacterNotExists() => tr.hoyolab.characterDoesNotExist,
          _MustBeResonatedWithStatue() => tr.hoyolab.mustBeResonatedWithStatue,
          _WeaponNotEquipped() => tr.hoyolab.weaponNotEquipped,
          _Error(:final error) => getErrorMessage(error, prefix: tr.hoyolab.failedToSyncGameData),
          _ => throw StateError("Invalid status: $status"),
        };

        showModalBubbleText(
          context: context,
          targetKey: key,
          text: message,
          color: status is _Synced
              ? Theme.of(context).colorScheme.surfaceContainerHighest
              : Theme.of(context).colorScheme.errorContainer,
        );
      },
      child: Icon(icon, key: key, size: 22, color: Theme.of(context).colorScheme.primary),
    );
  }
}

sealed class GameDataSyncStatus {
  const GameDataSyncStatus._();

  const factory GameDataSyncStatus.syncing() = _Syncing;

  const factory GameDataSyncStatus.synced() = _Synced;

  const factory GameDataSyncStatus.error({
    required Object? error,
  }) = _Error;

  const factory GameDataSyncStatus.characterNotExists() = _CharacterNotExists;

  const factory GameDataSyncStatus.weaponNotEquipped() = _WeaponNotEquipped;

  const factory GameDataSyncStatus.mustBeResonatedWithStatue() = _MustBeResonatedWithStatue;

  static GameDataSyncStatus? fromCharacterFetch(MutationState<FetchResult> s) {
    return switch (s) {
      MutationIdle() => null,
      MutationPending() => const GameDataSyncStatus.syncing(),
      MutationError(:final error) => GameDataSyncStatus.error(error: error),
      MutationSuccess(value: FetchSuccess()) => const GameDataSyncStatus.synced(),
      MutationSuccess(value: FetchCharacterNotFound()) => const GameDataSyncStatus.characterNotExists(),
      MutationSuccess(value: FetchVariantInactive()) => const GameDataSyncStatus.mustBeResonatedWithStatue(),
    };
  }

  /// Merges the statuses of several sync sources into one for a single
  /// indicator.
  ///
  /// The most urgent status wins: syncing, then an error, then a warning about
  /// the character or weapon, then synced. `null` entries (sync disabled for
  /// that source) are ignored; the result is `null` only when every entry is.
  static GameDataSyncStatus? combine(Iterable<GameDataSyncStatus?> statuses) {
    return statuses.nonNulls
        .fold(null, (p, e) => p != null && _priority(p) <= _priority(e) ? p : e);
  }

  static int _priority(GameDataSyncStatus status) {
    return switch (status) {
      _Syncing() => 0,
      _Error() => 1,
      _CharacterNotExists() || _MustBeResonatedWithStatue() || _WeaponNotEquipped() => 2,
      _Synced() => 3,
    };
  }
}

class _Syncing extends GameDataSyncStatus {
  const _Syncing() : super._();
}

class _Synced extends GameDataSyncStatus {
  const _Synced() : super._();
}

class _Error extends GameDataSyncStatus {
  final Object? error;

  const _Error({
    required this.error,
  }) : super._();
}

class _CharacterNotExists extends GameDataSyncStatus {
  const _CharacterNotExists() : super._();
}

class _WeaponNotEquipped extends GameDataSyncStatus {
  const _WeaponNotEquipped() : super._();
}

class _MustBeResonatedWithStatue extends GameDataSyncStatus {
  const _MustBeResonatedWithStatue() : super._();
}
