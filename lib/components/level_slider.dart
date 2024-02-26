import "package:flutter/material.dart";
import "package:material_symbols_icons/symbols.dart";

import "../i18n/strings.g.dart";
import "gapped_flex.dart";

class LevelSlider extends StatelessWidget {
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
                    levels.indexOf(values.start).toDouble(),
                    levels.indexOf(values.end).toDouble(),
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
            _buildSliderLabels(context),
          ],
        ),
        _buildLevelIndicators(context),
      ],
    );
  }

  Padding _buildSliderLabels(BuildContext context) {
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

  Widget _buildLevelIndicators(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GappedRow(
          gap: 4,
          crossAxisAlignment: CrossAxisAlignment.end,
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
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 6.0),
              child: Icon(Symbols.double_arrow),
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
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
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
