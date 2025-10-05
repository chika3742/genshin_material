// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class BookmarkTable extends Table
    with TableInfo<BookmarkTable, BookmarkTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  BookmarkTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression(
      'CAST(strftime(\'%s\', CURRENT_TIMESTAMP) AS INTEGER)',
    ),
  );
  late final GeneratedColumn<String> groupHash = GeneratedColumn<String>(
    'group_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    type,
    characterId,
    createdAt,
    groupHash,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmark_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookmarkTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarkTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      groupHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_hash'],
      )!,
    );
  }

  @override
  BookmarkTable createAlias(String alias) {
    return BookmarkTable(attachedDatabase, alias);
  }
}

class BookmarkTableData extends DataClass
    implements Insertable<BookmarkTableData> {
  final int id;
  final String type;
  final String characterId;
  final DateTime createdAt;
  final String groupHash;
  const BookmarkTableData({
    required this.id,
    required this.type,
    required this.characterId,
    required this.createdAt,
    required this.groupHash,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type'] = Variable<String>(type);
    map['character_id'] = Variable<String>(characterId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['group_hash'] = Variable<String>(groupHash);
    return map;
  }

  BookmarkTableDataCompanion toCompanion(bool nullToAbsent) {
    return BookmarkTableDataCompanion(
      id: Value(id),
      type: Value(type),
      characterId: Value(characterId),
      createdAt: Value(createdAt),
      groupHash: Value(groupHash),
    );
  }

  factory BookmarkTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkTableData(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      characterId: serializer.fromJson<String>(json['characterId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      groupHash: serializer.fromJson<String>(json['groupHash']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
      'characterId': serializer.toJson<String>(characterId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'groupHash': serializer.toJson<String>(groupHash),
    };
  }

  BookmarkTableData copyWith({
    int? id,
    String? type,
    String? characterId,
    DateTime? createdAt,
    String? groupHash,
  }) => BookmarkTableData(
    id: id ?? this.id,
    type: type ?? this.type,
    characterId: characterId ?? this.characterId,
    createdAt: createdAt ?? this.createdAt,
    groupHash: groupHash ?? this.groupHash,
  );
  BookmarkTableData copyWithCompanion(BookmarkTableDataCompanion data) {
    return BookmarkTableData(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      groupHash: data.groupHash.present ? data.groupHash.value : this.groupHash,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkTableData(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('characterId: $characterId, ')
          ..write('createdAt: $createdAt, ')
          ..write('groupHash: $groupHash')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, characterId, createdAt, groupHash);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookmarkTableData &&
          other.id == this.id &&
          other.type == this.type &&
          other.characterId == this.characterId &&
          other.createdAt == this.createdAt &&
          other.groupHash == this.groupHash);
}

class BookmarkTableDataCompanion extends UpdateCompanion<BookmarkTableData> {
  final Value<int> id;
  final Value<String> type;
  final Value<String> characterId;
  final Value<DateTime> createdAt;
  final Value<String> groupHash;
  const BookmarkTableDataCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.characterId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.groupHash = const Value.absent(),
  });
  BookmarkTableDataCompanion.insert({
    this.id = const Value.absent(),
    required String type,
    required String characterId,
    this.createdAt = const Value.absent(),
    required String groupHash,
  }) : type = Value(type),
       characterId = Value(characterId),
       groupHash = Value(groupHash);
  static Insertable<BookmarkTableData> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<String>? characterId,
    Expression<DateTime>? createdAt,
    Expression<String>? groupHash,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (characterId != null) 'character_id': characterId,
      if (createdAt != null) 'created_at': createdAt,
      if (groupHash != null) 'group_hash': groupHash,
    });
  }

  BookmarkTableDataCompanion copyWith({
    Value<int>? id,
    Value<String>? type,
    Value<String>? characterId,
    Value<DateTime>? createdAt,
    Value<String>? groupHash,
  }) {
    return BookmarkTableDataCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      characterId: characterId ?? this.characterId,
      createdAt: createdAt ?? this.createdAt,
      groupHash: groupHash ?? this.groupHash,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (groupHash.present) {
      map['group_hash'] = Variable<String>(groupHash.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkTableDataCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('characterId: $characterId, ')
          ..write('createdAt: $createdAt, ')
          ..write('groupHash: $groupHash')
          ..write(')'))
        .toString();
  }
}

class BookmarkMaterialDetailsTable extends Table
    with
        TableInfo<
          BookmarkMaterialDetailsTable,
          BookmarkMaterialDetailsTableData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  BookmarkMaterialDetailsTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
    'parent_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES bookmark_table (id) ON DELETE CASCADE',
    ),
  );
  late final GeneratedColumn<String> weaponId = GeneratedColumn<String>(
    'weapon_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  late final GeneratedColumn<String> materialId = GeneratedColumn<String>(
    'material_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> upperLevel = GeneratedColumn<int>(
    'upper_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> purposeType = GeneratedColumn<String>(
    'purpose_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> hash = GeneratedColumn<String>(
    'hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    parentId,
    weaponId,
    materialId,
    quantity,
    upperLevel,
    purposeType,
    hash,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmark_material_details_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {hash};
  @override
  BookmarkMaterialDetailsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarkMaterialDetailsTableData(
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_id'],
      )!,
      weaponId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weapon_id'],
      ),
      materialId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}material_id'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      upperLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}upper_level'],
      )!,
      purposeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purpose_type'],
      )!,
      hash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hash'],
      )!,
    );
  }

  @override
  BookmarkMaterialDetailsTable createAlias(String alias) {
    return BookmarkMaterialDetailsTable(attachedDatabase, alias);
  }
}

