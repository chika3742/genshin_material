import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

/// Exposes an outer [PageController] to descendants so a nested horizontal
/// scrollable can hand off horizontal drags to it at its left edge.
class PageHandoffScope extends InheritedWidget {
  final PageController controller;

  const PageHandoffScope({
    super.key,
    required this.controller,
    required super.child,
  });

  static PageController? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PageHandoffScope>()
        ?.controller;
  }

  @override
  bool updateShouldNotify(PageHandoffScope oldWidget) =>
      controller != oldWidget.controller;
}

/// A horizontal [SingleChildScrollView] that hands off the horizontal drag to
/// [pageController] when the drag begins at the left edge and the user's first
/// decisive movement is rightward.
///
/// A custom [HorizontalDragGestureRecognizer] competes in the gesture arena
/// and accepts early when conditions are met, so the inner [Scrollable] never
/// wins. The drag is then driven through `pageController.position.drag(...)`
/// which produces a real [Drag] tied to a [DragScrollActivity]; this is the
/// same path [Scrollable] uses, so platform physics (Bouncing/Clamping) and
/// [PageScrollPhysics] page-snapping apply naturally.
class PageHandoffHorizontalScroll extends HookWidget {
  final Widget child;
  final PageController pageController;

  const PageHandoffHorizontalScroll({
    super.key,
    required this.child,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final holdRef = useRef<ScrollHoldController?>(null);
    final dragRef = useRef<Drag?>(null);

    final gestures = useMemoized<Map<Type, GestureRecognizerFactory>>(
      () => {
        _LeftEdgePageHandoffRecognizer:
            GestureRecognizerFactoryWithHandlers<
                _LeftEdgePageHandoffRecognizer>(
          () => _LeftEdgePageHandoffRecognizer(
            innerPositionGetter: () => scrollController.hasClients
                ? scrollController.position
                : null,
          ),
          (instance) {
            instance
              ..onDown = (_) {
                if (!pageController.hasClients) return;
                holdRef.value = pageController.position
                    .hold(() => holdRef.value = null);
              }
              ..onStart = (details) {
                if (!pageController.hasClients) {
                  // Theoretical edge case: clients vanished between onDown
                  // and onStart. drag() would normally cancel the hold for
                  // us, so do it explicitly here.
                  holdRef.value?.cancel();
                  holdRef.value = null;
                  return;
                }
                dragRef.value = pageController.position
                    .drag(details, () => dragRef.value = null);
                holdRef.value = null;
              }
              ..onUpdate = (details) {
                dragRef.value?.update(details);
              }
              ..onEnd = (details) {
                dragRef.value?.end(details);
                dragRef.value = null;
              }
              ..onCancel = () {
                holdRef.value?.cancel();
                dragRef.value?.cancel();
                holdRef.value = null;
                dragRef.value = null;
              };
          },
        ),
      },
      [scrollController, pageController],
    );

    return RawGestureDetector(
      behavior: HitTestBehavior.translucent,
      gestures: gestures,
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        child: child,
      ),
    );
  }
}

/// A drag recognizer that accepts the gesture in the pre-touch-slop window
/// when the inner scroll is at its left edge and the user's accumulated
/// movement is clearly horizontal-rightward. This lets the recognizer win the
/// arena over the inner [Scrollable]'s recognizer (which would otherwise have
/// priority by depth) without hijacking vertical drags from an outer
/// [ListView].
class _LeftEdgePageHandoffRecognizer extends HorizontalDragGestureRecognizer {
  /// Movement (in any direction) at which we commit to a decision. Kept well
  /// below `kTouchSlop` (18) so we resolve before the inner recognizer can.
  static const double _decisionThreshold = 5.0;

  final ScrollPosition? Function() innerPositionGetter;
  bool _decided = false;
  Offset _accumulated = Offset.zero;

  _LeftEdgePageHandoffRecognizer({required this.innerPositionGetter});

  @override
  void addAllowedPointer(PointerDownEvent event) {
    _decided = false;
    _accumulated = Offset.zero;
    super.addAllowedPointer(event);
  }

  @override
  void handleEvent(PointerEvent event) {
    if (!_decided && event is PointerMoveEvent) {
      _accumulated += event.delta;
      final absDx = _accumulated.dx.abs();
      final absDy = _accumulated.dy.abs();
      if (absDx > _decisionThreshold || absDy > _decisionThreshold) {
        _decided = true;
        final position = innerPositionGetter();
        final atLeftEdge = position != null
            && position.pixels <= position.minScrollExtent + 1.0; // 1px tolerance for sub-pixel/floating-point imprecision
        final clearlyHorizontalRightward =
            absDx > absDy && _accumulated.dx > 0;
        if (clearlyHorizontalRightward && atLeftEdge) {
          resolve(GestureDisposition.accepted);
        } else {
          // Drop out of the arena and the pointer router so the inner
          // Scrollable / outer ListView can take the gesture cleanly.
          resolve(GestureDisposition.rejected);
          stopTrackingPointer(event.pointer);
          return;
        }
      }
    }
    super.handleEvent(event);
  }
}
