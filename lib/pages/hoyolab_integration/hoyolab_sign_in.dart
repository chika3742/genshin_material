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

  @override
  void initState() {
    super.initState();

    const skipGameSelectScript = """
      let signInFormShown = false;
    
      (() => {
        const observer = new MutationObserver((mutations) => {
          const gameButton = document.querySelector("div.game-select-game__item:nth-child(1)")
          if (gameButton) {
            gameButton.click();
          }
          
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
            onPageStarted: (_) {
              setState(() {
                _isLoadingPage = true;
              });
            },
            onPageFinished: (url) {
              setState(() {
                _isLoadingPage = false;
              });

              if (Uri.parse(url).host == "m.hoyolab.com") {
                _controller.runJavaScript(skipGameSelectScript);
              }
            },
            onNavigationRequest: (request) {
              final uri = Uri.parse(request.url);
              if (uri.host == "m.hoyolab.com" || (uri.host == "account.hoyolab.com" && uri.path != "/single-page/cross-login.html")) {
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
        ..loadRequest(Uri.parse("https://m.hoyolab.com/#/"));
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
