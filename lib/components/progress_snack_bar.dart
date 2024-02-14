import "package:flutter/material.dart";

class ProgressSnackBar extends StatefulWidget {
  const ProgressSnackBar({super.key, required this.initialText});

  final String initialText;

  @override
  State<ProgressSnackBar> createState() => ProgressSnackBarState();
}

class ProgressSnackBarState extends State<ProgressSnackBar> {
  double? progress;
  String? totalSize;
  late String text;

  @override
  void initState() {
    super.initState();
    text = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(text),
        Text(_buildProgressString(), textAlign: TextAlign.end),
        const SizedBox(height: 8),
        ProgressIndicatorTheme(
          data: ProgressIndicatorThemeData(
            color: Theme.of(context).colorScheme.inversePrimary,
            linearTrackColor: Theme.of(context).colorScheme.primary,
          ),
          child: LinearProgressIndicator(
            value: progress,
          ),
        ),
      ],
    );
  }

  String _buildProgressString() {
    final strings = <String>[];

    if (progress != null) {
      strings.add("${(progress! * 100).toStringAsFixed(2)}%");
    }
    if (totalSize != null) {
      strings.add(totalSize!);
    }

    if (strings.isEmpty) {
      return "";
    }

    return "(${strings.join(" / ")})";
  }
}
