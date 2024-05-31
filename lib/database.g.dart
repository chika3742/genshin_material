// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MaterialBookmarkTable extends MaterialBookmark
    with TableInfo<$MaterialBookmarkTable, MaterialBookmarkData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaterialBookmarkTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<MaterialBookmarkType, String>
      type = GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<MaterialBookmarkType>(
              $MaterialBookmarkTable.$convertertype);
  static const VerificationMeta _materialIdMeta =
      const VerificationMeta('materialId');
  @override
  late final GeneratedColumn<String> materialId = GeneratedColumn<String>(
      'material_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _characterIdMeta =
      const VerificationMeta('characterId');
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
      'character_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _upperLevelMeta =
      const VerificationMeta('upperLevel');
  @override
  late final GeneratedColumn<int> upperLevel = GeneratedColumn<int>(
      'upper_level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _purposeTypeMeta =
      const VerificationMeta('purposeType');
  @override
  late final GeneratedColumnWithTypeConverter<Purpose, String> purposeType =
      GeneratedColumn<String>('purpose_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Purpose>($MaterialBookmarkTable.$converterpurposeType);
  static const VerificationMeta _hashMeta = const VerificationMeta('hash');
  @override
  late final GeneratedColumn<String> hash = GeneratedColumn<String>(
      'hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        type,
        materialId,
        characterId,
        quantity,
        createdAt,
        upperLevel,
        purposeType,
        hash
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'material_bookmark';
  @override
  VerificationContext validateIntegrity(
      Insertable<MaterialBookmarkData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('material_id')) {
      context.handle(
          _materialIdMeta,
          materialId.isAcceptableOrUnknown(
              data['material_id']!, _materialIdMeta));
    }
    if (data.containsKey('character_id')) {
      context.handle(
          _characterIdMeta,
          characterId.isAcceptableOrUnknown(
              data['character_id']!, _characterIdMeta));
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('upper_level')) {
      context.handle(
          _upperLevelMeta,
          upperLevel.isAcceptableOrUnknown(
              data['upper_level']!, _upperLevelMeta));
    } else if (isInserting) {
      context.missing(_upperLevelMeta);
    }
    context.handle(_purposeTypeMeta, const VerificationResult.success());
    if (data.containsKey('hash')) {
      context.handle(
          _hashMeta, hash.isAcceptableOrUnknown(data['hash']!, _hashMeta));
    } else if (isInserting) {
      context.missing(_hashMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MaterialBookmarkData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MaterialBookmarkData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      type: $MaterialBookmarkTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      materialId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}material_id']),
      characterId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      upperLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}upper_level'])!,
      purposeType: $MaterialBookmarkTable.$converterpurposeType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}purpose_type'])!),
      hash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hash'])!,
    );
  }

  @override
  $MaterialBookmarkTable createAlias(String alias) {
    return $MaterialBookmarkTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MaterialBookmarkType, String, String>
      $convertertype = const EnumNameConverter<MaterialBookmarkType>(
          MaterialBookmarkType.values);
  static JsonTypeConverter2<Purpose, String, String> $converterpurposeType =
      const EnumNameConverter<Purpose>(Purpose.values);
}

class MaterialBookmarkData extends DataClass
    implements Insertable<MaterialBookmarkData> {
  final int id;
  final MaterialBookmarkType type;

  /// If null, this bookmark will be regarded as EXP items.
  final String? materialId;
  final String characterId;

  /// If [materialId] is null, this represents the amount of EXP.
  final int quantity;
  final DateTime createdAt;
  final int upperLevel;
  final Purpose purposeType;

  /// Can be generated with [combineMaterialBookmarkElements].
  final String hash;
  const MaterialBookmarkData(
      {required this.id,
      required this.type,
      this.materialId,
      required this.characterId,
      required this.quantity,
      required this.createdAt,
      required this.upperLevel,
      required this.purposeType,
      required this.hash});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['type'] =
          Variable<String>($MaterialBookmarkTable.$convertertype.toSql(type));
    }
    if (!nullToAbsent || materialId != null) {
      map['material_id'] = Variable<String>(materialId);
    }
    map['character_id'] = Variable<String>(characterId);
    map['quantity'] = Variable<int>(quantity);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['upper_level'] = Variable<int>(upperLevel);
    {
      map['purpose_type'] = Variable<String>(
          $MaterialBookmarkTable.$converterpurposeType.toSql(purposeType));
    }
    map['hash'] = Variable<String>(hash);
    return map;
  }

  MaterialBookmarkCompanion toCompanion(bool nullToAbsent) {
    return MaterialBookmarkCompanion(
      id: Value(id),
      type: Value(type),
      materialId: materialId == null && nullToAbsent
          ? const Value.absent()
          : Value(materialId),
      characterId: Value(characterId),
      quantity: Value(quantity),
      createdAt: Value(createdAt),
      upperLevel: Value(upperLevel),
      purposeType: Value(purposeType),
      hash: Value(hash),
    );
  }

  factory MaterialBookmarkData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MaterialBookmarkData(
      id: serializer.fromJson<int>(json['id']),
      type: $MaterialBookmarkTable.$convertertype
          .fromJson(serializer.fromJson<String>(json['type'])),
      materialId: serializer.fromJson<String?>(json['materialId']),
      characterId: serializer.fromJson<String>(json['characterId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      upperLevel: serializer.fromJson<int>(json['upperLevel']),
      purposeType: $MaterialBookmarkTable.$converterpurposeType
          .fromJson(serializer.fromJson<String>(json['purposeType'])),
      hash: serializer.fromJson<String>(json['hash']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer
          .toJson<String>($MaterialBookmarkTable.$convertertype.toJson(type)),
      'materialId': serializer.toJson<String?>(materialId),
      'characterId': serializer.toJson<String>(characterId),
      'quantity': serializer.toJson<int>(quantity),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'upperLevel': serializer.toJson<int>(upperLevel),
      'purposeType': serializer.toJson<String>(
          $MaterialBookmarkTable.$converterpurposeType.toJson(purposeType)),
      'hash': serializer.toJson<String>(hash),
    };
  }

  MaterialBookmarkData copyWith(
          {int? id,
          MaterialBookmarkType? type,
          Value<String?> materialId = const Value.absent(),
          String? characterId,
          int? quantity,
          DateTime? createdAt,
          int? upperLevel,
          Purpose? purposeType,
          String? hash}) =>
      MaterialBookmarkData(
        id: id ?? this.id,
        type: type ?? this.type,
        materialId: materialId.present ? materialId.value : this.materialId,
        characterId: characterId ?? this.characterId,
        quantity: quantity ?? this.quantity,
        createdAt: createdAt ?? this.createdAt,
        upperLevel: upperLevel ?? this.upperLevel,
        purposeType: purposeType ?? this.purposeType,
        hash: hash ?? this.hash,
      );
  @override
  String toString() {
    return (StringBuffer('MaterialBookmarkData(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('materialId: $materialId, ')
          ..write('characterId: $characterId, ')
          ..write('quantity: $quantity, ')
          ..write('createdAt: $createdAt, ')
          ..write('upperLevel: $upperLevel, ')
          ..write('purposeType: $purposeType, ')
          ..write('hash: $hash')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, materialId, characterId, quantity,
      createdAt, upperLevel, purposeType, hash);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MaterialBookmarkData &&
          other.id == this.id &&
          other.type == this.type &&
          other.materialId == this.materialId &&
          other.characterId == this.characterId &&
          other.quantity == this.quantity &&
          other.createdAt == this.createdAt &&
          other.upperLevel == this.upperLevel &&
          other.purposeType == this.purposeType &&
          other.hash == this.hash);
}

class MaterialBookmarkCompanion extends UpdateCompanion<MaterialBookmarkData> {
  final Value<int> id;
  final Value<MaterialBookmarkType> type;
  final Value<String?> materialId;
  final Value<String> characterId;
  final Value<int> quantity;
  final Value<DateTime> createdAt;
  final Value<int> upperLevel;
  final Value<Purpose> purposeType;
  final Value<String> hash;
  const MaterialBookmarkCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.materialId = const Value.absent(),
    this.characterId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.upperLevel = const Value.absent(),
    this.purposeType = const Value.absent(),
    this.hash = const Value.absent(),
  });
  MaterialBookmarkCompanion.insert({
    this.id = const Value.absent(),
    required MaterialBookmarkType type,
    this.materialId = const Value.absent(),
    required String characterId,
    required int quantity,
    this.createdAt = const Value.absent(),
    required int upperLevel,
    required Purpose purposeType,
    required String hash,
  })  : type = Value(type),
        characterId = Value(characterId),
        quantity = Value(quantity),
        upperLevel = Value(upperLevel),
        purposeType = Value(purposeType),
        hash = Value(hash);
  static Insertable<MaterialBookmarkData> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<String>? materialId,
    Expression<String>? characterId,
    Expression<int>? quantity,
    Expression<DateTime>? createdAt,
    Expression<int>? upperLevel,
    Expression<String>? purposeType,
    Expression<String>? hash,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (materialId != null) 'material_id': materialId,
      if (characterId != null) 'character_id': characterId,
      if (quantity != null) 'quantity': quantity,
      if (createdAt != null) 'created_at': createdAt,
      if (upperLevel != null) 'upper_level': upperLevel,
      if (purposeType != null) 'purpose_type': purposeType,
      if (hash != null) 'hash': hash,
    });
  }

  MaterialBookmarkCompanion copyWith(
      {Value<int>? id,
      Value<MaterialBookmarkType>? type,
      Value<String?>? materialId,
      Value<String>? characterId,
      Value<int>? quantity,
      Value<DateTime>? createdAt,
      Value<int>? upperLevel,
      Value<Purpose>? purposeType,
      Value<String>? hash}) {
    return MaterialBookmarkCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      materialId: materialId ?? this.materialId,
      characterId: characterId ?? this.characterId,
      quantity: quantity ?? this.quantity,
      createdAt: createdAt ?? this.createdAt,
      upperLevel: upperLevel ?? this.upperLevel,
      purposeType: purposeType ?? this.purposeType,
      hash: hash ?? this.hash,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
          $MaterialBookmarkTable.$convertertype.toSql(type.value));
    }
    if (materialId.present) {
      map['material_id'] = Variable<String>(materialId.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (upperLevel.present) {
      map['upper_level'] = Variable<int>(upperLevel.value);
    }
    if (purposeType.present) {
      map['purpose_type'] = Variable<String>($MaterialBookmarkTable
          .$converterpurposeType
          .toSql(purposeType.value));
    }
    if (hash.present) {
      map['hash'] = Variable<String>(hash.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MaterialBookmarkCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('materialId: $materialId, ')
          ..write('characterId: $characterId, ')
          ..write('quantity: $quantity, ')
          ..write('createdAt: $createdAt, ')
          ..write('upperLevel: $upperLevel, ')
          ..write('purposeType: $purposeType, ')
          ..write('hash: $hash')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $MaterialBookmarkTable materialBookmark =
      $MaterialBookmarkTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [materialBookmark];
}

typedef $$MaterialBookmarkTableInsertCompanionBuilder
    = MaterialBookmarkCompanion Function({
  Value<int> id,
  required MaterialBookmarkType type,
  Value<String?> materialId,
  required String characterId,
  required int quantity,
  Value<DateTime> createdAt,
  required int upperLevel,
  required Purpose purposeType,
  required String hash,
});
typedef $$MaterialBookmarkTableUpdateCompanionBuilder
    = MaterialBookmarkCompanion Function({
  Value<int> id,
  Value<MaterialBookmarkType> type,
  Value<String?> materialId,
  Value<String> characterId,
  Value<int> quantity,
  Value<DateTime> createdAt,
  Value<int> upperLevel,
  Value<Purpose> purposeType,
  Value<String> hash,
});

class $$MaterialBookmarkTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MaterialBookmarkTable,
    MaterialBookmarkData,
    $$MaterialBookmarkTableFilterComposer,
    $$MaterialBookmarkTableOrderingComposer,
    $$MaterialBookmarkTableProcessedTableManager,
    $$MaterialBookmarkTableInsertCompanionBuilder,
    $$MaterialBookmarkTableUpdateCompanionBuilder> {
  $$MaterialBookmarkTableTableManager(
      _$AppDatabase db, $MaterialBookmarkTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MaterialBookmarkTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MaterialBookmarkTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$MaterialBookmarkTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<MaterialBookmarkType> type = const Value.absent(),
            Value<String?> materialId = const Value.absent(),
            Value<String> characterId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> upperLevel = const Value.absent(),
            Value<Purpose> purposeType = const Value.absent(),
            Value<String> hash = const Value.absent(),
          }) =>
              MaterialBookmarkCompanion(
            id: id,
            type: type,
            materialId: materialId,
            characterId: characterId,
            quantity: quantity,
            createdAt: createdAt,
            upperLevel: upperLevel,
            purposeType: purposeType,
            hash: hash,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required MaterialBookmarkType type,
            Value<String?> materialId = const Value.absent(),
            required String characterId,
            required int quantity,
            Value<DateTime> createdAt = const Value.absent(),
            required int upperLevel,
            required Purpose purposeType,
            required String hash,
          }) =>
              MaterialBookmarkCompanion.insert(
            id: id,
            type: type,
            materialId: materialId,
            characterId: characterId,
            quantity: quantity,
            createdAt: createdAt,
            upperLevel: upperLevel,
            purposeType: purposeType,
            hash: hash,
          ),
        ));
}

