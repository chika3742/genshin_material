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

  const SectionHeading(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
