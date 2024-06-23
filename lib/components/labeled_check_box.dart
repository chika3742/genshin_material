import "package:flutter/material.dart";

class LabeledCheckBox extends StatelessWidget {
  final Widget child;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const LabeledCheckBox({
    super.key,
    required this.child,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Row(
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
