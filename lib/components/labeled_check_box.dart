import "package:flutter/material.dart";

class LabeledCheckBox extends StatelessWidget {
  final Widget child;
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final bool expandChild;

  const LabeledCheckBox({
    super.key,
    required this.child,
    required this.value,
    required this.onChanged,
    this.expandChild = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged?.call(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
            ),
          ),
          expandChild ? Expanded(child: _animatedChild(context)) : _animatedChild(context),
        ],
      ),
    );
  }

  Widget _animatedChild(BuildContext context) {
    return AnimatedDefaultTextStyle(
      style: TextStyle(color: onChanged != null ? Theme.of(context).colorScheme.onSurface : Theme.of(context).disabledColor),
      duration: kThemeChangeDuration,
      child: child,
    );
  }
}
