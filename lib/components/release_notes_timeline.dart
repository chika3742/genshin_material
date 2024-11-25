import "package:flutter/material.dart";
import "package:timelines/timelines.dart";

import "../models/release_note.dart";
import "../utils/semver.dart";
import "release_note_contents.dart";

class ReleaseNotesTimeline extends StatefulWidget {
  final List<ReleaseNote> items;
  final String versionPrefix;

  const ReleaseNotesTimeline({
    super.key,
    required this.items,
    required this.versionPrefix,
  });

  @override
  State<ReleaseNotesTimeline> createState() => _ReleaseNotesTimelineState();
}

class _ReleaseNotesTimelineState extends State<ReleaseNotesTimeline> {
  final tlContentsKeys = <int, GlobalKey>{};
  Map<int, double>? tlContentsHeights;

  static const _headerHeight = 64.0;
  static const _headerMargin = EdgeInsets.all(8);

  @override
  Widget build(BuildContext context) {
    if (tlContentsHeights == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          tlContentsHeights = <int, double>{};
          tlContentsKeys.forEach((key, value) {
            tlContentsHeights![key] = (value.currentContext!.findRenderObject() as RenderBox).size.height;
          });
        });
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Timeline.tileBuilder(
        builder: TimelineTileBuilder.connectedFromStyle(
          itemCount: widget.items.length,
          firstConnectorStyle: ConnectorStyle.dashedLine,
          lastConnectorStyle: ConnectorStyle.dashedLine,
          nodePositionBuilder: (context, index) => 0.05,
          connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
          indicatorStyleBuilder: (context, index) {
            if (index == widget.items.length - 1) {
              return IndicatorStyle.dot;
            }

            return isMinorVersionUpdated(widget.items[index + 1].version, widget.items[index].version)
                ? IndicatorStyle.dot
                : IndicatorStyle.outlined;
          },
          indicatorPositionBuilder: (context, index) {
            final widgetHeight = tlContentsHeights?[index];
            if (widgetHeight == null) {
              return 0;
            }

            return (_headerMargin.top + _headerHeight / 2) / widgetHeight;
          },
          contentsBuilder: (context, index) {
            return Column(
              key: tlContentsKeys[index] ??= GlobalKey(),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: _headerHeight,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin: _headerMargin,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.versionPrefix}${widget.items[index].version}",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(widget.items[index].releasedOn),
                    ],
                  ),
                ),
                ReleaseNoteContents(contentsText: widget.items[index].contents),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}
