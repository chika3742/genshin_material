import "package:flutter/material.dart";

class GappedColumn extends Flex {
  final double gap;

  GappedColumn({
    super.key,
    this.gap = 8.0,
    List<Widget> children = const <Widget>[],
    super.crossAxisAlignment,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
  }) : super(
    direction: Axis.vertical,
    children: List.generate(
      children.isNotEmpty ? children.length * 2 - 1 : 0,
      (index) => index % 2 == 0 ? children[index ~/ 2] : SizedBox(height: gap),
    ),
  );
}

class GappedRow extends Flex {
  final double gap;

  GappedRow({
    super.key,
    this.gap = 8.0,
    List<Widget> children = const <Widget>[],
    super.crossAxisAlignment,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
  }) : super(
    direction: Axis.horizontal,
    children: List.generate(
      children.isNotEmpty ? children.length * 2 - 1 : 0,
      (index) => index % 2 == 0 ? children[index ~/ 2] : SizedBox(width: gap),
    ),
  );
}

class SectionHeading extends StatelessWidget {
  final String text;
  final double indent;

  const SectionHeading(this.text, {super.key, this.indent = 0.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: indent),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

class SectionInnerHeading extends StatelessWidget {
  final String text;

  const SectionInnerHeading(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // leading triangle marker
        const Icon(Icons.arrow_right, size: 32, color: Colors.green),
        Expanded(
          child: Text(text, style: Theme.of(context).textTheme.titleMedium),
        ),
      ],
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
          if (label != null) label!,
        ],
      ),
    );
  }
}
