import "package:flutter/material.dart";
import "package:genshin_material/components/style_parsed_text.dart";

class ReleaseNoteContents extends StatelessWidget {
  final String contentsText;

  const ReleaseNoteContents({super.key, required this.contentsText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buildColumns(context),
    );
  }

  List<Widget> buildColumns(BuildContext context) {
    final widgets = <Widget>[];

    final lines = contentsText.split("\n");

    for (final line in lines) {
      if (line.isNotEmpty) {
        widgets.add(buildLine(context, line));
        widgets.add(const SizedBox(height: 4));
      }
    }

    if (widgets.isNotEmpty) {
      widgets.removeLast(); // remove last SizedBox widget
    }

    return widgets;
  }

  Widget buildLine(BuildContext context, String line) {
    final parsedLine = parseLine(line);

    return switch (parsedLine.type) {
      LineType.heading => buildHeading(context, parsedLine.text),
      LineType.listItem => buildListItem(context, parsedLine.text),
      LineType.indentedListItem =>
        buildListItem(context, parsedLine.text, indented: true),
    };
  }

  ContentsLine parseLine(String line) {
    // heading
    if (line[0] == "#") {
      return ContentsLine(
        type: LineType.heading,
        text: line.substring(1).trim(),
      );
    }
    // indented list item
    if (line.substring(0, 3) == "  -") {
      return ContentsLine(
        type: LineType.indentedListItem,
        text: line.substring(3).trim(),
      );
    }
    // list item
    if (line[0] == "-") {
      return ContentsLine(
        type: LineType.listItem,
        text: line.substring(1).trim(),
      );
    }

    throw "Could not detect line type";
  }

  Widget buildHeading(BuildContext context, String text) {
    return Row(
      children: [
        // leading triangle marker
        const Icon(Icons.arrow_right, size: 32, color: Colors.greenAccent),
        Expanded(
          child: Text(text, style: Theme.of(context).textTheme.titleLarge),
        ),
      ],
    );
  }

  Widget buildListItem(BuildContext context, String text, {indented = false}) {
    return Padding(
      padding: EdgeInsets.only(left: indented ? 32 : 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // list marker
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomPaint(
              size: const Size.fromRadius(3),
              painter: ListMarkerPainter(
                context: context,
                style: indented ? MarkerStyle.outlined : MarkerStyle.filled,
              ),
            ),
          ),
          Expanded(
            child: StyleParsedText(
              text,
              defaultStyle: const TextStyle(
                height: 1.5,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum LineType {
  heading,
  listItem,
  indentedListItem,
}

class ContentsLine {
  final LineType type;
  final String text;

  const ContentsLine({required this.type, required this.text});
}

class ListMarkerPainter extends CustomPainter {
  final MarkerStyle style;
  final BuildContext context;

  const ListMarkerPainter({
    this.style = MarkerStyle.filled,
    required this.context,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = Theme.of(context).colorScheme.onSurface
      ..style = switch (style) {
        MarkerStyle.filled => PaintingStyle.fill,
        MarkerStyle.outlined => PaintingStyle.stroke,
      }
      ..strokeWidth = 1.5;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      paint1,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

enum MarkerStyle {
  filled,
  outlined,
}
