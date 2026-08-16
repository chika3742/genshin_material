import "package:flutter/material.dart";
import "package:timelines/timelines.dart";

import "../models/release_note.dart";
import "../utils/semver.dart";
import "release_note_contents.dart";

class ReleaseNotesTimeline extends StatelessWidget {
  final List<ReleaseNote> items;
  final String versionPrefix;

  const ReleaseNotesTimeline({
    super.key,
    required this.items,
    required this.versionPrefix,
  });

  static const _headerHeight = 64.0;
  static const _headerMargin = EdgeInsets.all(8);
  static const _indicatorSize = 15.0;

  @override
  Widget build(BuildContext context) {
    // Each release note takes two tiles: an even header tile and an odd contents tile.
    // The header tile's height is the header's own height, so the indicator centers on
    // it without measuring.
    final tileCount = items.length * 2;
    final safeArea = MediaQuery.paddingOf(context);

    // Laid out eagerly: a lazy list can only estimate the scroll extent of these
    // variable-height tiles, which makes the scrollbar jump around.
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.0, safeArea.top, 16.0, safeArea.bottom),
      child: FixedTimeline.tileBuilder(
        mainAxisSize: MainAxisSize.min,
        builder: TimelineTileBuilder.connected(
          itemCount: tileCount,
          firstConnectorBuilder: (context) => Connector.dashedLine(),
          lastConnectorBuilder: (context) => Connector.dashedLine(),
          nodePositionBuilder: (context, index) => 0.05,
          // `tileCount - 2` is the last header tile, so everything below its dot is dashed.
          connectorBuilder: (context, index, type) =>
              index == tileCount - 2 ? Connector.dashedLine() : Connector.solidLine(),
          indicatorBuilder: (context, index) {
            if (index.isOdd) {
              // Invisible, but as wide as the dots: a narrower node would shift the line.
              return const SizedBox(width: _indicatorSize);
            }

            final itemIndex = index ~/ 2;
            final isDot = itemIndex == items.length - 1 ||
                isMinorVersionUpdated(items[itemIndex + 1].version, items[itemIndex].version);

            return isDot
                ? Indicator.dot(size: _indicatorSize)
                : Indicator.outlined(size: _indicatorSize);
          },
          contentsBuilder: (context, index) {
            final item = items[index ~/ 2];

            if (index.isOdd) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ReleaseNoteContents(contentsText: item.contents.localized),
              );
            }

            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                constraints: const BoxConstraints(minHeight: _headerHeight),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: _headerMargin,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$versionPrefix${item.version}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(item.releasedOn),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