class $$MaterialBookmarkTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $MaterialBookmarkTable,
        MaterialBookmarkData,
        $$MaterialBookmarkTableFilterComposer,
        $$MaterialBookmarkTableOrderingComposer,
        $$MaterialBookmarkTableProcessedTableManager,
        $$MaterialBookmarkTableInsertCompanionBuilder,
        $$MaterialBookmarkTableUpdateCompanionBuilder> {
  $$MaterialBookmarkTableProcessedTableManager(super.$state);
}

class $$MaterialBookmarkTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MaterialBookmarkTable> {
  $$MaterialBookmarkTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<MaterialBookmarkType, MaterialBookmarkType,
          String>
      get type => $state.composableBuilder(
          column: $state.table.type,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get materialId => $state.composableBuilder(
      column: $state.table.materialId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get characterId => $state.composableBuilder(
      column: $state.table.characterId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get upperLevel => $state.composableBuilder(
      column: $state.table.upperLevel,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Purpose, Purpose, String> get purposeType =>
      $state.composableBuilder(
          column: $state.table.purposeType,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get hash => $state.composableBuilder(
      column: $state.table.hash,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MaterialBookmarkTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MaterialBookmarkTable> {
  $$MaterialBookmarkTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get materialId => $state.composableBuilder(
      column: $state.table.materialId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get characterId => $state.composableBuilder(
      column: $state.table.characterId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get upperLevel => $state.composableBuilder(
      column: $state.table.upperLevel,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get purposeType => $state.composableBuilder(
      column: $state.table.purposeType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get hash => $state.composableBuilder(
      column: $state.table.hash,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$MaterialBookmarkTableTableManager get materialBookmark =>
      $$MaterialBookmarkTableTableManager(_db, _db.materialBookmark);
}
