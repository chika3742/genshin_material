import "dart:math";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:google_fonts/google_fonts.dart";
import "package:material_symbols_icons/symbols.dart";

import "../i18n/strings.g.dart";
import "../ui_core/bubble.dart";
import "../ui_core/layout.dart";
import "../utils/lists.dart";

class LevelSlider extends HookWidget {
  final List<int> levels;
  final List<int> ticks;
  final LevelRangeValues values;
  final void Function(LevelRangeValues values)? onChanged;

  const LevelSlider({
    super.key,
    required this.levels,
    required this.ticks,
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
                    ticks.indexOfCeilToNearest(values.start).toDouble(),
                    ticks.indexOfCeilToNearest(values.end).toDouble(),
                  ),
                  min: 0,
                  max: ticks.length - 1,
                  divisions: ticks.length - 1,
                  labels: RangeLabels(
                      "${tr.common.currentLevel}: ${values.start}",
                      "${tr.common.goalLevel}: ${values.end}"),
                  onChanged: (values) {
                    onChanged?.call(
                      LevelRangeValues(
                        ticks[values.start.toInt()],
                        ticks[values.end.toInt()],
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
        children: ticks.map((e) {
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
    final currLvController =
        useTextEditingController(text: values.start.toString());
    final tgLvController =
        useTextEditingController(text: values.end.toString());
    final currLvError = useState(false);
    final tgLvError = useState(false);

    useEffect(() {
      currLvController.text = values.start.toString();
      tgLvController.text = values.end.toString();
      return null;
    }, [values.start, values.end]);

    bool validateValue(bool current, String value) {
      final parsedNewValue = int.tryParse(value);
      if (parsedNewValue == null) {
        return false;
      }

      final minOrMax = current
          ? min(levels.last, values.end)
          : max(levels.first, values.start);

      if ((current && parsedNewValue >= minOrMax) ||
          (!current && parsedNewValue <= minOrMax)) {
        return false;
      }
      if (!levels.contains(parsedNewValue)) {
        return false;
      }
      return true;
    }

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
                WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: _buildLevelField(
                    controller: currLvController,
                    fontSize: 24,
                    error: currLvError.value,
                    onChanged: (value) {
                      if (validateValue(true, value)) {
                        currLvError.value = false;
                        onChanged?.call(LevelRangeValues(
                          int.tryParse(value) ?? values.start,
                          values.end,
                        ));
                      } else {
                        currLvError.value = true;
                      }
                    },
                    onBlur: () {
                      // reset value to the last valid value if current value is
                      // invalid
                      if (!validateValue(true, currLvController.text)) {
                        currLvController.text = values.start.toString();
                        currLvError.value = false;
                      }
                    },
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
                WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: _buildLevelField(
                    controller: tgLvController,
                    fontSize: 34,
                    error: tgLvError.value,
                    onChanged: (value) {
                      if (validateValue(false, value)) {
                        tgLvError.value = false;
                        onChanged?.call(LevelRangeValues(
                          values.start,
                          int.tryParse(value) ?? values.end,
                        ));
                      } else {
                        tgLvError.value = true;
                      }
                    },
                    onBlur: () {
                      // reset value to the last valid value if current value is
                      // invalid
                      if (!validateValue(false, tgLvController.text)) {
                        tgLvController.text = values.end.toString();
                        tgLvError.value = false;
                      }
                    },
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

  Widget _buildLevelField({
    TextEditingController? controller,
    double? fontSize,
    bool error = false,
    ValueChanged<String>? onChanged,
    VoidCallback? onBlur,
  }) {
    // calculate text size to adjust the field size
    final textPainter = TextPainter(
      text: TextSpan(
        text: "00",
        style: GoogleFonts.titilliumWeb(
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
    )..layout(
        minWidth: 0,
        maxWidth: 150,
      );

    final focusNode = useMemoized(() {
      final focusNode = FocusNode();
      focusNode.addListener(() {
        // select all text when the field is focused
        if (focusNode.hasFocus) {
          controller?.selection = TextSelection(
            baseOffset: 0,
            extentOffset: controller.text.length,
          );
        }
      });
      return focusNode;
    });

    return SizedBox(
      width: textPainter.size.width + 8,
      height: textPainter.size.height + 4,
      child: TextField(
        controller: controller,
        inputFormatters: [
          LengthLimitingTextInputFormatter(2),
        ],
        style: GoogleFonts.titilliumWeb(
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          error: error ? SizedBox() : null,
        ),
        onChanged: onChanged,
        onTapOutside: (event) {
          // blur the field when tapping outside
          focusNode.unfocus();
          onBlur?.call();
        },
        focusNode: focusNode,
      ),
    );
  }
}

class LevelRangeValues {
  final int start;
  final int end;

  const LevelRangeValues(this.start, this.end);
}
