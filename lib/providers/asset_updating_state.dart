
import "dart:developer";

import "package:freezed_annotation/freezed_annotation.dart";
import "package:path_provider/path_provider.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/asset_updater.dart";
import "versions.dart";

part "asset_updating_state.freezed.dart";
part "asset_updating_state.g.dart";

@Riverpod(keepAlive: true)
class AssetUpdatingStateNotifier extends _$AssetUpdatingStateNotifier {
  @override
  AssetUpdatingState build() {
    return const AssetUpdatingState();
  }

  Future<void> checkForUpdate({bool silent = true, bool force = false}) async {
    if (state.state.isBusy) {
      throw StateError("A process is already in progress");
    }

    _updateState(AssetUpdateProgressState.checkingForUpdate);

    final updater = AssetUpdater(
      assetDir: (await getLocalAssetDirectory()).path,
      tempDir: (await getTemporaryDirectory()).path,
    );

    try {
      await updater.checkForUpdate(force: force);
    } catch (e, st) {
      _setError(e, st);
      _updateState(AssetUpdateProgressState.errorWhileChecking);
      return;
    }

    if (updater.isUpdateAvailable) {
      await _executeUpdate(updater);
    } else {
      _updateState(silent ? AssetUpdateProgressState.none : AssetUpdateProgressState.noUpdateAvailable);
    }
  }

  Future<void> _executeUpdate(AssetUpdater updater) async {
    if (state.state.isUpdating) {
      throw StateError("An update is already in progress");
    }

    log("Installing update: D${updater.foundUpdate!.dataVersion}");

    _updateState(AssetUpdateProgressState.downloading);

    updater.onProgress = () {
      _propagateUpdaterState(updater);
    };

    try {
      await updater.downloadUpdate();
    } catch (e, st) {
      _setError(e, st);
      _updateState(AssetUpdateProgressState.errorWhileDownloading);
      return;
    }

    _updateState(AssetUpdateProgressState.installing);

    try {
      await updater.installUpdate();
    } catch (e, st) {
      _setError(e, st);
      _updateState(AssetUpdateProgressState.errorWhileInstalling);
      return;
    }

    ref.invalidate(assetDataProvider);

    _updateState(AssetUpdateProgressState.updated);
  }

  void _updateState(AssetUpdateProgressState state) {
    if (this.state.state != state) {
      this.state = this.state.copyWith(state: state);
    }
  }

  void _propagateUpdaterState(AssetUpdater updater) {
    state = state.copyWith(
      progress: updater.receivedBytes / updater.totalBytes,
      totalBytes: updater.totalBytes,
    );
  }

  void _setError(Object error, StackTrace st) {
    state = state.copyWith(error: error);
    log("An error occurred while updating assets", error: error, stackTrace: st);
  }
}

@Freezed(copyWith: true)
class AssetUpdatingState with _$AssetUpdatingState {
  const factory AssetUpdatingState({
    @Default(AssetUpdateProgressState.none) AssetUpdateProgressState state,
    double? progress,
    int? totalBytes,
    Object? error,
  }) = _AssetUpdatingState;
}
