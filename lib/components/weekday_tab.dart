import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../composables/use_periodic_timer.dart";
import "../models/common.dart";
import "../providers/preferences.dart";
import "../utils/daily_material_weekday.dart";

class WeekdayTab extends StatefulHookConsumerWidget implements PreferredSizeWidget {
  const WeekdayTab({
    super.key,
    required TabController tabController,
    required this.tabs,
  }) : _tabController = tabController;

  final TabController _tabController;
  final List<DailyTab> tabs;

  @override
  ConsumerState<WeekdayTab> createState() => _WeekdayTabState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _WeekdayTabState extends ConsumerState<WeekdayTab> {
  @override
  Widget build(BuildContext context) {
    usePeriodicTimer(const Duration(seconds: 2), (_) {
      if (mounted && ModalRoute.of(context)?.isCurrent == true) {
        setState(() {});
      }
    });

    final pref = ref.watch(preferencesStateProvider);

    return TabBar(
      controller: widget._tabController,
      tabs: [
        for (final tab in widget.tabs)
          Tab(
            child: Container(
              key: ValueKey(getCurrentDailyMaterialWeekday(pref.dailyResetServer)),
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 8,
              ),
              decoration: tab.getIsToday(pref.dailyResetServer) ? BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).colorScheme.inversePrimary,
              ) : null,
              child: Text(tab.title),
            ),
          ),
      ],
    );
  }
}

class DailyTab {
  final String id;
  final String title;
  final List<int> days;

  const DailyTab({
    required this.id,
    required this.title,
    required this.days,
  });

  bool getIsToday(GameServer server) {
    final now = getCurrentDailyMaterialWeekday(server);
    return days.contains(now);
  }
}
