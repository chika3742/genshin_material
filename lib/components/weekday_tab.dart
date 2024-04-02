import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../composables/use_periodic_timer.dart";
import "../models/common.dart";

class WeekdayTab extends StatefulHookWidget implements PreferredSizeWidget {
  const WeekdayTab({
    super.key,
    required TabController tabController,
    required this.tabs,
  }) : _tabController = tabController;

  final TabController _tabController;
  final List<DailyTab> tabs;

  @override
  State<WeekdayTab> createState() => _WeekdayTabState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _WeekdayTabState extends State<WeekdayTab> {
  @override
  Widget build(BuildContext context) {
    usePeriodicTimer(const Duration(seconds: 2), (_) {
      if (mounted && ModalRoute.of(context)?.isCurrent == true) {
        setState(() {});
      }
    });

    return TabBar(
      controller: widget._tabController,
      tabs: [
        for (final tab in widget.tabs)
          Tab(
            child: Container(
              key: ValueKey(DateTime.now().weekday),
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 8,
              ),
              decoration: tab.isToday ? BoxDecoration(
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
  final List<DayOfWeek> days;

  const DailyTab({
    required this.id,
    required this.title,
    required this.days,
  });

  bool get isToday {
    final now = DateTime.now();
    final today = now.weekday;
    return days.any((day) => day.index + 1 == today);
  }
}
