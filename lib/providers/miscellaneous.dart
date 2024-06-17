import "package:riverpod_annotation/riverpod_annotation.dart";

import "../core/hoyolab_api.dart";
import "preferences.dart";

part "miscellaneous.g.dart";

@riverpod
class CharaAccessPermissionState extends _$CharaAccessPermissionState {
  @override
  Future<bool> build() async {
    final cookie = ref.watch(preferencesStateNotifierProvider.select((it) => it.value?.cookie));
    if (cookie == null || cookie.isEmpty) {
      return false;
    }

    final api = HoyolabApi(cookie: cookie);
    final result = await api.getAvatarAuthInfo();
    return result.avatarAuth == 1;
  }

  Future<void> updateValue(bool value) async {
    state = const AsyncLoading();
    final cookie = ref.read(preferencesStateNotifierProvider).value?.cookie;
    await HoyolabApi(cookie: cookie).setAvatarAuth(value ? 1 : 0);

    ref.invalidateSelf();
  }
}
