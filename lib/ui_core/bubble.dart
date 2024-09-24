import "package:animations/animations.dart";
import "package:flutter/material.dart";

Future<T?> showModalBubbleText<T>({
  required BuildContext context,
  required GlobalKey targetKey,
  required String text,
  Color? color,
}) {
  return showModalBubble<T>(
    context: context,
    targetKey: targetKey,
    color: color,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(text),
    ),
  );
}

Future<T?> showModalBubble<T>({
  required BuildContext context,
  required GlobalKey targetKey,
  required Widget child,
  Color? color,
}) {
  assert(targetKey.currentContext != null, "The targetKey must have a context.");

  final renderBox = targetKey.currentContext!.findRenderObject() as RenderBox;
  final widgetPos = renderBox.localToGlobal(Offset.zero);

  return showModal<T>(
    context: context,
    configuration: FadeSlideTransitionConfiguration(barrierColor: Colors.black54.withOpacity(0.2)),
    builder: (context) {
      return Bubble(
        targetPos: widgetPos,
        targetSize: renderBox.size,
        color: color,
        child: child,
      );
    },
  );
}


class Bubble extends StatelessWidget {
  final Offset targetPos;
  final Size targetSize;
  final Color? color;
  final Widget? child;

  const Bubble({
    super.key,
    required this.targetPos,
    required this.targetSize,
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 8,
          top: targetPos.dy + targetSize.height
              - MediaQueryData.fromView(View.of(context)).padding.top, // safe area insets before consumption
          child: Material(
            type: MaterialType.transparency,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 16,
              ),
              child: Container(
                decoration: ShapeDecoration(
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  color: color ?? Theme.of(context).colorScheme.surfaceContainerHighest,
                  shape: BubbleShapeBorder(
                    tailPosition: targetPos.dx + targetSize.width / 2,
                  ),
                ),
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class BubbleShapeBorder extends ShapeBorder {
  static const bubbleTailHeight = 12.0;

  /// The position of the tail, absolute pixel x value.
  final double tailPosition;

  const BubbleShapeBorder({required this.tailPosition});

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.only(top: bubbleTailHeight);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final containerRect = Rect.fromPoints(
      rect.topLeft + const Offset(0, bubbleTailHeight),
      rect.bottomRight,
    );
    final tailPos = Offset(
      tailPosition,
      rect.top,
    );
    return Path()
      ..addRRect(RRect.fromRectAndRadius(containerRect, const Radius.circular(8)))
      ..moveTo(tailPos.dx - bubbleTailHeight / 2, tailPos.dy + bubbleTailHeight)
      ..relativeLineTo(bubbleTailHeight / 2, -bubbleTailHeight)
      ..relativeLineTo(bubbleTailHeight / 2, bubbleTailHeight)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}


class FadeSlideTransitionConfiguration extends ModalConfiguration {
  const FadeSlideTransitionConfiguration({
    super.barrierColor = Colors.black54,
    super.barrierDismissible = true,
    super.transitionDuration = const Duration(milliseconds: 75),
    super.reverseTransitionDuration = const Duration(milliseconds: 75),
    String super.barrierLabel = "Dismiss",
  });

  @override
  Widget transitionBuilder(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -0.01),
          end: const Offset(0, 0),
        ).animate(animation),
        child: child,
      ),
    );
  }
}
