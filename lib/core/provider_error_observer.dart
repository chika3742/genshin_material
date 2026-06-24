import "dart:async";
import "dart:io";

import "package:firebase_crashlytics/firebase_crashlytics.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:http/http.dart";

import "errors.dart";
import "silent_exception.dart";

final class ProviderErrorObserver extends ProviderObserver {
  @override
  void providerDidFail(ProviderObserverContext context, Object error, StackTrace stackTrace) {
    super.providerDidFail(context, error, stackTrace);
    handleError(error, stackTrace);

    if ((error is! SilentException || !error.isSilent) && !_isTransientNetworkError(error)) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    }
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
