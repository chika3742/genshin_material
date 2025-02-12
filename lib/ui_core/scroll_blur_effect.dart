import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class ScrollBlurEffect extends HookWidget {
  final Widget child;
  final ScrollController scrollController;

  /// The maximum blur height as a fraction of the total height.
  /// Acceptable values are between 0 and 1.
  final double maxBlurHeight;

  /// The height from the bottom of the screen where the blur effect will start to fade.
  final double blurFadeHeight;

  const ScrollBlurEffect({
    super.key,
    required this.scrollController,
    required this.child,
    this.maxBlurHeight = 0.15,
    this.blurFadeHeight = 80.0,
  })  : assert(maxBlurHeight >= 0.0 && maxBlurHeight <= 1.0),
        assert(blurFadeHeight >= 0);

  @override
  Widget build(BuildContext context) {
    final blurHeightFactor = useState(1.0);

    useEffect(() {
      void onScroll() {
        updateBlurHeight(blurHeightFactor);
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        updateBlurHeight(blurHeightFactor);
      });
      scrollController.addListener(onScroll);
      return () {
        scrollController.removeListener(onScroll);
      };
    }, [],);

    return LayoutBuilder(
      builder: (context, constraints) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white,
                Colors.white.withValues(alpha: 0),
              ],
              stops: [0.0, 1 - (maxBlurHeight * blurHeightFactor.value), 1.0],
            ).createShader(bounds);
          },
          child: NotificationListener<SizeChangedLayoutNotification>(
            onNotification: (notification) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                updateBlurHeight(blurHeightFactor);
              });
              return false;
            },
            child: child,
          ),
        );
      },
    );
  }

  void updateBlurHeight(ValueNotifier<double> blurHeightFactor) {
    final offset = scrollController.offset;
    blurHeightFactor.value = ((scrollController.position.maxScrollExtent - offset) / blurFadeHeight).clamp(0.0, 1.0);
  }
}
