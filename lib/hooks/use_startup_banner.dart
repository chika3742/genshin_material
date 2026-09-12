import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../i18n/strings.g.dart";
import "../models/banner_data.dart";

void useStartupBanner(BannerData? banner, {
  required void Function(String url) launchUrlString,
  required void Function() markAsRead,
}) {
  final context = useContext();
  useEffect(() {
    if (banner == null) {
      return null;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final scfMessenger = ScaffoldMessenger.of(context);
      scfMessenger.showMaterialBanner(MaterialBanner(
        key: UniqueKey(),
        content: Text(banner.text),
        actions: [
          TextButton(
            onPressed: () {
              launchUrlString(banner.actionUrl);
            },
            child: Text(banner.actionText),
          ),
          TextButton(
            onPressed: () {
              markAsRead();
              scfMessenger.hideCurrentMaterialBanner();
            },
            child: Text(tr.common.dismiss),
          ),
        ],
      ));
    });

    return null;
  // Intentionally empty dependency array: a Remote Config push must not swap
  // the text under a banner the user is already looking at. It pins this
  // MaterialBanner only — the pushed values are live everywhere else, and take
  // effect here on the next launch.
  }, []);
}
