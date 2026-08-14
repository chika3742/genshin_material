import "package:flutter/widgets.dart";
import "package:flutter_hooks/flutter_hooks.dart";

(AsyncSnapshot<T> snapshot, void Function() refresh) useRefreshableFuture<T>(Future<T> Function() fetch) {
  final refreshKey = useState(0);
  final future = useMemoized(fetch, [refreshKey.value]);
  final snapshot = useFuture(future);
  void refresh() {
    refreshKey.value++;
  }

  return (snapshot, refresh);
}
