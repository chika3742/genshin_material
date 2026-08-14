import "dart:developer";

import "package:clock/clock.dart";
import "package:collection/collection.dart";
import "package:drift/drift.dart";
import "package:flutter/material.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:timezone/timezone.dart" as tz;

import "../core/asset_cache.dart";
import "../core/pref_keys.dart";
import "../data/services/local_notification.dart";
import "../database.dart";
import "../i18n/strings.g.dart";
import "../models/common.dart";
import "../providers/database_provider.dart";
import "../providers/pref_notifier.dart";
import "../providers/versions.dart";
import "../utils/daily_material_weekday.dart";

part "reschedule_daily_material_notifications.g.dart";

typedef _WeekdayToCharacters = Map<DayOfWeek, Set<String>>;
typedef _NotificationInfo = ({
  tz.TZDateTime scheduledTime,
  Set<String> characterIds,
});
typedef _WeekdayToNotificationInfo = Map<DayOfWeek, _NotificationInfo>;

class RescheduleDailyMaterialNotifications {
  final AssetData? _assetData;
  final LocalNotification _notification;
  final AppDatabase _db;
  final GameServer _gameServer;
  final TimeOfDay? _notificationTime;

  const RescheduleDailyMaterialNotifications(
    this._notification,
    this._db, {
    required this._assetData,
    required this._gameServer,
    required this._notificationTime,
  });

  Future<void> execute() async {
    // Cancel all first to make the scheduled state idempotent against the
    // notification time setting and the bookmarks.
    for (int i = 1; i <= DateTime.daysPerWeek; i++) {
      await _notification.cancel(i);
    }

    if (_notificationTime == null || _assetData == null) {
      return;
    }

    final possibleMaterialIds = await _getPossibleMaterialIds();
    final weekdayToCharacterIds = await _getWeekdayToCharacterIds(possibleMaterialIds);
    final notifications = _getNotifications(weekdayToCharacterIds);

    for (final MapEntry(key: weekday, value: notification) in notifications.entries) {
      await _notification.schedule(
        id: weekday.value,
        title: tr.notification.dailyMaterial.title,
        body: _buildNotificationBody(notification.characterIds),
        scheduledDate: notification.scheduledTime,
        androidChannel: LocalNotification.dailyMaterialNotificationChannel,
        matchDateTimeComponents: .dayOfWeekAndTime,
      );
    }

    log("Scheduled: $notifications");
  }

  /// Obtains IDs of bookmarked materials whose `availableDays` is set.
  Future<List<String>> _getPossibleMaterialIds() async {
    assert(_assetData != null);

    final itemTable = _db.bookmarkMaterialItemTable;
    final bookmarkedIdsQuery = _db.selectOnly(itemTable, distinct: true)
      ..addColumns([itemTable.materialId]);
    final bookmarkedIds = await bookmarkedIdsQuery
        .map((r) => r.read(itemTable.materialId))
        .get();

    return bookmarkedIds
        .nonNulls
        .where((e) => _assetData!.materials[e]?.availableDays != null)
        .toList();
  }

  Future<_WeekdayToCharacters> _getWeekdayToCharacterIds(List<String> dailyMaterialIds) async {
    assert(_assetData != null);

    final itemTable = _db.bookmarkMaterialItemTable;
    final groupTable = _db.bookmarkMaterialGroupTable;

    final characterIdsQuery = _db.selectOnly(itemTable, distinct: true)
        .join([innerJoin(groupTable, groupTable.groupHash.equalsExp(itemTable.groupHash))])
      ..where(itemTable.materialId.isIn(dailyMaterialIds))
      ..addColumns([groupTable.characterId, itemTable.materialId]);

    final rows = (await characterIdsQuery.map((e) => (
      e.read(itemTable.materialId),
      e.read(groupTable.characterId),
    )).get()).nonNulls.toList();
    final materialToCharacters = rows.groupSetsBy((e) => e.$1);
    final weekdayToCharacters = <DayOfWeek, Set<String>>{};
    for (final MapEntry(key: materialId, value: characters) in materialToCharacters.entries) {
      final availableDays = _assetData!.materials[materialId]!.availableDays!;
      for (final weekday in availableDays) {
        (weekdayToCharacters[weekday] ??= {}).addAll(characters.map((e) => e.$2!));
      }
    }
    return weekdayToCharacters;
  }

  _WeekdayToNotificationInfo _getNotifications(_WeekdayToCharacters weekdays) {
    assert(_notificationTime != null);

    return weekdays.map((weekday, characterIds) => MapEntry(
      weekday,
      (
        scheduledTime: _nextLocalFireTime(weekday),
        characterIds: characterIds,
      ),
    ));
  }

  tz.TZDateTime _nextLocalFireTime(DayOfWeek targetGameWeekday) {
    final now = tz.TZDateTime.from(clock.now(), tz.local);

    for (int i = 0; i < DateTime.daysPerWeek + 1 /* buffer */; i++) {
      final candidate = tz.TZDateTime.local(
        now.year,
        now.month,
        now.day + i,
        _notificationTime!.hour,
        _notificationTime.minute,
      );
      if (!candidate.isAfter(now)) {
        continue;
      }
      final gameWeekday = getDailyMaterialWeekdayAt(candidate, _gameServer);
      if (gameWeekday == targetGameWeekday.value) {
        return candidate;
      }
    }

    throw StateError("Never happens");
  }

  String _buildNotificationBody(Set<String> characterIds) {
    assert(_assetData != null);

    final characterNamesPart = characterIds
        .map((e) => _assetData!.characters[e]!.name.localized)
        .join(tr.notification.dailyMaterial.separator);
    return tr.notification.dailyMaterial.body(characters: characterNamesPart);
  }
}

@riverpod
RescheduleDailyMaterialNotifications rescheduleDailyMaterialNotifications(Ref ref) {
  return RescheduleDailyMaterialNotifications(
    ref.watch(localNotificationProvider),
    ref.watch(appDatabaseProvider),
    assetData: ref.watch(assetDataProvider).value,
    gameServer: ref.watch(prefProvider(PrefKeys.dailyResetServer)),
    notificationTime: ref.watch(prefProvider(PrefKeys.dailyMaterialNotificationTime)),
  );
}
