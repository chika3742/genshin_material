import "package:flutter_riverpod/misc.dart";
import "package:genshin_material/data/services/crashlytics_service.dart";
import "package:mockito/annotations.dart";

/// Overrides [crashlyticsServiceProvider] with [service].
@GenerateNiceMocks([MockSpec<CrashlyticsService>()])
Override overrideCrashlyticsService(CrashlyticsService service) {
  return crashlyticsServiceProvider.overrideWithValue(service);
}
