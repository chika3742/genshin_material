import "package:flutter/widgets.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class _ScrollToTopHandler extends WidgetsBindingObserver {
  final ScrollController scrollController;

  _ScrollToTopHandler(this.scrollController);

  @override
  void handleStatusBarTap() {
    super.handleStatusBarTap();
    scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeOutExpo,
    );
  }
}

void useScrollToTopOnStatusBarTap(ScrollController scrollController) {
  final scrollToTopHandler = useMemoized(() => _ScrollToTopHandler(scrollController));
  useEffect(() {
    WidgetsBinding.instance.addObserver(scrollToTopHandler);

    return () {
      WidgetsBinding.instance.removeObserver(scrollToTopHandler);
    };
  });
}
