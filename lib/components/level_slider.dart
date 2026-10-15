import "dart:math";

import "package:flutter/foundation.dart";
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

/// The x where a continuous [RangeSlider] centers a thumb at [index], measured
/// from the start of the track.
double _thumbX(double index, int tickCount, double width) => index / (tickCount - 1) * width;

/// Paints a tick mark per division on the track, which [RangeSlider] itself
/// only does while discrete, i.e. while it rounds the thumbs onto the ticks.
///
/// When switching to the 2024 Material 3 style (`year2023: false`):
/// - extend [GappedRangeSliderTrackShape] instead, the default of that style.
/// - set `SliderThemeData.thumbSize` to a height of 32 or less. The default
///   handle height of 44 overflows the slider onto the synced level label.
class _TickedRangeSliderTrackShape extends RoundedRectRangeSliderTrackShape {
  const _TickedRangeSliderTrackShape(this.divisions);

  final int divisions;

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset startThumbCenter,
    required Offset endThumbCenter,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
    double additionalActiveTrackHeight = 2,
  }) {
    super.paint(
      context,
      offset,
      parentBox: parentBox,
      sliderTheme: sliderTheme,
      enableAnimation: enableAnimation,
      startThumbCenter: startThumbCenter,
      endThumbCenter: endThumbCenter,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
      textDirection: textDirection,
      additionalActiveTrackHeight: additionalActiveTrackHeight,
    );

    final trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    for (var i = 0; i <= divisions; i++) {
      sliderTheme.rangeTickMarkShape!.paint(
        context,
        Offset(trackRect.left + _thumbX(i.toDouble(), divisions + 1, trackRect.width), trackRect.center.dy),
        parentBox: parentBox,
        sliderTheme: sliderTheme,
        enableAnimation: enableAnimation,
        startThumbCenter: startThumbCenter,
        endThumbCenter: endThumbCenter,
        isEnabled: isEnabled,
        textDirection: textDirection,
      );
    }
  }
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

      final offsetX = _thumbX(ticks.indexOf(tick).toDouble(), ticks.length, size.width) -
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
  /// The time a thumb takes to slide to a new value, a Material 3 motion token
  /// in place of the animation a discrete [RangeSlider] would run.
  static const Duration _thumbAnimationDuration = Durations.short2;

  @override
  Widget build(BuildContext context) {
    final syncedLevelPosition = syncedLevel != null ? _positionOf(syncedLevel!) : null;
    final startPosition = _positionOf(values.start)!;
    final endPosition = _positionOf(values.end)!;

    // RangeSlider animates the thumbs only while discrete, which rounds them
    // onto the ticks, so they are animated here instead
    final positionController = useAnimationController(duration: _thumbAnimationDuration);
    final startTween = useRef(Tween(begin: startPosition, end: startPosition));
    final endTween = useRef(Tween(begin: endPosition, end: endPosition));
    final t = Easing.standard.transform(useAnimation(positionController));
    final shownStart = startTween.value.transform(t);
    final shownEnd = endTween.value.transform(t);
    useValueChanged<(double, double), void>((startPosition, endPosition), (_, _) {
      // from where the thumbs are shown, should they be retargeted mid-way
      startTween.value = Tween(begin: shownStart, end: startPosition);
      endTween.value = Tween(begin: shownEnd, end: endPosition);
      positionController.forward(from: 0);
    });

    final sliderKey = useMemoized(GlobalKey.new);
    // a semantic action moves a thumb by less than a tick, so only a pointer rounds
    final isDragging = useRef(false);
    // the slider reports where the pointer went down as the first change
    final isTouchDown = useRef(false);

    /// Snaps [value] reported for the thumb shown at [shown], on its way to
    /// [position] of [level].
    int snap(double value, double shown, double position, int level, {required bool isTouchDown}) {
      final distance = (value - shown).abs();
      // the thumb left in place keeps its level, even one between ticks
      if (distance < precisionErrorTolerance) return level;
      // So does a thumb between ticks only touched, within a touch radius of
      // our own; RangeSlider grabs the nearest thumb wherever the touch is.
      // A thumb on a tick needs none, as the touch rounds back onto it unless
      // it is nearer to the next tick. The track is inset by the overlay
      // radius, as are the tick labels.
      if (isTouchDown && position != position.roundToDouble()) {
        final trackWidth = sliderKey.currentContext!.size!.width - _sliderLabelHorizontalPadding * 2;
        if (distance / (ticks.length - 1) * trackWidth < kMinInteractiveDimension / 2) return level;
      }
      // A pointer lands on the nearest tick. A semantic action steps to the
      // next one from where the thumb is headed, which a sliding thumb may
      // not have reached yet, and past which no tick may lie.
      return ticks[isDragging.value
          ? value.round()
          : (value > shown ? position.floor() + 1 : position.ceil() - 1).clamp(0, ticks.length - 1)];
    }

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
                  // continuous, since a discrete slider rounds the thumbs of
                  // levels between ticks onto them; the ticks come from the
                  // track shape and the snapping from onChanged instead
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      rangeTrackShape: _TickedRangeSliderTrackShape(ticks.length - 1),
                      showValueIndicator: ShowValueIndicator.onDrag,
                    ),
                    child: CustomRangeSlider(
                      key: sliderKey,
                      values: RangeValues(shownStart, shownEnd),
                      min: 0,
                      max: ticks.length - 1,
                      labels: RangeLabels(
                          "${tr.common.currentLevel}: ${values.start}",
                          "${tr.common.goalLevel}: ${values.end}"),
                      onChangeStart: (_) => isDragging.value = isTouchDown.value = true,
                      onChangeEnd: (_) => isDragging.value = isTouchDown.value = false,
                      onChanged: (newValues) {
                        final touchDown = isTouchDown.value;
                        isTouchDown.value = false;
                        final start =
                            snap(newValues.start, shownStart, startPosition, values.start, isTouchDown: touchDown);
                        final end = snap(newValues.end, shownEnd, endPosition, values.end, isTouchDown: touchDown);
                        if (start >= end || (start == values.start && end == values.end)) return;
                        onChanged?.call(LevelRangeValues(start, end));
                      },
                    ),
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

  /// [level] as a fractional index into [ticks], or `null` if it is out of
  /// their range.
  double? _positionOf(int level) {
    if (level < ticks.first) return null;

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
              left: _thumbX(position, ticks.length, constraints.maxWidth),
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
