import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:google_fonts/google_fonts.dart";
import "package:material_symbols_icons/symbols.dart";

import "../i18n/strings.g.dart";
import "../ui_core/bubble.dart";
import "../ui_core/layout.dart";
import "../utils/lists.dart";

class LevelSlider extends HookWidget {
  final List<int> levels;
  final LevelRangeValues values;
  final void Function(LevelRangeValues values)? onChanged;

  const LevelSlider({
    super.key,
    required this.levels,
    required this.values,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                height: 32,
                child: RangeSlider(
                  values: RangeValues(
                    levels.indexOfCeilToNearest(values.start).toDouble(),
                    levels.indexOfCeilToNearest(values.end).toDouble(),
                  ),
                  min: 0,
                  max: levels.length - 1,
                  divisions: levels.length - 1,
                  labels: RangeLabels("${tr.common.currentLevel}: ${values.start}", "${tr.common.goalLevel}: ${values.end}"),
                  onChanged: (values) {
                    onChanged?.call(
                      LevelRangeValues(
                        levels[values.start.toInt()],
                        levels[values.end.toInt()],
                      ),
                    );
                  },
                ),
              ),
            ),
            _buildSliderLabels(),
          ],
        ),
        _buildLevelIndicators(),
      ],
    );
  }

  Padding _buildSliderLabels() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: levels.map((e) {
            return SizedBox(
              width: 24,
              child: Text(
                e.toString(),
                textAlign: TextAlign.center,
              ),
            );
          }).toList(growable: false),
        ),
      );
  }

  Widget _buildLevelIndicators() {
    final context = useContext();
    final helpButtonKey = useMemoized(() => GlobalKey());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GappedRow(
          gap: 4,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Lv.",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: values.start.toString(),
                    style: GoogleFonts.titilliumWeb(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: const Offset(0, 4),
              child: const Icon(Symbols.double_arrow),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Lv.",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: values.end.toString(),
                    style: GoogleFonts.titilliumWeb(
                      fontSize: 34,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              key: helpButtonKey,
              icon: const Icon(Symbols.help),
              onPressed: () {
                showModalBubbleText(
                  context: context,
                  targetKey: helpButtonKey,
                  text: tr.common.sliderTips,
                );
              },
            ),
          ],
        ),
    );
  }
}

class LevelRangeValues {
  final int start;
  final int end;

  const LevelRangeValues(this.start, this.end);
}
