import "package:flutter_riverpod/flutter_riverpod.dart";

import "../data/services/crashlytics_service.dart";
import "errors.dart";

final class ProviderErrorObserver extends ProviderObserver {
  @override
  void providerDidFail(ProviderObserverContext context, Object error, StackTrace stackTrace) {
    super.providerDidFail(context, error, stackTrace);
    handleError(error, stackTrace);

    context.container
        .read(crashlyticsServiceProvider)
        .reportIfNonSilent(error, stackTrace);
  }
}
