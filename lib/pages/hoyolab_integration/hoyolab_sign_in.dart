import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:webview_flutter/webview_flutter.dart";

import "../../i18n/strings.g.dart";
import "../../pigeon.g.dart";
import "../../ui_core/snack_bar.dart";

class HoyolabSignInPage extends StatefulWidget {
  const HoyolabSignInPage({super.key});

  @override
  State<HoyolabSignInPage> createState() => _HoyolabSignInPageState();
}

class _HoyolabSignInPageState extends State<HoyolabSignInPage> {
  final _controller = WebViewController();

  bool _isLoadingPage = true;

  static const _hoyolabHosts = [
    "m.hoyolab.com",
    "www.hoyolab.com",
  ];

  @override
  void initState() {
    super.initState();

    const loginObserverScript = """
      let signInFormShown = false;
    
      (() => {
        const observer = new MutationObserver((mutations) => {
          const signInForm = document.querySelector("#hyv-account-frame");
          if (signInForm !== null && !signInFormShown) {
            signInFormShown = true;
          } else if (signInForm === null && signInFormShown) {
            if (document.cookie.includes("; ltuid_v2=")) {
              webViewMessenger.postMessage("tokenReceived");
            } else {
              webViewMessenger.postMessage("signInFormClosed");
            }
            observer.disconnect();
          }
        });
        
        observer.observe(document.body, {
          childList: true,
          subtree: true,
        });
      })();
    """;

    final skipDialogScript = """
      if (location.href.startsWith("https://m.hoyolab.com/") || location.href.startsWith("https://www.hoyolab.com/")) {
        localStorage.setItem("bbs_interest_saved", '{"timestamp":${DateTime.now().millisecondsSinceEpoch},"value":"1632380230"}')
        localStorage.setItem("guide_download_app_dialog", '{"timestamp":${DateTime.now().millisecondsSinceEpoch},"value":${DateTime.now().millisecondsSinceEpoch}}')
        true
      } else {
        false
      }
    """;

    WebViewCookieManager().clearCookies().then((_) {
      _controller
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..clearLocalStorage()
        ..clearCache()
        ..setOnConsoleMessage((message) {
          if (kDebugMode) {
            print("Console: ${message.message}");
          }
        })
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (url) {
              setState(() {
                _isLoadingPage = true;
              });

              () async {
                while (true) {
                  final result = await _controller.runJavaScriptReturningResult(skipDialogScript);
                  if (result == "true") {
                    break;
                  }
                  await Future.delayed(const Duration(milliseconds: 100));
                }
              }();
            },
            onPageFinished: (url) {
              setState(() {
                _isLoadingPage = false;
              });

              if (_hoyolabHosts.contains(Uri.parse(url).host)) {
                _controller.runJavaScript(loginObserverScript);
              }
            },
            onNavigationRequest: (request) {
              final uri = Uri.parse(request.url);
              if (_hoyolabHosts.contains(uri.host)
                  || (uri.host == "account.hoyolab.com" && uri.path != "/single-page/cross-login.html")) {
                return NavigationDecision.navigate;
              }

              return NavigationDecision.prevent;
            },
          ),
        )
        ..addJavaScriptChannel(
          "webViewMessenger",
          onMessageReceived: (message) async {
            if (message.message == "signInFormClosed") {
              Navigator.of(context).pop();
            }
            if (message.message == "tokenReceived") {
              HoyolabIntegrationApi().fetchCookie().then((cookie) {
                Navigator.of(context).pop(cookie);
              }).catchError((error) {
                showSnackBar(context: context, message: tr.hoyolab.failedToSignIn, error: true);
                debugPrint("Failed to sign in: $error");
                Navigator.of(context).pop();
              });
            }
          },
        )
        ..loadRequest(Uri.parse("https://m.hoyolab.com/#/circles/2/30/feed?page_type=feed"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.hoyolab.signIn),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(tr.hoyolab.signInNote),
          ),
          Expanded(
            child: Stack(
              children: [
                WebViewWidget(
                  controller: _controller,
                ),
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: _isLoadingPage ? 4 : 0),
                  curve: Easing.emphasizedDecelerate,
                  duration: Durations.medium3,
                  builder: (_, double height, __) {
                    return SizedBox(
                      height: height,
                      child: const LinearProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
