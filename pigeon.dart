import "package:pigeon/pigeon.dart";

@ConfigurePigeon(PigeonOptions(
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
))
@HostApi()
abstract class HoyolabIntegrationApi {
  @async // Android's is a sync function, but the iOS one is async
  String fetchCookie();

  @async
  void setCookies(List<CookieEntry> cookies);
}

class CookieEntry {
  final String key;
  final String value;
  final String domain;
  final bool httpOnly;
  final bool secure;

  const CookieEntry({
    required this.key,
    required this.value,
    required this.domain,
    this.httpOnly = false,
    this.secure = false,
  });
}