class BookmarkMaterialDetailsTableData extends DataClass
    implements Insertable<BookmarkMaterialDetailsTableData> {
  final int parentId;
  final String? weaponId;
  final String? materialId;
  final int quantity;
  final int upperLevel;
  final String purposeType;
  final String hash;
  const BookmarkMaterialDetailsTableData({
    required this.parentId,
    this.weaponId,
    this.materialId,
    required this.quantity,
    required this.upperLevel,
    required this.purposeType,
    required this.hash,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['parent_id'] = Variable<int>(parentId);
    if (!nullToAbsent || weaponId != null) {
      map['weapon_id'] = Variable<String>(weaponId);
    }
    if (!nullToAbsent || materialId != null) {
      map['material_id'] = Variable<String>(materialId);
    }
    map['quantity'] = Variable<int>(quantity);
    map['upper_level'] = Variable<int>(upperLevel);
    map['purpose_type'] = Variable<String>(purposeType);
    map['hash'] = Variable<String>(hash);
    return map;
  }

  BookmarkMaterialDetailsTableDataCompanion toCompanion(bool nullToAbsent) {
    return BookmarkMaterialDetailsTableDataCompanion(
      parentId: Value(parentId),
      weaponId: weaponId == null && nullToAbsent
          ? const Value.absent()
          : Value(weaponId),
      materialId: materialId == null && nullToAbsent
          ? const Value.absent()
          : Value(materialId),
      quantity: Value(quantity),
      upperLevel: Value(upperLevel),
      purposeType: Value(purposeType),
      hash: Value(hash),
    );
  }

  factory BookmarkMaterialDetailsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkMaterialDetailsTableData(
      parentId: serializer.fromJson<int>(json['parentId']),
      weaponId: serializer.fromJson<String?>(json['weaponId']),
      materialId: serializer.fromJson<String?>(json['materialId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      upperLevel: serializer.fromJson<int>(json['upperLevel']),
      purposeType: serializer.fromJson<String>(json['purposeType']),
      hash: serializer.fromJson<String>(json['hash']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'parentId': serializer.toJson<int>(parentId),
      'weaponId': serializer.toJson<String?>(weaponId),
      'materialId': serializer.toJson<String?>(materialId),
      'quantity': serializer.toJson<int>(quantity),
      'upperLevel': serializer.toJson<int>(upperLevel),
      'purposeType': serializer.toJson<String>(purposeType),
      'hash': serializer.toJson<String>(hash),
    };
  }

  BookmarkMaterialDetailsTableData copyWith({
    int? parentId,
    Value<String?> weaponId = const Value.absent(),
    Value<String?> materialId = const Value.absent(),
    int? quantity,
    int? upperLevel,
    String? purposeType,
    String? hash,
  }) => BookmarkMaterialDetailsTableData(
    parentId: parentId ?? this.parentId,
    weaponId: weaponId.present ? weaponId.value : this.weaponId,
    materialId: materialId.present ? materialId.value : this.materialId,
    quantity: quantity ?? this.quantity,
    upperLevel: upperLevel ?? this.upperLevel,
    purposeType: purposeType ?? this.purposeType,
    hash: hash ?? this.hash,
  );
  BookmarkMaterialDetailsTableData copyWithCompanion(
    BookmarkMaterialDetailsTableDataCompanion data,
  ) {
    return BookmarkMaterialDetailsTableData(
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      weaponId: data.weaponId.present ? data.weaponId.value : this.weaponId,
      materialId: data.materialId.present
          ? data.materialId.value
          : this.materialId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      upperLevel: data.upperLevel.present
          ? data.upperLevel.value
          : this.upperLevel,
      purposeType: data.purposeType.present
          ? data.purposeType.value
          : this.purposeType,
      hash: data.hash.present ? data.hash.value : this.hash,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkMaterialDetailsTableData(')
          ..write('parentId: $parentId, ')
          ..write('weaponId: $weaponId, ')
          ..write('materialId: $materialId, ')
          ..write('quantity: $quantity, ')
          ..write('upperLevel: $upperLevel, ')
          ..write('purposeType: $purposeType, ')
          ..write('hash: $hash')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    parentId,
    weaponId,
    materialId,
    quantity,
    upperLevel,
    purposeType,
    hash,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookmarkMaterialDetailsTableData &&
          other.parentId == this.parentId &&
          other.weaponId == this.weaponId &&
          other.materialId == this.materialId &&
          other.quantity == this.quantity &&
          other.upperLevel == this.upperLevel &&
          other.purposeType == this.purposeType &&
          other.hash == this.hash);
}

class BookmarkMaterialDetailsTableDataCompanion
    extends UpdateCompanion<BookmarkMaterialDetailsTableData> {
  final Value<int> parentId;
  final Value<String?> weaponId;
  final Value<String?> materialId;
  final Value<int> quantity;
  final Value<int> upperLevel;
  final Value<String> purposeType;
  final Value<String> hash;
  final Value<int> rowid;
  const BookmarkMaterialDetailsTableDataCompanion({
    this.parentId = const Value.absent(),
    this.weaponId = const Value.absent(),
    this.materialId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.upperLevel = const Value.absent(),
    this.purposeType = const Value.absent(),
    this.hash = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BookmarkMaterialDetailsTableDataCompanion.insert({
    required int parentId,
    this.weaponId = const Value.absent(),
    this.materialId = const Value.absent(),
    required int quantity,
    required int upperLevel,
    required String purposeType,
    required String hash,
    this.rowid = const Value.absent(),
  }) : parentId = Value(parentId),
       quantity = Value(quantity),
       upperLevel = Value(upperLevel),
       purposeType = Value(purposeType),
       hash = Value(hash);
  static Insertable<BookmarkMaterialDetailsTableData> custom({
    Expression<int>? parentId,
    Expression<String>? weaponId,
    Expression<String>? materialId,
    Expression<int>? quantity,
    Expression<int>? upperLevel,
    Expression<String>? purposeType,
    Expression<String>? hash,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (parentId != null) 'parent_id': parentId,
      if (weaponId != null) 'weapon_id': weaponId,
      if (materialId != null) 'material_id': materialId,
      if (quantity != null) 'quantity': quantity,
      if (upperLevel != null) 'upper_level': upperLevel,
      if (purposeType != null) 'purpose_type': purposeType,
      if (hash != null) 'hash': hash,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BookmarkMaterialDetailsTableDataCompanion copyWith({
    Value<int>? parentId,
    Value<String?>? weaponId,
    Value<String?>? materialId,
    Value<int>? quantity,
    Value<int>? upperLevel,
    Value<String>? purposeType,
    Value<String>? hash,
    Value<int>? rowid,
  }) {
    return BookmarkMaterialDetailsTableDataCompanion(
      parentId: parentId ?? this.parentId,
      weaponId: weaponId ?? this.weaponId,
      materialId: materialId ?? this.materialId,
      quantity: quantity ?? this.quantity,
      upperLevel: upperLevel ?? this.upperLevel,
      purposeType: purposeType ?? this.purposeType,
      hash: hash ?? this.hash,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (weaponId.present) {
      map['weapon_id'] = Variable<String>(weaponId.value);
    }
    if (materialId.present) {
      map['material_id'] = Variable<String>(materialId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (upperLevel.present) {
      map['upper_level'] = Variable<int>(upperLevel.value);
    }
    if (purposeType.present) {
      map['purpose_type'] = Variable<String>(purposeType.value);
    }
    if (hash.present) {
      map['hash'] = Variable<String>(hash.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkMaterialDetailsTableDataCompanion(')
          ..write('parentId: $parentId, ')
          ..write('weaponId: $weaponId, ')
          ..write('materialId: $materialId, ')
          ..write('quantity: $quantity, ')
          ..write('upperLevel: $upperLevel, ')
          ..write('purposeType: $purposeType, ')
          ..write('hash: $hash, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class BookmarkArtifactSetDetailsTable extends Table
    with
        TableInfo<
          BookmarkArtifactSetDetailsTable,
          BookmarkArtifactSetDetailsTableData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  BookmarkArtifactSetDetailsTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
    'parent_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES bookmark_table (id) ON DELETE CASCADE',
    ),
  );
  late final GeneratedColumn<String> sets = GeneratedColumn<String>(
    'sets',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> mainStats = GeneratedColumn<String>(
    'main_stats',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> subStats = GeneratedColumn<String>(
    'sub_stats',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    parentId,
    sets,
    mainStats,
    subStats,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmark_artifact_set_details_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookmarkArtifactSetDetailsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarkArtifactSetDetailsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_id'],
      )!,
      sets: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sets'],
      )!,
      mainStats: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}main_stats'],
      )!,
      subStats: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sub_stats'],
      )!,
    );
  }

  @override
  BookmarkArtifactSetDetailsTable createAlias(String alias) {
    return BookmarkArtifactSetDetailsTable(attachedDatabase, alias);
  }
}

class BookmarkArtifactSetDetailsTableData extends DataClass
    implements Insertable<BookmarkArtifactSetDetailsTableData> {
  final int id;
  final int parentId;
  final String sets;
  final String mainStats;
  final String subStats;
  const BookmarkArtifactSetDetailsTableData({
    required this.id,
    required this.parentId,
    required this.sets,
    required this.mainStats,
    required this.subStats,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['parent_id'] = Variable<int>(parentId);
    map['sets'] = Variable<String>(sets);
    map['main_stats'] = Variable<String>(mainStats);
    map['sub_stats'] = Variable<String>(subStats);
    return map;
  }

  BookmarkArtifactSetDetailsTableDataCompanion toCompanion(bool nullToAbsent) {
    return BookmarkArtifactSetDetailsTableDataCompanion(
      id: Value(id),
      parentId: Value(parentId),
      sets: Value(sets),
      mainStats: Value(mainStats),
      subStats: Value(subStats),
    );
  }

  factory BookmarkArtifactSetDetailsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkArtifactSetDetailsTableData(
      id: serializer.fromJson<int>(json['id']),
      parentId: serializer.fromJson<int>(json['parentId']),
      sets: serializer.fromJson<String>(json['sets']),
      mainStats: serializer.fromJson<String>(json['mainStats']),
      subStats: serializer.fromJson<String>(json['subStats']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parentId': serializer.toJson<int>(parentId),
      'sets': serializer.toJson<String>(sets),
      'mainStats': serializer.toJson<String>(mainStats),
      'subStats': serializer.toJson<String>(subStats),
    };
  }

  BookmarkArtifactSetDetailsTableData copyWith({
    int? id,
    int? parentId,
    String? sets,
    String? mainStats,
    String? subStats,
  }) => BookmarkArtifactSetDetailsTableData(
    id: id ?? this.id,
    parentId: parentId ?? this.parentId,
    sets: sets ?? this.sets,
    mainStats: mainStats ?? this.mainStats,
    subStats: subStats ?? this.subStats,
  );
  BookmarkArtifactSetDetailsTableData copyWithCompanion(
    BookmarkArtifactSetDetailsTableDataCompanion data,
  ) {
    return BookmarkArtifactSetDetailsTableData(
      id: data.id.present ? data.id.value : this.id,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      sets: data.sets.present ? data.sets.value : this.sets,
      mainStats: data.mainStats.present ? data.mainStats.value : this.mainStats,
      subStats: data.subStats.present ? data.subStats.value : this.subStats,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkArtifactSetDetailsTableData(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('sets: $sets, ')
          ..write('mainStats: $mainStats, ')
          ..write('subStats: $subStats')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, parentId, sets, mainStats, subStats);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookmarkArtifactSetDetailsTableData &&
          other.id == this.id &&
          other.parentId == this.parentId &&
          other.sets == this.sets &&
          other.mainStats == this.mainStats &&
          other.subStats == this.subStats);
}

class BookmarkArtifactSetDetailsTableDataCompanion
    extends UpdateCompanion<BookmarkArtifactSetDetailsTableData> {
  final Value<int> id;
  final Value<int> parentId;
  final Value<String> sets;
  final Value<String> mainStats;
  final Value<String> subStats;
  const BookmarkArtifactSetDetailsTableDataCompanion({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    this.sets = const Value.absent(),
    this.mainStats = const Value.absent(),
    this.subStats = const Value.absent(),
  });
  BookmarkArtifactSetDetailsTableDataCompanion.insert({
    this.id = const Value.absent(),
    required int parentId,
    required String sets,
    required String mainStats,
    required String subStats,
  }) : parentId = Value(parentId),
       sets = Value(sets),
       mainStats = Value(mainStats),
       subStats = Value(subStats);
  static Insertable<BookmarkArtifactSetDetailsTableData> custom({
    Expression<int>? id,
    Expression<int>? parentId,
    Expression<String>? sets,
    Expression<String>? mainStats,
    Expression<String>? subStats,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentId != null) 'parent_id': parentId,
      if (sets != null) 'sets': sets,
      if (mainStats != null) 'main_stats': mainStats,
      if (subStats != null) 'sub_stats': subStats,
    });
  }

  BookmarkArtifactSetDetailsTableDataCompanion copyWith({
    Value<int>? id,
    Value<int>? parentId,
    Value<String>? sets,
    Value<String>? mainStats,
    Value<String>? subStats,
  }) {
    return BookmarkArtifactSetDetailsTableDataCompanion(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      sets: sets ?? this.sets,
      mainStats: mainStats ?? this.mainStats,
      subStats: subStats ?? this.subStats,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (sets.present) {
      map['sets'] = Variable<String>(sets.value);
    }
    if (mainStats.present) {
      map['main_stats'] = Variable<String>(mainStats.value);
    }
    if (subStats.present) {
      map['sub_stats'] = Variable<String>(subStats.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkArtifactSetDetailsTableDataCompanion(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('sets: $sets, ')
          ..write('mainStats: $mainStats, ')
          ..write('subStats: $subStats')
          ..write(')'))
        .toString();
  }
}

class BookmarkArtifactPieceDetailsTable extends Table
    with
        TableInfo<
          BookmarkArtifactPieceDetailsTable,
          BookmarkArtifactPieceDetailsTableData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  BookmarkArtifactPieceDetailsTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
    'parent_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES bookmark_table (id) ON DELETE CASCADE',
    ),
  );
  late final GeneratedColumn<String> piece = GeneratedColumn<String>(
    'piece',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> mainStat = GeneratedColumn<String>(
    'main_stat',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  late final GeneratedColumn<String> subStats = GeneratedColumn<String>(
    'sub_stats',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    parentId,
    piece,
    mainStat,
    subStats,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmark_artifact_piece_details_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookmarkArtifactPieceDetailsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarkArtifactPieceDetailsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_id'],
      )!,
      piece: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}piece'],
      )!,
      mainStat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}main_stat'],
      ),
      subStats: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sub_stats'],
      )!,
    );
  }

  @override
  BookmarkArtifactPieceDetailsTable createAlias(String alias) {
    return BookmarkArtifactPieceDetailsTable(attachedDatabase, alias);
  }
}

class BookmarkArtifactPieceDetailsTableData extends DataClass
    implements Insertable<BookmarkArtifactPieceDetailsTableData> {
  final int id;
  final int parentId;
  final String piece;
  final String? mainStat;
  final String subStats;
  const BookmarkArtifactPieceDetailsTableData({
    required this.id,
    required this.parentId,
    required this.piece,
    this.mainStat,
    required this.subStats,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['parent_id'] = Variable<int>(parentId);
    map['piece'] = Variable<String>(piece);
    if (!nullToAbsent || mainStat != null) {
      map['main_stat'] = Variable<String>(mainStat);
    }
    map['sub_stats'] = Variable<String>(subStats);
    return map;
  }

  BookmarkArtifactPieceDetailsTableDataCompanion toCompanion(
    bool nullToAbsent,
  ) {
    return BookmarkArtifactPieceDetailsTableDataCompanion(
      id: Value(id),
      parentId: Value(parentId),
      piece: Value(piece),
      mainStat: mainStat == null && nullToAbsent
          ? const Value.absent()
          : Value(mainStat),
      subStats: Value(subStats),
    );
  }

  factory BookmarkArtifactPieceDetailsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkArtifactPieceDetailsTableData(
      id: serializer.fromJson<int>(json['id']),
      parentId: serializer.fromJson<int>(json['parentId']),
      piece: serializer.fromJson<String>(json['piece']),
      mainStat: serializer.fromJson<String?>(json['mainStat']),
      subStats: serializer.fromJson<String>(json['subStats']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parentId': serializer.toJson<int>(parentId),
      'piece': serializer.toJson<String>(piece),
      'mainStat': serializer.toJson<String?>(mainStat),
      'subStats': serializer.toJson<String>(subStats),
    };
  }

  BookmarkArtifactPieceDetailsTableData copyWith({
    int? id,
    int? parentId,
    String? piece,
    Value<String?> mainStat = const Value.absent(),
    String? subStats,
  }) => BookmarkArtifactPieceDetailsTableData(
    id: id ?? this.id,
    parentId: parentId ?? this.parentId,
    piece: piece ?? this.piece,
    mainStat: mainStat.present ? mainStat.value : this.mainStat,
    subStats: subStats ?? this.subStats,
  );
  BookmarkArtifactPieceDetailsTableData copyWithCompanion(
    BookmarkArtifactPieceDetailsTableDataCompanion data,
  ) {
    return BookmarkArtifactPieceDetailsTableData(
      id: data.id.present ? data.id.value : this.id,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      piece: data.piece.present ? data.piece.value : this.piece,
      mainStat: data.mainStat.present ? data.mainStat.value : this.mainStat,
      subStats: data.subStats.present ? data.subStats.value : this.subStats,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkArtifactPieceDetailsTableData(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('piece: $piece, ')
          ..write('mainStat: $mainStat, ')
          ..write('subStats: $subStats')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, parentId, piece, mainStat, subStats);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookmarkArtifactPieceDetailsTableData &&
          other.id == this.id &&
          other.parentId == this.parentId &&
          other.piece == this.piece &&
          other.mainStat == this.mainStat &&
          other.subStats == this.subStats);
}

class BookmarkArtifactPieceDetailsTableDataCompanion
    extends UpdateCompanion<BookmarkArtifactPieceDetailsTableData> {
  final Value<int> id;
  final Value<int> parentId;
  final Value<String> piece;
  final Value<String?> mainStat;
  final Value<String> subStats;
  const BookmarkArtifactPieceDetailsTableDataCompanion({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    this.piece = const Value.absent(),
    this.mainStat = const Value.absent(),
    this.subStats = const Value.absent(),
  });
  BookmarkArtifactPieceDetailsTableDataCompanion.insert({
    this.id = const Value.absent(),
    required int parentId,
    required String piece,
    this.mainStat = const Value.absent(),
    required String subStats,
  }) : parentId = Value(parentId),
       piece = Value(piece),
       subStats = Value(subStats);
  static Insertable<BookmarkArtifactPieceDetailsTableData> custom({
    Expression<int>? id,
    Expression<int>? parentId,
    Expression<String>? piece,
    Expression<String>? mainStat,
    Expression<String>? subStats,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentId != null) 'parent_id': parentId,
      if (piece != null) 'piece': piece,
      if (mainStat != null) 'main_stat': mainStat,
      if (subStats != null) 'sub_stats': subStats,
    });
  }

  BookmarkArtifactPieceDetailsTableDataCompanion copyWith({
    Value<int>? id,
    Value<int>? parentId,
    Value<String>? piece,
    Value<String?>? mainStat,
    Value<String>? subStats,
  }) {
    return BookmarkArtifactPieceDetailsTableDataCompanion(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      piece: piece ?? this.piece,
      mainStat: mainStat ?? this.mainStat,
      subStats: subStats ?? this.subStats,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (piece.present) {
      map['piece'] = Variable<String>(piece.value);
    }
    if (mainStat.present) {
      map['main_stat'] = Variable<String>(mainStat.value);
    }
    if (subStats.present) {
      map['sub_stats'] = Variable<String>(subStats.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkArtifactPieceDetailsTableDataCompanion(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('piece: $piece, ')
          ..write('mainStat: $mainStat, ')
          ..write('subStats: $subStats')
          ..write(')'))
        .toString();
  }
}

class InGameCharacterStateTable extends Table
    with TableInfo<InGameCharacterStateTable, InGameCharacterStateTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  InGameCharacterStateTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> purposes = GeneratedColumn<String>(
    'purposes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> equippedWeaponId = GeneratedColumn<String>(
    'equipped_weapon_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
    'last_updated',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression(
      'CAST(strftime(\'%s\', CURRENT_TIMESTAMP) AS INTEGER)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    characterId,
    purposes,
    equippedWeaponId,
    lastUpdated,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'in_game_character_state_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {uid, characterId};
  @override
  InGameCharacterStateTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InGameCharacterStateTableData(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      )!,
      purposes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purposes'],
      )!,
      equippedWeaponId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}equipped_weapon_id'],
      ),
      lastUpdated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated'],
      )!,
    );
  }

  @override
  InGameCharacterStateTable createAlias(String alias) {
    return InGameCharacterStateTable(attachedDatabase, alias);
  }
}

class InGameCharacterStateTableData extends DataClass
    implements Insertable<InGameCharacterStateTableData> {
  final String uid;
  final String characterId;
  final String purposes;
  final String? equippedWeaponId;
  final DateTime lastUpdated;
  const InGameCharacterStateTableData({
    required this.uid,
    required this.characterId,
    required this.purposes,
    this.equippedWeaponId,
    required this.lastUpdated,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['character_id'] = Variable<String>(characterId);
    map['purposes'] = Variable<String>(purposes);
    if (!nullToAbsent || equippedWeaponId != null) {
      map['equipped_weapon_id'] = Variable<String>(equippedWeaponId);
    }
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  InGameCharacterStateTableDataCompanion toCompanion(bool nullToAbsent) {
    return InGameCharacterStateTableDataCompanion(
      uid: Value(uid),
      characterId: Value(characterId),
      purposes: Value(purposes),
      equippedWeaponId: equippedWeaponId == null && nullToAbsent
          ? const Value.absent()
          : Value(equippedWeaponId),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory InGameCharacterStateTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InGameCharacterStateTableData(
      uid: serializer.fromJson<String>(json['uid']),
      characterId: serializer.fromJson<String>(json['characterId']),
      purposes: serializer.fromJson<String>(json['purposes']),
      equippedWeaponId: serializer.fromJson<String?>(json['equippedWeaponId']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'characterId': serializer.toJson<String>(characterId),
      'purposes': serializer.toJson<String>(purposes),
      'equippedWeaponId': serializer.toJson<String?>(equippedWeaponId),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  InGameCharacterStateTableData copyWith({
    String? uid,
    String? characterId,
    String? purposes,
    Value<String?> equippedWeaponId = const Value.absent(),
    DateTime? lastUpdated,
  }) => InGameCharacterStateTableData(
    uid: uid ?? this.uid,
    characterId: characterId ?? this.characterId,
    purposes: purposes ?? this.purposes,
    equippedWeaponId: equippedWeaponId.present
        ? equippedWeaponId.value
        : this.equippedWeaponId,
    lastUpdated: lastUpdated ?? this.lastUpdated,
  );
  InGameCharacterStateTableData copyWithCompanion(
    InGameCharacterStateTableDataCompanion data,
  ) {
    return InGameCharacterStateTableData(
      uid: data.uid.present ? data.uid.value : this.uid,
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
      purposes: data.purposes.present ? data.purposes.value : this.purposes,
      equippedWeaponId: data.equippedWeaponId.present
          ? data.equippedWeaponId.value
          : this.equippedWeaponId,
      lastUpdated: data.lastUpdated.present
          ? data.lastUpdated.value
          : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InGameCharacterStateTableData(')
          ..write('uid: $uid, ')
          ..write('characterId: $characterId, ')
          ..write('purposes: $purposes, ')
          ..write('equippedWeaponId: $equippedWeaponId, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(uid, characterId, purposes, equippedWeaponId, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InGameCharacterStateTableData &&
          other.uid == this.uid &&
          other.characterId == this.characterId &&
          other.purposes == this.purposes &&
          other.equippedWeaponId == this.equippedWeaponId &&
          other.lastUpdated == this.lastUpdated);
}

class InGameCharacterStateTableDataCompanion
    extends UpdateCompanion<InGameCharacterStateTableData> {
  final Value<String> uid;
  final Value<String> characterId;
  final Value<String> purposes;
  final Value<String?> equippedWeaponId;
  final Value<DateTime> lastUpdated;
  final Value<int> rowid;
  const InGameCharacterStateTableDataCompanion({
    this.uid = const Value.absent(),
    this.characterId = const Value.absent(),
    this.purposes = const Value.absent(),
    this.equippedWeaponId = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InGameCharacterStateTableDataCompanion.insert({
    required String uid,
    required String characterId,
    required String purposes,
    this.equippedWeaponId = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uid = Value(uid),
       characterId = Value(characterId),
       purposes = Value(purposes);
  static Insertable<InGameCharacterStateTableData> custom({
    Expression<String>? uid,
    Expression<String>? characterId,
    Expression<String>? purposes,
    Expression<String>? equippedWeaponId,
    Expression<DateTime>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (characterId != null) 'character_id': characterId,
      if (purposes != null) 'purposes': purposes,
      if (equippedWeaponId != null) 'equipped_weapon_id': equippedWeaponId,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InGameCharacterStateTableDataCompanion copyWith({
    Value<String>? uid,
    Value<String>? characterId,
    Value<String>? purposes,
    Value<String?>? equippedWeaponId,
    Value<DateTime>? lastUpdated,
    Value<int>? rowid,
  }) {
    return InGameCharacterStateTableDataCompanion(
      uid: uid ?? this.uid,
      characterId: characterId ?? this.characterId,
      purposes: purposes ?? this.purposes,
      equippedWeaponId: equippedWeaponId ?? this.equippedWeaponId,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (purposes.present) {
      map['purposes'] = Variable<String>(purposes.value);
    }
    if (equippedWeaponId.present) {
      map['equipped_weapon_id'] = Variable<String>(equippedWeaponId.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InGameCharacterStateTableDataCompanion(')
          ..write('uid: $uid, ')
          ..write('characterId: $characterId, ')
          ..write('purposes: $purposes, ')
          ..write('equippedWeaponId: $equippedWeaponId, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class InGameWeaponStateTable extends Table
    with TableInfo<InGameWeaponStateTable, InGameWeaponStateTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  InGameWeaponStateTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> weaponId = GeneratedColumn<String>(
    'weapon_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> purposes = GeneratedColumn<String>(
    'purposes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
    'last_updated',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression(
      'CAST(strftime(\'%s\', CURRENT_TIMESTAMP) AS INTEGER)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    characterId,
    weaponId,
    purposes,
    lastUpdated,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'in_game_weapon_state_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {uid, characterId, weaponId};
  @override
  InGameWeaponStateTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InGameWeaponStateTableData(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      )!,
      weaponId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weapon_id'],
      )!,
      purposes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purposes'],
      )!,
      lastUpdated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated'],
      )!,
    );
  }

  @override
  InGameWeaponStateTable createAlias(String alias) {
    return InGameWeaponStateTable(attachedDatabase, alias);
  }
}

class InGameWeaponStateTableData extends DataClass
    implements Insertable<InGameWeaponStateTableData> {
  final String uid;
  final String characterId;
  final String weaponId;
  final String purposes;
  final DateTime lastUpdated;
  const InGameWeaponStateTableData({
    required this.uid,
    required this.characterId,
    required this.weaponId,
    required this.purposes,
    required this.lastUpdated,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['character_id'] = Variable<String>(characterId);
    map['weapon_id'] = Variable<String>(weaponId);
    map['purposes'] = Variable<String>(purposes);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  InGameWeaponStateTableDataCompanion toCompanion(bool nullToAbsent) {
    return InGameWeaponStateTableDataCompanion(
      uid: Value(uid),
      characterId: Value(characterId),
      weaponId: Value(weaponId),
      purposes: Value(purposes),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory InGameWeaponStateTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InGameWeaponStateTableData(
      uid: serializer.fromJson<String>(json['uid']),
      characterId: serializer.fromJson<String>(json['characterId']),
      weaponId: serializer.fromJson<String>(json['weaponId']),
      purposes: serializer.fromJson<String>(json['purposes']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'characterId': serializer.toJson<String>(characterId),
      'weaponId': serializer.toJson<String>(weaponId),
      'purposes': serializer.toJson<String>(purposes),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  InGameWeaponStateTableData copyWith({
    String? uid,
    String? characterId,
    String? weaponId,
    String? purposes,
    DateTime? lastUpdated,
  }) => InGameWeaponStateTableData(
    uid: uid ?? this.uid,
    characterId: characterId ?? this.characterId,
    weaponId: weaponId ?? this.weaponId,
    purposes: purposes ?? this.purposes,
    lastUpdated: lastUpdated ?? this.lastUpdated,
  );
  InGameWeaponStateTableData copyWithCompanion(
    InGameWeaponStateTableDataCompanion data,
  ) {
    return InGameWeaponStateTableData(
      uid: data.uid.present ? data.uid.value : this.uid,
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
      weaponId: data.weaponId.present ? data.weaponId.value : this.weaponId,
      purposes: data.purposes.present ? data.purposes.value : this.purposes,
      lastUpdated: data.lastUpdated.present
          ? data.lastUpdated.value
          : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InGameWeaponStateTableData(')
          ..write('uid: $uid, ')
          ..write('characterId: $characterId, ')
          ..write('weaponId: $weaponId, ')
          ..write('purposes: $purposes, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(uid, characterId, weaponId, purposes, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InGameWeaponStateTableData &&
          other.uid == this.uid &&
          other.characterId == this.characterId &&
          other.weaponId == this.weaponId &&
          other.purposes == this.purposes &&
          other.lastUpdated == this.lastUpdated);
}

class InGameWeaponStateTableDataCompanion
    extends UpdateCompanion<InGameWeaponStateTableData> {
  final Value<String> uid;
  final Value<String> characterId;
  final Value<String> weaponId;
  final Value<String> purposes;
  final Value<DateTime> lastUpdated;
  final Value<int> rowid;
  const InGameWeaponStateTableDataCompanion({
    this.uid = const Value.absent(),
    this.characterId = const Value.absent(),
    this.weaponId = const Value.absent(),
    this.purposes = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InGameWeaponStateTableDataCompanion.insert({
    required String uid,
    required String characterId,
    required String weaponId,
    required String purposes,
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uid = Value(uid),
       characterId = Value(characterId),
       weaponId = Value(weaponId),
       purposes = Value(purposes);
  static Insertable<InGameWeaponStateTableData> custom({
    Expression<String>? uid,
    Expression<String>? characterId,
    Expression<String>? weaponId,
    Expression<String>? purposes,
    Expression<DateTime>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (characterId != null) 'character_id': characterId,
      if (weaponId != null) 'weapon_id': weaponId,
      if (purposes != null) 'purposes': purposes,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InGameWeaponStateTableDataCompanion copyWith({
    Value<String>? uid,
    Value<String>? characterId,
    Value<String>? weaponId,
    Value<String>? purposes,
    Value<DateTime>? lastUpdated,
    Value<int>? rowid,
  }) {
    return InGameWeaponStateTableDataCompanion(
      uid: uid ?? this.uid,
      characterId: characterId ?? this.characterId,
      weaponId: weaponId ?? this.weaponId,
      purposes: purposes ?? this.purposes,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (weaponId.present) {
      map['weapon_id'] = Variable<String>(weaponId.value);
    }
    if (purposes.present) {
      map['purposes'] = Variable<String>(purposes.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InGameWeaponStateTableDataCompanion(')
          ..write('uid: $uid, ')
          ..write('characterId: $characterId, ')
          ..write('weaponId: $weaponId, ')
          ..write('purposes: $purposes, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class BookmarkOrderRegistryTable extends Table
    with TableInfo<BookmarkOrderRegistryTable, BookmarkOrderRegistryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  BookmarkOrderRegistryTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('\'main\''),
  );
  late final GeneratedColumn<String> order = GeneratedColumn<String>(
    'order',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, order];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmark_order_registry_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookmarkOrderRegistryTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarkOrderRegistryTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      order: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order'],
      )!,
    );
  }

  @override
  BookmarkOrderRegistryTable createAlias(String alias) {
    return BookmarkOrderRegistryTable(attachedDatabase, alias);
  }
}

class BookmarkOrderRegistryTableData extends DataClass
    implements Insertable<BookmarkOrderRegistryTableData> {
  final String id;
  final String order;
  const BookmarkOrderRegistryTableData({required this.id, required this.order});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['order'] = Variable<String>(order);
    return map;
  }

  BookmarkOrderRegistryTableDataCompanion toCompanion(bool nullToAbsent) {
    return BookmarkOrderRegistryTableDataCompanion(
      id: Value(id),
      order: Value(order),
    );
  }

  factory BookmarkOrderRegistryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkOrderRegistryTableData(
      id: serializer.fromJson<String>(json['id']),
      order: serializer.fromJson<String>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'order': serializer.toJson<String>(order),
    };
  }

  BookmarkOrderRegistryTableData copyWith({String? id, String? order}) =>
      BookmarkOrderRegistryTableData(
        id: id ?? this.id,
        order: order ?? this.order,
      );
  BookmarkOrderRegistryTableData copyWithCompanion(
    BookmarkOrderRegistryTableDataCompanion data,
  ) {
    return BookmarkOrderRegistryTableData(
      id: data.id.present ? data.id.value : this.id,
      order: data.order.present ? data.order.value : this.order,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkOrderRegistryTableData(')
          ..write('id: $id, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, order);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookmarkOrderRegistryTableData &&
          other.id == this.id &&
          other.order == this.order);
}

class BookmarkOrderRegistryTableDataCompanion
    extends UpdateCompanion<BookmarkOrderRegistryTableData> {
  final Value<String> id;
  final Value<String> order;
  final Value<int> rowid;
  const BookmarkOrderRegistryTableDataCompanion({
    this.id = const Value.absent(),
    this.order = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BookmarkOrderRegistryTableDataCompanion.insert({
    this.id = const Value.absent(),
    required String order,
    this.rowid = const Value.absent(),
  }) : order = Value(order);
  static Insertable<BookmarkOrderRegistryTableData> custom({
    Expression<String>? id,
    Expression<String>? order,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (order != null) 'order': order,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BookmarkOrderRegistryTableDataCompanion copyWith({
    Value<String>? id,
    Value<String>? order,
    Value<int>? rowid,
  }) {
    return BookmarkOrderRegistryTableDataCompanion(
      id: id ?? this.id,
      order: order ?? this.order,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (order.present) {
      map['order'] = Variable<String>(order.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkOrderRegistryTableDataCompanion(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class MaterialBagCountTable extends Table
    with TableInfo<MaterialBagCountTable, MaterialBagCountTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MaterialBagCountTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> hyvId = GeneratedColumn<int>(
    'hyv_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
    'last_updated',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression(
      'CAST(strftime(\'%s\', CURRENT_TIMESTAMP) AS INTEGER)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [uid, hyvId, count, lastUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'material_bag_count_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {uid, hyvId};
  @override
  MaterialBagCountTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MaterialBagCountTableData(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      hyvId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hyv_id'],
      )!,
      count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count'],
      )!,
      lastUpdated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated'],
      )!,
    );
  }

  @override
  MaterialBagCountTable createAlias(String alias) {
    return MaterialBagCountTable(attachedDatabase, alias);
  }
}

class MaterialBagCountTableData extends DataClass
    implements Insertable<MaterialBagCountTableData> {
  final String uid;
  final int hyvId;
  final int count;
  final DateTime lastUpdated;
  const MaterialBagCountTableData({
    required this.uid,
    required this.hyvId,
    required this.count,
    required this.lastUpdated,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['hyv_id'] = Variable<int>(hyvId);
    map['count'] = Variable<int>(count);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  MaterialBagCountTableDataCompanion toCompanion(bool nullToAbsent) {
    return MaterialBagCountTableDataCompanion(
      uid: Value(uid),
      hyvId: Value(hyvId),
      count: Value(count),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory MaterialBagCountTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MaterialBagCountTableData(
      uid: serializer.fromJson<String>(json['uid']),
      hyvId: serializer.fromJson<int>(json['hyvId']),
      count: serializer.fromJson<int>(json['count']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'hyvId': serializer.toJson<int>(hyvId),
      'count': serializer.toJson<int>(count),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  MaterialBagCountTableData copyWith({
    String? uid,
    int? hyvId,
    int? count,
    DateTime? lastUpdated,
  }) => MaterialBagCountTableData(
    uid: uid ?? this.uid,
    hyvId: hyvId ?? this.hyvId,
    count: count ?? this.count,
    lastUpdated: lastUpdated ?? this.lastUpdated,
  );
  MaterialBagCountTableData copyWithCompanion(
    MaterialBagCountTableDataCompanion data,
  ) {
    return MaterialBagCountTableData(
      uid: data.uid.present ? data.uid.value : this.uid,
      hyvId: data.hyvId.present ? data.hyvId.value : this.hyvId,
      count: data.count.present ? data.count.value : this.count,
      lastUpdated: data.lastUpdated.present
          ? data.lastUpdated.value
          : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MaterialBagCountTableData(')
          ..write('uid: $uid, ')
          ..write('hyvId: $hyvId, ')
          ..write('count: $count, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, hyvId, count, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MaterialBagCountTableData &&
          other.uid == this.uid &&
          other.hyvId == this.hyvId &&
          other.count == this.count &&
          other.lastUpdated == this.lastUpdated);
}

class MaterialBagCountTableDataCompanion
    extends UpdateCompanion<MaterialBagCountTableData> {
  final Value<String> uid;
  final Value<int> hyvId;
  final Value<int> count;
  final Value<DateTime> lastUpdated;
  final Value<int> rowid;
  const MaterialBagCountTableDataCompanion({
    this.uid = const Value.absent(),
    this.hyvId = const Value.absent(),
    this.count = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MaterialBagCountTableDataCompanion.insert({
    required String uid,
    required int hyvId,
    required int count,
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uid = Value(uid),
       hyvId = Value(hyvId),
       count = Value(count);
  static Insertable<MaterialBagCountTableData> custom({
    Expression<String>? uid,
    Expression<int>? hyvId,
    Expression<int>? count,
    Expression<DateTime>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (hyvId != null) 'hyv_id': hyvId,
      if (count != null) 'count': count,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MaterialBagCountTableDataCompanion copyWith({
    Value<String>? uid,
    Value<int>? hyvId,
    Value<int>? count,
    Value<DateTime>? lastUpdated,
    Value<int>? rowid,
  }) {
    return MaterialBagCountTableDataCompanion(
      uid: uid ?? this.uid,
      hyvId: hyvId ?? this.hyvId,
      count: count ?? this.count,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (hyvId.present) {
      map['hyv_id'] = Variable<int>(hyvId.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MaterialBagCountTableDataCompanion(')
          ..write('uid: $uid, ')
          ..write('hyvId: $hyvId, ')
          ..write('count: $count, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class FurnishingCraftCountTable extends Table
    with TableInfo<FurnishingCraftCountTable, FurnishingCraftCountTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  FurnishingCraftCountTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> furnishingId = GeneratedColumn<String>(
    'furnishing_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> setId = GeneratedColumn<String>(
    'set_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [furnishingId, setId, count];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'furnishing_craft_count_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {furnishingId, setId};
  @override
  FurnishingCraftCountTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FurnishingCraftCountTableData(
      furnishingId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}furnishing_id'],
      )!,
      setId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}set_id'],
      )!,
      count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count'],
      )!,
    );
  }

  @override
  FurnishingCraftCountTable createAlias(String alias) {
    return FurnishingCraftCountTable(attachedDatabase, alias);
  }
}

class FurnishingCraftCountTableData extends DataClass
    implements Insertable<FurnishingCraftCountTableData> {
  final String furnishingId;
  final String setId;
  final int count;
  const FurnishingCraftCountTableData({
    required this.furnishingId,
    required this.setId,
    required this.count,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['furnishing_id'] = Variable<String>(furnishingId);
    map['set_id'] = Variable<String>(setId);
    map['count'] = Variable<int>(count);
    return map;
  }

  FurnishingCraftCountTableDataCompanion toCompanion(bool nullToAbsent) {
    return FurnishingCraftCountTableDataCompanion(
      furnishingId: Value(furnishingId),
      setId: Value(setId),
      count: Value(count),
    );
  }

  factory FurnishingCraftCountTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FurnishingCraftCountTableData(
      furnishingId: serializer.fromJson<String>(json['furnishingId']),
      setId: serializer.fromJson<String>(json['setId']),
      count: serializer.fromJson<int>(json['count']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'furnishingId': serializer.toJson<String>(furnishingId),
      'setId': serializer.toJson<String>(setId),
      'count': serializer.toJson<int>(count),
    };
  }

  FurnishingCraftCountTableData copyWith({
    String? furnishingId,
    String? setId,
    int? count,
  }) => FurnishingCraftCountTableData(
    furnishingId: furnishingId ?? this.furnishingId,
    setId: setId ?? this.setId,
    count: count ?? this.count,
  );
  FurnishingCraftCountTableData copyWithCompanion(
    FurnishingCraftCountTableDataCompanion data,
  ) {
    return FurnishingCraftCountTableData(
      furnishingId: data.furnishingId.present
          ? data.furnishingId.value
          : this.furnishingId,
      setId: data.setId.present ? data.setId.value : this.setId,
      count: data.count.present ? data.count.value : this.count,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FurnishingCraftCountTableData(')
          ..write('furnishingId: $furnishingId, ')
          ..write('setId: $setId, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(furnishingId, setId, count);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FurnishingCraftCountTableData &&
          other.furnishingId == this.furnishingId &&
          other.setId == this.setId &&
          other.count == this.count);
}

class FurnishingCraftCountTableDataCompanion
    extends UpdateCompanion<FurnishingCraftCountTableData> {
  final Value<String> furnishingId;
  final Value<String> setId;
  final Value<int> count;
  final Value<int> rowid;
  const FurnishingCraftCountTableDataCompanion({
    this.furnishingId = const Value.absent(),
    this.setId = const Value.absent(),
    this.count = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FurnishingCraftCountTableDataCompanion.insert({
    required String furnishingId,
    required String setId,
    required int count,
    this.rowid = const Value.absent(),
  }) : furnishingId = Value(furnishingId),
       setId = Value(setId),
       count = Value(count);
  static Insertable<FurnishingCraftCountTableData> custom({
    Expression<String>? furnishingId,
    Expression<String>? setId,
    Expression<int>? count,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (furnishingId != null) 'furnishing_id': furnishingId,
      if (setId != null) 'set_id': setId,
      if (count != null) 'count': count,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FurnishingCraftCountTableDataCompanion copyWith({
    Value<String>? furnishingId,
    Value<String>? setId,
    Value<int>? count,
    Value<int>? rowid,
  }) {
    return FurnishingCraftCountTableDataCompanion(
      furnishingId: furnishingId ?? this.furnishingId,
      setId: setId ?? this.setId,
      count: count ?? this.count,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (furnishingId.present) {
      map['furnishing_id'] = Variable<String>(furnishingId.value);
    }
    if (setId.present) {
      map['set_id'] = Variable<String>(setId.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FurnishingCraftCountTableDataCompanion(')
          ..write('furnishingId: $furnishingId, ')
          ..write('setId: $setId, ')
          ..write('count: $count, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class FurnishingSetBookmarkTable extends Table
    with TableInfo<FurnishingSetBookmarkTable, FurnishingSetBookmarkTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  FurnishingSetBookmarkTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> setId = GeneratedColumn<String>(
    'set_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression(
      'CAST(strftime(\'%s\', CURRENT_TIMESTAMP) AS INTEGER)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [setId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'furnishing_set_bookmark_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {setId};
  @override
  FurnishingSetBookmarkTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FurnishingSetBookmarkTableData(
      setId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}set_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  FurnishingSetBookmarkTable createAlias(String alias) {
    return FurnishingSetBookmarkTable(attachedDatabase, alias);
  }
}

class FurnishingSetBookmarkTableData extends DataClass
    implements Insertable<FurnishingSetBookmarkTableData> {
  final String setId;
  final DateTime createdAt;
  const FurnishingSetBookmarkTableData({
    required this.setId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['set_id'] = Variable<String>(setId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FurnishingSetBookmarkTableDataCompanion toCompanion(bool nullToAbsent) {
    return FurnishingSetBookmarkTableDataCompanion(
      setId: Value(setId),
      createdAt: Value(createdAt),
    );
  }

  factory FurnishingSetBookmarkTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FurnishingSetBookmarkTableData(
      setId: serializer.fromJson<String>(json['setId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'setId': serializer.toJson<String>(setId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FurnishingSetBookmarkTableData copyWith({
    String? setId,
    DateTime? createdAt,
  }) => FurnishingSetBookmarkTableData(
    setId: setId ?? this.setId,
    createdAt: createdAt ?? this.createdAt,
  );
  FurnishingSetBookmarkTableData copyWithCompanion(
    FurnishingSetBookmarkTableDataCompanion data,
  ) {
    return FurnishingSetBookmarkTableData(
      setId: data.setId.present ? data.setId.value : this.setId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FurnishingSetBookmarkTableData(')
          ..write('setId: $setId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(setId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FurnishingSetBookmarkTableData &&
          other.setId == this.setId &&
          other.createdAt == this.createdAt);
}

class FurnishingSetBookmarkTableDataCompanion
    extends UpdateCompanion<FurnishingSetBookmarkTableData> {
  final Value<String> setId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FurnishingSetBookmarkTableDataCompanion({
    this.setId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FurnishingSetBookmarkTableDataCompanion.insert({
    required String setId,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : setId = Value(setId);
  static Insertable<FurnishingSetBookmarkTableData> custom({
    Expression<String>? setId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (setId != null) 'set_id': setId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FurnishingSetBookmarkTableDataCompanion copyWith({
    Value<String>? setId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return FurnishingSetBookmarkTableDataCompanion(
      setId: setId ?? this.setId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (setId.present) {
      map['set_id'] = Variable<String>(setId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FurnishingSetBookmarkTableDataCompanion(')
          ..write('setId: $setId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV3 extends GeneratedDatabase {
  DatabaseAtV3(QueryExecutor e) : super(e);
  late final BookmarkTable bookmarkTable = BookmarkTable(this);
  late final BookmarkMaterialDetailsTable bookmarkMaterialDetailsTable =
      BookmarkMaterialDetailsTable(this);
  late final BookmarkArtifactSetDetailsTable bookmarkArtifactSetDetailsTable =
      BookmarkArtifactSetDetailsTable(this);
  late final BookmarkArtifactPieceDetailsTable
  bookmarkArtifactPieceDetailsTable = BookmarkArtifactPieceDetailsTable(this);
  late final InGameCharacterStateTable inGameCharacterStateTable =
      InGameCharacterStateTable(this);
  late final InGameWeaponStateTable inGameWeaponStateTable =
      InGameWeaponStateTable(this);
  late final BookmarkOrderRegistryTable bookmarkOrderRegistryTable =
      BookmarkOrderRegistryTable(this);
  late final MaterialBagCountTable materialBagCountTable =
      MaterialBagCountTable(this);
  late final FurnishingCraftCountTable furnishingCraftCountTable =
      FurnishingCraftCountTable(this);
  late final FurnishingSetBookmarkTable furnishingSetBookmarkTable =
      FurnishingSetBookmarkTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    bookmarkTable,
    bookmarkMaterialDetailsTable,
    bookmarkArtifactSetDetailsTable,
    bookmarkArtifactPieceDetailsTable,
    inGameCharacterStateTable,
    inGameWeaponStateTable,
    bookmarkOrderRegistryTable,
    materialBagCountTable,
    furnishingCraftCountTable,
    furnishingSetBookmarkTable,
  ];
  @override
  int get schemaVersion => 3;
}
