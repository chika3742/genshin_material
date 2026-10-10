import "package:drift/drift.dart";

import "../models/common.dart";
import "converters.dart";

@DataClassName("BookmarkMaterialGroup")
class BookmarkMaterialGroupTable extends Table {
  TextColumn get groupHash => text()();
  TextColumn get characterId => text().map(const CharacterOrVariantIdConverter())();
  TextColumn get weaponId => text().nullable()();
  TextColumn get purposeType => textEnum<Purpose>()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  /// Fractional-indexing order index in material bookmark list.
  TextColumn get orderIndex => text().unique()();

  @override
  Set<Column<Object>>? get primaryKey => {groupHash};
}

@DataClassName("BookmarkMaterialItem")
class BookmarkMaterialItemTable extends Table {
  TextColumn get hash => text()();
  TextColumn get groupHash => text().references(BookmarkMaterialGroupTable, #groupHash, onDelete: KeyAction.cascade)();
  /// If null, this bookmark will be regarded as EXP items.
  TextColumn get materialId => text().nullable()();
  /// If [materialId] is null, this represents the amount of EXP.
  IntColumn get quantity => integer()();
  /// target level.
  IntColumn get upperLevel => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {hash};
}

@DataClassName("BookmarkArtifact")
class BookmarkArtifactTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get characterId => text().map(const VariantIdConverter())();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get subStats => text().map(const ListConverter<StatId>())();
  /// Fractional-indexing order index in artifact bookmark list.
  TextColumn get orderIndex => text().unique()();
}

@DataClassName("BookmarkArtifactSet")
class BookmarkArtifactSetTable extends Table {
  IntColumn get id => integer().references(BookmarkArtifactTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get sets => text().map(const ListConverter<ArtifactSetId>())();
  /// key = [ArtifactPieceTypeId]
  TextColumn get mainStats => text().map(const MapConverter<StatId?>())();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DataClassName("BookmarkArtifactPiece")
class BookmarkArtifactPieceTable extends Table {
  IntColumn get id => integer().references(BookmarkArtifactTable, #id, onDelete: KeyAction.cascade)();
  /// [ArtifactPieceId]
  TextColumn get piece => text()();
  /// [ArtifactPieceTypeId]?
  TextColumn get mainStat => text().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DataClassName("InGameCharacterState")
class InGameCharacterStateTable extends Table {
  TextColumn get uid => text()();
  IntColumn get characterId => integer()();
  /// corresponds to HoYoLAB `element_attr_id`.
  IntColumn get elementId => integer()();
  TextColumn get purposes => text().map(const PurposeMapConverter())();
  IntColumn get equippedWeaponId => integer()();
  TextColumn get weaponPurposes => text().map(const PurposeMapConverter())();
  DateTimeColumn get lastUpdated => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {uid, characterId, elementId};
}

@DataClassName("MaterialBagCount")
class MaterialBagCountTable extends Table {
  TextColumn get uid => text()();
  IntColumn get hyvId => integer()();
  IntColumn get count => integer()();
  DateTimeColumn get lastUpdated => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {uid, hyvId};
}

@DataClassName("FurnishingCraftCount")
class FurnishingCraftCountTable extends Table {
  TextColumn get furnishingId => text()();
  TextColumn get setId => text()();
  IntColumn get count => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {furnishingId, setId};
}

@DataClassName("FurnishingSetBookmark")
class FurnishingSetBookmarkTable extends Table {
  TextColumn get setId => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>>? get primaryKey => {setId};
}
