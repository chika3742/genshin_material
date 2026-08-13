import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/composables/use_refreshable_future.dart";

class _Host extends HookWidget {
  const _Host({required this.fetch, required this.onBuild});

  final Future<String> Function() fetch;
  final void Function(AsyncSnapshot<String> snapshot, VoidCallback refresh) onBuild;

  @override
  Widget build(BuildContext context) {
    final (snapshot, refresh) = useRefreshableFuture(fetch);
    onBuild(snapshot, refresh);
    return const SizedBox();
  }
}

void main() {
  late int calls;
  late AsyncSnapshot<String> snapshot;
  late VoidCallback refresh;

  setUp(() {
    calls = 0;
  });

  Future<String> fetch() async {
    calls++;
    return "v$calls";
  }

  Widget host() => MaterialApp(
    home: _Host(
      fetch: fetch,
      onBuild: (s, r) {
        snapshot = s;
        refresh = r;
      },
    ),
  );

  testWidgets("Calls fetch once on the first build", (tester) async {
    await tester.pumpWidget(host());
    await tester.pump();

    expect(calls, 1);
    expect(snapshot.data, "v1");
  });

  testWidgets("Re-runs fetch and updates the snapshot on refresh", (tester) async {
    await tester.pumpWidget(host());
    await tester.pump();

    refresh();
    await tester.pump();
    await tester.pump();

    expect(calls, 2);
    expect(snapshot.data, "v2");
  });

  testWidgets("Does not re-run fetch on a plain rebuild", (tester) async {
    await tester.pumpWidget(host());
    await tester.pump();

    // Rebuilds the same element with a new widget instance, so only a refresh
    // (not an identity change of `fetch`) may re-run it.
    await tester.pumpWidget(host());
    await tester.pump();

    expect(calls, 1);
    expect(snapshot.data, "v1");
  });
}
