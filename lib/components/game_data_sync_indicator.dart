import "package:animations/animations.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../i18n/strings.g.dart";


class GameDataSyncIndicator extends HookWidget {
  final GameDataSyncStatus status;

  const GameDataSyncIndicator({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final iconKey = useMemoized(() => GlobalKey(), [status]);

    return Row(
      children: [
        Icon(Symbols.sync, size: 20, color: Theme.of(context).colorScheme.secondary),
        const SizedBox(width: 4),
        SizedBox(
          width: 22,
          height: 22,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Easing.standardDecelerate,
            switchOutCurve: Easing.standardAccelerate,
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              );
            },
            child: status == GameDataSyncStatus.syncing
                ? _buildProgressIndicator()
                : _buildStatusIcon(iconKey, context),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressIndicator() {
    return const Padding(
      padding: EdgeInsets.all(4.0),
      child: CircularProgressIndicator(
        strokeWidth: 2,
      ),
    );
  }

  Widget _buildStatusIcon(GlobalKey key, BuildContext context) {
    final icon = switch (status) {
      GameDataSyncStatus.synced => Symbols.check,
      GameDataSyncStatus.error => Symbols.error,
      GameDataSyncStatus.characterNotExists => Symbols.person_alert,
      GameDataSyncStatus.mustBeResonatedWithStatue => Symbols.warning,
      _ => throw "Invalid status: $status",
    };
    return GestureDetector(
      onTap: () {
      final message = switch (status) {
          GameDataSyncStatus.synced => tr.hoyolab.charaSyncSuccess,
          GameDataSyncStatus.characterNotExists => tr.hoyolab.characterDoesNotExist,
          GameDataSyncStatus.mustBeResonatedWithStatue => tr.hoyolab.mustBeResonatedWithStatue,
          _ => tr.hoyolab.failedToSyncGameData,
        };

        final renderBox = key.currentContext!.findRenderObject() as RenderBox;
        final widgetPos = renderBox.localToGlobal(Offset.zero);

        showModal(
          context: context,
          configuration: FadeSlideTransitionConfiguration(barrierColor: Colors.black54.withOpacity(0.2)),
          builder: (context) {
            return Stack(
              children: [
                Positioned(
                  right: 8,
                  top: widgetPos.dy + renderBox.size.height
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
                          color: status == GameDataSyncStatus.synced
                              ? Theme.of(context).colorScheme.surfaceContainerHighest
                              : Theme.of(context).colorScheme.errorContainer,
                          shape: BubbleShapeBorder(
                            tailPosition: widgetPos.dx + renderBox.size.width / 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          child: Text(message),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Icon(icon, key: key, size: 22, color: Theme.of(context).colorScheme.primary),
    );
  }
}

enum GameDataSyncStatus {
  syncing,
  synced,
  error,
  characterNotExists,
  mustBeResonatedWithStatue,
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
