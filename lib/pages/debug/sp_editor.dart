import "package:material_ui/material_ui.dart";
import "package:flutter/services.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../../providers/pref_notifier.dart";

class SharedPreferencesEditorPage extends HookConsumerWidget {
  const SharedPreferencesEditorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sp = ref.watch(sharedPreferencesWithCacheProvider);
    final prefs = useState(_getPreferences(sp));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preferences Editor"),
      ),
      body: ListView(
        children: [
          for (final e in prefs.value.entries) ListTile(
            title: Text(e.key),
            subtitle: Text(e.value.toString()),
            trailing: PopupMenuButton(
              icon: const Icon(Symbols.more_horiz),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: const Text("Copy value"),
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: e.value.toString()));
                    },
                  ),
                  PopupMenuItem(
                    child: const Text("Edit value"),
                    onTap: () async {
                      final result = await showDialog<String>(
                        context: context,
                        builder: (_) => _ValueEditDialog(
                          initialValue: e.value.toString(),
                        ),
                      );
                      if (result == null) { return; }

                      if (e.value is String) {
                        sp.setString(e.key, result);
                      } else if (e.value is int) {
                        sp.setInt(e.key, int.parse(result));
                      } else if (e.value is double) {
                        sp.setDouble(e.key, double.parse(result));
                      } else if (e.value is bool) {
                        sp.setBool(e.key, bool.parse(result));
                      } else {
                        throw "Unsupported type: ${e.value.runtimeType}";
                      }

                      prefs.value = _getPreferences(sp);
                    },
                  ),
                  PopupMenuItem(
                    child: const Text("Delete"),
                    onTap: () {
                      sp.remove(e.key);
                      prefs.value = _getPreferences(sp);
                    },
                  ),
                ];
              },
            ),
          ),
        ],
      ),
    );
  }

  Map<String, Object?> _getPreferences(SharedPreferencesWithCache sp) {
    final keys = sp.keys;
    final Map<String, Object?> prefs = {};

    for (final key in keys) {
      prefs[key] = sp.get(key);
    }

    return prefs;
  }
}

class _ValueEditDialog extends HookWidget {
  final String initialValue;

  const _ValueEditDialog({this.initialValue = ""});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initialValue);

    return SimpleDialog(
      contentPadding: const EdgeInsets.all(16),
      children: [
        TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: "Value",
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(controller.text);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ],
    );
  }
}
