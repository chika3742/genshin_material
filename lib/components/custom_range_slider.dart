import "package:flutter/material.dart";

/// A custom range slider that responds to drag gestures inside the selected range,
/// in addition to the standard thumb interactions.
///
/// This addresses the issue where Flutter's RangeSlider only responds to touches
/// on the thumbs themselves, making it difficult to adjust the range by dragging
/// from inside the selected area.
class CustomRangeSlider extends StatefulWidget {
  CustomRangeSlider({
    super.key,
    required this.values,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.labels,
    this.activeColor,
    this.inactiveColor,
    this.overlayColor,
  })  : assert(min <= max),
        assert(values.start >= min && values.start <= max),
        assert(values.end >= min && values.end <= max),
        assert(values.start <= values.end);

  final RangeValues values;
  final ValueChanged<RangeValues>? onChanged;
  final ValueChanged<RangeValues>? onChangeStart;
  final ValueChanged<RangeValues>? onChangeEnd;
  final double min;
  final double max;
  final int? divisions;
  final RangeLabels? labels;
  final Color? activeColor;
  final Color? inactiveColor;
  final WidgetStateProperty<Color?>? overlayColor;

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  // Track if we're dragging the whole range
  bool _isDraggingRange = false;

  // Initial values when drag started
  RangeValues? _dragStartValues;

  // Initial drag position
  double? _dragStartPosition;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The actual RangeSlider
        RangeSlider(
          values: widget.values,
          onChanged: _isDraggingRange ? null : widget.onChanged,
          onChangeStart: widget.onChangeStart,
          onChangeEnd: widget.onChangeEnd,
          min: widget.min,
          max: widget.max,
          divisions: widget.divisions,
          labels: widget.labels,
          activeColor: widget.activeColor,
          inactiveColor: widget.inactiveColor,
          overlayColor: widget.overlayColor,
        ),
        // Gesture detector for range dragging
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onPanStart: _handlePanStart,
            onPanUpdate: _handlePanUpdate,
            onPanEnd: _handlePanEnd,
            onPanCancel: _handlePanCancel,
          ),
        ),
      ],
    );
  }

  void _handlePanStart(DragStartDetails details) {
    if (widget.onChanged == null) return;

    final box = context.findRenderObject() as RenderBox?;
    if (box == null) return;

    final localPosition = details.localPosition.dx;
    final sliderWidth = box.size.width;

    // Calculate the position as a value between min and max
    final position = _getValueFromPosition(localPosition, sliderWidth);

    // Only start range dragging if the touch is inside the selected range
    // and not too close to the thumbs
    if (_isTouchInsideRange(position)) {
      _isDraggingRange = true;
      _dragStartValues = widget.values;
      _dragStartPosition = position;
      widget.onChangeStart?.call(widget.values);
      setState(() {});
    }
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    if (!_isDraggingRange || widget.onChanged == null || _dragStartValues == null || _dragStartPosition == null) {
      return;
    }

    final box = context.findRenderObject() as RenderBox?;
    if (box == null) return;

    final localPosition = details.localPosition.dx;
    final sliderWidth = box.size.width;
    final currentPosition = _getValueFromPosition(localPosition, sliderWidth);
    final delta = currentPosition - _dragStartPosition!;

    // Move both thumbs together
    var newStart = _dragStartValues!.start + delta;
    var newEnd = _dragStartValues!.end + delta;

    // Constrain to min/max bounds
    final rangeSize = _dragStartValues!.end - _dragStartValues!.start;
    if (newStart < widget.min) {
      newStart = widget.min;
      newEnd = widget.min + rangeSize;
    } else if (newEnd > widget.max) {
      newEnd = widget.max;
      newStart = widget.max - rangeSize;
    }

    var newValues = RangeValues(newStart, newEnd);

    // Apply divisions if specified
    if (widget.divisions != null && widget.divisions! > 0) {
      newValues = _applyDivisions(newValues);
    }

    widget.onChanged!(newValues);
  }

  void _handlePanEnd(DragEndDetails details) {
    if (_isDraggingRange) {
      widget.onChangeEnd?.call(widget.values);
      _isDraggingRange = false;
      _dragStartValues = null;
      _dragStartPosition = null;
      setState(() {});
    }
  }

  void _handlePanCancel() {
    if (_isDraggingRange) {
      _isDraggingRange = false;
      _dragStartValues = null;
      _dragStartPosition = null;
      setState(() {});
    }
  }

  double _getValueFromPosition(double position, double sliderWidth) {
    // Account for padding (standard Material slider has padding)
    const thumbRadius = 10.0;
    final effectiveWidth = sliderWidth - (thumbRadius * 2);
    final effectivePosition = (position - thumbRadius).clamp(0.0, effectiveWidth);

    final ratio = effectivePosition / effectiveWidth;
    return widget.min + (ratio * (widget.max - widget.min));
  }

  bool _isTouchInsideRange(double position) {
    // Calculate threshold based on the range size
    // Use a smaller threshold to avoid interfering with thumb dragging
    final range = widget.max - widget.min;
    final threshold = range * 0.08; // 8% of range as threshold

    // Check if inside the range but not too close to the thumbs
    final insideRange = position > widget.values.start && position < widget.values.end;
    final notNearStart = (position - widget.values.start).abs() > threshold;
    final notNearEnd = (position - widget.values.end).abs() > threshold;

    return insideRange && notNearStart && notNearEnd;
  }

  RangeValues _applyDivisions(RangeValues values) {
    final divisions = widget.divisions!;
    final range = widget.max - widget.min;
    final stepSize = range / divisions;

    final startSteps = ((values.start - widget.min) / stepSize).round();
    final endSteps = ((values.end - widget.min) / stepSize).round();

    final newStart = widget.min + (startSteps * stepSize);
    final newEnd = widget.min + (endSteps * stepSize);

    return RangeValues(
      newStart.clamp(widget.min, widget.max),
      newEnd.clamp(widget.min, widget.max),
    );
  }
}
