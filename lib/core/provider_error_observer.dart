import "dart:async";
import "dart:io";

import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:http/http.dart";

import "../data/services/crashlytics_service.dart";
import "errors.dart";

final class ProviderErrorObserver extends ProviderObserver {
  @override
  void providerDidFail(ProviderObserverContext context, Object error, StackTrace stackTrace) {
    super.providerDidFail(context, error, stackTrace);
    handleError(error, stackTrace);

    // ponytail: assumes `crashlyticsServiceProvider` itself always builds —
    // `main.dart` initializes Firebase before `runApp`. Guard it here if that
    // ever stops holding.
    if (!_isTransientNetworkError(error)) {
      context.container
          .read(crashlyticsServiceProvider)
          .reportIfNonSilent(error, stackTrace);
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
