import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:genshin_material/components/release_note_contents.dart";
import "package:genshin_material/core/data.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:genshin_material/models/release_note.dart";
import "package:timelines/timelines.dart";

class ReleaseNotesPage extends ConsumerStatefulWidget {
  const ReleaseNotesPage({super.key});

  @override
  ConsumerState<ReleaseNotesPage> createState() => _ReleaseNotesPageState();
}

class _ReleaseNotesPageState extends ConsumerState<ReleaseNotesPage> {
@override
  Widget build(BuildContext context) {
    final releaseNotes = ref.watch(releaseNotesDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.releaseNotes),
      ),
      body: switch (releaseNotes) {
        AsyncData(:final value) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: buildTimeline(value),
        ),
        AsyncError() => const Center(
            child: Text("Failed to load release notes"),
          ),
        _ => const Center(
            child: CircularProgressIndicator(),
          ),
      },
    );
  }

  final tlContentsKeys = <int, GlobalKey>{};
  Map<int, double>? tlContentsHeights;

  Widget buildTimeline(List<ReleaseNote> releaseNotes) {
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

    return Timeline.tileBuilder(
      builder: TimelineTileBuilder.connectedFromStyle(
        itemCount: releaseNotes.length,
        firstConnectorStyle: ConnectorStyle.dashedLine,
        lastConnectorStyle: ConnectorStyle.dashedLine,
        nodePositionBuilder: (context, index) => 0.05,
        connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
        indicatorStyleBuilder: (context, index) {
          return index % 2 == 0 ? IndicatorStyle.dot : IndicatorStyle.outlined;
        },
        indicatorPositionBuilder: (context, index) {
          final widgetHeight = tlContentsHeights?[index];
          if (widgetHeight == null) {
            return 0;
          }

          const top = 36;

          return top / widgetHeight;
        },
        contentsBuilder: (context, index) {
          return Column(
            key: tlContentsKeys[index] ??= GlobalKey(),
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                margin: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "v${releaseNotes[index].version}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(releaseNotes[index].releasedOn),
                  ],
                ),
              ),
              ReleaseNoteContents(contentsText: releaseNotes[index].contents),
            ],
          );
        },
      ),
    );
  }
}
