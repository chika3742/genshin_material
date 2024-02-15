import "package:freezed_annotation/freezed_annotation.dart";
import "package:genshin_material/core/asset_updater.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

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

  void setState(AssetUpdatingState state) {
    this.state = state;
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
