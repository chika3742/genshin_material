import "dart:async";

import "package:firebase_remote_config/firebase_remote_config.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/data/services/remote_config_service.dart";
import "package:genshin_material/hooks/use_remote_config_listener.dart";
import "package:genshin_material/providers/remote_config.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:mockito/mockito.dart";

import "../utils/remote_config.mocks.dart";

class _Host extends HookConsumerWidget {
  const _Host();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useRemoteConfigListener(ref);
    return const SizedBox();
  }
}

void main() {
  late MockRemoteConfigService service;
  late StreamController<RemoteConfigUpdate> updates;

  setUp(() {
    service = MockRemoteConfigService();
    updates = StreamController<RemoteConfigUpdate>.broadcast();
  });

  tearDown(() async {
    await updates.close();
  });

  /// Wires the mock so that every pushed event calls the hook back, the way
  /// [RemoteConfigService.listenConfigUpdate] does once `activate()` resolves.
  void stubImmediateUpdates() {
    when(service.listenConfigUpdate(any)).thenAnswer((invocation) {
      final onActivated = invocation.positionalArguments.single as void Function();
      return updates.stream.listen((_) => onActivated());
    });
  }

  Future<ProviderContainer> pumpHost(WidgetTester tester) async {
    final container = ProviderContainer(overrides: [
      remoteConfigServiceProvider.overrideWithValue(service),
    ]);
    addTearDown(container.dispose);

    await tester.pumpWidget(UncontrolledProviderScope(
      container: container,
      child: const MaterialApp(home: _Host()),
    ));
    return container;
  }

  testWidgets("re-reads every key when the server pushes an update",
      (tester) async {
    stubImmediateUpdates();
    var enabled = false;
    var bannerText = "before";
    when(service.get<bool>(RemoteConfigKeys.hoyolabLinkEnabled))
        .thenAnswer((_) => enabled);
    when(service.get<String>(RemoteConfigKeys.bannerText))
        .thenAnswer((_) => bannerText);
    final container = await pumpHost(tester);
    final enabledProvider =
        remoteConfigProvider(RemoteConfigKeys.hoyolabLinkEnabled);
    final textProvider = remoteConfigProvider(RemoteConfigKeys.bannerText);

    container.listen(enabledProvider, (_, _) {});
    container.listen(textProvider, (_, _) {});
    expect(container.read(enabledProvider), isFalse);
    expect(container.read(textProvider), "before");

    enabled = true;
    bannerText = "after";
    updates.add(RemoteConfigUpdate({"hoyolab_link_enabled", "banner_text"}));
    await tester.pump();

    // The whole family is invalidated; a consumer that needs a value to stay
    // put for the session says so itself, the way `useStartupBanner` does.
    expect(container.read(enabledProvider), isTrue);
    expect(container.read(textProvider), "after");
  });

  testWidgets("cancels the subscription when the widget is disposed",
      (tester) async {
    stubImmediateUpdates();
    await pumpHost(tester);
    expect(updates.hasListener, isTrue);

    await tester.pumpWidget(const MaterialApp(home: SizedBox()));

    expect(updates.hasListener, isFalse);
  });

  testWidgets("does nothing when the widget is gone before activate() returns",
      (tester) async {
    // `listenConfigUpdate` awaits `activate()` before calling back, so an event
    // that is already in flight outlives `subscription.cancel()`.
    late void Function() onActivated;
    when(service.listenConfigUpdate(any)).thenAnswer((invocation) {
      onActivated = invocation.positionalArguments.single as void Function();
      return updates.stream.listen((_) {});
    });
    when(service.get<bool>(RemoteConfigKeys.hoyolabLinkEnabled))
        .thenReturn(false);
    await pumpHost(tester);

    await tester.pumpWidget(const MaterialApp(home: SizedBox()));

    expect(onActivated, returnsNormally);
  });
}
