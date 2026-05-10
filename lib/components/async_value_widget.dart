import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "center_text.dart";

typedef AsyncDataBuilder<T> = Widget Function(BuildContext context, T data);
typedef AsyncErrorBuilder = Widget Function(BuildContext context, Object error);

class AsyncValueWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final AsyncDataBuilder<T> builder;

  /// Widget to show when the [value] is in loading state. Defaults to centered
  /// [CircularProgressIndicator].
  final Widget? loadingIndicator;

  /// Builder to show a widget when in error state. Defaults to centered error
  /// text.
  final AsyncErrorBuilder? errorBuilder;

  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.builder,
    this.loadingIndicator,
    this.errorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return switch (value) {
      AsyncData(:final value) => builder(context, value),
      AsyncLoading() => loadingIndicator ?? Center(
        child: CircularProgressIndicator(),
      ),
      AsyncError(:final error) => errorBuilder?.call(context, error)
          ?? CenterText(error.toString()),
    };
  }
}
