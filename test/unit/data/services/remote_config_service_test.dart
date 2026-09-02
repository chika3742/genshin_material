import "dart:async";

import "package:firebase_remote_config/firebase_remote_config.dart";
import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/remote_config_keys.dart";
import "package:genshin_material/data/services/remote_config_service.dart";
import "package:genshin_material/models/remote_config_key.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";

import "remote_config_service_test.mocks.dart";

@GenerateNiceMocks([MockSpec<FirebaseRemoteConfig>()])
void main() {
  late MockFirebaseRemoteConfig firebaseRemoteConfig;
  late RemoteConfigService service;

  setUp(() {
    firebaseRemoteConfig = MockFirebaseRemoteConfig();
    service = RemoteConfigService(firebaseRemoteConfig);
  });

  group("get", () {
    test("reads a bool key through getBool", () {
      when(firebaseRemoteConfig.getBool("bool_key")).thenReturn(true);

      expect(service.get(const BoolRemoteConfigKey("bool_key")), isTrue);
      verify(firebaseRemoteConfig.getBool("bool_key")).called(1);
      verifyNever(firebaseRemoteConfig.getString(any));
      verifyNever(firebaseRemoteConfig.getInt(any));
    });

    test("reads a string key through getString", () {
      when(firebaseRemoteConfig.getString("string_key")).thenReturn("value");

      expect(
        service.get(const StringRemoteConfigKey("string_key")),
        "value",
      );
      verify(firebaseRemoteConfig.getString("string_key")).called(1);
      verifyNever(firebaseRemoteConfig.getBool(any));
      verifyNever(firebaseRemoteConfig.getInt(any));
    });

    test("reads an int key through getInt", () {
      when(firebaseRemoteConfig.getInt("int_key")).thenReturn(42);

      expect(service.get(const IntRemoteConfigKey("int_key")), 42);
      verify(firebaseRemoteConfig.getInt("int_key")).called(1);
      verifyNever(firebaseRemoteConfig.getBool(any));
      verifyNever(firebaseRemoteConfig.getString(any));
    });

    test("forwards the declared key name of the app's own keys", () {
      when(firebaseRemoteConfig.getBool(RemoteConfigKeys.hoyolabLinkEnabled.key))
          .thenReturn(true);
      when(firebaseRemoteConfig
              .getInt(RemoteConfigKeys.minimumAssetSchemaVersion.key))
          .thenReturn(7);

      expect(service.get(RemoteConfigKeys.hoyolabLinkEnabled), isTrue);
      expect(service.get(RemoteConfigKeys.minimumAssetSchemaVersion), 7);
      verify(firebaseRemoteConfig.getBool("hoyolab_link_enabled")).called(1);
      verify(firebaseRemoteConfig.getInt("minimum_asset_schema_version"))
          .called(1);
    });
  });

  group("listenConfigUpdate", () {
    late StreamController<RemoteConfigUpdate> controller;
    late int activations;

    setUp(() {
      activations = 0;
      controller = StreamController<RemoteConfigUpdate>();
      when(firebaseRemoteConfig.onConfigUpdated)
          .thenAnswer((_) => controller.stream);
      when(firebaseRemoteConfig.activate()).thenAnswer((_) async => true);
    });

    tearDown(() async {
      await controller.close();
    });

    test("does not activate before an update arrives", () async {
      final subscription = service.listenConfigUpdate(() => activations++);
      await pumpEventQueue();

      verifyNever(firebaseRemoteConfig.activate());

      await subscription.cancel();
    });

    test("activates the fetched config when an update arrives", () async {
      final subscription = service.listenConfigUpdate(() => activations++);

      controller.add(RemoteConfigUpdate({"hoyolab_link_enabled"}));
      await pumpEventQueue();

      verify(firebaseRemoteConfig.activate()).called(1);
      expect(activations, 1, reason: "onActivated runs after activate()");

      await subscription.cancel();
    });

    test("activates once per update event", () async {
      final subscription = service.listenConfigUpdate(() => activations++);

      controller.add(RemoteConfigUpdate({"a"}));
      controller.add(RemoteConfigUpdate({"b"}));
      await pumpEventQueue();

      verify(firebaseRemoteConfig.activate()).called(2);

      await subscription.cancel();
    });

    test("stops activating once the subscription is cancelled", () async {
      final subscription = service.listenConfigUpdate(() => activations++);
      await subscription.cancel();

      controller.add(RemoteConfigUpdate({"a"}));
      await pumpEventQueue();

      verifyNever(firebaseRemoteConfig.activate());
    });
  });
}
