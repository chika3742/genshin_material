import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod/misc.dart";
import "package:material_ui/material_ui.dart";

Widget createScreenWithApp({ThemeData? theme, required Widget child}) {
  return MaterialApp(
    theme: theme,
    home: child,
  );
}

Widget createProviderScope({List<Override> overrides = const [], required Widget child}) {
  return ProviderScope(
    overrides: overrides,
    retry: (_, _) => null,
    child: child,
  );
}
