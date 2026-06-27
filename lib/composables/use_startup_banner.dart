import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../i18n/strings.g.dart";
import "../providers/banner_notifier.dart";

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
  // 依存配列を空にすることで、アプリ起動中にリモートコンフィグが更新されても
  // バナーの表示状態が変化しないようにしている（意図的な設計）。
  // バナーの表示内容の変更はアプリ再起動後に反映される。
  }, []);
}
