import "package:freezed_annotation/freezed_annotation.dart";

import "common.dart";
import "localized_text.dart";

part "farming_efficiency.freezed.dart";

/// Represents the efficiency analysis for a specific domain
@freezed
class DomainEfficiency with _$DomainEfficiency {
  const DomainEfficiency._();

  const factory DomainEfficiency({
    required String domainId,
    required LocalizedText domainName,
    required List<String> availableDays,
    required double efficiencyScore,
    required List<MaterialEfficiency> materials,
    required int totalBookmarkedQuantity,
  }) = _DomainEfficiency;

  /// Returns true if this domain is available today
  bool isAvailableToday(GameServer server) {
    final currentWeekday = DateTime.now().toUtc().add(server.serverTimeZoneOffset).weekday;
    return availableDays.any((day) => _dayStringToWeekday(day) == currentWeekday);
  }

  static int _dayStringToWeekday(String day) {
    switch (day) {
      case "monday":
        return DateTime.monday;
      case "tuesday":
        return DateTime.tuesday;
      case "wednesday":
        return DateTime.wednesday;
      case "thursday":
        return DateTime.thursday;
      case "friday":
        return DateTime.friday;
      case "saturday":
        return DateTime.saturday;
      case "sunday":
        return DateTime.sunday;
      default:
        return 0;
    }
  }
}

/// Represents efficiency data for a specific material within a domain
@freezed
class MaterialEfficiency with _$MaterialEfficiency {
  const factory MaterialEfficiency({
    required MaterialId materialId,
    required LocalizedText materialName,
    required int bookmarkedQuantity,
    required int rarity,
    required double weightedScore,
  }) = _MaterialEfficiency;
}

/// Overall farming efficiency analysis result
@freezed
class FarmingEfficiencyAnalysis with _$FarmingEfficiencyAnalysis {
  const factory FarmingEfficiencyAnalysis({
    required List<DomainEfficiency> talentDomains,
    required List<DomainEfficiency> weaponDomains,
    required int totalBookmarks,
    required DateTime analyzedAt,
  }) = _FarmingEfficiencyAnalysis;
}
