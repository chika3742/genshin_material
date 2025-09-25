import "package:collection/collection.dart";
import "package:freezed_annotation/freezed_annotation.dart";

import "localized_text.dart";

part "drop_rates.g.dart";
part "drop_rates.freezed.dart";

@freezed
sealed class DropRateEntry with _$DropRateEntry {
  const DropRateEntry._();

  const factory DropRateEntry({
    required LocalizedText description,
    LocalizedText? note,
    required DropRateTarget target,
    required List<DropRate> originalRate,
    required bool condensedAvailable,
  }) = _DropRateEntry;

  factory DropRateEntry.fromJson(Map<String, dynamic> json) =>
      _$DropRateEntryFromJson(json);

  double? getDropRateForAR(int ar) {
    return originalRate.lastWhereOrNull((e) => e.lowerAR <= ar)?.rate;
  }
}

@freezed
sealed class DropRateTarget with _$DropRateTarget {
  const factory DropRateTarget({
    String? category,
    int? rarity,
    List<String>? ids,
  }) = _DropRateTarget;

  factory DropRateTarget.fromJson(Map<String, dynamic> json) =>
      _$DropRateTargetFromJson(json);
}

@freezed
sealed class DropRate with _$DropRate {
  const factory DropRate({
    required int lowerAR,
    required double rate,
  }) = _DropRate;

  factory DropRate.fromJson(Map<String, dynamic> json) =>
      _$DropRateFromJson(json);
}
