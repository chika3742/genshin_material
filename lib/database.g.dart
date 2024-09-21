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
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
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
  @override
  List<GeneratedColumn> get $columns => [id, type, characterId, createdAt];
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
    context.handle(_typeMeta, const VerificationResult.success());
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
  const BookmarkCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.characterId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  BookmarkCompanion.insert({
    this.id = const Value.absent(),
    required BookmarkType type,
    required String characterId,
    this.createdAt = const Value.absent(),
  })  : type = Value(type),
        characterId = Value(characterId);
  static Insertable<Bookmark> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<String>? characterId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (characterId != null) 'character_id': characterId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  BookmarkCompanion copyWith(
      {Value<int>? id,
      Value<BookmarkType>? type,
      Value<String>? characterId,
      Value<DateTime>? createdAt}) {
    return BookmarkCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      characterId: characterId ?? this.characterId,
      createdAt: createdAt ?? this.createdAt,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('characterId: $characterId, ')
          ..write('createdAt: $createdAt')
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
  static const VerificationMeta _purposeTypeMeta =
      const VerificationMeta('purposeType');
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
  List<GeneratedColumn> get $columns => [
        id,
        parentId,
        weaponId,
        materialId,
        quantity,
        upperLevel,
        purposeType,
        hash
      ];
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
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
  BookmarkMaterialDetails map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarkMaterialDetails(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
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
  final int id;
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
      {required this.id,
      required this.parentId,
      this.weaponId,
      this.materialId,
      required this.quantity,
      required this.upperLevel,
      required this.purposeType,
      required this.hash});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
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
      id: Value(id),
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
      id: serializer.fromJson<int>(json['id']),
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
      'id': serializer.toJson<int>(id),
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
          {int? id,
          int? parentId,
          Value<String?> weaponId = const Value.absent(),
          Value<String?> materialId = const Value.absent(),
          int? quantity,
          int? upperLevel,
          Purpose? purposeType,
          String? hash}) =>
      BookmarkMaterialDetails(
        id: id ?? this.id,
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
      id: data.id.present ? data.id.value : this.id,
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
          ..write('id: $id, ')
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
  int get hashCode => Object.hash(id, parentId, weaponId, materialId, quantity,
      upperLevel, purposeType, hash);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookmarkMaterialDetails &&
          other.id == this.id &&
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
  final Value<int> id;
  final Value<int> parentId;
  final Value<String?> weaponId;
  final Value<String?> materialId;
  final Value<int> quantity;
  final Value<int> upperLevel;
  final Value<Purpose> purposeType;
  final Value<String> hash;
  const BookmarkMaterialDetailsCompanion({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    this.weaponId = const Value.absent(),
    this.materialId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.upperLevel = const Value.absent(),
    this.purposeType = const Value.absent(),
    this.hash = const Value.absent(),
  });
  BookmarkMaterialDetailsCompanion.insert({
    this.id = const Value.absent(),
    required int parentId,
    this.weaponId = const Value.absent(),
    this.materialId = const Value.absent(),
    required int quantity,
    required int upperLevel,
    required Purpose purposeType,
    required String hash,
  })  : parentId = Value(parentId),
        quantity = Value(quantity),
        upperLevel = Value(upperLevel),
        purposeType = Value(purposeType),
        hash = Value(hash);
  static Insertable<BookmarkMaterialDetails> custom({
    Expression<int>? id,
    Expression<int>? parentId,
    Expression<String>? weaponId,
    Expression<String>? materialId,
    Expression<int>? quantity,
    Expression<int>? upperLevel,
    Expression<String>? purposeType,
    Expression<String>? hash,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentId != null) 'parent_id': parentId,
      if (weaponId != null) 'weapon_id': weaponId,
      if (materialId != null) 'material_id': materialId,
      if (quantity != null) 'quantity': quantity,
      if (upperLevel != null) 'upper_level': upperLevel,
      if (purposeType != null) 'purpose_type': purposeType,
      if (hash != null) 'hash': hash,
    });
  }

  BookmarkMaterialDetailsCompanion copyWith(
      {Value<int>? id,
      Value<int>? parentId,
      Value<String?>? weaponId,
      Value<String?>? materialId,
      Value<int>? quantity,
      Value<int>? upperLevel,
      Value<Purpose>? purposeType,
      Value<String>? hash}) {
    return BookmarkMaterialDetailsCompanion(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      weaponId: weaponId ?? this.weaponId,
      materialId: materialId ?? this.materialId,
      quantity: quantity ?? this.quantity,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkMaterialDetailsCompanion(')
          ..write('id: $id, ')
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
  static const VerificationMeta _setsMeta = const VerificationMeta('sets');
  @override
  late final GeneratedColumnWithTypeConverter<List<ArtifactSetId>, String>
      sets = GeneratedColumn<String>('sets', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<ArtifactSetId>>(
              $BookmarkArtifactSetDetailsTableTable.$convertersets);
  static const VerificationMeta _mainStatsMeta =
      const VerificationMeta('mainStats');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, StatId?>, String>
      mainStats = GeneratedColumn<String>('main_stats', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, StatId?>>(
              $BookmarkArtifactSetDetailsTableTable.$convertermainStats);
  static const VerificationMeta _subStatsMeta =
      const VerificationMeta('subStats');
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
    context.handle(_setsMeta, const VerificationResult.success());
    context.handle(_mainStatsMeta, const VerificationResult.success());
    context.handle(_subStatsMeta, const VerificationResult.success());
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
      const ListConverter();
  static TypeConverter<Map<String, StatId?>, String> $convertermainStats =
      const MapConverter();
  static TypeConverter<List<StatId>, String> $convertersubStats =
      const ListConverter();
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
  static const VerificationMeta _subStatsMeta =
      const VerificationMeta('subStats');
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
    context.handle(_subStatsMeta, const VerificationResult.success());
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
      const ListConverter();
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

class $CharacterLevelInfoTableTable extends CharacterLevelInfoTable
    with TableInfo<$CharacterLevelInfoTableTable, CharacterLevelInfo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterLevelInfoTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _purposesMeta =
      const VerificationMeta('purposes');
  @override
  late final GeneratedColumnWithTypeConverter<Map<Purpose, int>, String>
      purposes = GeneratedColumn<String>('purposes', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<Purpose, int>>(
              $CharacterLevelInfoTableTable.$converterpurposes);
  @override
  List<GeneratedColumn> get $columns => [uid, characterId, purposes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_level_info_table';
  @override
  VerificationContext validateIntegrity(Insertable<CharacterLevelInfo> instance,
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
    context.handle(_purposesMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid, characterId};
  @override
  CharacterLevelInfo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterLevelInfo(
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid'])!,
      characterId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_id'])!,
      purposes: $CharacterLevelInfoTableTable.$converterpurposes.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}purposes'])!),
    );
  }

  @override
  $CharacterLevelInfoTableTable createAlias(String alias) {
    return $CharacterLevelInfoTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<Purpose, int>, String> $converterpurposes =
      const PurposeMapConverter();
}

class CharacterLevelInfo extends DataClass
    implements Insertable<CharacterLevelInfo> {
  final String uid;
  final String characterId;
  final Map<Purpose, int> purposes;
  const CharacterLevelInfo(
      {required this.uid, required this.characterId, required this.purposes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['character_id'] = Variable<String>(characterId);
    {
      map['purposes'] = Variable<String>(
          $CharacterLevelInfoTableTable.$converterpurposes.toSql(purposes));
    }
    return map;
  }

  CharacterLevelInfoCompanion toCompanion(bool nullToAbsent) {
    return CharacterLevelInfoCompanion(
      uid: Value(uid),
      characterId: Value(characterId),
      purposes: Value(purposes),
    );
  }

  factory CharacterLevelInfo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterLevelInfo(
      uid: serializer.fromJson<String>(json['uid']),
      characterId: serializer.fromJson<String>(json['characterId']),
      purposes: serializer.fromJson<Map<Purpose, int>>(json['purposes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'characterId': serializer.toJson<String>(characterId),
      'purposes': serializer.toJson<Map<Purpose, int>>(purposes),
    };
  }

  CharacterLevelInfo copyWith(
          {String? uid, String? characterId, Map<Purpose, int>? purposes}) =>
      CharacterLevelInfo(
        uid: uid ?? this.uid,
        characterId: characterId ?? this.characterId,
        purposes: purposes ?? this.purposes,
      );
  CharacterLevelInfo copyWithCompanion(CharacterLevelInfoCompanion data) {
    return CharacterLevelInfo(
      uid: data.uid.present ? data.uid.value : this.uid,
      characterId:
          data.characterId.present ? data.characterId.value : this.characterId,
      purposes: data.purposes.present ? data.purposes.value : this.purposes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterLevelInfo(')
          ..write('uid: $uid, ')
          ..write('characterId: $characterId, ')
          ..write('purposes: $purposes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, characterId, purposes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterLevelInfo &&
          other.uid == this.uid &&
          other.characterId == this.characterId &&
          other.purposes == this.purposes);
}

class CharacterLevelInfoCompanion extends UpdateCompanion<CharacterLevelInfo> {
  final Value<String> uid;
  final Value<String> characterId;
  final Value<Map<Purpose, int>> purposes;
  final Value<int> rowid;
  const CharacterLevelInfoCompanion({
    this.uid = const Value.absent(),
    this.characterId = const Value.absent(),
    this.purposes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharacterLevelInfoCompanion.insert({
    required String uid,
    required String characterId,
    required Map<Purpose, int> purposes,
    this.rowid = const Value.absent(),
  })  : uid = Value(uid),
        characterId = Value(characterId),
        purposes = Value(purposes);
  static Insertable<CharacterLevelInfo> custom({
    Expression<String>? uid,
    Expression<String>? characterId,
    Expression<String>? purposes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (characterId != null) 'character_id': characterId,
      if (purposes != null) 'purposes': purposes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharacterLevelInfoCompanion copyWith(
      {Value<String>? uid,
      Value<String>? characterId,
      Value<Map<Purpose, int>>? purposes,
      Value<int>? rowid}) {
    return CharacterLevelInfoCompanion(
      uid: uid ?? this.uid,
      characterId: characterId ?? this.characterId,
      purposes: purposes ?? this.purposes,
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
      map['purposes'] = Variable<String>($CharacterLevelInfoTableTable
          .$converterpurposes
          .toSql(purposes.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterLevelInfoCompanion(')
          ..write('uid: $uid, ')
          ..write('characterId: $characterId, ')
          ..write('purposes: $purposes, ')
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
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumnWithTypeConverter<List<int>, String> order =
      GeneratedColumn<String>('order', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<int>>(
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
    context.handle(_orderMeta, const VerificationResult.success());
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

  static TypeConverter<List<int>, String> $converterorder =
      const ListConverter();
}

class BookmarkOrderRegistry extends DataClass
    implements Insertable<BookmarkOrderRegistry> {
  final String id;
  final List<int> order;
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
      order: serializer.fromJson<List<int>>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'order': serializer.toJson<List<int>>(order),
    };
  }

  BookmarkOrderRegistry copyWith({String? id, List<int>? order}) =>
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
  final Value<List<int>> order;
  final Value<int> rowid;
  const BookmarkOrderRegistryCompanion({
    this.id = const Value.absent(),
    this.order = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BookmarkOrderRegistryCompanion.insert({
    this.id = const Value.absent(),
    required List<int> order,
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
      {Value<String>? id, Value<List<int>>? order, Value<int>? rowid}) {
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
  late final $CharacterLevelInfoTableTable characterLevelInfoTable =
      $CharacterLevelInfoTableTable(this);
  late final $BookmarkOrderRegistryTableTable bookmarkOrderRegistryTable =
      $BookmarkOrderRegistryTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        bookmarkTable,
        bookmarkMaterialDetailsTable,
        bookmarkArtifactSetDetailsTable,
        bookmarkArtifactPieceDetailsTable,
        characterLevelInfoTable,
        bookmarkOrderRegistryTable
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
});
typedef $$BookmarkTableTableUpdateCompanionBuilder = BookmarkCompanion
    Function({
  Value<int> id,
  Value<BookmarkType> type,
  Value<String> characterId,
  Value<DateTime> createdAt,
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
        .filter((f) => f.parentId.id($_item.id));

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
        .filter((f) => f.parentId.id($_item.id));

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
        .filter((f) => f.parentId.id($_item.id));

    final cache = $_typedResult
        .readTableOrNull(_bookmarkArtifactPieceDetailsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$BookmarkTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BookmarkTableTable> {
  $$BookmarkTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<BookmarkType, BookmarkType, String> get type =>
      $state.composableBuilder(
          column: $state.table.type,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get characterId => $state.composableBuilder(
      column: $state.table.characterId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter bookmarkMaterialDetailsTableRefs(
      ComposableFilter Function(
              $$BookmarkMaterialDetailsTableTableFilterComposer f)
          f) {
    final $$BookmarkMaterialDetailsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.bookmarkMaterialDetailsTable,
            getReferencedColumn: (t) => t.parentId,
            builder: (joinBuilder, parentComposers) =>
                $$BookmarkMaterialDetailsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.bookmarkMaterialDetailsTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }

  ComposableFilter bookmarkArtifactSetDetailsTableRefs(
      ComposableFilter Function(
              $$BookmarkArtifactSetDetailsTableTableFilterComposer f)
          f) {
    final $$BookmarkArtifactSetDetailsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.bookmarkArtifactSetDetailsTable,
            getReferencedColumn: (t) => t.parentId,
            builder: (joinBuilder, parentComposers) =>
                $$BookmarkArtifactSetDetailsTableTableFilterComposer(
                    ComposerState(
                        $state.db,
                        $state.db.bookmarkArtifactSetDetailsTable,
                        joinBuilder,
                        parentComposers)));
    return f(composer);
  }

  ComposableFilter bookmarkArtifactPieceDetailsTableRefs(
      ComposableFilter Function(
              $$BookmarkArtifactPieceDetailsTableTableFilterComposer f)
          f) {
    final $$BookmarkArtifactPieceDetailsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.bookmarkArtifactPieceDetailsTable,
            getReferencedColumn: (t) => t.parentId,
            builder: (joinBuilder, parentComposers) =>
                $$BookmarkArtifactPieceDetailsTableTableFilterComposer(
                    ComposerState(
                        $state.db,
                        $state.db.bookmarkArtifactPieceDetailsTable,
                        joinBuilder,
                        parentComposers)));
    return f(composer);
  }
}

class $$BookmarkTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BookmarkTableTable> {
  $$BookmarkTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get characterId => $state.composableBuilder(
      column: $state.table.characterId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$BookmarkTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BookmarkTableTable,
    Bookmark,
    $$BookmarkTableTableFilterComposer,
    $$BookmarkTableTableOrderingComposer,
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
          filteringComposer:
              $$BookmarkTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BookmarkTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<BookmarkType> type = const Value.absent(),
            Value<String> characterId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              BookmarkCompanion(
            id: id,
            type: type,
            characterId: characterId,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required BookmarkType type,
            required String characterId,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              BookmarkCompanion.insert(
            id: id,
            type: type,
            characterId: characterId,
            createdAt: createdAt,
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
                    await $_getPrefetchedData(
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
                    await $_getPrefetchedData(
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
                    await $_getPrefetchedData(
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
  Value<int> id,
  required int parentId,
  Value<String?> weaponId,
  Value<String?> materialId,
  required int quantity,
  required int upperLevel,
  required Purpose purposeType,
  required String hash,
});
typedef $$BookmarkMaterialDetailsTableTableUpdateCompanionBuilder
    = BookmarkMaterialDetailsCompanion Function({
  Value<int> id,
  Value<int> parentId,
  Value<String?> weaponId,
  Value<String?> materialId,
  Value<int> quantity,
  Value<int> upperLevel,
  Value<Purpose> purposeType,
  Value<String> hash,
});

final class $$BookmarkMaterialDetailsTableTableReferences
    extends BaseReferences<_$AppDatabase, $BookmarkMaterialDetailsTableTable,
        BookmarkMaterialDetails> {
  $$BookmarkMaterialDetailsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BookmarkTableTable _parentIdTable(_$AppDatabase db) =>
      db.bookmarkTable.createAlias($_aliasNameGenerator(
          db.bookmarkMaterialDetailsTable.parentId, db.bookmarkTable.id));

  $$BookmarkTableTableProcessedTableManager? get parentId {
    if ($_item.parentId == null) return null;
    final manager = $$BookmarkTableTableTableManager($_db, $_db.bookmarkTable)
        .filter((f) => f.id($_item.parentId!));
    final item = $_typedResult.readTableOrNull(_parentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BookmarkMaterialDetailsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BookmarkMaterialDetailsTableTable> {
  $$BookmarkMaterialDetailsTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get weaponId => $state.composableBuilder(
      column: $state.table.weaponId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get materialId => $state.composableBuilder(
      column: $state.table.materialId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
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

  $$BookmarkTableTableFilterComposer get parentId {
    final $$BookmarkTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $state.db.bookmarkTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$BookmarkTableTableFilterComposer(ComposerState($state.db,
                $state.db.bookmarkTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$BookmarkMaterialDetailsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase,
        $BookmarkMaterialDetailsTableTable> {
  $$BookmarkMaterialDetailsTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get weaponId => $state.composableBuilder(
      column: $state.table.weaponId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get materialId => $state.composableBuilder(
      column: $state.table.materialId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
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

  $$BookmarkTableTableOrderingComposer get parentId {
    final $$BookmarkTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.parentId,
            referencedTable: $state.db.bookmarkTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$BookmarkTableTableOrderingComposer(ComposerState($state.db,
                    $state.db.bookmarkTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$BookmarkMaterialDetailsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BookmarkMaterialDetailsTableTable,
    BookmarkMaterialDetails,
    $$BookmarkMaterialDetailsTableTableFilterComposer,
    $$BookmarkMaterialDetailsTableTableOrderingComposer,
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
          filteringComposer: $$BookmarkMaterialDetailsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$BookmarkMaterialDetailsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> parentId = const Value.absent(),
            Value<String?> weaponId = const Value.absent(),
            Value<String?> materialId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<int> upperLevel = const Value.absent(),
            Value<Purpose> purposeType = const Value.absent(),
            Value<String> hash = const Value.absent(),
          }) =>
              BookmarkMaterialDetailsCompanion(
            id: id,
            parentId: parentId,
            weaponId: weaponId,
            materialId: materialId,
            quantity: quantity,
            upperLevel: upperLevel,
            purposeType: purposeType,
            hash: hash,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int parentId,
            Value<String?> weaponId = const Value.absent(),
            Value<String?> materialId = const Value.absent(),
            required int quantity,
            required int upperLevel,
            required Purpose purposeType,
            required String hash,
          }) =>
              BookmarkMaterialDetailsCompanion.insert(
            id: id,
            parentId: parentId,
            weaponId: weaponId,
            materialId: materialId,
            quantity: quantity,
            upperLevel: upperLevel,
            purposeType: purposeType,
            hash: hash,
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

  $$BookmarkTableTableProcessedTableManager? get parentId {
    if ($_item.parentId == null) return null;
    final manager = $$BookmarkTableTableTableManager($_db, $_db.bookmarkTable)
        .filter((f) => f.id($_item.parentId!));
    final item = $_typedResult.readTableOrNull(_parentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BookmarkArtifactSetDetailsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase,
        $BookmarkArtifactSetDetailsTableTable> {
  $$BookmarkArtifactSetDetailsTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<ArtifactSetId>, List<ArtifactSetId>,
          String>
      get sets => $state.composableBuilder(
          column: $state.table.sets,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Map<String, StatId?>, Map<String, StatId>,
          String>
      get mainStats => $state.composableBuilder(
          column: $state.table.mainStats,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<StatId>, List<StatId>, String>
      get subStats => $state.composableBuilder(
          column: $state.table.subStats,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  $$BookmarkTableTableFilterComposer get parentId {
    final $$BookmarkTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $state.db.bookmarkTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$BookmarkTableTableFilterComposer(ComposerState($state.db,
                $state.db.bookmarkTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$BookmarkArtifactSetDetailsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase,
        $BookmarkArtifactSetDetailsTableTable> {
  $$BookmarkArtifactSetDetailsTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sets => $state.composableBuilder(
      column: $state.table.sets,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get mainStats => $state.composableBuilder(
      column: $state.table.mainStats,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get subStats => $state.composableBuilder(
      column: $state.table.subStats,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$BookmarkTableTableOrderingComposer get parentId {
    final $$BookmarkTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.parentId,
            referencedTable: $state.db.bookmarkTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$BookmarkTableTableOrderingComposer(ComposerState($state.db,
                    $state.db.bookmarkTable, joinBuilder, parentComposers)));
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
          filteringComposer:
              $$BookmarkArtifactSetDetailsTableTableFilterComposer(
                  ComposerState(db, table)),
          orderingComposer:
              $$BookmarkArtifactSetDetailsTableTableOrderingComposer(
                  ComposerState(db, table)),
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

  $$BookmarkTableTableProcessedTableManager? get parentId {
    if ($_item.parentId == null) return null;
    final manager = $$BookmarkTableTableTableManager($_db, $_db.bookmarkTable)
        .filter((f) => f.id($_item.parentId!));
    final item = $_typedResult.readTableOrNull(_parentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BookmarkArtifactPieceDetailsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase,
        $BookmarkArtifactPieceDetailsTableTable> {
  $$BookmarkArtifactPieceDetailsTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get piece => $state.composableBuilder(
      column: $state.table.piece,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get mainStat => $state.composableBuilder(
      column: $state.table.mainStat,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<StatId>, List<StatId>, String>
      get subStats => $state.composableBuilder(
          column: $state.table.subStats,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  $$BookmarkTableTableFilterComposer get parentId {
    final $$BookmarkTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $state.db.bookmarkTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$BookmarkTableTableFilterComposer(ComposerState($state.db,
                $state.db.bookmarkTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$BookmarkArtifactPieceDetailsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase,
        $BookmarkArtifactPieceDetailsTableTable> {
  $$BookmarkArtifactPieceDetailsTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get piece => $state.composableBuilder(
      column: $state.table.piece,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get mainStat => $state.composableBuilder(
      column: $state.table.mainStat,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get subStats => $state.composableBuilder(
      column: $state.table.subStats,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$BookmarkTableTableOrderingComposer get parentId {
    final $$BookmarkTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.parentId,
            referencedTable: $state.db.bookmarkTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$BookmarkTableTableOrderingComposer(ComposerState($state.db,
                    $state.db.bookmarkTable, joinBuilder, parentComposers)));
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
          filteringComposer:
              $$BookmarkArtifactPieceDetailsTableTableFilterComposer(
                  ComposerState(db, table)),
          orderingComposer:
              $$BookmarkArtifactPieceDetailsTableTableOrderingComposer(
                  ComposerState(db, table)),
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
        $$BookmarkArtifactPieceDetailsTableTableCreateCompanionBuilder,
        $$BookmarkArtifactPieceDetailsTableTableUpdateCompanionBuilder,
        (
          BookmarkArtifactPieceDetails,
          $$BookmarkArtifactPieceDetailsTableTableReferences
        ),
        BookmarkArtifactPieceDetails,
        PrefetchHooks Function({bool parentId})>;
typedef $$CharacterLevelInfoTableTableCreateCompanionBuilder
    = CharacterLevelInfoCompanion Function({
  required String uid,
  required String characterId,
  required Map<Purpose, int> purposes,
  Value<int> rowid,
});
typedef $$CharacterLevelInfoTableTableUpdateCompanionBuilder
    = CharacterLevelInfoCompanion Function({
  Value<String> uid,
  Value<String> characterId,
  Value<Map<Purpose, int>> purposes,
  Value<int> rowid,
});

class $$CharacterLevelInfoTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CharacterLevelInfoTableTable> {
  $$CharacterLevelInfoTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uid => $state.composableBuilder(
      column: $state.table.uid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get characterId => $state.composableBuilder(
      column: $state.table.characterId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Map<Purpose, int>, Map<Purpose, int>, String>
      get purposes => $state.composableBuilder(
          column: $state.table.purposes,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));
}

class $$CharacterLevelInfoTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CharacterLevelInfoTableTable> {
  $$CharacterLevelInfoTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uid => $state.composableBuilder(
      column: $state.table.uid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get characterId => $state.composableBuilder(
      column: $state.table.characterId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get purposes => $state.composableBuilder(
      column: $state.table.purposes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$CharacterLevelInfoTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CharacterLevelInfoTableTable,
    CharacterLevelInfo,
    $$CharacterLevelInfoTableTableFilterComposer,
    $$CharacterLevelInfoTableTableOrderingComposer,
    $$CharacterLevelInfoTableTableCreateCompanionBuilder,
    $$CharacterLevelInfoTableTableUpdateCompanionBuilder,
    (
      CharacterLevelInfo,
      BaseReferences<_$AppDatabase, $CharacterLevelInfoTableTable,
          CharacterLevelInfo>
    ),
    CharacterLevelInfo,
    PrefetchHooks Function()> {
  $$CharacterLevelInfoTableTableTableManager(
      _$AppDatabase db, $CharacterLevelInfoTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$CharacterLevelInfoTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$CharacterLevelInfoTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uid = const Value.absent(),
            Value<String> characterId = const Value.absent(),
            Value<Map<Purpose, int>> purposes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CharacterLevelInfoCompanion(
            uid: uid,
            characterId: characterId,
            purposes: purposes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uid,
            required String characterId,
            required Map<Purpose, int> purposes,
            Value<int> rowid = const Value.absent(),
          }) =>
              CharacterLevelInfoCompanion.insert(
            uid: uid,
            characterId: characterId,
            purposes: purposes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CharacterLevelInfoTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $CharacterLevelInfoTableTable,
        CharacterLevelInfo,
        $$CharacterLevelInfoTableTableFilterComposer,
        $$CharacterLevelInfoTableTableOrderingComposer,
        $$CharacterLevelInfoTableTableCreateCompanionBuilder,
        $$CharacterLevelInfoTableTableUpdateCompanionBuilder,
        (
          CharacterLevelInfo,
          BaseReferences<_$AppDatabase, $CharacterLevelInfoTableTable,
              CharacterLevelInfo>
        ),
        CharacterLevelInfo,
        PrefetchHooks Function()>;
typedef $$BookmarkOrderRegistryTableTableCreateCompanionBuilder
    = BookmarkOrderRegistryCompanion Function({
  Value<String> id,
  required List<int> order,
  Value<int> rowid,
});
typedef $$BookmarkOrderRegistryTableTableUpdateCompanionBuilder
    = BookmarkOrderRegistryCompanion Function({
  Value<String> id,
  Value<List<int>> order,
  Value<int> rowid,
});

class $$BookmarkOrderRegistryTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BookmarkOrderRegistryTableTable> {
  $$BookmarkOrderRegistryTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<int>, List<int>, String> get order =>
      $state.composableBuilder(
          column: $state.table.order,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));
}

class $$BookmarkOrderRegistryTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BookmarkOrderRegistryTableTable> {
  $$BookmarkOrderRegistryTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get order => $state.composableBuilder(
      column: $state.table.order,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$BookmarkOrderRegistryTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BookmarkOrderRegistryTableTable,
    BookmarkOrderRegistry,
    $$BookmarkOrderRegistryTableTableFilterComposer,
    $$BookmarkOrderRegistryTableTableOrderingComposer,
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
          filteringComposer: $$BookmarkOrderRegistryTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$BookmarkOrderRegistryTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<List<int>> order = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BookmarkOrderRegistryCompanion(
            id: id,
            order: order,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required List<int> order,
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
        $$BookmarkOrderRegistryTableTableCreateCompanionBuilder,
        $$BookmarkOrderRegistryTableTableUpdateCompanionBuilder,
        (
          BookmarkOrderRegistry,
          BaseReferences<_$AppDatabase, $BookmarkOrderRegistryTableTable,
              BookmarkOrderRegistry>
        ),
        BookmarkOrderRegistry,
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
  $$CharacterLevelInfoTableTableTableManager get characterLevelInfoTable =>
      $$CharacterLevelInfoTableTableTableManager(
          _db, _db.characterLevelInfoTable);
  $$BookmarkOrderRegistryTableTableTableManager
      get bookmarkOrderRegistryTable =>
          $$BookmarkOrderRegistryTableTableTableManager(
              _db, _db.bookmarkOrderRegistryTable);
}
