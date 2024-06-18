import "package:animations/animations.dart";
import "package:flutter/material.dart";

void showModalLoading(BuildContext context) {
  showModal(
    context: context,
    useRootNavigator: true,
    builder: (context) {
      return Center(
        child: CircularProgressIndicator(
          color: ColorScheme.fromSeed(seedColor: Colors.orange).surface,
        ),
      );
    },
  );
}
