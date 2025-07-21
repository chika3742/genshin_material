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

class LevelRangeValues {
  final int start;
  final int end;

  const LevelRangeValues(this.start, this.end);
}

class SliderLabelPainter extends CustomPainter {
  const SliderLabelPainter({required this.ticks, required this.context});

  final List<int> ticks;
  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    final painter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    for (final tick in ticks) {
      final textSpan = TextSpan(
        text: tick.toString(),
        style: Theme.of(context).textTheme.bodyMedium,
      );
      painter.text = textSpan;
      painter.layout();

      final offsetX = (ticks.indexOf(tick) * size.width / (ticks.length - 1)) -
          (painter.width / 2);
      painter.paint(canvas, Offset(offsetX, (size.height - painter.height) / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

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

  static const double _sliderHeight = 32.0;
  static const double _sliderLabelSpacing = 20.0;
  static const double _sliderLabelHorizontalPadding = 24.0;
  static const double _sliderLabelHeight = 24.0;
  static const double _levelIndicatorHorizontalPadding = 16.0;
  static const double _levelIndicatorGap = 4.0;
  static const int _levelFieldMaxLength = 2;
  static const double _levelFieldHorizontalPadding = 8.0;
  static const double _levelFieldVerticalPadding = 4.0;
  static const double _currentLevelFieldFontSize = 24.0;
  static const double _targetLevelFieldFontSize = 34.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: _sliderLabelSpacing),
              child: SizedBox(
                height: _sliderHeight,
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
            Positioned(
              left: _sliderLabelHorizontalPadding,
              right: _sliderLabelHorizontalPadding,
              bottom: 0,
              height: _sliderLabelHeight,
              child: _buildSliderLabels(),
            ),
          ],
        ),
        _buildLevelIndicators(),
      ],
    );
  }

  Widget _buildSliderLabels() {
    return CustomPaint(
      painter: SliderLabelPainter(
        context: useContext(),
        ticks: ticks,
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _levelIndicatorHorizontalPadding),
      child: GappedRow(
        gap: _levelIndicatorGap,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          _buildLevelField(
            controller: currLvController,
            fontSize: _currentLevelFieldFontSize,
            error: currLvError.value,
            onChanged: (value) {
              if (validateCurrentLevel(value)) {
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
              if (!validateCurrentLevel(currLvController.text)) {
                currLvController.text = values.start.toString();
                currLvError.value = false;
              }
            },
          ),
          Transform.translate(
            offset: const Offset(0, 4.0),
            child: const Icon(Symbols.double_arrow),
          ),
          _buildLevelField(
            controller: tgLvController,
            fontSize: _targetLevelFieldFontSize,
            error: tgLvError.value,
            onChanged: (value) {
              if (validateTargetLevel(value)) {
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
              if (!validateTargetLevel(tgLvController.text)) {
                tgLvController.text = values.end.toString();
                tgLvError.value = false;
              }
            },
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

  bool validateCurrentLevel(String value) {
    final parsedNewValue = int.tryParse(value);
    if (parsedNewValue == null) {
      return false;
    }

    final maxLevel = min(levels.last, values.end);

    // current level must not equal to the target level
    if (parsedNewValue >= maxLevel || !levels.contains(parsedNewValue)) {
      return false;
    }
    return true;
  }

  bool validateTargetLevel(String value) {
    final parsedNewValue = int.tryParse(value);
    if (parsedNewValue == null) {
      return false;
    }

    final minLevel = max(levels.first, values.start);

    // target level must not equal to the current level
    if (parsedNewValue <= minLevel || !levels.contains(parsedNewValue)) {
      return false;
    }
    return true;
  }

  Widget _buildLevelField({
    TextEditingController? controller,
    double? fontSize,
    bool error = false,
    ValueChanged<String>? onChanged,
    VoidCallback? onBlur,
  }) {
    final context = useContext();

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

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Lv.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: SizedBox(
              width: textPainter.size.width + _levelFieldHorizontalPadding,
              height: textPainter.size.height + _levelFieldVerticalPadding,
              child: TextField(
                controller: controller,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(_levelFieldMaxLength),
                ],
                style: GoogleFonts.titilliumWeb(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  error: error
                      ? const SizedBox.shrink() // only for changing the field color; don't want to show an error message
                      : null,
                ),
                onChanged: onChanged,
                onTapOutside: (event) {
                  // blur the field when tapping outside
                  focusNode.unfocus();
                  onBlur?.call();
                },
                focusNode: focusNode,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
