import "dart:async";
import "dart:io";

import "package:firebase_crashlytics/firebase_crashlytics.dart";
import "package:http/http.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../core/silent_exception.dart";

part "crashlytics_service.g.dart";

class CrashlyticsService {
  final FirebaseCrashlytics _crashlytics;

  const CrashlyticsService(this._crashlytics);

  /// Reports to Crashlytics if the [error] is marked as silent or is transient
  /// network error.
  void reportIfNonSilent(Object error, StackTrace st) {
    if (!_isTransientNetworkError(error) && (error is! SilentException || !error.isSilent)) {
      _crashlytics.recordError(error, st);
    }
  }

  bool _isTransientNetworkError(Object error) {
    return switch (error) {
      SocketException() ||
      TimeoutException() ||
      ClientException() => true,
      _ => false,
    };
  }
}

@Riverpod(keepAlive: true)
CrashlyticsService crashlyticsService(Ref ref) {
  return CrashlyticsService(FirebaseCrashlytics.instance);
}
