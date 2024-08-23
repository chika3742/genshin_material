import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class ScrollBlurEffect extends HookWidget {
  final Widget child;
  final ScrollController scrollController;
  final double maxBlurHeight;

  const ScrollBlurEffect({super.key, required this.scrollController, required this.child, this.maxBlurHeight = 100});

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
    }, [blurHeightFactor.value],);

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
                Colors.white.withOpacity(0),
              ],
              stops: [0.0, 1 - ((maxBlurHeight / constraints.maxHeight) * blurHeightFactor.value), 1.0],
            ).createShader(bounds);
          },
          child: child,
        );
      },
    );
  }

  void updateBlurHeight(ValueNotifier<double> blurHeightFactor) {
    final offset = scrollController.offset;
    blurHeightFactor.value = ((scrollController.position.maxScrollExtent - offset) / maxBlurHeight).clamp(0.0, 1.0);
  }
}
