import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";
import "package:url_launcher/url_launcher_string.dart";

import "../../components/list_tile.dart";
import "../../constants/urls.dart";
import "../../core/remote_config_keys.dart";
import "../../data/repositories/hoyolab_cookie_repository.dart";
import "../../i18n/strings.g.dart";
import "../../models/hoyolab_api.dart";
import "../../providers/hoyolab_api.dart";
import "../../providers/remote_config.dart";
import "../../routes.dart";
import "../../ui_core/error_messages.dart";

class ToolsPage extends HookConsumerWidget {
  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cookie = ref.watch(hoyolabCookieRepositoryProvider);
    final (signState, refreshSignState) = _useLoginBonusState(ref);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.tools),
      ),
      body: ListView(
        children: [
          SimpleListTile(
            leadingIcon: Symbols.diamond,
            title: tr.pages.resinCalc,
            location: ResinCalcRoute().location,
          ),
          SimpleListTile(
            leadingIcon: Symbols.history,
            title: tr.pages.wishes,
            trailingIcon: Symbols.open_in_new,
            onTap: () {
              launchUrlString(wishesPageUrl, mode: LaunchMode.externalApplication);
            },
          ),
          if (cookie case AsyncData(:final value) when value != null
              && ref.watch(remoteConfigProvider(RemoteConfigKeys.hoyolabLinkEnabled)))
            SimpleListTile(
              leading: Badge(
                smallSize: 8,
                isLabelVisible: signState.data?.isSign == false,
                child: Icon(Symbols.crown),
              ),
              trailingIcon: Symbols.chevron_right,
              title: switch (signState.connectionState) {
                .active || .waiting => tr.tools.loginBonusLoading,
                .done when signState.hasError => getErrorMessage(signState.error, prefix: tr.errors.failedToFetchSignState),
                .done when signState.data!.isSign => tr.tools.loginBonusClaimed,
                _ => tr.tools.loginBonusUnclaimed,
              },
              onTap: () async {
                await LoginBonusRoute().push(context);
                refreshSignState();
              },
            ),
        ],
      ),
    );
  }
}

(AsyncSnapshot<SignInfo?>, void Function()) _useLoginBonusState(WidgetRef ref) {
  final cookie = ref.watch(hoyolabCookieRepositoryProvider);
  final lifecycle = useAppLifecycleState();
  final refreshCounter = useState(0);
  useValueChanged<AppLifecycleState?, void>(lifecycle, (_, _) {
    if (lifecycle == .resumed) {
      refreshCounter.value++;
    }
  });
  void refresh() {
    refreshCounter.value++;
  }
  final future = useMemoized(() async {
    if (cookie.value == null) {
      return null;
    }
    final api = await ref.watch(hoyolabAccountApiProvider.future);
    return await api.loginBonusStatus();
  }, [cookie.value, refreshCounter.value]);
  final snapshot = useFuture(future);
  return (snapshot, refresh);
}
