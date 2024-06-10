import "package:animations/animations.dart";
import "package:flutter/material.dart";

void showModalLoading(BuildContext context) {
  showModal(context: context, builder: (_) => const Center(child: CircularProgressIndicator()));
}
