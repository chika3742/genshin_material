// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BookmarkTableTable extends BookmarkTable
    with TableInfo<$BookmarkTableTable, Bookmark> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookmarkTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumnWithTypeConverter<BookmarkType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<BookmarkType>($BookmarkTableTable.$convertertype);
  static const VerificationMeta _characterIdMeta =
      const VerificationMeta('characterId');
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
      'character_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _groupHashMeta =
      const VerificationMeta('groupHash');
  @override
  late final GeneratedColumn<String> groupHash = GeneratedColumn<String>(
      'group_hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, type, characterId, createdAt, groupHash];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmark_table';
  @override
  VerificationContext validateIntegrity(Insertable<Bookmark> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('character_id')) {
      context.handle(
          _characterIdMeta,
          characterId.isAcceptableOrUnknown(
              data['character_id']!, _characterIdMeta));
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('group_hash')) {
      context.handle(_groupHashMeta,
          groupHash.isAcceptableOrUnknown(data['group_hash']!, _groupHashMeta));
    } else if (isInserting) {
      context.missing(_groupHashMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Bookmark map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Bookmark(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      type: $BookmarkTableTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      characterId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      groupHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_hash'])!,
    );
  }

  @override
  $BookmarkTableTable createAlias(String alias) {
    return $BookmarkTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<BookmarkType, String, String> $convertertype =
      const EnumNameConverter<BookmarkType>(BookmarkType.values);
}

class BookmarkCompanion extends UpdateCompanion<Bookmark> {
  final Value<int> id;
  final Value<BookmarkType> type;
  final Value<String> characterId;
  final Value<DateTime> createdAt;
  final Value<String> groupHash;
  const BookmarkCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.characterId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.groupHash = const Value.absent(),
  });
  BookmarkCompanion.insert({
    this.id = const Value.absent(),
    required BookmarkType type,
    required String characterId,
    this.createdAt = const Value.absent(),
    required String groupHash,
  })  : type = Value(type),
        characterId = Value(characterId),
        groupHash = Value(groupHash);
  static Insertable<Bookmark> custom({
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

  BookmarkCompanion copyWith(
      {Value<int>? id,
      Value<BookmarkType>? type,
      Value<String>? characterId,
      Value<DateTime>? createdAt,
      Value<String>? groupHash}) {
    return BookmarkCompanion(
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
      map['type'] = Variable<String>(
          $BookmarkTableTable.$convertertype.toSql(type.value));
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
    return (StringBuffer('BookmarkCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('characterId: $characterId, ')
          ..write('createdAt: $createdAt, ')
          ..write('groupHash: $groupHash')
          ..write(')'))
        .toString();
  }
}

class $BookmarkMaterialDetailsTableTable extends BookmarkMaterialDetailsTable
    with
        TableInfo<$BookmarkMaterialDetailsTableTable, BookmarkMaterialDetails> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookmarkMaterialDetailsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES bookmark_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _weaponIdMeta =
      const VerificationMeta('weaponId');
  @override
  late final GeneratedColumn<String> weaponId = GeneratedColumn<String>(
      'weapon_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _materialIdMeta =
      const VerificationMeta('materialId');
  @override
  late final GeneratedColumn<String> materialId = GeneratedColumn<String>(
      'material_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _upperLevelMeta =
      const VerificationMeta('upperLevel');
  @override
  late final GeneratedColumn<int> upperLevel = GeneratedColumn<int>(
      'upper_level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<Purpose, String> purposeType =
      GeneratedColumn<String>('purpose_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Purpose>(
              $BookmarkMaterialDetailsTableTable.$converterpurposeType);
  static const VerificationMeta _hashMeta = const VerificationMeta('hash');
  @override
  late final GeneratedColumn<String> hash = GeneratedColumn<String>(
      'hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [parentId, weaponId, materialId, quantity, upperLevel, purposeType, hash];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmark_material_details_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<BookmarkMaterialDetails> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('weapon_id')) {
      context.handle(_weaponIdMeta,
          weaponId.isAcceptableOrUnknown(data['weapon_id']!, _weaponIdMeta));
    }
    if (data.containsKey('material_id')) {
      context.handle(
          _materialIdMeta,
          materialId.isAcceptableOrUnknown(
              data['material_id']!, _materialIdMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('upper_level')) {
      context.handle(
          _upperLevelMeta,
          upperLevel.isAcceptableOrUnknown(
              data['upper_level']!, _upperLevelMeta));
    } else if (isInserting) {
      context.missing(_upperLevelMeta);
    }
    if (data.containsKey('hash')) {
      context.handle(
          _hashMeta, hash.isAcceptableOrUnknown(data['hash']!, _hashMeta));
    } else if (isInserting) {
      context.missing(_hashMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {hash};
  @override
  BookmarkMaterialDetails map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarkMaterialDetails(
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id'])!,
      weaponId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}weapon_id']),
      materialId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}material_id']),
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      upperLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}upper_level'])!,
      purposeType: $BookmarkMaterialDetailsTableTable.$converterpurposeType
          .fromSql(attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}purpose_type'])!),
      hash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hash'])!,
    );
  }

  @override
  $BookmarkMaterialDetailsTableTable createAlias(String alias) {
    return $BookmarkMaterialDetailsTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Purpose, String, String> $converterpurposeType =
      const EnumNameConverter<Purpose>(Purpose.values);
}

class BookmarkMaterialDetails extends DataClass
    implements Insertable<BookmarkMaterialDetails> {
  final int parentId;

  /// If null, this is a character material bookmark.
  final String? weaponId;

  /// If null, this bookmark will be regarded as EXP items.
  final String? materialId;

  /// If [materialId] is null, this represents the amount of EXP.
  final int quantity;

  /// target level.
  final int upperLevel;
  final Purpose purposeType;
  final String hash;
  const BookmarkMaterialDetails(
      {required this.parentId,
      this.weaponId,
      this.materialId,
      required this.quantity,
      required this.upperLevel,
      required this.purposeType,
      required this.hash});
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
    {
      map['purpose_type'] = Variable<String>($BookmarkMaterialDetailsTableTable
          .$converterpurposeType
          .toSql(purposeType));
    }
    map['hash'] = Variable<String>(hash);
    return map;
  }

  BookmarkMaterialDetailsCompanion toCompanion(bool nullToAbsent) {
    return BookmarkMaterialDetailsCompanion(
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

  factory BookmarkMaterialDetails.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkMaterialDetails(
      parentId: serializer.fromJson<int>(json['parentId']),
      weaponId: serializer.fromJson<String?>(json['weaponId']),
      materialId: serializer.fromJson<String?>(json['materialId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      upperLevel: serializer.fromJson<int>(json['upperLevel']),
      purposeType: $BookmarkMaterialDetailsTableTable.$converterpurposeType
          .fromJson(serializer.fromJson<String>(json['purposeType'])),
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
      'purposeType': serializer.toJson<String>(
          $BookmarkMaterialDetailsTableTable.$converterpurposeType
              .toJson(purposeType)),
      'hash': serializer.toJson<String>(hash),
    };
  }

  BookmarkMaterialDetails copyWith(
          {int? parentId,
          Value<String?> weaponId = const Value.absent(),
          Value<String?> materialId = const Value.absent(),
          int? quantity,
          int? upperLevel,
          Purpose? purposeType,
          String? hash}) =>
      BookmarkMaterialDetails(
        parentId: parentId ?? this.parentId,
        weaponId: weaponId.present ? weaponId.value : this.weaponId,
        materialId: materialId.present ? materialId.value : this.materialId,
        quantity: quantity ?? this.quantity,
        upperLevel: upperLevel ?? this.upperLevel,
        purposeType: purposeType ?? this.purposeType,
        hash: hash ?? this.hash,
      );
  BookmarkMaterialDetails copyWithCompanion(
      BookmarkMaterialDetailsCompanion data) {
    return BookmarkMaterialDetails(
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      weaponId: data.weaponId.present ? data.weaponId.value : this.weaponId,
      materialId:
          data.materialId.present ? data.materialId.value : this.materialId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      upperLevel:
          data.upperLevel.present ? data.upperLevel.value : this.upperLevel,
      purposeType:
          data.purposeType.present ? data.purposeType.value : this.purposeType,
      hash: data.hash.present ? data.hash.value : this.hash,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkMaterialDetails(')
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
      parentId, weaponId, materialId, quantity, upperLevel, purposeType, hash);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookmarkMaterialDetails &&
          other.parentId == this.parentId &&
          other.weaponId == this.weaponId &&
          other.materialId == this.materialId &&
          other.quantity == this.quantity &&
          other.upperLevel == this.upperLevel &&
          other.purposeType == this.purposeType &&
          other.hash == this.hash);
}

class BookmarkMaterialDetailsCompanion
    extends UpdateCompanion<BookmarkMaterialDetails> {
  final Value<int> parentId;
  final Value<String?> weaponId;
  final Value<String?> materialId;
  final Value<int> quantity;
  final Value<int> upperLevel;
  final Value<Purpose> purposeType;
  final Value<String> hash;
  final Value<int> rowid;
  const BookmarkMaterialDetailsCompanion({
    this.parentId = const Value.absent(),
    this.weaponId = const Value.absent(),
    this.materialId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.upperLevel = const Value.absent(),
    this.purposeType = const Value.absent(),
    this.hash = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BookmarkMaterialDetailsCompanion.insert({
    required int parentId,
    this.weaponId = const Value.absent(),
    this.materialId = const Value.absent(),
    required int quantity,
    required int upperLevel,
    required Purpose purposeType,
    required String hash,
    this.rowid = const Value.absent(),
  })  : parentId = Value(parentId),
        quantity = Value(quantity),
        upperLevel = Value(upperLevel),
        purposeType = Value(purposeType),
        hash = Value(hash);
  static Insertable<BookmarkMaterialDetails> custom({
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

  BookmarkMaterialDetailsCompanion copyWith(
      {Value<int>? parentId,
      Value<String?>? weaponId,
      Value<String?>? materialId,
      Value<int>? quantity,
      Value<int>? upperLevel,
      Value<Purpose>? purposeType,
      Value<String>? hash,
      Value<int>? rowid}) {
    return BookmarkMaterialDetailsCompanion(
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
      map['purpose_type'] = Variable<String>($BookmarkMaterialDetailsTableTable
          .$converterpurposeType
          .toSql(purposeType.value));
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
    return (StringBuffer('BookmarkMaterialDetailsCompanion(')
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

class $BookmarkArtifactSetDetailsTableTable
    extends BookmarkArtifactSetDetailsTable
    with
        TableInfo<$BookmarkArtifactSetDetailsTableTable,
            BookmarkArtifactSetDetails> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookmarkArtifactSetDetailsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES bookmark_table (id) ON DELETE CASCADE'));
  @override
  late final GeneratedColumnWithTypeConverter<List<ArtifactSetId>, String>
      sets = GeneratedColumn<String>('sets', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<ArtifactSetId>>(
              $BookmarkArtifactSetDetailsTableTable.$convertersets);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, StatId?>, String>
      mainStats = GeneratedColumn<String>('main_stats', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, StatId?>>(
              $BookmarkArtifactSetDetailsTableTable.$convertermainStats);
  @override
  late final GeneratedColumnWithTypeConverter<List<StatId>, String> subStats =
      GeneratedColumn<String>('sub_stats', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<StatId>>(
              $BookmarkArtifactSetDetailsTableTable.$convertersubStats);
  @override
  List<GeneratedColumn> get $columns =>
      [id, parentId, sets, mainStats, subStats];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmark_artifact_set_details_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<BookmarkArtifactSetDetails> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookmarkArtifactSetDetails map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarkArtifactSetDetails(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id'])!,
      sets: $BookmarkArtifactSetDetailsTableTable.$convertersets.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}sets'])!),
      mainStats: $BookmarkArtifactSetDetailsTableTable.$convertermainStats
          .fromSql(attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}main_stats'])!),
      subStats: $BookmarkArtifactSetDetailsTableTable.$convertersubStats
          .fromSql(attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}sub_stats'])!),
    );
  }

  @override
  $BookmarkArtifactSetDetailsTableTable createAlias(String alias) {
    return $BookmarkArtifactSetDetailsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<ArtifactSetId>, String> $convertersets =
      const ListConverter<ArtifactSetId>();
  static TypeConverter<Map<String, StatId?>, String> $convertermainStats =
      const MapConverter<StatId?>();
  static TypeConverter<List<StatId>, String> $convertersubStats =
      const ListConverter<StatId>();
}

class BookmarkArtifactSetDetails extends DataClass
    implements Insertable<BookmarkArtifactSetDetails> {
  final int id;
  final int parentId;
  final List<ArtifactSetId> sets;

  /// key = [ArtifactPieceTypeId]
  final Map<String, StatId?> mainStats;
  final List<StatId> subStats;
  const BookmarkArtifactSetDetails(
      {required this.id,
      required this.parentId,
      required this.sets,
      required this.mainStats,
      required this.subStats});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['parent_id'] = Variable<int>(parentId);
    {
      map['sets'] = Variable<String>(
          $BookmarkArtifactSetDetailsTableTable.$convertersets.toSql(sets));
    }
    {
      map['main_stats'] = Variable<String>($BookmarkArtifactSetDetailsTableTable
          .$convertermainStats
          .toSql(mainStats));
    }
    {
      map['sub_stats'] = Variable<String>($BookmarkArtifactSetDetailsTableTable
          .$convertersubStats
          .toSql(subStats));
    }
    return map;
  }

  BookmarkArtifactSetDetailsCompanion toCompanion(bool nullToAbsent) {
    return BookmarkArtifactSetDetailsCompanion(
      id: Value(id),
      parentId: Value(parentId),
      sets: Value(sets),
      mainStats: Value(mainStats),
      subStats: Value(subStats),
    );
  }

  factory BookmarkArtifactSetDetails.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkArtifactSetDetails(
      id: serializer.fromJson<int>(json['id']),
      parentId: serializer.fromJson<int>(json['parentId']),
      sets: serializer.fromJson<List<ArtifactSetId>>(json['sets']),
      mainStats: serializer.fromJson<Map<String, StatId?>>(json['mainStats']),
      subStats: serializer.fromJson<List<StatId>>(json['subStats']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parentId': serializer.toJson<int>(parentId),
      'sets': serializer.toJson<List<ArtifactSetId>>(sets),
      'mainStats': serializer.toJson<Map<String, StatId?>>(mainStats),
      'subStats': serializer.toJson<List<StatId>>(subStats),
    };
  }

  BookmarkArtifactSetDetails copyWith(
          {int? id,
          int? parentId,
          List<ArtifactSetId>? sets,
          Map<String, StatId?>? mainStats,
          List<StatId>? subStats}) =>
      BookmarkArtifactSetDetails(
        id: id ?? this.id,
        parentId: parentId ?? this.parentId,
        sets: sets ?? this.sets,
        mainStats: mainStats ?? this.mainStats,
        subStats: subStats ?? this.subStats,
      );
  BookmarkArtifactSetDetails copyWithCompanion(
      BookmarkArtifactSetDetailsCompanion data) {
    return BookmarkArtifactSetDetails(
      id: data.id.present ? data.id.value : this.id,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      sets: data.sets.present ? data.sets.value : this.sets,
      mainStats: data.mainStats.present ? data.mainStats.value : this.mainStats,
      subStats: data.subStats.present ? data.subStats.value : this.subStats,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkArtifactSetDetails(')
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
      (other is BookmarkArtifactSetDetails &&
          other.id == this.id &&
          other.parentId == this.parentId &&
          other.sets == this.sets &&
          other.mainStats == this.mainStats &&
          other.subStats == this.subStats);
}

class BookmarkArtifactSetDetailsCompanion
    extends UpdateCompanion<BookmarkArtifactSetDetails> {
  final Value<int> id;
  final Value<int> parentId;
  final Value<List<ArtifactSetId>> sets;
  final Value<Map<String, StatId?>> mainStats;
  final Value<List<StatId>> subStats;
  const BookmarkArtifactSetDetailsCompanion({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    this.sets = const Value.absent(),
    this.mainStats = const Value.absent(),
    this.subStats = const Value.absent(),
  });
  BookmarkArtifactSetDetailsCompanion.insert({
    this.id = const Value.absent(),
    required int parentId,
    required List<ArtifactSetId> sets,
    required Map<String, StatId?> mainStats,
    required List<StatId> subStats,
  })  : parentId = Value(parentId),
        sets = Value(sets),
        mainStats = Value(mainStats),
        subStats = Value(subStats);
  static Insertable<BookmarkArtifactSetDetails> custom({
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

  BookmarkArtifactSetDetailsCompanion copyWith(
      {Value<int>? id,
      Value<int>? parentId,
      Value<List<ArtifactSetId>>? sets,
      Value<Map<String, StatId?>>? mainStats,
      Value<List<StatId>>? subStats}) {
    return BookmarkArtifactSetDetailsCompanion(
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
      map['sets'] = Variable<String>($BookmarkArtifactSetDetailsTableTable
          .$convertersets
          .toSql(sets.value));
    }
    if (mainStats.present) {
      map['main_stats'] = Variable<String>($BookmarkArtifactSetDetailsTableTable
          .$convertermainStats
          .toSql(mainStats.value));
    }
    if (subStats.present) {
      map['sub_stats'] = Variable<String>($BookmarkArtifactSetDetailsTableTable
          .$convertersubStats
          .toSql(subStats.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkArtifactSetDetailsCompanion(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('sets: $sets, ')
          ..write('mainStats: $mainStats, ')
          ..write('subStats: $subStats')
          ..write(')'))
        .toString();
  }
}

class $BookmarkArtifactPieceDetailsTableTable
    extends BookmarkArtifactPieceDetailsTable
    with
        TableInfo<$BookmarkArtifactPieceDetailsTableTable,
            BookmarkArtifactPieceDetails> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookmarkArtifactPieceDetailsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES bookmark_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _pieceMeta = const VerificationMeta('piece');
  @override
  late final GeneratedColumn<String> piece = GeneratedColumn<String>(
      'piece', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mainStatMeta =
      const VerificationMeta('mainStat');
  @override
  late final GeneratedColumn<String> mainStat = GeneratedColumn<String>(
      'main_stat', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<List<StatId>, String> subStats =
      GeneratedColumn<String>('sub_stats', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<StatId>>(
              $BookmarkArtifactPieceDetailsTableTable.$convertersubStats);
  @override
  List<GeneratedColumn> get $columns =>
      [id, parentId, piece, mainStat, subStats];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmark_artifact_piece_details_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<BookmarkArtifactPieceDetails> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('piece')) {
      context.handle(
          _pieceMeta, piece.isAcceptableOrUnknown(data['piece']!, _pieceMeta));
    } else if (isInserting) {
      context.missing(_pieceMeta);
    }
    if (data.containsKey('main_stat')) {
      context.handle(_mainStatMeta,
          mainStat.isAcceptableOrUnknown(data['main_stat']!, _mainStatMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookmarkArtifactPieceDetails map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarkArtifactPieceDetails(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id'])!,
      piece: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}piece'])!,
      mainStat: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}main_stat']),
      subStats: $BookmarkArtifactPieceDetailsTableTable.$convertersubStats
          .fromSql(attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}sub_stats'])!),
    );
  }

  @override
  $BookmarkArtifactPieceDetailsTableTable createAlias(String alias) {
    return $BookmarkArtifactPieceDetailsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<StatId>, String> $convertersubStats =
      const ListConverter<StatId>();
}

class BookmarkArtifactPieceDetails extends DataClass
    implements Insertable<BookmarkArtifactPieceDetails> {
  final int id;
  final int parentId;

  /// [ArtifactPieceId]
  final String piece;

  /// [ArtifactPieceTypeId]?
  final String? mainStat;
  final List<StatId> subStats;
  const BookmarkArtifactPieceDetails(
      {required this.id,
      required this.parentId,
      required this.piece,
      this.mainStat,
      required this.subStats});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['parent_id'] = Variable<int>(parentId);
    map['piece'] = Variable<String>(piece);
    if (!nullToAbsent || mainStat != null) {
      map['main_stat'] = Variable<String>(mainStat);
    }
    {
      map['sub_stats'] = Variable<String>(
          $BookmarkArtifactPieceDetailsTableTable.$convertersubStats
              .toSql(subStats));
    }
    return map;
  }

  BookmarkArtifactPieceDetailsCompanion toCompanion(bool nullToAbsent) {
    return BookmarkArtifactPieceDetailsCompanion(
      id: Value(id),
      parentId: Value(parentId),
      piece: Value(piece),
      mainStat: mainStat == null && nullToAbsent
          ? const Value.absent()
          : Value(mainStat),
      subStats: Value(subStats),
    );
  }

  factory BookmarkArtifactPieceDetails.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkArtifactPieceDetails(
      id: serializer.fromJson<int>(json['id']),
      parentId: serializer.fromJson<int>(json['parentId']),
      piece: serializer.fromJson<String>(json['piece']),
      mainStat: serializer.fromJson<String?>(json['mainStat']),
      subStats: serializer.fromJson<List<StatId>>(json['subStats']),
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
      'subStats': serializer.toJson<List<StatId>>(subStats),
    };
  }

  BookmarkArtifactPieceDetails copyWith(
          {int? id,
          int? parentId,
          String? piece,
          Value<String?> mainStat = const Value.absent(),
          List<StatId>? subStats}) =>
      BookmarkArtifactPieceDetails(
        id: id ?? this.id,
        parentId: parentId ?? this.parentId,
        piece: piece ?? this.piece,
        mainStat: mainStat.present ? mainStat.value : this.mainStat,
        subStats: subStats ?? this.subStats,
      );
  BookmarkArtifactPieceDetails copyWithCompanion(
      BookmarkArtifactPieceDetailsCompanion data) {
    return BookmarkArtifactPieceDetails(
      id: data.id.present ? data.id.value : this.id,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      piece: data.piece.present ? data.piece.value : this.piece,
      mainStat: data.mainStat.present ? data.mainStat.value : this.mainStat,
      subStats: data.subStats.present ? data.subStats.value : this.subStats,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkArtifactPieceDetails(')
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
      (other is BookmarkArtifactPieceDetails &&
          other.id == this.id &&
          other.parentId == this.parentId &&
          other.piece == this.piece &&
          other.mainStat == this.mainStat &&
          other.subStats == this.subStats);
}

class BookmarkArtifactPieceDetailsCompanion
    extends UpdateCompanion<BookmarkArtifactPieceDetails> {
  final Value<int> id;
  final Value<int> parentId;
  final Value<String> piece;
  final Value<String?> mainStat;
  final Value<List<StatId>> subStats;
  const BookmarkArtifactPieceDetailsCompanion({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    this.piece = const Value.absent(),
    this.mainStat = const Value.absent(),
    this.subStats = const Value.absent(),
  });
  BookmarkArtifactPieceDetailsCompanion.insert({
    this.id = const Value.absent(),
    required int parentId,
    required String piece,
    this.mainStat = const Value.absent(),
    required List<StatId> subStats,
  })  : parentId = Value(parentId),
        piece = Value(piece),
        subStats = Value(subStats);
  static Insertable<BookmarkArtifactPieceDetails> custom({
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

  BookmarkArtifactPieceDetailsCompanion copyWith(
      {Value<int>? id,
      Value<int>? parentId,
      Value<String>? piece,
      Value<String?>? mainStat,
      Value<List<StatId>>? subStats}) {
    return BookmarkArtifactPieceDetailsCompanion(
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
      map['sub_stats'] = Variable<String>(
          $BookmarkArtifactPieceDetailsTableTable.$convertersubStats
              .toSql(subStats.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkArtifactPieceDetailsCompanion(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('piece: $piece, ')
          ..write('mainStat: $mainStat, ')
          ..write('subStats: $subStats')
          ..write(')'))
        .toString();
  }
}

class $InGameCharacterStateTableTable extends InGameCharacterStateTable
    with TableInfo<$InGameCharacterStateTableTable, InGameCharacterState> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InGameCharacterStateTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _characterIdMeta =
      const VerificationMeta('characterId');
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
      'character_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<Map<Purpose, int>, String>
      purposes = GeneratedColumn<String>('purposes', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<Purpose, int>>(
              $InGameCharacterStateTableTable.$converterpurposes);
  static const VerificationMeta _equippedWeaponIdMeta =
      const VerificationMeta('equippedWeaponId');
  @override
  late final GeneratedColumn<String> equippedWeaponId = GeneratedColumn<String>(
      'equipped_weapon_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [uid, characterId, purposes, equippedWeaponId, lastUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'in_game_character_state_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<InGameCharacterState> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('character_id')) {
      context.handle(
          _characterIdMeta,
          characterId.isAcceptableOrUnknown(
              data['character_id']!, _characterIdMeta));
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('equipped_weapon_id')) {
      context.handle(
          _equippedWeaponIdMeta,
          equippedWeaponId.isAcceptableOrUnknown(
              data['equipped_weapon_id']!, _equippedWeaponIdMeta));
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid, characterId};
  @override
  InGameCharacterState map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InGameCharacterState(
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid'])!,
      characterId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_id'])!,
      purposes: $InGameCharacterStateTableTable.$converterpurposes.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}purposes'])!),
      equippedWeaponId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}equipped_weapon_id']),
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
    );
  }

  @override
  $InGameCharacterStateTableTable createAlias(String alias) {
    return $InGameCharacterStateTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<Purpose, int>, String> $converterpurposes =
      const PurposeMapConverter();
}

class InGameCharacterState extends DataClass
    implements Insertable<InGameCharacterState>, InGameState {
  final String uid;
  final String characterId;
  final Map<Purpose, int> purposes;
  final String? equippedWeaponId;
  final DateTime lastUpdated;
  const InGameCharacterState(
      {required this.uid,
      required this.characterId,
      required this.purposes,
      this.equippedWeaponId,
      required this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['character_id'] = Variable<String>(characterId);
    {
      map['purposes'] = Variable<String>(
          $InGameCharacterStateTableTable.$converterpurposes.toSql(purposes));
    }
    if (!nullToAbsent || equippedWeaponId != null) {
      map['equipped_weapon_id'] = Variable<String>(equippedWeaponId);
    }
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  InGameCharacterStateCompanion toCompanion(bool nullToAbsent) {
    return InGameCharacterStateCompanion(
      uid: Value(uid),
      characterId: Value(characterId),
      purposes: Value(purposes),
      equippedWeaponId: equippedWeaponId == null && nullToAbsent
          ? const Value.absent()
          : Value(equippedWeaponId),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory InGameCharacterState.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InGameCharacterState(
      uid: serializer.fromJson<String>(json['uid']),
      characterId: serializer.fromJson<String>(json['characterId']),
      purposes: serializer.fromJson<Map<Purpose, int>>(json['purposes']),
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
      'purposes': serializer.toJson<Map<Purpose, int>>(purposes),
      'equippedWeaponId': serializer.toJson<String?>(equippedWeaponId),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  InGameCharacterState copyWith(
          {String? uid,
          String? characterId,
          Map<Purpose, int>? purposes,
          Value<String?> equippedWeaponId = const Value.absent(),
          DateTime? lastUpdated}) =>
      InGameCharacterState(
        uid: uid ?? this.uid,
        characterId: characterId ?? this.characterId,
        purposes: purposes ?? this.purposes,
        equippedWeaponId: equippedWeaponId.present
            ? equippedWeaponId.value
            : this.equippedWeaponId,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );
  InGameCharacterState copyWithCompanion(InGameCharacterStateCompanion data) {
    return InGameCharacterState(
      uid: data.uid.present ? data.uid.value : this.uid,
      characterId:
          data.characterId.present ? data.characterId.value : this.characterId,
      purposes: data.purposes.present ? data.purposes.value : this.purposes,
      equippedWeaponId: data.equippedWeaponId.present
          ? data.equippedWeaponId.value
          : this.equippedWeaponId,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InGameCharacterState(')
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
      (other is InGameCharacterState &&
          other.uid == this.uid &&
          other.characterId == this.characterId &&
          other.purposes == this.purposes &&
          other.equippedWeaponId == this.equippedWeaponId &&
          other.lastUpdated == this.lastUpdated);
}

class InGameCharacterStateCompanion
    extends UpdateCompanion<InGameCharacterState> {
  final Value<String> uid;
  final Value<String> characterId;
  final Value<Map<Purpose, int>> purposes;
  final Value<String?> equippedWeaponId;
  final Value<DateTime> lastUpdated;
  final Value<int> rowid;
  const InGameCharacterStateCompanion({
    this.uid = const Value.absent(),
    this.characterId = const Value.absent(),
    this.purposes = const Value.absent(),
    this.equippedWeaponId = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InGameCharacterStateCompanion.insert({
    required String uid,
    required String characterId,
    required Map<Purpose, int> purposes,
    this.equippedWeaponId = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uid = Value(uid),
        characterId = Value(characterId),
        purposes = Value(purposes);
  static Insertable<InGameCharacterState> custom({
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

  InGameCharacterStateCompanion copyWith(
      {Value<String>? uid,
      Value<String>? characterId,
      Value<Map<Purpose, int>>? purposes,
      Value<String?>? equippedWeaponId,
      Value<DateTime>? lastUpdated,
      Value<int>? rowid}) {
    return InGameCharacterStateCompanion(
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
      map['purposes'] = Variable<String>($InGameCharacterStateTableTable
          .$converterpurposes
          .toSql(purposes.value));
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
    return (StringBuffer('InGameCharacterStateCompanion(')
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

class $InGameWeaponStateTableTable extends InGameWeaponStateTable
    with TableInfo<$InGameWeaponStateTableTable, InGameWeaponState> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InGameWeaponStateTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _characterIdMeta =
      const VerificationMeta('characterId');
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
      'character_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _weaponIdMeta =
      const VerificationMeta('weaponId');
  @override
  late final GeneratedColumn<String> weaponId = GeneratedColumn<String>(
      'weapon_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<Map<Purpose, int>, String>
      purposes = GeneratedColumn<String>('purposes', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<Purpose, int>>(
              $InGameWeaponStateTableTable.$converterpurposes);
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [uid, characterId, weaponId, purposes, lastUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'in_game_weapon_state_table';
  @override
  VerificationContext validateIntegrity(Insertable<InGameWeaponState> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('character_id')) {
      context.handle(
          _characterIdMeta,
          characterId.isAcceptableOrUnknown(
              data['character_id']!, _characterIdMeta));
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('weapon_id')) {
      context.handle(_weaponIdMeta,
          weaponId.isAcceptableOrUnknown(data['weapon_id']!, _weaponIdMeta));
    } else if (isInserting) {
      context.missing(_weaponIdMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid, characterId, weaponId};
  @override
  InGameWeaponState map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InGameWeaponState(
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid'])!,
      characterId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_id'])!,
      weaponId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}weapon_id'])!,
      purposes: $InGameWeaponStateTableTable.$converterpurposes.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}purposes'])!),
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
    );
  }

  @override
  $InGameWeaponStateTableTable createAlias(String alias) {
    return $InGameWeaponStateTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<Purpose, int>, String> $converterpurposes =
      const PurposeMapConverter();
}

class InGameWeaponState extends DataClass
    implements Insertable<InGameWeaponState>, InGameState {
  final String uid;
  final String characterId;
  final String weaponId;
  final Map<Purpose, int> purposes;
  final DateTime lastUpdated;
  const InGameWeaponState(
      {required this.uid,
      required this.characterId,
      required this.weaponId,
      required this.purposes,
      required this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['character_id'] = Variable<String>(characterId);
    map['weapon_id'] = Variable<String>(weaponId);
    {
      map['purposes'] = Variable<String>(
          $InGameWeaponStateTableTable.$converterpurposes.toSql(purposes));
    }
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  InGameWeaponStateCompanion toCompanion(bool nullToAbsent) {
    return InGameWeaponStateCompanion(
      uid: Value(uid),
      characterId: Value(characterId),
      weaponId: Value(weaponId),
      purposes: Value(purposes),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory InGameWeaponState.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InGameWeaponState(
      uid: serializer.fromJson<String>(json['uid']),
      characterId: serializer.fromJson<String>(json['characterId']),
      weaponId: serializer.fromJson<String>(json['weaponId']),
      purposes: serializer.fromJson<Map<Purpose, int>>(json['purposes']),
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
      'purposes': serializer.toJson<Map<Purpose, int>>(purposes),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  InGameWeaponState copyWith(
          {String? uid,
          String? characterId,
          String? weaponId,
          Map<Purpose, int>? purposes,
          DateTime? lastUpdated}) =>
      InGameWeaponState(
        uid: uid ?? this.uid,
        characterId: characterId ?? this.characterId,
        weaponId: weaponId ?? this.weaponId,
        purposes: purposes ?? this.purposes,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );
  InGameWeaponState copyWithCompanion(InGameWeaponStateCompanion data) {
    return InGameWeaponState(
      uid: data.uid.present ? data.uid.value : this.uid,
      characterId:
          data.characterId.present ? data.characterId.value : this.characterId,
      weaponId: data.weaponId.present ? data.weaponId.value : this.weaponId,
      purposes: data.purposes.present ? data.purposes.value : this.purposes,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InGameWeaponState(')
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
      (other is InGameWeaponState &&
          other.uid == this.uid &&
          other.characterId == this.characterId &&
          other.weaponId == this.weaponId &&
          other.purposes == this.purposes &&
          other.lastUpdated == this.lastUpdated);
}

class InGameWeaponStateCompanion extends UpdateCompanion<InGameWeaponState> {
  final Value<String> uid;
  final Value<String> characterId;
  final Value<String> weaponId;
  final Value<Map<Purpose, int>> purposes;
  final Value<DateTime> lastUpdated;
  final Value<int> rowid;
  const InGameWeaponStateCompanion({
    this.uid = const Value.absent(),
    this.characterId = const Value.absent(),
    this.weaponId = const Value.absent(),
    this.purposes = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InGameWeaponStateCompanion.insert({
    required String uid,
    required String characterId,
    required String weaponId,
    required Map<Purpose, int> purposes,
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uid = Value(uid),
        characterId = Value(characterId),
        weaponId = Value(weaponId),
        purposes = Value(purposes);
  static Insertable<InGameWeaponState> custom({
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

  InGameWeaponStateCompanion copyWith(
      {Value<String>? uid,
      Value<String>? characterId,
      Value<String>? weaponId,
      Value<Map<Purpose, int>>? purposes,
      Value<DateTime>? lastUpdated,
      Value<int>? rowid}) {
    return InGameWeaponStateCompanion(
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
      map['purposes'] = Variable<String>($InGameWeaponStateTableTable
          .$converterpurposes
          .toSql(purposes.value));
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
    return (StringBuffer('InGameWeaponStateCompanion(')
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

class $BookmarkOrderRegistryTableTable extends BookmarkOrderRegistryTable
    with TableInfo<$BookmarkOrderRegistryTableTable, BookmarkOrderRegistry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookmarkOrderRegistryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("main"));
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> order =
      GeneratedColumn<String>('order', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $BookmarkOrderRegistryTableTable.$converterorder);
  @override
  List<GeneratedColumn> get $columns => [id, order];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmark_order_registry_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<BookmarkOrderRegistry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookmarkOrderRegistry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarkOrderRegistry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      order: $BookmarkOrderRegistryTableTable.$converterorder.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}order'])!),
    );
  }

  @override
  $BookmarkOrderRegistryTableTable createAlias(String alias) {
    return $BookmarkOrderRegistryTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterorder =
      const ListConverter<String>();
}

class BookmarkOrderRegistry extends DataClass
    implements Insertable<BookmarkOrderRegistry> {
  final String id;
  final List<String> order;
  const BookmarkOrderRegistry({required this.id, required this.order});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['order'] = Variable<String>(
          $BookmarkOrderRegistryTableTable.$converterorder.toSql(order));
    }
    return map;
  }

  BookmarkOrderRegistryCompanion toCompanion(bool nullToAbsent) {
    return BookmarkOrderRegistryCompanion(
      id: Value(id),
      order: Value(order),
    );
  }

  factory BookmarkOrderRegistry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkOrderRegistry(
      id: serializer.fromJson<String>(json['id']),
      order: serializer.fromJson<List<String>>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'order': serializer.toJson<List<String>>(order),
    };
  }

  BookmarkOrderRegistry copyWith({String? id, List<String>? order}) =>
      BookmarkOrderRegistry(
        id: id ?? this.id,
        order: order ?? this.order,
      );
  BookmarkOrderRegistry copyWithCompanion(BookmarkOrderRegistryCompanion data) {
    return BookmarkOrderRegistry(
      id: data.id.present ? data.id.value : this.id,
      order: data.order.present ? data.order.value : this.order,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkOrderRegistry(')
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
      (other is BookmarkOrderRegistry &&
          other.id == this.id &&
          other.order == this.order);
}

class BookmarkOrderRegistryCompanion
    extends UpdateCompanion<BookmarkOrderRegistry> {
  final Value<String> id;
  final Value<List<String>> order;
  final Value<int> rowid;
  const BookmarkOrderRegistryCompanion({
    this.id = const Value.absent(),
    this.order = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BookmarkOrderRegistryCompanion.insert({
    this.id = const Value.absent(),
    required List<String> order,
    this.rowid = const Value.absent(),
  }) : order = Value(order);
  static Insertable<BookmarkOrderRegistry> custom({
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

  BookmarkOrderRegistryCompanion copyWith(
      {Value<String>? id, Value<List<String>>? order, Value<int>? rowid}) {
    return BookmarkOrderRegistryCompanion(
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
      map['order'] = Variable<String>(
          $BookmarkOrderRegistryTableTable.$converterorder.toSql(order.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkOrderRegistryCompanion(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MaterialBagCountTableTable extends MaterialBagCountTable
    with TableInfo<$MaterialBagCountTableTable, MaterialBagCount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaterialBagCountTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hyvIdMeta = const VerificationMeta('hyvId');
  @override
  late final GeneratedColumn<int> hyvId = GeneratedColumn<int>(
      'hyv_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
      'count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [uid, hyvId, count, lastUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'material_bag_count_table';
  @override
  VerificationContext validateIntegrity(Insertable<MaterialBagCount> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('hyv_id')) {
      context.handle(
          _hyvIdMeta, hyvId.isAcceptableOrUnknown(data['hyv_id']!, _hyvIdMeta));
    } else if (isInserting) {
      context.missing(_hyvIdMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid, hyvId};
  @override
  MaterialBagCount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MaterialBagCount(
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid'])!,
      hyvId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hyv_id'])!,
      count: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
    );
  }

  @override
  $MaterialBagCountTableTable createAlias(String alias) {
    return $MaterialBagCountTableTable(attachedDatabase, alias);
  }
}

class MaterialBagCount extends DataClass
    implements Insertable<MaterialBagCount> {
  final String uid;
  final int hyvId;
  final int count;
  final DateTime lastUpdated;
  const MaterialBagCount(
      {required this.uid,
      required this.hyvId,
      required this.count,
      required this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['hyv_id'] = Variable<int>(hyvId);
    map['count'] = Variable<int>(count);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  MaterialBagCountCompanion toCompanion(bool nullToAbsent) {
    return MaterialBagCountCompanion(
      uid: Value(uid),
      hyvId: Value(hyvId),
      count: Value(count),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory MaterialBagCount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MaterialBagCount(
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

  MaterialBagCount copyWith(
          {String? uid, int? hyvId, int? count, DateTime? lastUpdated}) =>
      MaterialBagCount(
        uid: uid ?? this.uid,
        hyvId: hyvId ?? this.hyvId,
        count: count ?? this.count,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );
  MaterialBagCount copyWithCompanion(MaterialBagCountCompanion data) {
    return MaterialBagCount(
      uid: data.uid.present ? data.uid.value : this.uid,
      hyvId: data.hyvId.present ? data.hyvId.value : this.hyvId,
      count: data.count.present ? data.count.value : this.count,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MaterialBagCount(')
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
      (other is MaterialBagCount &&
          other.uid == this.uid &&
          other.hyvId == this.hyvId &&
          other.count == this.count &&
          other.lastUpdated == this.lastUpdated);
}

class MaterialBagCountCompanion extends UpdateCompanion<MaterialBagCount> {
  final Value<String> uid;
  final Value<int> hyvId;
  final Value<int> count;
  final Value<DateTime> lastUpdated;
  final Value<int> rowid;
  const MaterialBagCountCompanion({
    this.uid = const Value.absent(),
    this.hyvId = const Value.absent(),
    this.count = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MaterialBagCountCompanion.insert({
    required String uid,
    required int hyvId,
    required int count,
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uid = Value(uid),
        hyvId = Value(hyvId),
        count = Value(count);
  static Insertable<MaterialBagCount> custom({
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

  MaterialBagCountCompanion copyWith(
      {Value<String>? uid,
      Value<int>? hyvId,
      Value<int>? count,
      Value<DateTime>? lastUpdated,
      Value<int>? rowid}) {
    return MaterialBagCountCompanion(
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
    return (StringBuffer('MaterialBagCountCompanion(')
          ..write('uid: $uid, ')
          ..write('hyvId: $hyvId, ')
          ..write('count: $count, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FurnishingCraftCountTableTable extends FurnishingCraftCountTable
    with TableInfo<$FurnishingCraftCountTableTable, FurnishingCraftCount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FurnishingCraftCountTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _furnishingIdMeta =
      const VerificationMeta('furnishingId');
  @override
  late final GeneratedColumn<String> furnishingId = GeneratedColumn<String>(
      'furnishing_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _setIdMeta = const VerificationMeta('setId');
  @override
  late final GeneratedColumn<String> setId = GeneratedColumn<String>(
      'set_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
      'count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [furnishingId, setId, count];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'furnishing_craft_count_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<FurnishingCraftCount> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('furnishing_id')) {
      context.handle(
          _furnishingIdMeta,
          furnishingId.isAcceptableOrUnknown(
              data['furnishing_id']!, _furnishingIdMeta));
    } else if (isInserting) {
      context.missing(_furnishingIdMeta);
    }
    if (data.containsKey('set_id')) {
      context.handle(
          _setIdMeta, setId.isAcceptableOrUnknown(data['set_id']!, _setIdMeta));
    } else if (isInserting) {
      context.missing(_setIdMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {furnishingId, setId};
  @override
  FurnishingCraftCount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FurnishingCraftCount(
      furnishingId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}furnishing_id'])!,
      setId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}set_id'])!,
      count: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count'])!,
    );
  }

  @override
  $FurnishingCraftCountTableTable createAlias(String alias) {
    return $FurnishingCraftCountTableTable(attachedDatabase, alias);
  }
}

class FurnishingCraftCount extends DataClass
    implements Insertable<FurnishingCraftCount> {
  final String furnishingId;
  final String setId;
  final int count;
  const FurnishingCraftCount(
      {required this.furnishingId, required this.setId, required this.count});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['furnishing_id'] = Variable<String>(furnishingId);
    map['set_id'] = Variable<String>(setId);
    map['count'] = Variable<int>(count);
    return map;
  }

  FurnishingCraftCountCompanion toCompanion(bool nullToAbsent) {
    return FurnishingCraftCountCompanion(
      furnishingId: Value(furnishingId),
      setId: Value(setId),
      count: Value(count),
    );
  }

  factory FurnishingCraftCount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FurnishingCraftCount(
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

  FurnishingCraftCount copyWith(
          {String? furnishingId, String? setId, int? count}) =>
      FurnishingCraftCount(
        furnishingId: furnishingId ?? this.furnishingId,
        setId: setId ?? this.setId,
        count: count ?? this.count,
      );
  FurnishingCraftCount copyWithCompanion(FurnishingCraftCountCompanion data) {
    return FurnishingCraftCount(
      furnishingId: data.furnishingId.present
          ? data.furnishingId.value
          : this.furnishingId,
      setId: data.setId.present ? data.setId.value : this.setId,
      count: data.count.present ? data.count.value : this.count,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FurnishingCraftCount(')
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
      (other is FurnishingCraftCount &&
          other.furnishingId == this.furnishingId &&
          other.setId == this.setId &&
          other.count == this.count);
}

class FurnishingCraftCountCompanion
    extends UpdateCompanion<FurnishingCraftCount> {
  final Value<String> furnishingId;
  final Value<String> setId;
  final Value<int> count;
  final Value<int> rowid;
  const FurnishingCraftCountCompanion({
    this.furnishingId = const Value.absent(),
    this.setId = const Value.absent(),
    this.count = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FurnishingCraftCountCompanion.insert({
    required String furnishingId,
    required String setId,
    required int count,
    this.rowid = const Value.absent(),
  })  : furnishingId = Value(furnishingId),
        setId = Value(setId),
        count = Value(count);
  static Insertable<FurnishingCraftCount> custom({
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

  FurnishingCraftCountCompanion copyWith(
      {Value<String>? furnishingId,
      Value<String>? setId,
      Value<int>? count,
      Value<int>? rowid}) {
    return FurnishingCraftCountCompanion(
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
    return (StringBuffer('FurnishingCraftCountCompanion(')
          ..write('furnishingId: $furnishingId, ')
          ..write('setId: $setId, ')
          ..write('count: $count, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FurnishingSetBookmarkTableTable extends FurnishingSetBookmarkTable
    with TableInfo<$FurnishingSetBookmarkTableTable, FurnishingSetBookmark> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FurnishingSetBookmarkTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _setIdMeta = const VerificationMeta('setId');
  @override
  late final GeneratedColumn<String> setId = GeneratedColumn<String>(
      'set_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [setId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'furnishing_set_bookmark_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<FurnishingSetBookmark> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('set_id')) {
      context.handle(
          _setIdMeta, setId.isAcceptableOrUnknown(data['set_id']!, _setIdMeta));
    } else if (isInserting) {
      context.missing(_setIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {setId};
  @override
  FurnishingSetBookmark map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FurnishingSetBookmark(
      setId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}set_id'])!,
    );
  }

  @override
  $FurnishingSetBookmarkTableTable createAlias(String alias) {
    return $FurnishingSetBookmarkTableTable(attachedDatabase, alias);
  }
}

class FurnishingSetBookmark extends DataClass
    implements Insertable<FurnishingSetBookmark> {
  final String setId;
  const FurnishingSetBookmark({required this.setId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['set_id'] = Variable<String>(setId);
    return map;
  }

  FurnishingSetBookmarkCompanion toCompanion(bool nullToAbsent) {
    return FurnishingSetBookmarkCompanion(
      setId: Value(setId),
    );
  }

  factory FurnishingSetBookmark.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FurnishingSetBookmark(
      setId: serializer.fromJson<String>(json['setId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'setId': serializer.toJson<String>(setId),
    };
  }

  FurnishingSetBookmark copyWith({String? setId}) => FurnishingSetBookmark(
        setId: setId ?? this.setId,
      );
  FurnishingSetBookmark copyWithCompanion(FurnishingSetBookmarkCompanion data) {
    return FurnishingSetBookmark(
      setId: data.setId.present ? data.setId.value : this.setId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FurnishingSetBookmark(')
          ..write('setId: $setId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => setId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FurnishingSetBookmark && other.setId == this.setId);
}

class FurnishingSetBookmarkCompanion
    extends UpdateCompanion<FurnishingSetBookmark> {
  final Value<String> setId;
  final Value<int> rowid;
  const FurnishingSetBookmarkCompanion({
    this.setId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FurnishingSetBookmarkCompanion.insert({
    required String setId,
    this.rowid = const Value.absent(),
  }) : setId = Value(setId);
  static Insertable<FurnishingSetBookmark> custom({
    Expression<String>? setId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (setId != null) 'set_id': setId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FurnishingSetBookmarkCompanion copyWith(
      {Value<String>? setId, Value<int>? rowid}) {
    return FurnishingSetBookmarkCompanion(
      setId: setId ?? this.setId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (setId.present) {
      map['set_id'] = Variable<String>(setId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FurnishingSetBookmarkCompanion(')
          ..write('setId: $setId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BookmarkTableTable bookmarkTable = $BookmarkTableTable(this);
  late final $BookmarkMaterialDetailsTableTable bookmarkMaterialDetailsTable =
      $BookmarkMaterialDetailsTableTable(this);
  late final $BookmarkArtifactSetDetailsTableTable
      bookmarkArtifactSetDetailsTable =
      $BookmarkArtifactSetDetailsTableTable(this);
  late final $BookmarkArtifactPieceDetailsTableTable
      bookmarkArtifactPieceDetailsTable =
      $BookmarkArtifactPieceDetailsTableTable(this);
  late final $InGameCharacterStateTableTable inGameCharacterStateTable =
      $InGameCharacterStateTableTable(this);
  late final $InGameWeaponStateTableTable inGameWeaponStateTable =
      $InGameWeaponStateTableTable(this);
  late final $BookmarkOrderRegistryTableTable bookmarkOrderRegistryTable =
      $BookmarkOrderRegistryTableTable(this);
  late final $MaterialBagCountTableTable materialBagCountTable =
      $MaterialBagCountTableTable(this);
  late final $FurnishingCraftCountTableTable furnishingCraftCountTable =
      $FurnishingCraftCountTableTable(this);
  late final $FurnishingSetBookmarkTableTable furnishingSetBookmarkTable =
      $FurnishingSetBookmarkTableTable(this);
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
        furnishingSetBookmarkTable
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('bookmark_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('bookmark_material_details_table',
                  kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('bookmark_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('bookmark_artifact_set_details_table',
                  kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('bookmark_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('bookmark_artifact_piece_details_table',
                  kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$BookmarkTableTableCreateCompanionBuilder = BookmarkCompanion
    Function({
  Value<int> id,
  required BookmarkType type,
  required String characterId,
  Value<DateTime> createdAt,
  required String groupHash,
});
typedef $$BookmarkTableTableUpdateCompanionBuilder = BookmarkCompanion
    Function({
  Value<int> id,
  Value<BookmarkType> type,
  Value<String> characterId,
  Value<DateTime> createdAt,
  Value<String> groupHash,
});

final class $$BookmarkTableTableReferences
    extends BaseReferences<_$AppDatabase, $BookmarkTableTable, Bookmark> {
  $$BookmarkTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BookmarkMaterialDetailsTableTable,
      List<BookmarkMaterialDetails>> _bookmarkMaterialDetailsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.bookmarkMaterialDetailsTable,
          aliasName: $_aliasNameGenerator(
              db.bookmarkTable.id, db.bookmarkMaterialDetailsTable.parentId));

  $$BookmarkMaterialDetailsTableTableProcessedTableManager
      get bookmarkMaterialDetailsTableRefs {
    final manager = $$BookmarkMaterialDetailsTableTableTableManager(
            $_db, $_db.bookmarkMaterialDetailsTable)
        .filter((f) => f.parentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult
        .readTableOrNull(_bookmarkMaterialDetailsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$BookmarkArtifactSetDetailsTableTable,
          List<BookmarkArtifactSetDetails>>
      _bookmarkArtifactSetDetailsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.bookmarkArtifactSetDetailsTable,
              aliasName: $_aliasNameGenerator(db.bookmarkTable.id,
                  db.bookmarkArtifactSetDetailsTable.parentId));

  $$BookmarkArtifactSetDetailsTableTableProcessedTableManager
      get bookmarkArtifactSetDetailsTableRefs {
    final manager = $$BookmarkArtifactSetDetailsTableTableTableManager(
            $_db, $_db.bookmarkArtifactSetDetailsTable)
        .filter((f) => f.parentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult
        .readTableOrNull(_bookmarkArtifactSetDetailsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$BookmarkArtifactPieceDetailsTableTable,
          List<BookmarkArtifactPieceDetails>>
      _bookmarkArtifactPieceDetailsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.bookmarkArtifactPieceDetailsTable,
              aliasName: $_aliasNameGenerator(db.bookmarkTable.id,
                  db.bookmarkArtifactPieceDetailsTable.parentId));

  $$BookmarkArtifactPieceDetailsTableTableProcessedTableManager
      get bookmarkArtifactPieceDetailsTableRefs {
    final manager = $$BookmarkArtifactPieceDetailsTableTableTableManager(
            $_db, $_db.bookmarkArtifactPieceDetailsTable)
        .filter((f) => f.parentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult
        .readTableOrNull(_bookmarkArtifactPieceDetailsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$BookmarkTableTableFilterComposer
    extends Composer<_$AppDatabase, $BookmarkTableTable> {
  $$BookmarkTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<BookmarkType, BookmarkType, String> get type =>
      $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get groupHash => $composableBuilder(
      column: $table.groupHash, builder: (column) => ColumnFilters(column));

  Expression<bool> bookmarkMaterialDetailsTableRefs(
      Expression<bool> Function(
              $$BookmarkMaterialDetailsTableTableFilterComposer f)
          f) {
    final $$BookmarkMaterialDetailsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.bookmarkMaterialDetailsTable,
            getReferencedColumn: (t) => t.parentId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$BookmarkMaterialDetailsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.bookmarkMaterialDetailsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> bookmarkArtifactSetDetailsTableRefs(
      Expression<bool> Function(
              $$BookmarkArtifactSetDetailsTableTableFilterComposer f)
          f) {
    final $$BookmarkArtifactSetDetailsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.bookmarkArtifactSetDetailsTable,
            getReferencedColumn: (t) => t.parentId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$BookmarkArtifactSetDetailsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.bookmarkArtifactSetDetailsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> bookmarkArtifactPieceDetailsTableRefs(
      Expression<bool> Function(
              $$BookmarkArtifactPieceDetailsTableTableFilterComposer f)
          f) {
    final $$BookmarkArtifactPieceDetailsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.bookmarkArtifactPieceDetailsTable,
            getReferencedColumn: (t) => t.parentId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$BookmarkArtifactPieceDetailsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.bookmarkArtifactPieceDetailsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$BookmarkTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BookmarkTableTable> {
  $$BookmarkTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get groupHash => $composableBuilder(
      column: $table.groupHash, builder: (column) => ColumnOrderings(column));
}

class $$BookmarkTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BookmarkTableTable> {
  $$BookmarkTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<BookmarkType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get groupHash =>
      $composableBuilder(column: $table.groupHash, builder: (column) => column);

  Expression<T> bookmarkMaterialDetailsTableRefs<T extends Object>(
      Expression<T> Function(
              $$BookmarkMaterialDetailsTableTableAnnotationComposer a)
          f) {
    final $$BookmarkMaterialDetailsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.bookmarkMaterialDetailsTable,
            getReferencedColumn: (t) => t.parentId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$BookmarkMaterialDetailsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.bookmarkMaterialDetailsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> bookmarkArtifactSetDetailsTableRefs<T extends Object>(
      Expression<T> Function(
              $$BookmarkArtifactSetDetailsTableTableAnnotationComposer a)
          f) {
    final $$BookmarkArtifactSetDetailsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.bookmarkArtifactSetDetailsTable,
            getReferencedColumn: (t) => t.parentId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$BookmarkArtifactSetDetailsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.bookmarkArtifactSetDetailsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> bookmarkArtifactPieceDetailsTableRefs<T extends Object>(
      Expression<T> Function(
              $$BookmarkArtifactPieceDetailsTableTableAnnotationComposer a)
          f) {
    final $$BookmarkArtifactPieceDetailsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.bookmarkArtifactPieceDetailsTable,
            getReferencedColumn: (t) => t.parentId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$BookmarkArtifactPieceDetailsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.bookmarkArtifactPieceDetailsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$BookmarkTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BookmarkTableTable,
    Bookmark,
    $$BookmarkTableTableFilterComposer,
    $$BookmarkTableTableOrderingComposer,
    $$BookmarkTableTableAnnotationComposer,
    $$BookmarkTableTableCreateCompanionBuilder,
    $$BookmarkTableTableUpdateCompanionBuilder,
    (Bookmark, $$BookmarkTableTableReferences),
    Bookmark,
    PrefetchHooks Function(
        {bool bookmarkMaterialDetailsTableRefs,
        bool bookmarkArtifactSetDetailsTableRefs,
        bool bookmarkArtifactPieceDetailsTableRefs})> {
  $$BookmarkTableTableTableManager(_$AppDatabase db, $BookmarkTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookmarkTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BookmarkTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookmarkTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<BookmarkType> type = const Value.absent(),
            Value<String> characterId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> groupHash = const Value.absent(),
          }) =>
              BookmarkCompanion(
            id: id,
            type: type,
            characterId: characterId,
            createdAt: createdAt,
            groupHash: groupHash,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required BookmarkType type,
            required String characterId,
            Value<DateTime> createdAt = const Value.absent(),
            required String groupHash,
          }) =>
              BookmarkCompanion.insert(
            id: id,
            type: type,
            characterId: characterId,
            createdAt: createdAt,
            groupHash: groupHash,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BookmarkTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {bookmarkMaterialDetailsTableRefs = false,
              bookmarkArtifactSetDetailsTableRefs = false,
              bookmarkArtifactPieceDetailsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (bookmarkMaterialDetailsTableRefs)
                  db.bookmarkMaterialDetailsTable,
                if (bookmarkArtifactSetDetailsTableRefs)
                  db.bookmarkArtifactSetDetailsTable,
                if (bookmarkArtifactPieceDetailsTableRefs)
                  db.bookmarkArtifactPieceDetailsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (bookmarkMaterialDetailsTableRefs)
                    await $_getPrefetchedData<Bookmark, $BookmarkTableTable,
                            BookmarkMaterialDetails>(
                        currentTable: table,
                        referencedTable: $$BookmarkTableTableReferences
                            ._bookmarkMaterialDetailsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BookmarkTableTableReferences(db, table, p0)
                                .bookmarkMaterialDetailsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.parentId == item.id),
                        typedResults: items),
                  if (bookmarkArtifactSetDetailsTableRefs)
                    await $_getPrefetchedData<Bookmark, $BookmarkTableTable,
                            BookmarkArtifactSetDetails>(
                        currentTable: table,
                        referencedTable: $$BookmarkTableTableReferences
                            ._bookmarkArtifactSetDetailsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BookmarkTableTableReferences(db, table, p0)
                                .bookmarkArtifactSetDetailsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.parentId == item.id),
                        typedResults: items),
                  if (bookmarkArtifactPieceDetailsTableRefs)
                    await $_getPrefetchedData<Bookmark, $BookmarkTableTable,
                            BookmarkArtifactPieceDetails>(
                        currentTable: table,
                        referencedTable: $$BookmarkTableTableReferences
                            ._bookmarkArtifactPieceDetailsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BookmarkTableTableReferences(db, table, p0)
                                .bookmarkArtifactPieceDetailsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.parentId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$BookmarkTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BookmarkTableTable,
    Bookmark,
    $$BookmarkTableTableFilterComposer,
    $$BookmarkTableTableOrderingComposer,
    $$BookmarkTableTableAnnotationComposer,
    $$BookmarkTableTableCreateCompanionBuilder,
    $$BookmarkTableTableUpdateCompanionBuilder,
    (Bookmark, $$BookmarkTableTableReferences),
    Bookmark,
    PrefetchHooks Function(
        {bool bookmarkMaterialDetailsTableRefs,
        bool bookmarkArtifactSetDetailsTableRefs,
        bool bookmarkArtifactPieceDetailsTableRefs})>;
typedef $$BookmarkMaterialDetailsTableTableCreateCompanionBuilder
    = BookmarkMaterialDetailsCompanion Function({
  required int parentId,
  Value<String?> weaponId,
  Value<String?> materialId,
  required int quantity,
  required int upperLevel,
  required Purpose purposeType,
  required String hash,
  Value<int> rowid,
});
typedef $$BookmarkMaterialDetailsTableTableUpdateCompanionBuilder
    = BookmarkMaterialDetailsCompanion Function({
  Value<int> parentId,
  Value<String?> weaponId,
  Value<String?> materialId,
  Value<int> quantity,
  Value<int> upperLevel,
  Value<Purpose> purposeType,
  Value<String> hash,
  Value<int> rowid,
});

final class $$BookmarkMaterialDetailsTableTableReferences
    extends BaseReferences<_$AppDatabase, $BookmarkMaterialDetailsTableTable,
        BookmarkMaterialDetails> {
  $$BookmarkMaterialDetailsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BookmarkTableTable _parentIdTable(_$AppDatabase db) =>
      db.bookmarkTable.createAlias($_aliasNameGenerator(
          db.bookmarkMaterialDetailsTable.parentId, db.bookmarkTable.id));

  $$BookmarkTableTableProcessedTableManager get parentId {
    final $_column = $_itemColumn<int>('parent_id')!;

    final manager = $$BookmarkTableTableTableManager($_db, $_db.bookmarkTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BookmarkMaterialDetailsTableTableFilterComposer
    extends Composer<_$AppDatabase, $BookmarkMaterialDetailsTableTable> {
  $$BookmarkMaterialDetailsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get weaponId => $composableBuilder(
      column: $table.weaponId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get materialId => $composableBuilder(
      column: $table.materialId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get upperLevel => $composableBuilder(
      column: $table.upperLevel, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Purpose, Purpose, String> get purposeType =>
      $composableBuilder(
          column: $table.purposeType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get hash => $composableBuilder(
      column: $table.hash, builder: (column) => ColumnFilters(column));

  $$BookmarkTableTableFilterComposer get parentId {
    final $$BookmarkTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $db.bookmarkTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookmarkTableTableFilterComposer(
              $db: $db,
              $table: $db.bookmarkTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BookmarkMaterialDetailsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BookmarkMaterialDetailsTableTable> {
  $$BookmarkMaterialDetailsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get weaponId => $composableBuilder(
      column: $table.weaponId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get materialId => $composableBuilder(
      column: $table.materialId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get upperLevel => $composableBuilder(
      column: $table.upperLevel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get purposeType => $composableBuilder(
      column: $table.purposeType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hash => $composableBuilder(
      column: $table.hash, builder: (column) => ColumnOrderings(column));

  $$BookmarkTableTableOrderingComposer get parentId {
    final $$BookmarkTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $db.bookmarkTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookmarkTableTableOrderingComposer(
              $db: $db,
              $table: $db.bookmarkTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BookmarkMaterialDetailsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BookmarkMaterialDetailsTableTable> {
  $$BookmarkMaterialDetailsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get weaponId =>
      $composableBuilder(column: $table.weaponId, builder: (column) => column);

  GeneratedColumn<String> get materialId => $composableBuilder(
      column: $table.materialId, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get upperLevel => $composableBuilder(
      column: $table.upperLevel, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Purpose, String> get purposeType =>
      $composableBuilder(
          column: $table.purposeType, builder: (column) => column);

  GeneratedColumn<String> get hash =>
      $composableBuilder(column: $table.hash, builder: (column) => column);

  $$BookmarkTableTableAnnotationComposer get parentId {
    final $$BookmarkTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $db.bookmarkTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookmarkTableTableAnnotationComposer(
              $db: $db,
              $table: $db.bookmarkTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BookmarkMaterialDetailsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BookmarkMaterialDetailsTableTable,
    BookmarkMaterialDetails,
    $$BookmarkMaterialDetailsTableTableFilterComposer,
    $$BookmarkMaterialDetailsTableTableOrderingComposer,
    $$BookmarkMaterialDetailsTableTableAnnotationComposer,
    $$BookmarkMaterialDetailsTableTableCreateCompanionBuilder,
    $$BookmarkMaterialDetailsTableTableUpdateCompanionBuilder,
    (BookmarkMaterialDetails, $$BookmarkMaterialDetailsTableTableReferences),
    BookmarkMaterialDetails,
    PrefetchHooks Function({bool parentId})> {
  $$BookmarkMaterialDetailsTableTableTableManager(
      _$AppDatabase db, $BookmarkMaterialDetailsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookmarkMaterialDetailsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$BookmarkMaterialDetailsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookmarkMaterialDetailsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> parentId = const Value.absent(),
            Value<String?> weaponId = const Value.absent(),
            Value<String?> materialId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<int> upperLevel = const Value.absent(),
            Value<Purpose> purposeType = const Value.absent(),
            Value<String> hash = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BookmarkMaterialDetailsCompanion(
            parentId: parentId,
            weaponId: weaponId,
            materialId: materialId,
            quantity: quantity,
            upperLevel: upperLevel,
            purposeType: purposeType,
            hash: hash,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int parentId,
            Value<String?> weaponId = const Value.absent(),
            Value<String?> materialId = const Value.absent(),
            required int quantity,
            required int upperLevel,
            required Purpose purposeType,
            required String hash,
            Value<int> rowid = const Value.absent(),
          }) =>
              BookmarkMaterialDetailsCompanion.insert(
            parentId: parentId,
            weaponId: weaponId,
            materialId: materialId,
            quantity: quantity,
            upperLevel: upperLevel,
            purposeType: purposeType,
            hash: hash,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BookmarkMaterialDetailsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({parentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (parentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.parentId,
                    referencedTable:
                        $$BookmarkMaterialDetailsTableTableReferences
                            ._parentIdTable(db),
                    referencedColumn:
                        $$BookmarkMaterialDetailsTableTableReferences
                            ._parentIdTable(db)
                            .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$BookmarkMaterialDetailsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $BookmarkMaterialDetailsTableTable,
        BookmarkMaterialDetails,
        $$BookmarkMaterialDetailsTableTableFilterComposer,
        $$BookmarkMaterialDetailsTableTableOrderingComposer,
        $$BookmarkMaterialDetailsTableTableAnnotationComposer,
        $$BookmarkMaterialDetailsTableTableCreateCompanionBuilder,
        $$BookmarkMaterialDetailsTableTableUpdateCompanionBuilder,
        (
          BookmarkMaterialDetails,
          $$BookmarkMaterialDetailsTableTableReferences
        ),
        BookmarkMaterialDetails,
        PrefetchHooks Function({bool parentId})>;
typedef $$BookmarkArtifactSetDetailsTableTableCreateCompanionBuilder
    = BookmarkArtifactSetDetailsCompanion Function({
  Value<int> id,
  required int parentId,
  required List<ArtifactSetId> sets,
  required Map<String, StatId?> mainStats,
  required List<StatId> subStats,
});
typedef $$BookmarkArtifactSetDetailsTableTableUpdateCompanionBuilder
    = BookmarkArtifactSetDetailsCompanion Function({
  Value<int> id,
  Value<int> parentId,
  Value<List<ArtifactSetId>> sets,
  Value<Map<String, StatId?>> mainStats,
  Value<List<StatId>> subStats,
});

final class $$BookmarkArtifactSetDetailsTableTableReferences
    extends BaseReferences<_$AppDatabase, $BookmarkArtifactSetDetailsTableTable,
        BookmarkArtifactSetDetails> {
  $$BookmarkArtifactSetDetailsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BookmarkTableTable _parentIdTable(_$AppDatabase db) =>
      db.bookmarkTable.createAlias($_aliasNameGenerator(
          db.bookmarkArtifactSetDetailsTable.parentId, db.bookmarkTable.id));

  $$BookmarkTableTableProcessedTableManager get parentId {
    final $_column = $_itemColumn<int>('parent_id')!;

    final manager = $$BookmarkTableTableTableManager($_db, $_db.bookmarkTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BookmarkArtifactSetDetailsTableTableFilterComposer
    extends Composer<_$AppDatabase, $BookmarkArtifactSetDetailsTableTable> {
  $$BookmarkArtifactSetDetailsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<ArtifactSetId>, List<ArtifactSetId>,
          String>
      get sets => $composableBuilder(
          column: $table.sets,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Map<String, StatId?>, Map<String, StatId>,
          String>
      get mainStats => $composableBuilder(
          column: $table.mainStats,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<StatId>, List<StatId>, String>
      get subStats => $composableBuilder(
          column: $table.subStats,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  $$BookmarkTableTableFilterComposer get parentId {
    final $$BookmarkTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $db.bookmarkTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookmarkTableTableFilterComposer(
              $db: $db,
              $table: $db.bookmarkTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BookmarkArtifactSetDetailsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BookmarkArtifactSetDetailsTableTable> {
  $$BookmarkArtifactSetDetailsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sets => $composableBuilder(
      column: $table.sets, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mainStats => $composableBuilder(
      column: $table.mainStats, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subStats => $composableBuilder(
      column: $table.subStats, builder: (column) => ColumnOrderings(column));

  $$BookmarkTableTableOrderingComposer get parentId {
    final $$BookmarkTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $db.bookmarkTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookmarkTableTableOrderingComposer(
              $db: $db,
              $table: $db.bookmarkTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BookmarkArtifactSetDetailsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BookmarkArtifactSetDetailsTableTable> {
  $$BookmarkArtifactSetDetailsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<ArtifactSetId>, String> get sets =>
      $composableBuilder(column: $table.sets, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, StatId?>, String>
      get mainStats => $composableBuilder(
          column: $table.mainStats, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<StatId>, String> get subStats =>
      $composableBuilder(column: $table.subStats, builder: (column) => column);

  $$BookmarkTableTableAnnotationComposer get parentId {
    final $$BookmarkTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $db.bookmarkTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookmarkTableTableAnnotationComposer(
              $db: $db,
              $table: $db.bookmarkTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BookmarkArtifactSetDetailsTableTableTableManager
    extends RootTableManager<
        _$AppDatabase,
        $BookmarkArtifactSetDetailsTableTable,
        BookmarkArtifactSetDetails,
        $$BookmarkArtifactSetDetailsTableTableFilterComposer,
        $$BookmarkArtifactSetDetailsTableTableOrderingComposer,
        $$BookmarkArtifactSetDetailsTableTableAnnotationComposer,
        $$BookmarkArtifactSetDetailsTableTableCreateCompanionBuilder,
        $$BookmarkArtifactSetDetailsTableTableUpdateCompanionBuilder,
        (
          BookmarkArtifactSetDetails,
          $$BookmarkArtifactSetDetailsTableTableReferences
        ),
        BookmarkArtifactSetDetails,
        PrefetchHooks Function({bool parentId})> {
  $$BookmarkArtifactSetDetailsTableTableTableManager(
      _$AppDatabase db, $BookmarkArtifactSetDetailsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookmarkArtifactSetDetailsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$BookmarkArtifactSetDetailsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookmarkArtifactSetDetailsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> parentId = const Value.absent(),
            Value<List<ArtifactSetId>> sets = const Value.absent(),
            Value<Map<String, StatId?>> mainStats = const Value.absent(),
            Value<List<StatId>> subStats = const Value.absent(),
          }) =>
              BookmarkArtifactSetDetailsCompanion(
            id: id,
            parentId: parentId,
            sets: sets,
            mainStats: mainStats,
            subStats: subStats,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int parentId,
            required List<ArtifactSetId> sets,
            required Map<String, StatId?> mainStats,
            required List<StatId> subStats,
          }) =>
              BookmarkArtifactSetDetailsCompanion.insert(
            id: id,
            parentId: parentId,
            sets: sets,
            mainStats: mainStats,
            subStats: subStats,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BookmarkArtifactSetDetailsTableTableReferences(
                        db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({parentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (parentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.parentId,
                    referencedTable:
                        $$BookmarkArtifactSetDetailsTableTableReferences
                            ._parentIdTable(db),
                    referencedColumn:
                        $$BookmarkArtifactSetDetailsTableTableReferences
                            ._parentIdTable(db)
                            .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$BookmarkArtifactSetDetailsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $BookmarkArtifactSetDetailsTableTable,
        BookmarkArtifactSetDetails,
        $$BookmarkArtifactSetDetailsTableTableFilterComposer,
        $$BookmarkArtifactSetDetailsTableTableOrderingComposer,
        $$BookmarkArtifactSetDetailsTableTableAnnotationComposer,
        $$BookmarkArtifactSetDetailsTableTableCreateCompanionBuilder,
        $$BookmarkArtifactSetDetailsTableTableUpdateCompanionBuilder,
        (
          BookmarkArtifactSetDetails,
          $$BookmarkArtifactSetDetailsTableTableReferences
        ),
        BookmarkArtifactSetDetails,
        PrefetchHooks Function({bool parentId})>;
typedef $$BookmarkArtifactPieceDetailsTableTableCreateCompanionBuilder
    = BookmarkArtifactPieceDetailsCompanion Function({
  Value<int> id,
  required int parentId,
  required String piece,
  Value<String?> mainStat,
  required List<StatId> subStats,
});
typedef $$BookmarkArtifactPieceDetailsTableTableUpdateCompanionBuilder
    = BookmarkArtifactPieceDetailsCompanion Function({
  Value<int> id,
  Value<int> parentId,
  Value<String> piece,
  Value<String?> mainStat,
  Value<List<StatId>> subStats,
});

final class $$BookmarkArtifactPieceDetailsTableTableReferences
    extends BaseReferences<_$AppDatabase,
        $BookmarkArtifactPieceDetailsTableTable, BookmarkArtifactPieceDetails> {
  $$BookmarkArtifactPieceDetailsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BookmarkTableTable _parentIdTable(_$AppDatabase db) =>
      db.bookmarkTable.createAlias($_aliasNameGenerator(
          db.bookmarkArtifactPieceDetailsTable.parentId, db.bookmarkTable.id));

  $$BookmarkTableTableProcessedTableManager get parentId {
    final $_column = $_itemColumn<int>('parent_id')!;

    final manager = $$BookmarkTableTableTableManager($_db, $_db.bookmarkTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BookmarkArtifactPieceDetailsTableTableFilterComposer
    extends Composer<_$AppDatabase, $BookmarkArtifactPieceDetailsTableTable> {
  $$BookmarkArtifactPieceDetailsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get piece => $composableBuilder(
      column: $table.piece, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mainStat => $composableBuilder(
      column: $table.mainStat, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<StatId>, List<StatId>, String>
      get subStats => $composableBuilder(
          column: $table.subStats,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  $$BookmarkTableTableFilterComposer get parentId {
    final $$BookmarkTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $db.bookmarkTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookmarkTableTableFilterComposer(
              $db: $db,
              $table: $db.bookmarkTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BookmarkArtifactPieceDetailsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BookmarkArtifactPieceDetailsTableTable> {
  $$BookmarkArtifactPieceDetailsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get piece => $composableBuilder(
      column: $table.piece, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mainStat => $composableBuilder(
      column: $table.mainStat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subStats => $composableBuilder(
      column: $table.subStats, builder: (column) => ColumnOrderings(column));

  $$BookmarkTableTableOrderingComposer get parentId {
    final $$BookmarkTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $db.bookmarkTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookmarkTableTableOrderingComposer(
              $db: $db,
              $table: $db.bookmarkTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BookmarkArtifactPieceDetailsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BookmarkArtifactPieceDetailsTableTable> {
  $$BookmarkArtifactPieceDetailsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get piece =>
      $composableBuilder(column: $table.piece, builder: (column) => column);

  GeneratedColumn<String> get mainStat =>
      $composableBuilder(column: $table.mainStat, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<StatId>, String> get subStats =>
      $composableBuilder(column: $table.subStats, builder: (column) => column);

  $$BookmarkTableTableAnnotationComposer get parentId {
    final $$BookmarkTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $db.bookmarkTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookmarkTableTableAnnotationComposer(
              $db: $db,
              $table: $db.bookmarkTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BookmarkArtifactPieceDetailsTableTableTableManager
    extends RootTableManager<
        _$AppDatabase,
        $BookmarkArtifactPieceDetailsTableTable,
        BookmarkArtifactPieceDetails,
        $$BookmarkArtifactPieceDetailsTableTableFilterComposer,
        $$BookmarkArtifactPieceDetailsTableTableOrderingComposer,
        $$BookmarkArtifactPieceDetailsTableTableAnnotationComposer,
        $$BookmarkArtifactPieceDetailsTableTableCreateCompanionBuilder,
        $$BookmarkArtifactPieceDetailsTableTableUpdateCompanionBuilder,
        (
          BookmarkArtifactPieceDetails,
          $$BookmarkArtifactPieceDetailsTableTableReferences
        ),
        BookmarkArtifactPieceDetails,
        PrefetchHooks Function({bool parentId})> {
  $$BookmarkArtifactPieceDetailsTableTableTableManager(
      _$AppDatabase db, $BookmarkArtifactPieceDetailsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookmarkArtifactPieceDetailsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$BookmarkArtifactPieceDetailsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookmarkArtifactPieceDetailsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> parentId = const Value.absent(),
            Value<String> piece = const Value.absent(),
            Value<String?> mainStat = const Value.absent(),
            Value<List<StatId>> subStats = const Value.absent(),
          }) =>
              BookmarkArtifactPieceDetailsCompanion(
            id: id,
            parentId: parentId,
            piece: piece,
            mainStat: mainStat,
            subStats: subStats,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int parentId,
            required String piece,
            Value<String?> mainStat = const Value.absent(),
            required List<StatId> subStats,
          }) =>
              BookmarkArtifactPieceDetailsCompanion.insert(
            id: id,
            parentId: parentId,
            piece: piece,
            mainStat: mainStat,
            subStats: subStats,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BookmarkArtifactPieceDetailsTableTableReferences(
                        db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({parentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (parentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.parentId,
                    referencedTable:
                        $$BookmarkArtifactPieceDetailsTableTableReferences
                            ._parentIdTable(db),
                    referencedColumn:
                        $$BookmarkArtifactPieceDetailsTableTableReferences
                            ._parentIdTable(db)
                            .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$BookmarkArtifactPieceDetailsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $BookmarkArtifactPieceDetailsTableTable,
        BookmarkArtifactPieceDetails,
        $$BookmarkArtifactPieceDetailsTableTableFilterComposer,
        $$BookmarkArtifactPieceDetailsTableTableOrderingComposer,
        $$BookmarkArtifactPieceDetailsTableTableAnnotationComposer,
        $$BookmarkArtifactPieceDetailsTableTableCreateCompanionBuilder,
        $$BookmarkArtifactPieceDetailsTableTableUpdateCompanionBuilder,
        (
          BookmarkArtifactPieceDetails,
          $$BookmarkArtifactPieceDetailsTableTableReferences
        ),
        BookmarkArtifactPieceDetails,
        PrefetchHooks Function({bool parentId})>;
typedef $$InGameCharacterStateTableTableCreateCompanionBuilder
    = InGameCharacterStateCompanion Function({
  required String uid,
  required String characterId,
  required Map<Purpose, int> purposes,
  Value<String?> equippedWeaponId,
  Value<DateTime> lastUpdated,
  Value<int> rowid,
});
typedef $$InGameCharacterStateTableTableUpdateCompanionBuilder
    = InGameCharacterStateCompanion Function({
  Value<String> uid,
  Value<String> characterId,
  Value<Map<Purpose, int>> purposes,
  Value<String?> equippedWeaponId,
  Value<DateTime> lastUpdated,
  Value<int> rowid,
});

class $$InGameCharacterStateTableTableFilterComposer
    extends Composer<_$AppDatabase, $InGameCharacterStateTableTable> {
  $$InGameCharacterStateTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<Purpose, int>, Map<Purpose, int>, String>
      get purposes => $composableBuilder(
          column: $table.purposes,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get equippedWeaponId => $composableBuilder(
      column: $table.equippedWeaponId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));
}

class $$InGameCharacterStateTableTableOrderingComposer
    extends Composer<_$AppDatabase, $InGameCharacterStateTableTable> {
  $$InGameCharacterStateTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get purposes => $composableBuilder(
      column: $table.purposes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get equippedWeaponId => $composableBuilder(
      column: $table.equippedWeaponId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));
}

class $$InGameCharacterStateTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $InGameCharacterStateTableTable> {
  $$InGameCharacterStateTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<Purpose, int>, String> get purposes =>
      $composableBuilder(column: $table.purposes, builder: (column) => column);

  GeneratedColumn<String> get equippedWeaponId => $composableBuilder(
      column: $table.equippedWeaponId, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);
}

class $$InGameCharacterStateTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InGameCharacterStateTableTable,
    InGameCharacterState,
    $$InGameCharacterStateTableTableFilterComposer,
    $$InGameCharacterStateTableTableOrderingComposer,
    $$InGameCharacterStateTableTableAnnotationComposer,
    $$InGameCharacterStateTableTableCreateCompanionBuilder,
    $$InGameCharacterStateTableTableUpdateCompanionBuilder,
    (
      InGameCharacterState,
      BaseReferences<_$AppDatabase, $InGameCharacterStateTableTable,
          InGameCharacterState>
    ),
    InGameCharacterState,
    PrefetchHooks Function()> {
  $$InGameCharacterStateTableTableTableManager(
      _$AppDatabase db, $InGameCharacterStateTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InGameCharacterStateTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$InGameCharacterStateTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InGameCharacterStateTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> uid = const Value.absent(),
            Value<String> characterId = const Value.absent(),
            Value<Map<Purpose, int>> purposes = const Value.absent(),
            Value<String?> equippedWeaponId = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InGameCharacterStateCompanion(
            uid: uid,
            characterId: characterId,
            purposes: purposes,
            equippedWeaponId: equippedWeaponId,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uid,
            required String characterId,
            required Map<Purpose, int> purposes,
            Value<String?> equippedWeaponId = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InGameCharacterStateCompanion.insert(
            uid: uid,
            characterId: characterId,
            purposes: purposes,
            equippedWeaponId: equippedWeaponId,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$InGameCharacterStateTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $InGameCharacterStateTableTable,
        InGameCharacterState,
        $$InGameCharacterStateTableTableFilterComposer,
        $$InGameCharacterStateTableTableOrderingComposer,
        $$InGameCharacterStateTableTableAnnotationComposer,
        $$InGameCharacterStateTableTableCreateCompanionBuilder,
        $$InGameCharacterStateTableTableUpdateCompanionBuilder,
        (
          InGameCharacterState,
          BaseReferences<_$AppDatabase, $InGameCharacterStateTableTable,
              InGameCharacterState>
        ),
        InGameCharacterState,
        PrefetchHooks Function()>;
typedef $$InGameWeaponStateTableTableCreateCompanionBuilder
    = InGameWeaponStateCompanion Function({
  required String uid,
  required String characterId,
  required String weaponId,
  required Map<Purpose, int> purposes,
  Value<DateTime> lastUpdated,
  Value<int> rowid,
});
typedef $$InGameWeaponStateTableTableUpdateCompanionBuilder
    = InGameWeaponStateCompanion Function({
  Value<String> uid,
  Value<String> characterId,
  Value<String> weaponId,
  Value<Map<Purpose, int>> purposes,
  Value<DateTime> lastUpdated,
  Value<int> rowid,
});

class $$InGameWeaponStateTableTableFilterComposer
    extends Composer<_$AppDatabase, $InGameWeaponStateTableTable> {
  $$InGameWeaponStateTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get weaponId => $composableBuilder(
      column: $table.weaponId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<Purpose, int>, Map<Purpose, int>, String>
      get purposes => $composableBuilder(
          column: $table.purposes,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));
}

class $$InGameWeaponStateTableTableOrderingComposer
    extends Composer<_$AppDatabase, $InGameWeaponStateTableTable> {
  $$InGameWeaponStateTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get weaponId => $composableBuilder(
      column: $table.weaponId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get purposes => $composableBuilder(
      column: $table.purposes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));
}

class $$InGameWeaponStateTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $InGameWeaponStateTableTable> {
  $$InGameWeaponStateTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => column);

  GeneratedColumn<String> get weaponId =>
      $composableBuilder(column: $table.weaponId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<Purpose, int>, String> get purposes =>
      $composableBuilder(column: $table.purposes, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);
}

class $$InGameWeaponStateTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InGameWeaponStateTableTable,
    InGameWeaponState,
    $$InGameWeaponStateTableTableFilterComposer,
    $$InGameWeaponStateTableTableOrderingComposer,
    $$InGameWeaponStateTableTableAnnotationComposer,
    $$InGameWeaponStateTableTableCreateCompanionBuilder,
    $$InGameWeaponStateTableTableUpdateCompanionBuilder,
    (
      InGameWeaponState,
      BaseReferences<_$AppDatabase, $InGameWeaponStateTableTable,
          InGameWeaponState>
    ),
    InGameWeaponState,
    PrefetchHooks Function()> {
  $$InGameWeaponStateTableTableTableManager(
      _$AppDatabase db, $InGameWeaponStateTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InGameWeaponStateTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$InGameWeaponStateTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InGameWeaponStateTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> uid = const Value.absent(),
            Value<String> characterId = const Value.absent(),
            Value<String> weaponId = const Value.absent(),
            Value<Map<Purpose, int>> purposes = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InGameWeaponStateCompanion(
            uid: uid,
            characterId: characterId,
            weaponId: weaponId,
            purposes: purposes,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uid,
            required String characterId,
            required String weaponId,
            required Map<Purpose, int> purposes,
            Value<DateTime> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InGameWeaponStateCompanion.insert(
            uid: uid,
            characterId: characterId,
            weaponId: weaponId,
            purposes: purposes,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$InGameWeaponStateTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $InGameWeaponStateTableTable,
        InGameWeaponState,
        $$InGameWeaponStateTableTableFilterComposer,
        $$InGameWeaponStateTableTableOrderingComposer,
        $$InGameWeaponStateTableTableAnnotationComposer,
        $$InGameWeaponStateTableTableCreateCompanionBuilder,
        $$InGameWeaponStateTableTableUpdateCompanionBuilder,
        (
          InGameWeaponState,
          BaseReferences<_$AppDatabase, $InGameWeaponStateTableTable,
              InGameWeaponState>
        ),
        InGameWeaponState,
        PrefetchHooks Function()>;
typedef $$BookmarkOrderRegistryTableTableCreateCompanionBuilder
    = BookmarkOrderRegistryCompanion Function({
  Value<String> id,
  required List<String> order,
  Value<int> rowid,
});
typedef $$BookmarkOrderRegistryTableTableUpdateCompanionBuilder
    = BookmarkOrderRegistryCompanion Function({
  Value<String> id,
  Value<List<String>> order,
  Value<int> rowid,
});

class $$BookmarkOrderRegistryTableTableFilterComposer
    extends Composer<_$AppDatabase, $BookmarkOrderRegistryTableTable> {
  $$BookmarkOrderRegistryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get order => $composableBuilder(
          column: $table.order,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$BookmarkOrderRegistryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BookmarkOrderRegistryTableTable> {
  $$BookmarkOrderRegistryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnOrderings(column));
}

class $$BookmarkOrderRegistryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BookmarkOrderRegistryTableTable> {
  $$BookmarkOrderRegistryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);
}

class $$BookmarkOrderRegistryTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BookmarkOrderRegistryTableTable,
    BookmarkOrderRegistry,
    $$BookmarkOrderRegistryTableTableFilterComposer,
    $$BookmarkOrderRegistryTableTableOrderingComposer,
    $$BookmarkOrderRegistryTableTableAnnotationComposer,
    $$BookmarkOrderRegistryTableTableCreateCompanionBuilder,
    $$BookmarkOrderRegistryTableTableUpdateCompanionBuilder,
    (
      BookmarkOrderRegistry,
      BaseReferences<_$AppDatabase, $BookmarkOrderRegistryTableTable,
          BookmarkOrderRegistry>
    ),
    BookmarkOrderRegistry,
    PrefetchHooks Function()> {
  $$BookmarkOrderRegistryTableTableTableManager(
      _$AppDatabase db, $BookmarkOrderRegistryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookmarkOrderRegistryTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$BookmarkOrderRegistryTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookmarkOrderRegistryTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<List<String>> order = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BookmarkOrderRegistryCompanion(
            id: id,
            order: order,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required List<String> order,
            Value<int> rowid = const Value.absent(),
          }) =>
              BookmarkOrderRegistryCompanion.insert(
            id: id,
            order: order,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BookmarkOrderRegistryTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $BookmarkOrderRegistryTableTable,
        BookmarkOrderRegistry,
        $$BookmarkOrderRegistryTableTableFilterComposer,
        $$BookmarkOrderRegistryTableTableOrderingComposer,
        $$BookmarkOrderRegistryTableTableAnnotationComposer,
        $$BookmarkOrderRegistryTableTableCreateCompanionBuilder,
        $$BookmarkOrderRegistryTableTableUpdateCompanionBuilder,
        (
          BookmarkOrderRegistry,
          BaseReferences<_$AppDatabase, $BookmarkOrderRegistryTableTable,
              BookmarkOrderRegistry>
        ),
        BookmarkOrderRegistry,
        PrefetchHooks Function()>;
typedef $$MaterialBagCountTableTableCreateCompanionBuilder
    = MaterialBagCountCompanion Function({
  required String uid,
  required int hyvId,
  required int count,
  Value<DateTime> lastUpdated,
  Value<int> rowid,
});
typedef $$MaterialBagCountTableTableUpdateCompanionBuilder
    = MaterialBagCountCompanion Function({
  Value<String> uid,
  Value<int> hyvId,
  Value<int> count,
  Value<DateTime> lastUpdated,
  Value<int> rowid,
});

class $$MaterialBagCountTableTableFilterComposer
    extends Composer<_$AppDatabase, $MaterialBagCountTableTable> {
  $$MaterialBagCountTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get hyvId => $composableBuilder(
      column: $table.hyvId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get count => $composableBuilder(
      column: $table.count, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));
}

class $$MaterialBagCountTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MaterialBagCountTableTable> {
  $$MaterialBagCountTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get hyvId => $composableBuilder(
      column: $table.hyvId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get count => $composableBuilder(
      column: $table.count, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));
}

class $$MaterialBagCountTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MaterialBagCountTableTable> {
  $$MaterialBagCountTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<int> get hyvId =>
      $composableBuilder(column: $table.hyvId, builder: (column) => column);

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);
}

class $$MaterialBagCountTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MaterialBagCountTableTable,
    MaterialBagCount,
    $$MaterialBagCountTableTableFilterComposer,
    $$MaterialBagCountTableTableOrderingComposer,
    $$MaterialBagCountTableTableAnnotationComposer,
    $$MaterialBagCountTableTableCreateCompanionBuilder,
    $$MaterialBagCountTableTableUpdateCompanionBuilder,
    (
      MaterialBagCount,
      BaseReferences<_$AppDatabase, $MaterialBagCountTableTable,
          MaterialBagCount>
    ),
    MaterialBagCount,
    PrefetchHooks Function()> {
  $$MaterialBagCountTableTableTableManager(
      _$AppDatabase db, $MaterialBagCountTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MaterialBagCountTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$MaterialBagCountTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MaterialBagCountTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> uid = const Value.absent(),
            Value<int> hyvId = const Value.absent(),
            Value<int> count = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MaterialBagCountCompanion(
            uid: uid,
            hyvId: hyvId,
            count: count,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uid,
            required int hyvId,
            required int count,
            Value<DateTime> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MaterialBagCountCompanion.insert(
            uid: uid,
            hyvId: hyvId,
            count: count,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MaterialBagCountTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $MaterialBagCountTableTable,
        MaterialBagCount,
        $$MaterialBagCountTableTableFilterComposer,
        $$MaterialBagCountTableTableOrderingComposer,
        $$MaterialBagCountTableTableAnnotationComposer,
        $$MaterialBagCountTableTableCreateCompanionBuilder,
        $$MaterialBagCountTableTableUpdateCompanionBuilder,
        (
          MaterialBagCount,
          BaseReferences<_$AppDatabase, $MaterialBagCountTableTable,
              MaterialBagCount>
        ),
        MaterialBagCount,
        PrefetchHooks Function()>;
typedef $$FurnishingCraftCountTableTableCreateCompanionBuilder
    = FurnishingCraftCountCompanion Function({
  required String furnishingId,
  required String setId,
  required int count,
  Value<int> rowid,
});
typedef $$FurnishingCraftCountTableTableUpdateCompanionBuilder
    = FurnishingCraftCountCompanion Function({
  Value<String> furnishingId,
  Value<String> setId,
  Value<int> count,
  Value<int> rowid,
});

class $$FurnishingCraftCountTableTableFilterComposer
    extends Composer<_$AppDatabase, $FurnishingCraftCountTableTable> {
  $$FurnishingCraftCountTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get furnishingId => $composableBuilder(
      column: $table.furnishingId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get setId => $composableBuilder(
      column: $table.setId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get count => $composableBuilder(
      column: $table.count, builder: (column) => ColumnFilters(column));
}

class $$FurnishingCraftCountTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FurnishingCraftCountTableTable> {
  $$FurnishingCraftCountTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get furnishingId => $composableBuilder(
      column: $table.furnishingId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get setId => $composableBuilder(
      column: $table.setId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get count => $composableBuilder(
      column: $table.count, builder: (column) => ColumnOrderings(column));
}

class $$FurnishingCraftCountTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FurnishingCraftCountTableTable> {
  $$FurnishingCraftCountTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get furnishingId => $composableBuilder(
      column: $table.furnishingId, builder: (column) => column);

  GeneratedColumn<String> get setId =>
      $composableBuilder(column: $table.setId, builder: (column) => column);

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);
}

class $$FurnishingCraftCountTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FurnishingCraftCountTableTable,
    FurnishingCraftCount,
    $$FurnishingCraftCountTableTableFilterComposer,
    $$FurnishingCraftCountTableTableOrderingComposer,
    $$FurnishingCraftCountTableTableAnnotationComposer,
    $$FurnishingCraftCountTableTableCreateCompanionBuilder,
    $$FurnishingCraftCountTableTableUpdateCompanionBuilder,
    (
      FurnishingCraftCount,
      BaseReferences<_$AppDatabase, $FurnishingCraftCountTableTable,
          FurnishingCraftCount>
    ),
    FurnishingCraftCount,
    PrefetchHooks Function()> {
  $$FurnishingCraftCountTableTableTableManager(
      _$AppDatabase db, $FurnishingCraftCountTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FurnishingCraftCountTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$FurnishingCraftCountTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FurnishingCraftCountTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> furnishingId = const Value.absent(),
            Value<String> setId = const Value.absent(),
            Value<int> count = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FurnishingCraftCountCompanion(
            furnishingId: furnishingId,
            setId: setId,
            count: count,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String furnishingId,
            required String setId,
            required int count,
            Value<int> rowid = const Value.absent(),
          }) =>
              FurnishingCraftCountCompanion.insert(
            furnishingId: furnishingId,
            setId: setId,
            count: count,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FurnishingCraftCountTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $FurnishingCraftCountTableTable,
        FurnishingCraftCount,
        $$FurnishingCraftCountTableTableFilterComposer,
        $$FurnishingCraftCountTableTableOrderingComposer,
        $$FurnishingCraftCountTableTableAnnotationComposer,
        $$FurnishingCraftCountTableTableCreateCompanionBuilder,
        $$FurnishingCraftCountTableTableUpdateCompanionBuilder,
        (
          FurnishingCraftCount,
          BaseReferences<_$AppDatabase, $FurnishingCraftCountTableTable,
              FurnishingCraftCount>
        ),
        FurnishingCraftCount,
        PrefetchHooks Function()>;
typedef $$FurnishingSetBookmarkTableTableCreateCompanionBuilder
    = FurnishingSetBookmarkCompanion Function({
  required String setId,
  Value<int> rowid,
});
typedef $$FurnishingSetBookmarkTableTableUpdateCompanionBuilder
    = FurnishingSetBookmarkCompanion Function({
  Value<String> setId,
  Value<int> rowid,
});

class $$FurnishingSetBookmarkTableTableFilterComposer
    extends Composer<_$AppDatabase, $FurnishingSetBookmarkTableTable> {
  $$FurnishingSetBookmarkTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get setId => $composableBuilder(
      column: $table.setId, builder: (column) => ColumnFilters(column));
}

class $$FurnishingSetBookmarkTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FurnishingSetBookmarkTableTable> {
  $$FurnishingSetBookmarkTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get setId => $composableBuilder(
      column: $table.setId, builder: (column) => ColumnOrderings(column));
}

class $$FurnishingSetBookmarkTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FurnishingSetBookmarkTableTable> {
  $$FurnishingSetBookmarkTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get setId =>
      $composableBuilder(column: $table.setId, builder: (column) => column);
}

class $$FurnishingSetBookmarkTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FurnishingSetBookmarkTableTable,
    FurnishingSetBookmark,
    $$FurnishingSetBookmarkTableTableFilterComposer,
    $$FurnishingSetBookmarkTableTableOrderingComposer,
    $$FurnishingSetBookmarkTableTableAnnotationComposer,
    $$FurnishingSetBookmarkTableTableCreateCompanionBuilder,
    $$FurnishingSetBookmarkTableTableUpdateCompanionBuilder,
    (
      FurnishingSetBookmark,
      BaseReferences<_$AppDatabase, $FurnishingSetBookmarkTableTable,
          FurnishingSetBookmark>
    ),
    FurnishingSetBookmark,
    PrefetchHooks Function()> {
  $$FurnishingSetBookmarkTableTableTableManager(
      _$AppDatabase db, $FurnishingSetBookmarkTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FurnishingSetBookmarkTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$FurnishingSetBookmarkTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FurnishingSetBookmarkTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> setId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FurnishingSetBookmarkCompanion(
            setId: setId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String setId,
            Value<int> rowid = const Value.absent(),
          }) =>
              FurnishingSetBookmarkCompanion.insert(
            setId: setId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FurnishingSetBookmarkTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $FurnishingSetBookmarkTableTable,
        FurnishingSetBookmark,
        $$FurnishingSetBookmarkTableTableFilterComposer,
        $$FurnishingSetBookmarkTableTableOrderingComposer,
        $$FurnishingSetBookmarkTableTableAnnotationComposer,
        $$FurnishingSetBookmarkTableTableCreateCompanionBuilder,
        $$FurnishingSetBookmarkTableTableUpdateCompanionBuilder,
        (
          FurnishingSetBookmark,
          BaseReferences<_$AppDatabase, $FurnishingSetBookmarkTableTable,
              FurnishingSetBookmark>
        ),
        FurnishingSetBookmark,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BookmarkTableTableTableManager get bookmarkTable =>
      $$BookmarkTableTableTableManager(_db, _db.bookmarkTable);
  $$BookmarkMaterialDetailsTableTableTableManager
      get bookmarkMaterialDetailsTable =>
          $$BookmarkMaterialDetailsTableTableTableManager(
              _db, _db.bookmarkMaterialDetailsTable);
  $$BookmarkArtifactSetDetailsTableTableTableManager
      get bookmarkArtifactSetDetailsTable =>
          $$BookmarkArtifactSetDetailsTableTableTableManager(
              _db, _db.bookmarkArtifactSetDetailsTable);
  $$BookmarkArtifactPieceDetailsTableTableTableManager
      get bookmarkArtifactPieceDetailsTable =>
          $$BookmarkArtifactPieceDetailsTableTableTableManager(
              _db, _db.bookmarkArtifactPieceDetailsTable);
  $$InGameCharacterStateTableTableTableManager get inGameCharacterStateTable =>
      $$InGameCharacterStateTableTableTableManager(
          _db, _db.inGameCharacterStateTable);
  $$InGameWeaponStateTableTableTableManager get inGameWeaponStateTable =>
      $$InGameWeaponStateTableTableTableManager(
          _db, _db.inGameWeaponStateTable);
  $$BookmarkOrderRegistryTableTableTableManager
      get bookmarkOrderRegistryTable =>
          $$BookmarkOrderRegistryTableTableTableManager(
              _db, _db.bookmarkOrderRegistryTable);
  $$MaterialBagCountTableTableTableManager get materialBagCountTable =>
      $$MaterialBagCountTableTableTableManager(_db, _db.materialBagCountTable);
  $$FurnishingCraftCountTableTableTableManager get furnishingCraftCountTable =>
      $$FurnishingCraftCountTableTableTableManager(
          _db, _db.furnishingCraftCountTable);
  $$FurnishingSetBookmarkTableTableTableManager
      get furnishingSetBookmarkTable =>
          $$FurnishingSetBookmarkTableTableTableManager(
              _db, _db.furnishingSetBookmarkTable);
}
