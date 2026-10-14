import "dart:math";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:google_fonts/google_fonts.dart";
import "package:material_symbols_icons/symbols.dart";

import "../i18n/strings.g.dart";
import "../models/level_range_values.dart";
import "../utils/lists.dart";
import "custom_range_slider.dart";
import "labeled_check_box.dart";

/// The x where a discrete [RangeSlider] centers a thumb at [index], measured
/// from the start of the track inset. It insets the thumbs by half the track
/// height on each side.
double _thumbX(BuildContext context, double index, int tickCount, double width) {
  final trackHeight = SliderTheme.of(context).trackHeight ?? LevelSlider._defaultSliderTrackHeight;
  return trackHeight / 2 + index / (tickCount - 1) * (width - trackHeight);
}

class _SliderLabelPainter extends CustomPainter {
  const _SliderLabelPainter({required this.ticks, required this.context});

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

      final offsetX = _thumbX(context, ticks.indexOf(tick).toDouble(), ticks.length, size.width) -
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
  final bool active;
  final ValueChanged<bool>? onActiveChanged;
  final Widget? label;
  final void Function(LevelRangeValues values)? onChanged;

  /// The in-game level from HoYoLAB sync, marked on the track. `null` hides the mark.
  final int? syncedLevel;

  /// Keeps the space for the [syncedLevel] mark even while it is `null`, so
  /// the layout does not shift when the level arrives.
  final bool reserveSyncedLevelSpace;

  const LevelSlider({
    super.key,
    required this.levels,
    required this.ticks,
    required this.values,
    this.active = true,
    this.onActiveChanged,
    this.label,
    this.onChanged,
    this.syncedLevel,
    this.reserveSyncedLevelSpace = false,
  });

  @visibleForTesting
  static const syncedLevelIndicatorKey = Key("syncedLevelIndicator");

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
  static const double _syncedLevelLabelHeight = 16.0;
  static const double _syncedLevelMarkerSize = 12.0;
  static const double _syncedLevelMarkerBorderWidth = 2.0;
  /// The track height of [RangeSlider] when the theme sets none, with
  /// `year2023: true` (the default).
  ///
  /// When switching to the 2024 Material 3 style (`year2023: false`):
  /// - change this to 16, and `xOfTickIndex` in `level_slider_test.dart` to match.
  /// - set `SliderThemeData.thumbSize` to a height of 32 or less. The default
  ///   handle height of 44 overflows the slider onto the synced level label.
  static const double _defaultSliderTrackHeight = 4.0;

