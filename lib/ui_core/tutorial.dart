import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:tutorial_coach_mark/tutorial_coach_mark.dart";

import "../i18n/strings.g.dart";
import "../providers/preferences.dart";

void showIndexSheetTutorialIfNeeded(BuildContext context, GlobalKey fabKey, WidgetRef ref) {
  final prefs = ref.read(preferencesStateNotifierProvider);

  if (prefs.indexSheetTutorialShown) {
    return;
  }

  TutorialCoachMark(
    hideSkip: true,
    focusAnimationDuration: Durations.medium3,
    unFocusAnimationDuration: Durations.medium3,

    targets: [
      TargetFocus(
        identify: "index",
        keyTarget: fabKey,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: DefaultTextStyle(
              style: const TextStyle(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tr.tutorial.indexSheet, style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text(tr.tutorial.indexSheetDesc),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
    onFinish: () {
      if (ref.context.mounted) {
        ref.read(preferencesStateNotifierProvider.notifier).setIndexSheetTutorialShown();
      }
    },
  ).show(context: context, rootOverlay: true);
}
