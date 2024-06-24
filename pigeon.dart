import "package:pigeon/pigeon.dart";

@ConfigurePigeon(
  PigeonOptions(
    dartOut: "lib/pigeon.g.dart",
    dartOptions: DartOptions(),
    kotlinOut:
        "android/app/src/main/kotlin/net/chikach/genshinmaterial/Messages.g.kt",
    kotlinOptions: KotlinOptions(
      package: "net.chikach.genshinmaterial",
    ),
    swiftOut: "ios/Runner/Messages.g.swift",
    swiftOptions: SwiftOptions(),
    dartPackageName: "genshin_material",
  ),
)
@HostApi()
abstract class HoyolabIntegrationApi {
  @async
  String fetchCookie();
}