  @override
  Widget build(BuildContext context) {
    final syncedLevelPosition = _syncedLevelPosition();

    return _buildContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: reserveSyncedLevelSpace || syncedLevelPosition != null ? _syncedLevelLabelHeight : 0,
                  bottom: _sliderLabelSpacing,
                ),
                child: SizedBox(
                  height: _sliderHeight,
                  child: CustomRangeSlider(
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
                      if (values.start == values.end) return;
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
              if (syncedLevelPosition != null)
                Positioned(
                  left: _sliderLabelHorizontalPadding,
                  right: _sliderLabelHorizontalPadding,
                  top: 0,
                  height: _syncedLevelLabelHeight + _sliderHeight,
                  // drawn over the thumbs, so let the touches through to them
                  child: IgnorePointer(
                    child: _buildSyncedLevelIndicator(syncedLevelPosition),
                  ),
                ),
            ],
          ),
          _buildLevelIndicators(),
        ],
      ),
    );
  }

  /// [syncedLevel] as a fractional index into [ticks], or `null` if it is
  /// unset or out of their range.
  double? _syncedLevelPosition() {
    final level = syncedLevel;
    if (level == null || level < ticks.first) return null;

    final index = ticks.indexOfCeilToNearest(level);
    if (index < 0) return null;
    if (ticks[index] == level) return index.toDouble();

    // interpolate linearly between the neighboring ticks
    return index - 1 + (level - ticks[index - 1]) / (ticks[index] - ticks[index - 1]);
  }

  Widget _buildSyncedLevelIndicator(double position) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final colorScheme = Theme.of(context).colorScheme;
        // inverseSurface contrasts with both the primary-colored thumbs and
        // active track and the pale inactive track
        final color = colorScheme.inverseSurface;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: _thumbX(context, position, ticks.length, constraints.maxWidth),
              top: 0,
              child: FractionalTranslation(
                translation: const Offset(-0.5, 0),
                child: Column(
                  key: syncedLevelIndicatorKey,
                  children: [
                    SizedBox(
                      height: _syncedLevelLabelHeight,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Lv.$syncedLevel",
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color),
                        ),
                      ),
                    ),
                    // centered on the track
                    SizedBox(
                      height: _sliderHeight,
                      child: Center(
                        child: Transform.rotate(
                          angle: pi / 4,
                          child: SizedBox.square(
                            dimension: _syncedLevelMarkerSize,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: color,
                                // separates the marker from a thumb beneath it
                                border: Border.all(
                                  color: colorScheme.surface,
                                  width: _syncedLevelMarkerBorderWidth,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContainer({required Widget child}) {
    return Card(
      margin: .zero,
      child: Padding(
        padding: .all(8.0),
        child: label != null ? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LabeledCheckBox(
              value: active,
              onChanged: onActiveChanged != null ? (value) {
                onActiveChanged!(value!);
              } : null,
              child: Expanded(
                child: label!,
              ),
            ),
            AnimatedCrossFade( // resize animation
              crossFadeState: active ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
              firstCurve: Curves.easeOutQuint,
              secondCurve: Curves.easeOutQuint,
              sizeCurve: Curves.easeOutQuint,
              firstChild: SizedBox.shrink(),
              secondChild: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: child,
              ),
            ),
          ],
        ) : child,
      ),
    );
  }

  Widget _buildSliderLabels() {
    return CustomPaint(
      painter: _SliderLabelPainter(
        context: useContext(),
        ticks: ticks,
      ),
    );
  }

  Widget _buildLevelIndicators() {
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
      child: Row(
        spacing: _levelIndicatorGap,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          _buildLevelField(
            controller: currLvController,
            fontSize: _currentLevelFieldFontSize,
            error: currLvError.value,
            onChanged: (value) {
              if (_validateCurrentLevel(value)) {
                currLvError.value = false;
                onChanged?.call(LevelRangeValues(
                  int.parse(value),
                  values.end,
                ));
              } else {
                currLvError.value = true;
              }
            },
            onBlur: () {
              // reset value to the last valid value if current value is
              // invalid
              if (!_validateCurrentLevel(currLvController.text)) {
                // reset level to the last valid value
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
              if (_validateTargetLevel(value)) {
                tgLvError.value = false;
                onChanged?.call(LevelRangeValues(
                  values.start,
                  int.parse(value),
                ));
              } else {
                tgLvError.value = true;
              }
            },
            onBlur: () {
              // reset value to the last valid value if current value is
              // invalid
              if (!_validateTargetLevel(tgLvController.text)) {
                // reset level to the last valid value
                tgLvController.text = values.end.toString();
                tgLvError.value = false;
              }
            },
          ),
        ],
      ),
    );
  }

  bool _isValidLevel(int level) {
    return ticks.contains(level) || levels.contains(level);
  }

  bool _validateCurrentLevel(String value) {
    final parsedNewValue = int.tryParse(value);
    if (parsedNewValue == null) {
      return false;
    }

    final maxLevel = min(levels.last, values.end);

    // current level must not be greater than the target level
    if (parsedNewValue >= maxLevel || !_isValidLevel(parsedNewValue)) {
      return false;
    }
    return true;
  }

  bool _validateTargetLevel(String value) {
    final parsedNewValue = int.tryParse(value);
    if (parsedNewValue == null) {
      return false;
    }

    final minLevel = max(levels.first, values.start);

    // target level must not be less than or equal to the current level
    if (parsedNewValue <= minLevel || !_isValidLevel(parsedNewValue)) {
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

    final focusNode = useFocusNode();
    final lastListener = useRef<VoidCallback?>(null);
    useEffect(() {
      if (lastListener.value != null) {
        focusNode.removeListener(lastListener.value!);
      }
      lastListener.value = () {
        if (focusNode.hasFocus) {
          // select all text when the field is focused
          controller?.selection = TextSelection(
            baseOffset: 0,
            extentOffset: controller.text.length,
          );
        } else {
          onBlur?.call();
        }
      };
      focusNode.addListener(lastListener.value!);
      return null;
    }, [controller, onBlur]);

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
                keyboardType: TextInputType.number,
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
