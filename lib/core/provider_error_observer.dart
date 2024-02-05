import "package:flutter/foundation.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class ProviderErrorObserver extends ProviderObserver {
  @override
  void providerDidFail(ProviderBase<Object?> provider, Object error, StackTrace stackTrace, ProviderContainer container) {
    debugPrint(error.toString());
    debugPrintStack(stackTrace: stackTrace);
  }
}