import "package:flutter/material.dart";

class ListSubheader extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry padding;

  const ListSubheader(
    this.text, {
    super.key,
    this.padding = const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
