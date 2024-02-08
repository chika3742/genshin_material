import "package:flutter_custom_tabs/flutter_custom_tabs.dart";

void launchCustomTab(String url) {
  launchUrl(
    Uri.parse(url),
    customTabsOptions: const CustomTabsOptions(
      showTitle: true,
      shareState: CustomTabsShareState.off,
    ),
    safariVCOptions: const SafariViewControllerOptions.pageSheet(
      configuration: SheetPresentationControllerConfiguration(
        detents: {SheetPresentationControllerDetent.large},
      ),
    ),
  );
}
