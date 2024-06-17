import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class AnimatedLinearProgressIndicator extends HookWidget {
  final bool show;
  final double? value;
  final double height;
  final Duration duration;
  final Curve curve;

  const AnimatedLinearProgressIndicator({
    super.key,
    this.show = true,
    this.value,
    this.height = 4,
    this.duration = Durations.medium3,
    this.curve = Easing.emphasizedDecelerate,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: show ? height : 0, end: show ? height : 0),
      duration: duration,
      curve: curve,
      builder: (context, height, child) {
        return SizedBox(
          height: height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: LinearProgressIndicator(value: value, borderRadius: BorderRadius.circular(2)),
          ),
        );
      },
    );
  }
}

class SmallCircularProgressIndicator extends StatelessWidget {
  const SmallCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 28,
      height: 28,
      child: CircularProgressIndicator(),
    );
  }
}

