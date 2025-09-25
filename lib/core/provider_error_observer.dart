import "package:flutter_riverpod/flutter_riverpod.dart";

import "errors.dart";

base class ProviderErrorObserver extends ProviderObserver {
  @override
  void providerDidFail(ProviderObserverContext context, Object error, StackTrace stackTrace) {
    super.providerDidFail(context, error, stackTrace);
    handleError(error, stackTrace);
  }
}
