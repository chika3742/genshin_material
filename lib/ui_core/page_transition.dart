import "package:animations/animations.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

Page buildTransitionedPage({
  required BuildContext context,
  required Widget child,
}) {
  return switch (Theme.of(context).platform) {
    TargetPlatform.iOS || TargetPlatform.macOS => MaterialPage(child: child),
    _ => CustomTransitionPage(
      child: child,
      barrierColor: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SharedAxisTransition(
          transitionType: SharedAxisTransitionType.horizontal,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
    ),
  };
}

Route<T> adaptiveRoute<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool fullscreenDialog = false,
}) {
  return switch (Theme.of(context).platform) {
    TargetPlatform.iOS || TargetPlatform.macOS => CupertinoPageRoute<T>(
      builder: builder,
      fullscreenDialog: fullscreenDialog,
    ),
    _ => MaterialPageRoute<T>(
      builder: builder,
      fullscreenDialog: fullscreenDialog,
    ),
  };
}
