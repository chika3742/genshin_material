import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/composables/use_startup_banner.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:genshin_material/providers/banner_notifier.dart";

class _Host extends HookWidget {
  final BannerData? banner;
  final void Function(String url) launchUrlString;
  final void Function() markAsRead;

  const _Host({
    required this.banner,
    required this.launchUrlString,
    required this.markAsRead,
  });

  @override
  Widget build(BuildContext context) {
    useStartupBanner(
      banner,
      launchUrlString: launchUrlString,
      markAsRead: markAsRead,
    );
    return const Scaffold(body: SizedBox());
  }
}

Widget _wrap(Widget child) => MaterialApp(home: child);

const _banner = BannerData(
  text: "Hello",
  actionText: "Go",
  actionUrl: "https://example.com",
);

void main() {
  testWidgets("does not show MaterialBanner when banner is null", (tester) async {
    await tester.pumpWidget(_wrap(_Host(
      banner: null,
      launchUrlString: (_) {},
      markAsRead: () {},
    )));
    await tester.pump();

    expect(find.byType(MaterialBanner), findsNothing);
  });

  testWidgets("shows MaterialBanner with text and action text when banner is provided", (tester) async {
    await tester.pumpWidget(_wrap(_Host(
      banner: _banner,
      launchUrlString: (_) {},
      markAsRead: () {},
    )));
    await tester.pumpAndSettle();

    expect(find.byType(MaterialBanner), findsOneWidget);
    expect(find.text("Hello"), findsOneWidget);
    expect(find.widgetWithText(TextButton, "Go"), findsOneWidget);
    expect(find.widgetWithText(TextButton, tr.common.dismiss), findsOneWidget);
  });

  testWidgets("tapping action button invokes launchUrlString with actionUrl", (tester) async {
    String? captured;
    await tester.pumpWidget(_wrap(_Host(
      banner: _banner,
      launchUrlString: (url) => captured = url,
      markAsRead: () {},
    )));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(TextButton, "Go"));
    await tester.pump();

    expect(captured, "https://example.com");
  });

  testWidgets("tapping dismiss button invokes markAsRead and hides MaterialBanner", (tester) async {
    var dismissed = 0;
    await tester.pumpWidget(_wrap(_Host(
      banner: _banner,
      launchUrlString: (_) {},
      markAsRead: () => dismissed++,
    )));
    await tester.pumpAndSettle();
    expect(find.byType(MaterialBanner), findsOneWidget);

    await tester.tap(find.widgetWithText(TextButton, tr.common.dismiss));
    await tester.pumpAndSettle();

    expect(dismissed, 1);
    expect(find.byType(MaterialBanner), findsNothing);
  });
}
