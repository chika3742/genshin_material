import "package:material_symbols_icons/symbols.dart";
import "package:material_ui/material_ui.dart";

class WarningBanner extends StatelessWidget {
  final String text;

  const WarningBanner({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          spacing: 8,
          children: [
            Icon(Symbols.warning),
            Expanded(child: Text(text)),
          ],
        ),
      ),
    );
  }
}
