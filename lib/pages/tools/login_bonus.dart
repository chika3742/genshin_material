import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:webview_flutter/webview_flutter.dart";

import "../../components/center_text.dart";
import "../../data/repositories/hoyolab_cookie_repository.dart";
import "../../data/services/launch_url.dart";
import "../../i18n/strings.g.dart";
import "../../pigeon.g.dart";

class LoginBonusPage extends HookConsumerWidget {
  const LoginBonusPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cookie = ref.watch(hoyolabCookieRepositoryProvider);

    final controller = useMemoized(WebViewController.new);
    Future<void> initWebView(String cookie) async {
      await WebViewCookieManager().clearCookies();
      await HoyolabIntegrationApi().setCookies(_parseCookies(cookie));
      await controller.setJavaScriptMode(.unrestricted);
      await controller.setNavigationDelegate(NavigationDelegate(
        onNavigationRequest: (request) {
          if (request.url.startsWith("https://act.hoyolab.com/ys/event/signin-sea-v3/index.html")) {
            return .navigate;
          }
          ref.read(launchUrlStringProvider)(request.url);
          return .prevent;
        },
      ));
      final lang = switch (LocaleSettings.instance.currentLocale) {
        .ja => "ja-jp",
        .en => "en-us",
      };
      await controller.loadRequest(Uri.parse("https://act.hoyolab.com/ys/event/signin-sea-v3/index.html?act_id=e202102251931481&hyl_auth_required=true&hyl_presentation_style=fullscreen&lang=$lang"));
    }

    useEffect(() {
      if (cookie case AsyncData(value: final cookie?)) {
        initWebView(cookie);
      }
      return null;
    }, [cookie]);

    Widget buildBody() {
      if (cookie is AsyncLoading) {
        return SizedBox.shrink();
      }
      if (cookie is AsyncError) {
        return CenterText(tr.errors.failedToObtainHylCredential);
      }
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(tr.tools.loginBonusLogoutWarning),
          ),
          Expanded(
            child: WebViewWidget(
              controller: controller,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.loginBonus),
      ),
      body: buildBody(),
    );
  }
}

List<CookieEntry> _parseCookies(String cookie) {
  const secureKeys = [
    "account_id_v2",
    "account_mid_v2",
    "cookie_token_v2",
    "ltmid_v2",
    "ltuid_v2",
    "ltoken_v2",
  ];
  const httpOnlyKeys = [
    "cookie_token_v2",
    "ltoken_v2",
  ];

  final entries = cookie.split(";").map((e) => e.trim());
  return entries.map((rawEntry) {
    final separatorIndex = rawEntry.indexOf("=");
    if (separatorIndex < 0) {
      return CookieEntry(
        key: "",
        value: "",
        domain: "",
        secure: false,
        httpOnly: false,
      );
    }
    final key = rawEntry.substring(0, separatorIndex);
    final value = rawEntry.substring(separatorIndex + 1);
    return CookieEntry(
      key: key,
      value: value,
      domain: ".hoyolab.com",
      secure: secureKeys.contains(key),
      httpOnly: httpOnlyKeys.contains(key),
    );
  }).toList();
}
