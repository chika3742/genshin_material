import "package:url_launcher/url_launcher.dart";

void launchCustomTab(String url) {
  launchUrl(
    Uri.parse(url),
    browserConfiguration: const BrowserConfiguration(
      showTitle: true,
    ),
    mode: LaunchMode.platformDefault,
  );
}
