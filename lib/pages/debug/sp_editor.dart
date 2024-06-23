import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../main.dart";

class SharedPreferencesEditorPage extends HookWidget {
  const SharedPreferencesEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = useState(_getPreferences());

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
                        spInstance.setString(e.key, result);
                      } else if (e.value is int) {
                        spInstance.setInt(e.key, int.parse(result));
                      } else if (e.value is double) {
                        spInstance.setDouble(e.key, double.parse(result));
                      } else if (e.value is bool) {
                        spInstance.setBool(e.key, bool.parse(result));
                      } else {
                        throw "Unsupported type: ${e.value.runtimeType}";
                      }

                      prefs.value = _getPreferences();
                    },
                  ),
                  PopupMenuItem(
                    child: const Text("Delete"),
                    onTap: () {
                      spInstance.remove(e.key);
                      prefs.value = _getPreferences();
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

  Map<String, Object?> _getPreferences() {
    final keys = spInstance.getKeys();
    final Map<String, Object?> prefs = {};

    for (final key in keys) {
      prefs[key] = spInstance.get(key);
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
