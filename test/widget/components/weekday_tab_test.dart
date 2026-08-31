import "package:clock/clock.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/components/weekday_tab.dart";
import "package:genshin_material/core/pref_keys.dart";
import "package:genshin_material/models/common.dart";
import "package:genshin_material/providers/pref_notifier.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../../utils.dart";
import "../../utils/in_memory_pref_notifier.dart";

void main() {
  // 20:00 UTC is already Tuesday on the Asia server (UTC+8, reset at 04:00)
  // while it is still Monday on the America one (UTC-5).
  final mondayEvening = DateTime.utc(2024, 1, 1, 20);

  const tabs = [
    DailyTab(id: "monday", title: "monday", days: [DateTime.monday]),
    DailyTab(id: "tuesday", title: "tuesday", days: [DateTime.tuesday]),
    DailyTab(id: "wednesday", title: "wednesday", days: [DateTime.wednesday]),
  ];

  TabController? tabController;

  tearDown(() {
    tabController?.dispose();
    tabController = null;
  });

  Future<ProviderContainer> pumpTab(
    WidgetTester tester, {
    GameServer server = GameServer.asia,
    List<DailyTab> tabs = tabs,
  }) async {
    final controller = TabController(length: tabs.length, vsync: const TestVSync());
    tabController = controller;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          overridePref(PrefKeys.dailyResetServer, server),
        ],
        child: createScreenWithApp(
          Scaffold(
            appBar: AppBar(
              bottom: WeekdayTab(tabController: controller, tabs: tabs),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return ProviderScope.containerOf(tester.element(find.byType(WeekdayTab)));
  }

  // The periodic timer of the component lives as long as the widget does, so
  // the tree has to go away before the test ends.
  Future<void> disposeTree(WidgetTester tester) async {
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(Duration.zero);
  }

  bool isHighlighted(WidgetTester tester, String title) {
    final container = tester.widget<Container>(
      find.ancestor(of: find.text(title), matching: find.byType(Container)).first,
    );
    return container.decoration != null;
  }

  testWidgets("renders one tab per entry", (tester) async {
    await withClock(Clock.fixed(mondayEvening), () async {
      await pumpTab(tester);

      expect(find.byType(Tab), findsNWidgets(tabs.length));

      await disposeTree(tester);
    });
  });

  testWidgets("highlights the tab of the day of the asian server", (tester) async {
    await withClock(Clock.fixed(mondayEvening), () async {
      await pumpTab(tester);

      expect(isHighlighted(tester, "tuesday"), isTrue);
      expect(isHighlighted(tester, "monday"), isFalse);

      await disposeTree(tester);
    });
  });

  testWidgets("highlights the tab of the day of the american server", (tester) async {
    await withClock(Clock.fixed(mondayEvening), () async {
      await pumpTab(tester, server: GameServer.america);

      expect(isHighlighted(tester, "monday"), isTrue);
      expect(isHighlighted(tester, "tuesday"), isFalse);

      await disposeTree(tester);
    });
  });

  testWidgets("follows the server the user switches to", (tester) async {
    await withClock(Clock.fixed(mondayEvening), () async {
      final container = await pumpTab(tester, server: GameServer.america);
      expect(isHighlighted(tester, "monday"), isTrue);

      await container
          .read(prefProvider(PrefKeys.dailyResetServer).notifier)
          .set(GameServer.asia);
      await tester.pumpAndSettle();

      expect(isHighlighted(tester, "tuesday"), isTrue);
      expect(isHighlighted(tester, "monday"), isFalse);

      await disposeTree(tester);
    });
  });

  testWidgets("highlights nothing when no tab covers the current day", (tester) async {
    await withClock(Clock.fixed(mondayEvening), () async {
      await pumpTab(
        tester,
        tabs: const [
          DailyTab(id: "monday", title: "monday", days: [DateTime.monday]),
          DailyTab(id: "wednesday", title: "wednesday", days: [DateTime.wednesday]),
        ],
      );

      expect(isHighlighted(tester, "monday"), isFalse);
      expect(isHighlighted(tester, "wednesday"), isFalse);

      await disposeTree(tester);
    });
  });

  testWidgets("highlights every tab that covers the current day", (tester) async {
    await withClock(Clock.fixed(mondayEvening), () async {
      await pumpTab(
        tester,
        tabs: const [
          DailyTab(id: "a", title: "a", days: [DateTime.tuesday]),
          DailyTab(id: "b", title: "b", days: [DateTime.tuesday, DateTime.friday]),
        ],
      );

      expect(isHighlighted(tester, "a"), isTrue);
      expect(isHighlighted(tester, "b"), isTrue);

      await disposeTree(tester);
    });
  });

  testWidgets("moves the controller to the tapped tab", (tester) async {
    await withClock(Clock.fixed(mondayEvening), () async {
      await pumpTab(tester);
      var notified = 0;
      tabController!.addListener(() => notified++);

      await tester.tap(find.text("wednesday"));
      await tester.pumpAndSettle();

      expect(tabController!.index, 2);
      expect(notified, greaterThan(0));

      await disposeTree(tester);
    });
  });

  testWidgets("takes the height of a toolbar", (tester) async {
    await withClock(Clock.fixed(mondayEvening), () async {
      await pumpTab(tester);

      final tab = tester.widget<WeekdayTab>(find.byType(WeekdayTab));
      expect(tab.preferredSize.height, kToolbarHeight);

      await disposeTree(tester);
    });
  });
}
