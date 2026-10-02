import "dart:async";
import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/i18n/strings.g.dart";
import "package:genshin_material/pages/tools/tools.dart";
import "package:genshin_material/providers/login_bonus_state.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../../utils/fake_login_bonus_state.dart";
import "../../utils/remote_config.dart";
import "../../utils/secure_storage.dart";
import "../utils.dart";

void main() {
  // Signed in, so that the login bonus tile is shown.
  setUpSecureStorageMock();

  /// What the next build of the provider returns.
  late Future<bool?> Function() nextResult;

  /// Mounts the page with the bonus claimed, and returns its container.
  Future<ProviderContainer> pumpPage(WidgetTester tester) async {
    nextResult = () async => true;
    await tester.pumpWidget(createProviderScope(
      overrides: [
        overrideRemoteConfig(RemoteConfigKeys.hoyolabLinkEnabled, true),
        loginBonusStateProvider.overrideWith(() => FakeLoginBonusState(() => nextResult())),
      ],
      child: const MaterialApp(home: ToolsPage()),
    ));
    await tester.pump();
    expect(find.text(tr.tools.loginBonusClaimed), findsOneWidget);
    return ProviderScope.containerOf(tester.element(find.byType(ToolsPage)));
  }

  testWidgets("keeps showing the claimed state while re-checking", (tester) async {
    final container = await pumpPage(tester);

    final recheck = Completer<bool?>();
    nextResult = () => recheck.future;
    container.invalidate(loginBonusStateProvider);
    await tester.pump();

    expect(container.read(loginBonusStateProvider).isLoading, isTrue);
    expect(find.text(tr.tools.loginBonusClaimed), findsOneWidget);
    expect(find.text(tr.tools.loginBonusLoading), findsNothing);
  });

  testWidgets("shows the error rather than the previous state when a re-check fails", (tester) async {
    final container = await pumpPage(tester);

    nextResult = () => Future.error(const SocketException("offline"));
    container.invalidate(loginBonusStateProvider);
    // One frame rebuilds the provider, the next shows the error it ends with.
    await tester.pump();
    await tester.pump();

    expect(
      container.read(loginBonusStateProvider),
      isA<AsyncError<bool?>>().having((s) => s.value, "value", isTrue),
    );
    expect(find.text(tr.errors.failedToFetchSignState + tr.updates.noInternet), findsOneWidget);
    expect(find.text(tr.tools.loginBonusClaimed), findsNothing);
  });
}
