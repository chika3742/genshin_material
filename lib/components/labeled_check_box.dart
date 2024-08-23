import "package:flutter/material.dart";

class LabeledCheckBox extends StatelessWidget {
  final Widget child;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const LabeledCheckBox({
    super.key,
    required this.child,
    required this.value,
    required this.onChanged,
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
          _animatedChild(context),
        ],
      ),
    );
  }

  Widget _animatedChild(BuildContext context) {
    final enabledStyle = Theme.of(context).textTheme.labelLarge!.copyWith(
      fontSize: 15,
    );
    final disabledStyle = enabledStyle.copyWith(
      color: Theme.of(context).disabledColor,
    );
    return AnimatedDefaultTextStyle(
      style: onChanged != null ? enabledStyle : disabledStyle,
      duration: kThemeChangeDuration,
      child: child,
    );
  }
}

class LabeledRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final void Function(T?) onChanged;
  final Widget? label;
  final Color? activeColor;

  const LabeledRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.label,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: Radio(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: activeColor,
            ),
          ),
          if (label != null) DefaultTextStyle(
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontSize: 15,
            ),
            child: label!,
          ),
        ],
      ),
    );
  }
}
