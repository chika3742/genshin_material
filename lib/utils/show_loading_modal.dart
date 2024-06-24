import "package:animations/animations.dart";
import "package:flutter/material.dart";

void showLoadingModal(BuildContext context) {
  showModal(
    context: context,
    useRootNavigator: true,
    builder: (context) {
      return PopScope(
        canPop: false,
        child: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      );
    },
  );
}
