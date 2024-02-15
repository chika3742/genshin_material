import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/asset_updater.dart";
import "versions.dart";

part "asset_updating_state.freezed.dart";
part "asset_updating_state.g.dart";

@Riverpod(keepAlive: true)
class AssetUpdatingStateNotifier extends _$AssetUpdatingStateNotifier {
  @override
  AssetUpdatingState build() {
    return const AssetUpdatingState(
      state: null,
    );
  }

  void startUpdate() {
    state = const AssetUpdatingState(
      state: AssetUpdateProgressState.downloading,
    );
  }

  Future<void> executeUpdate(AssetUpdater updater) async {
    if (state.state != null) {
      return; // Installation in progress
    }

    startUpdate();

    updater.onProgress = () {
      reflectUpdaterState(updater);
    };

    try {
      await updater.installUpdate();

      ref.invalidate(assetVersionDataProvider);
    } finally {
      completeUpdate();
    }
  }

  void reflectUpdaterState(AssetUpdater updater) {
    if (updater.state == AssetUpdateProgressState.downloading && updater.totalBytes != 0) {
      state = AssetUpdatingState(
        state: AssetUpdateProgressState.downloading,
        progress: updater.receivedBytes / updater.totalBytes,
        totalBytes: updater.totalBytes,
      );
    } else if (updater.state == AssetUpdateProgressState.installing) {
      state = const AssetUpdatingState(
        state: AssetUpdateProgressState.installing,
      );
    }
  }

  void completeUpdate() {
    state = const AssetUpdatingState(
      state: null,
    );
  }
}

@freezed
class AssetUpdatingState with _$AssetUpdatingState {
  /// If [state] is `null`, no installation process running.
  const factory AssetUpdatingState({
    required AssetUpdateProgressState? state,
    double? progress,
    int? totalBytes,
  }) = _AssetUpdatingState;
}
