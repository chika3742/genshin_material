import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod/misc.dart";
import "package:genshin_material/core/remote_config_keys.dart";
import "package:material_ui/material_ui.dart";

import "../utils/in_memory_pref.dart";
import "../utils/remote_config.dart";

Widget createScreenWithApp({ThemeData? theme, required Widget child}) {
  return MaterialApp(
    theme: theme,
    home: child,
  );
}

Widget createProviderScope({
  bool hoyolabLinkEnabled = true,
  List<Override> overrides = const [],
  required Widget child,
}) {
  return ProviderScope(
    overrides: [
      overridePrefDefaults(),
      overrideRemoteConfig(RemoteConfigKeys.hoyolabLinkEnabled, hoyolabLinkEnabled),
      ...overrides,
    ],
    retry: (_, _) => null,
    child: child,
  );
}
