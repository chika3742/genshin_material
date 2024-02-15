import "package:flutter_riverpod/flutter_riverpod.dart";

import "handle_error.dart";

class ProviderErrorObserver extends ProviderObserver {
  @override
  void providerDidFail(ProviderBase<Object?> provider, Object error, StackTrace stackTrace, ProviderContainer container) {
    handleError(error, stackTrace);
  }
}
