import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod/misc.dart";
import "package:timelines/timelines.dart";

import "../components/center_text.dart";
import "../components/data_asset_scope.dart";
import "../components/release_notes_timeline.dart";
import "../i18n/strings.g.dart";
import "../models/release_note.dart";
import "../providers/versions.dart";

class ReleaseNotesPage extends StatefulWidget {
  final int initialTabIndex;

  const ReleaseNotesPage({super.key, this.initialTabIndex = 0});

  @override
  State<ReleaseNotesPage> createState() => _ReleaseNotesPageState();
}

class _ReleaseNotesPageState extends State<ReleaseNotesPage> with SingleTickerProviderStateMixin {
  static final _tabs = [
    Tab(text: tr.releaseNotesPage.featureUpdates),
    Tab(text: tr.releaseNotesPage.assetUpdates),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      initialIndex: widget.initialTabIndex,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.releaseNotes),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildReleaseNotesTab(
            provider: featuresReleaseNotesDataProvider,
            versionPrefix: "v",
            color: Theme.of(context).colorScheme.primary,
          ),
          DataAssetScope(
            useScaffold: false,
            builder: (_, _) {
              return _buildReleaseNotesTab(
                provider: assetsReleaseNotesDataProvider,
                versionPrefix: "D",
                color: Theme.of(context).colorScheme.secondary,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReleaseNotesTab({
    required ProviderBase<AsyncValue<List<ReleaseNote>>> provider,
    required String versionPrefix,
    required Color color,
  }) {
    return TimelineTheme(
      data: TimelineThemeData(
        color: color,
      ),
      child: _ReleaseNotesTabContent(
        provider: provider,
        versionPrefix: versionPrefix,
      ),
    );
  }
}

class _ReleaseNotesTabContent extends ConsumerWidget {
  final ProviderBase<AsyncValue<List<ReleaseNote>>> provider;
  final String versionPrefix;

  const _ReleaseNotesTabContent({required this.provider, this.versionPrefix = "v"});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final releaseNotes = ref.watch(provider);

    return switch (releaseNotes) {
      AsyncData(:final value) => ReleaseNotesTimeline(
        items: value,
        versionPrefix: versionPrefix,
      ),
      AsyncError(:final error) => CenterError(error: error),
      _ => const CircularProgressIndicator(),
    };
  }
}
