import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../components/center_error.dart";
import "../components/data_asset_scope.dart";
import "../components/release_notes_timeline.dart";
import "../i18n/strings.g.dart";
import "../models/release_note.dart";
import "../providers/versions.dart";

class ReleaseNotesPage extends StatefulWidget {
  const ReleaseNotesPage({super.key});

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
    _tabController = TabController(length: _tabs.length, vsync: this);
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
          _ReleaseNotesTab(provider: featuresReleaseNotesDataProvider),
          DataAssetScope(
            child: _ReleaseNotesTab(provider: assetsReleaseNotesDataProvider),
          ),
        ],
      ),
    );
  }
}

class _ReleaseNotesTab extends ConsumerWidget {
  final FutureProvider<List<ReleaseNote>> provider;

  const _ReleaseNotesTab({required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final releaseNotes = ref.watch(provider);

    return switch (releaseNotes) {
      AsyncData(:final value) => ReleaseNotesTimeline(
        items: value,
      ),
      AsyncError(:final error) => CenterError(error),
      _ => const CircularProgressIndicator(),
    };
  }
}
