import "package:firebase_crashlytics/firebase_crashlytics.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../core/silent_exception.dart";

part "crashlytics_service.g.dart";

class CrashlyticsService {
  final FirebaseCrashlytics _crashlytics;

  const CrashlyticsService(this._crashlytics);

  void reportIfNonSilent(Object error, StackTrace st) {
    if (error is! SilentException || !error.isSilent) {
      _crashlytics.recordError(error, st);
    }
  }
}

@Riverpod(keepAlive: true)
CrashlyticsService crashlyticsService(Ref ref) {
  return CrashlyticsService(FirebaseCrashlytics.instance);
}
