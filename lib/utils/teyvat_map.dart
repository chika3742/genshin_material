
import "../constants/urls.dart";
import "../i18n/strings.g.dart";
import "../ui_core/custom_tabs.dart";

const teleportPointTypes = ["2", "3", "154", "319", "338"];

void openTeyvatMap(String typeId, {String? initialPosition}) {
  var url = Uri.parse(teyvatMapUrl);
  final params = {
    "shown_types": [...teleportPointTypes, typeId].join(","),
    "zoom": "-0.50",
    if (initialPosition != null) "center": initialPosition,
  };
  url = url.replace(
    queryParameters: {
      "lang": LocaleSettings.currentLocale.languageCode == "ja" ? "ja-jp" : "en-us",
    },
    fragment: "${url.fragment}?${params.entries.map((e) => "${e.key}=${e.value}").join("&")}",
  );

  launchCustomTab(url.toString());
}
