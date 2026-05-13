// dart format width=80
// ignore_for_file: type=lint
part of 'database.dart';

class $BookmarkMaterialGroupTableTable extends BookmarkMaterialGroupTable
    with TableInfo<$BookmarkMaterialGroupTableTable, BookmarkMaterialGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookmarkMaterialGroupTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _groupHashMeta = const VerificationMeta(
    'groupHash',
  );
  @override
  late final GeneratedColumn<String> groupHash = GeneratedColumn<String>(
    'group_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weaponIdMeta = const VerificationMeta(
    'weaponId',
  );
  @override
  late final GeneratedColumn<String> weaponId = GeneratedColumn<String>(
    'weapon_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Purpose, String> purposeType =
      GeneratedColumn<String>(
        'purpose_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Purpose>(
        $BookmarkMaterialGroupTableTable.$converterpurposeType,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<String> orderIndex = GeneratedColumn<String>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    groupHash,
    characterId,
    weaponId,
    purposeType,
    createdAt,
    orderIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmark_material_group_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<BookmarkMaterialGroup> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('group_hash')) {
      context.handle(
        _groupHashMeta,
        groupHash.isAcceptableOrUnknown(data['group_hash']!, _groupHashMeta),
      );
    } else if (isInserting) {
      context.missing(_groupHashMeta);
    }
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('weapon_id')) {
      context.handle(
        _weaponIdMeta,
        weaponId.isAcceptableOrUnknown(data['weapon_id']!, _weaponIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {groupHash};
  @override
  BookmarkMaterialGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarkMaterialGroup(
      groupHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_hash'],
      )!,
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      )!,
      weaponId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weapon_id'],
      ),
      purposeType: $BookmarkMaterialGroupTableTable.$converterpurposeType
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}purpose_type'],
            )!,
          ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_index'],
      )!,
    );
  }

  @override
  $BookmarkMaterialGroupTableTable createAlias(String alias) {
    return $BookmarkMaterialGroupTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Purpose, String, String> $converterpurposeType =
      const EnumNameConverter<Purpose>(Purpose.values);
}

class BookmarkMaterialGroup extends DataClass
    implements Insertable<BookmarkMaterialGroup> {
  final String groupHash;
  final String characterId;
  final String? weaponId;
  final Purpose purposeType;
  final DateTime createdAt;

  /// Fractional-indexing order index in material bookmark list.
  final String orderIndex;
  const BookmarkMaterialGroup({
    required this.groupHash,
    required this.characterId,
    this.weaponId,
    required this.purposeType,
    required this.createdAt,
    required this.orderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['group_hash'] = Variable<String>(groupHash);
    map['character_id'] = Variable<String>(characterId);
    if (!nullToAbsent || weaponId != null) {
      map['weapon_id'] = Variable<String>(weaponId);
    }
    {
      map['purpose_type'] = Variable<String>(
        $BookmarkMaterialGroupTableTable.$converterpurposeType.toSql(
          purposeType,
        ),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['order_index'] = Variable<String>(orderIndex);
    return map;
  }

  BookmarkMaterialGroupCompanion toCompanion(bool nullToAbsent) {
    return BookmarkMaterialGroupCompanion(
      groupHash: Value(groupHash),
      characterId: Value(characterId),
      weaponId: weaponId == null && nullToAbsent
          ? const Value.absent()
          : Value(weaponId),
      purposeType: Value(purposeType),
      createdAt: Value(createdAt),
      orderIndex: Value(orderIndex),
    );
  }

  factory BookmarkMaterialGroup.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkMaterialGroup(
      groupHash: serializer.fromJson<String>(json['groupHash']),
      characterId: serializer.fromJson<String>(json['characterId']),
      weaponId: serializer.fromJson<String?>(json['weaponId']),
      purposeType: $BookmarkMaterialGroupTableTable.$converterpurposeType
          .fromJson(serializer.fromJson<String>(json['purposeType'])),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      orderIndex: serializer.fromJson<String>(json['orderIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'groupHash': serializer.toJson<String>(groupHash),
      'characterId': serializer.toJson<String>(characterId),
      'weaponId': serializer.toJson<String?>(weaponId),
      'purposeType': serializer.toJson<String>(
        $BookmarkMaterialGroupTableTable.$converterpurposeType.toJson(
          purposeType,
        ),
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'orderIndex': serializer.toJson<String>(orderIndex),
    };
  }

  BookmarkMaterialGroup copyWith({
    String? groupHash,
    String? characterId,
    Value<String?> weaponId = const Value.absent(),
    Purpose? purposeType,
    DateTime? createdAt,
    String? orderIndex,
  }) => BookmarkMaterialGroup(
    groupHash: groupHash ?? this.groupHash,
    characterId: characterId ?? this.characterId,
    weaponId: weaponId.present ? weaponId.value : this.weaponId,
    purposeType: purposeType ?? this.purposeType,
    createdAt: createdAt ?? this.createdAt,
    orderIndex: orderIndex ?? this.orderIndex,
  );
  BookmarkMaterialGroup copyWithCompanion(BookmarkMaterialGroupCompanion data) {
    return BookmarkMaterialGroup(
      groupHash: data.groupHash.present ? data.groupHash.value : this.groupHash,
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
      weaponId: data.weaponId.present ? data.weaponId.value : this.weaponId,
      purposeType: data.purposeType.present
          ? data.purposeType.value
          : this.purposeType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkMaterialGroup(')
          ..write('groupHash: $groupHash, ')
          ..write('characterId: $characterId, ')
          ..write('weaponId: $weaponId, ')
          ..write('purposeType: $purposeType, ')
          ..write('createdAt: $createdAt, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    groupHash,
    characterId,
    weaponId,
    purposeType,
    createdAt,
    orderIndex,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookmarkMaterialGroup &&
          other.groupHash == this.groupHash &&
          other.characterId == this.characterId &&
          other.weaponId == this.weaponId &&
          other.purposeType == this.purposeType &&
          other.createdAt == this.createdAt &&
          other.orderIndex == this.orderIndex);
}

class BookmarkMaterialGroupCompanion
    extends UpdateCompanion<BookmarkMaterialGroup> {
  final Value<String> groupHash;
  final Value<String> characterId;
  final Value<String?> weaponId;
  final Value<Purpose> purposeType;
  final Value<DateTime> createdAt;
  final Value<String> orderIndex;
  final Value<int> rowid;
  const BookmarkMaterialGroupCompanion({
    this.groupHash = const Value.absent(),
    this.characterId = const Value.absent(),
    this.weaponId = const Value.absent(),
    this.purposeType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BookmarkMaterialGroupCompanion.insert({
    required String groupHash,
    required String characterId,
    this.weaponId = const Value.absent(),
    required Purpose purposeType,
    this.createdAt = const Value.absent(),
    required String orderIndex,
    this.rowid = const Value.absent(),
  }) : groupHash = Value(groupHash),
       characterId = Value(characterId),
       purposeType = Value(purposeType),
       orderIndex = Value(orderIndex);
  static Insertable<BookmarkMaterialGroup> custom({
    Expression<String>? groupHash,
    Expression<String>? characterId,
    Expression<String>? weaponId,
    Expression<String>? purposeType,
    Expression<DateTime>? createdAt,
    Expression<String>? orderIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (groupHash != null) 'group_hash': groupHash,
      if (characterId != null) 'character_id': characterId,
      if (weaponId != null) 'weapon_id': weaponId,
      if (purposeType != null) 'purpose_type': purposeType,
      if (createdAt != null) 'created_at': createdAt,
      if (orderIndex != null) 'order_index': orderIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BookmarkMaterialGroupCompanion copyWith({
    Value<String>? groupHash,
    Value<String>? characterId,
    Value<String?>? weaponId,
    Value<Purpose>? purposeType,
    Value<DateTime>? createdAt,
    Value<String>? orderIndex,
    Value<int>? rowid,
  }) {
    return BookmarkMaterialGroupCompanion(
      groupHash: groupHash ?? this.groupHash,
      characterId: characterId ?? this.characterId,
      weaponId: weaponId ?? this.weaponId,
      purposeType: purposeType ?? this.purposeType,
      createdAt: createdAt ?? this.createdAt,
      orderIndex: orderIndex ?? this.orderIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (groupHash.present) {
      map['group_hash'] = Variable<String>(groupHash.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (weaponId.present) {
      map['weapon_id'] = Variable<String>(weaponId.value);
    }
    if (purposeType.present) {
      map['purpose_type'] = Variable<String>(
        $BookmarkMaterialGroupTableTable.$converterpurposeType.toSql(
          purposeType.value,
        ),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<String>(orderIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkMaterialGroupCompanion(')
          ..write('groupHash: $groupHash, ')
          ..write('characterId: $characterId, ')
          ..write('weaponId: $weaponId, ')
          ..write('purposeType: $purposeType, ')
          ..write('createdAt: $createdAt, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BookmarkMaterialItemTableTable extends BookmarkMaterialItemTable
    with TableInfo<$BookmarkMaterialItemTableTable, BookmarkMaterialItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookmarkMaterialItemTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _hashMeta = const VerificationMeta('hash');
  @override
  late final GeneratedColumn<String> hash = GeneratedColumn<String>(
    'hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _groupHashMeta = const VerificationMeta(
    'groupHash',
  );
  @override
  late final GeneratedColumn<String> groupHash = GeneratedColumn<String>(
    'group_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES bookmark_material_group_table (group_hash) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _materialIdMeta = const VerificationMeta(
    'materialId',
  );
  @override
  late final GeneratedColumn<String> materialId = GeneratedColumn<String>(
    'material_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _upperLevelMeta = const VerificationMeta(
    'upperLevel',
  );
  @override
  late final GeneratedColumn<int> upperLevel = GeneratedColumn<int>(
    'upper_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    hash,
    groupHash,
    materialId,
    quantity,
    upperLevel,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmark_material_item_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<BookmarkMaterialItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('hash')) {
      context.handle(
        _hashMeta,
        hash.isAcceptableOrUnknown(data['hash']!, _hashMeta),
      );
    } else if (isInserting) {
      context.missing(_hashMeta);
    }
    if (data.containsKey('group_hash')) {
      context.handle(
        _groupHashMeta,
        groupHash.isAcceptableOrUnknown(data['group_hash']!, _groupHashMeta),
      );
    } else if (isInserting) {
      context.missing(_groupHashMeta);
    }
    if (data.containsKey('material_id')) {
      context.handle(
        _materialIdMeta,
        materialId.isAcceptableOrUnknown(data['material_id']!, _materialIdMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('upper_level')) {
      context.handle(
        _upperLevelMeta,
        upperLevel.isAcceptableOrUnknown(data['upper_level']!, _upperLevelMeta),
      );
    } else if (isInserting) {
      context.missing(_upperLevelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {hash};
  @override
  BookmarkMaterialItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarkMaterialItem(
      hash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hash'],
      )!,
      groupHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_hash'],
      )!,
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
    );
  }

  @override
  $BookmarkMaterialItemTableTable createAlias(String alias) {
    return $BookmarkMaterialItemTableTable(attachedDatabase, alias);
  }
}

class BookmarkMaterialItem extends DataClass
    implements Insertable<BookmarkMaterialItem> {
  final String hash;
  final String groupHash;

  /// If null, this bookmark will be regarded as EXP items.
  final String? materialId;

  /// If [materialId] is null, this represents the amount of EXP.
  final int quantity;

  /// target level.
  final int upperLevel;
  const BookmarkMaterialItem({
    required this.hash,
    required this.groupHash,
    this.materialId,
    required this.quantity,
    required this.upperLevel,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['hash'] = Variable<String>(hash);
    map['group_hash'] = Variable<String>(groupHash);
    if (!nullToAbsent || materialId != null) {
      map['material_id'] = Variable<String>(materialId);
    }
    map['quantity'] = Variable<int>(quantity);
    map['upper_level'] = Variable<int>(upperLevel);
    return map;
  }

  BookmarkMaterialItemCompanion toCompanion(bool nullToAbsent) {
    return BookmarkMaterialItemCompanion(
      hash: Value(hash),
      groupHash: Value(groupHash),
      materialId: materialId == null && nullToAbsent
          ? const Value.absent()
          : Value(materialId),
      quantity: Value(quantity),
      upperLevel: Value(upperLevel),
    );
  }

  factory BookmarkMaterialItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkMaterialItem(
      hash: serializer.fromJson<String>(json['hash']),
      groupHash: serializer.fromJson<String>(json['groupHash']),
      materialId: serializer.fromJson<String?>(json['materialId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      upperLevel: serializer.fromJson<int>(json['upperLevel']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'hash': serializer.toJson<String>(hash),
      'groupHash': serializer.toJson<String>(groupHash),
      'materialId': serializer.toJson<String?>(materialId),
      'quantity': serializer.toJson<int>(quantity),
      'upperLevel': serializer.toJson<int>(upperLevel),
    };
  }

  BookmarkMaterialItem copyWith({
    String? hash,
    String? groupHash,
    Value<String?> materialId = const Value.absent(),
    int? quantity,
    int? upperLevel,
  }) => BookmarkMaterialItem(
    hash: hash ?? this.hash,
    groupHash: groupHash ?? this.groupHash,
    materialId: materialId.present ? materialId.value : this.materialId,
    quantity: quantity ?? this.quantity,
    upperLevel: upperLevel ?? this.upperLevel,
  );
  BookmarkMaterialItem copyWithCompanion(BookmarkMaterialItemCompanion data) {
    return BookmarkMaterialItem(
      hash: data.hash.present ? data.hash.value : this.hash,
      groupHash: data.groupHash.present ? data.groupHash.value : this.groupHash,
      materialId: data.materialId.present
          ? data.materialId.value
          : this.materialId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      upperLevel: data.upperLevel.present
          ? data.upperLevel.value
          : this.upperLevel,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkMaterialItem(')
          ..write('hash: $hash, ')
          ..write('groupHash: $groupHash, ')
          ..write('materialId: $materialId, ')
          ..write('quantity: $quantity, ')
          ..write('upperLevel: $upperLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(hash, groupHash, materialId, quantity, upperLevel);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookmarkMaterialItem &&
          other.hash == this.hash &&
          other.groupHash == this.groupHash &&
          other.materialId == this.materialId &&
          other.quantity == this.quantity &&
          other.upperLevel == this.upperLevel);
}

class BookmarkMaterialItemCompanion
    extends UpdateCompanion<BookmarkMaterialItem> {
  final Value<String> hash;
  final Value<String> groupHash;
  final Value<String?> materialId;
  final Value<int> quantity;
  final Value<int> upperLevel;
  final Value<int> rowid;
  const BookmarkMaterialItemCompanion({
    this.hash = const Value.absent(),
    this.groupHash = const Value.absent(),
    this.materialId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.upperLevel = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BookmarkMaterialItemCompanion.insert({
    required String hash,
    required String groupHash,
    this.materialId = const Value.absent(),
    required int quantity,
    required int upperLevel,
    this.rowid = const Value.absent(),
  }) : hash = Value(hash),
       groupHash = Value(groupHash),
       quantity = Value(quantity),
       upperLevel = Value(upperLevel);
  static Insertable<BookmarkMaterialItem> custom({
    Expression<String>? hash,
    Expression<String>? groupHash,
    Expression<String>? materialId,
    Expression<int>? quantity,
    Expression<int>? upperLevel,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (hash != null) 'hash': hash,
      if (groupHash != null) 'group_hash': groupHash,
      if (materialId != null) 'material_id': materialId,
      if (quantity != null) 'quantity': quantity,
      if (upperLevel != null) 'upper_level': upperLevel,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BookmarkMaterialItemCompanion copyWith({
    Value<String>? hash,
    Value<String>? groupHash,
    Value<String?>? materialId,
    Value<int>? quantity,
    Value<int>? upperLevel,
    Value<int>? rowid,
  }) {
    return BookmarkMaterialItemCompanion(
      hash: hash ?? this.hash,
      groupHash: groupHash ?? this.groupHash,
      materialId: materialId ?? this.materialId,
      quantity: quantity ?? this.quantity,
      upperLevel: upperLevel ?? this.upperLevel,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (hash.present) {
      map['hash'] = Variable<String>(hash.value);
    }
    if (groupHash.present) {
      map['group_hash'] = Variable<String>(groupHash.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkMaterialItemCompanion(')
          ..write('hash: $hash, ')
          ..write('groupHash: $groupHash, ')
          ..write('materialId: $materialId, ')
          ..write('quantity: $quantity, ')
          ..write('upperLevel: $upperLevel, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BookmarkArtifactTableTable extends BookmarkArtifactTable
    with TableInfo<$BookmarkArtifactTableTable, BookmarkArtifact> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookmarkArtifactTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
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
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<StatId>, String> subStats =
      GeneratedColumn<String>(
        'sub_stats',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<StatId>>(
        $BookmarkArtifactTableTable.$convertersubStats,
      );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<String> orderIndex = GeneratedColumn<String>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    characterId,
    createdAt,
    subStats,
    orderIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmark_artifact_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<BookmarkArtifact> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookmarkArtifact map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarkArtifact(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      subStats: $BookmarkArtifactTableTable.$convertersubStats.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sub_stats'],
        )!,
      ),
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_index'],
      )!,
    );
  }

  @override
  $BookmarkArtifactTableTable createAlias(String alias) {
    return $BookmarkArtifactTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<StatId>, String> $convertersubStats =
      const ListConverter<StatId>();
}

class BookmarkArtifact extends DataClass
    implements Insertable<BookmarkArtifact> {
  final int id;
  final String characterId;
  final DateTime createdAt;
  final List<StatId> subStats;

  /// Fractional-indexing order index in artifact bookmark list.
  final String orderIndex;
  const BookmarkArtifact({
    required this.id,
    required this.characterId,
    required this.createdAt,
    required this.subStats,
    required this.orderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['character_id'] = Variable<String>(characterId);
    map['created_at'] = Variable<DateTime>(createdAt);
    {
      map['sub_stats'] = Variable<String>(
        $BookmarkArtifactTableTable.$convertersubStats.toSql(subStats),
      );
    }
    map['order_index'] = Variable<String>(orderIndex);
    return map;
  }

  BookmarkArtifactCompanion toCompanion(bool nullToAbsent) {
    return BookmarkArtifactCompanion(
      id: Value(id),
      characterId: Value(characterId),
      createdAt: Value(createdAt),
      subStats: Value(subStats),
      orderIndex: Value(orderIndex),
    );
  }

  factory BookmarkArtifact.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkArtifact(
      id: serializer.fromJson<int>(json['id']),
      characterId: serializer.fromJson<String>(json['characterId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      subStats: serializer.fromJson<List<StatId>>(json['subStats']),
      orderIndex: serializer.fromJson<String>(json['orderIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'characterId': serializer.toJson<String>(characterId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'subStats': serializer.toJson<List<StatId>>(subStats),
      'orderIndex': serializer.toJson<String>(orderIndex),
    };
  }

  BookmarkArtifact copyWith({
    int? id,
    String? characterId,
    DateTime? createdAt,
    List<StatId>? subStats,
    String? orderIndex,
  }) => BookmarkArtifact(
    id: id ?? this.id,
    characterId: characterId ?? this.characterId,
    createdAt: createdAt ?? this.createdAt,
    subStats: subStats ?? this.subStats,
    orderIndex: orderIndex ?? this.orderIndex,
  );
  BookmarkArtifact copyWithCompanion(BookmarkArtifactCompanion data) {
    return BookmarkArtifact(
      id: data.id.present ? data.id.value : this.id,
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      subStats: data.subStats.present ? data.subStats.value : this.subStats,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkArtifact(')
          ..write('id: $id, ')
          ..write('characterId: $characterId, ')
          ..write('createdAt: $createdAt, ')
          ..write('subStats: $subStats, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, characterId, createdAt, subStats, orderIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookmarkArtifact &&
          other.id == this.id &&
          other.characterId == this.characterId &&
          other.createdAt == this.createdAt &&
          other.subStats == this.subStats &&
          other.orderIndex == this.orderIndex);
}

class BookmarkArtifactCompanion extends UpdateCompanion<BookmarkArtifact> {
  final Value<int> id;
  final Value<String> characterId;
  final Value<DateTime> createdAt;
  final Value<List<StatId>> subStats;
  final Value<String> orderIndex;
  const BookmarkArtifactCompanion({
    this.id = const Value.absent(),
    this.characterId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.subStats = const Value.absent(),
    this.orderIndex = const Value.absent(),
  });
  BookmarkArtifactCompanion.insert({
    this.id = const Value.absent(),
    required String characterId,
    this.createdAt = const Value.absent(),
    required List<StatId> subStats,
    required String orderIndex,
  }) : characterId = Value(characterId),
       subStats = Value(subStats),
       orderIndex = Value(orderIndex);
  static Insertable<BookmarkArtifact> custom({
    Expression<int>? id,
    Expression<String>? characterId,
    Expression<DateTime>? createdAt,
    Expression<String>? subStats,
    Expression<String>? orderIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (characterId != null) 'character_id': characterId,
      if (createdAt != null) 'created_at': createdAt,
      if (subStats != null) 'sub_stats': subStats,
      if (orderIndex != null) 'order_index': orderIndex,
    });
  }

  BookmarkArtifactCompanion copyWith({
    Value<int>? id,
    Value<String>? characterId,
    Value<DateTime>? createdAt,
    Value<List<StatId>>? subStats,
    Value<String>? orderIndex,
  }) {
    return BookmarkArtifactCompanion(
      id: id ?? this.id,
      characterId: characterId ?? this.characterId,
      createdAt: createdAt ?? this.createdAt,
      subStats: subStats ?? this.subStats,
      orderIndex: orderIndex ?? this.orderIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (subStats.present) {
      map['sub_stats'] = Variable<String>(
        $BookmarkArtifactTableTable.$convertersubStats.toSql(subStats.value),
      );
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<String>(orderIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkArtifactCompanion(')
          ..write('id: $id, ')
          ..write('characterId: $characterId, ')
          ..write('createdAt: $createdAt, ')
          ..write('subStats: $subStats, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }
}

class $BookmarkArtifactSetTableTable extends BookmarkArtifactSetTable
    with TableInfo<$BookmarkArtifactSetTableTable, BookmarkArtifactSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookmarkArtifactSetTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES bookmark_artifact_table (id) ON DELETE CASCADE',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<ArtifactSetId>, String>
  sets =
      GeneratedColumn<String>(
        'sets',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<ArtifactSetId>>(
        $BookmarkArtifactSetTableTable.$convertersets,
      );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, StatId?>, String>
  mainStats =
      GeneratedColumn<String>(
        'main_stats',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Map<String, StatId?>>(
        $BookmarkArtifactSetTableTable.$convertermainStats,
      );
  @override
  List<GeneratedColumn> get $columns => [id, sets, mainStats];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmark_artifact_set_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<BookmarkArtifactSet> instance, {
    bool isInserting = false,
  }) {
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
  BookmarkArtifactSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarkArtifactSet(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sets: $BookmarkArtifactSetTableTable.$convertersets.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sets'],
        )!,
      ),
      mainStats: $BookmarkArtifactSetTableTable.$convertermainStats.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}main_stats'],
        )!,
      ),
    );
  }

  @override
  $BookmarkArtifactSetTableTable createAlias(String alias) {
    return $BookmarkArtifactSetTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<ArtifactSetId>, String> $convertersets =
      const ListConverter<ArtifactSetId>();
  static TypeConverter<Map<String, StatId?>, String> $convertermainStats =
      const MapConverter<StatId?>();
}

class BookmarkArtifactSet extends DataClass
    implements Insertable<BookmarkArtifactSet> {
  final int id;
  final List<ArtifactSetId> sets;

  /// key = [ArtifactPieceTypeId]
  final Map<String, StatId?> mainStats;
  const BookmarkArtifactSet({
    required this.id,
    required this.sets,
    required this.mainStats,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['sets'] = Variable<String>(
        $BookmarkArtifactSetTableTable.$convertersets.toSql(sets),
      );
    }
    {
      map['main_stats'] = Variable<String>(
        $BookmarkArtifactSetTableTable.$convertermainStats.toSql(mainStats),
      );
    }
    return map;
  }

  BookmarkArtifactSetCompanion toCompanion(bool nullToAbsent) {
    return BookmarkArtifactSetCompanion(
      id: Value(id),
      sets: Value(sets),
      mainStats: Value(mainStats),
    );
  }

  factory BookmarkArtifactSet.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkArtifactSet(
      id: serializer.fromJson<int>(json['id']),
      sets: serializer.fromJson<List<ArtifactSetId>>(json['sets']),
      mainStats: serializer.fromJson<Map<String, StatId?>>(json['mainStats']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sets': serializer.toJson<List<ArtifactSetId>>(sets),
      'mainStats': serializer.toJson<Map<String, StatId?>>(mainStats),
    };
  }

  BookmarkArtifactSet copyWith({
    int? id,
    List<ArtifactSetId>? sets,
    Map<String, StatId?>? mainStats,
  }) => BookmarkArtifactSet(
    id: id ?? this.id,
    sets: sets ?? this.sets,
    mainStats: mainStats ?? this.mainStats,
  );
  BookmarkArtifactSet copyWithCompanion(BookmarkArtifactSetCompanion data) {
    return BookmarkArtifactSet(
      id: data.id.present ? data.id.value : this.id,
      sets: data.sets.present ? data.sets.value : this.sets,
      mainStats: data.mainStats.present ? data.mainStats.value : this.mainStats,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkArtifactSet(')
          ..write('id: $id, ')
          ..write('sets: $sets, ')
          ..write('mainStats: $mainStats')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sets, mainStats);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookmarkArtifactSet &&
          other.id == this.id &&
          other.sets == this.sets &&
          other.mainStats == this.mainStats);
}

class BookmarkArtifactSetCompanion
    extends UpdateCompanion<BookmarkArtifactSet> {
  final Value<int> id;
  final Value<List<ArtifactSetId>> sets;
  final Value<Map<String, StatId?>> mainStats;
  const BookmarkArtifactSetCompanion({
    this.id = const Value.absent(),
    this.sets = const Value.absent(),
    this.mainStats = const Value.absent(),
  });
  BookmarkArtifactSetCompanion.insert({
    this.id = const Value.absent(),
    required List<ArtifactSetId> sets,
    required Map<String, StatId?> mainStats,
  }) : sets = Value(sets),
       mainStats = Value(mainStats);
  static Insertable<BookmarkArtifactSet> custom({
    Expression<int>? id,
    Expression<String>? sets,
    Expression<String>? mainStats,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sets != null) 'sets': sets,
      if (mainStats != null) 'main_stats': mainStats,
    });
  }

  BookmarkArtifactSetCompanion copyWith({
    Value<int>? id,
    Value<List<ArtifactSetId>>? sets,
    Value<Map<String, StatId?>>? mainStats,
  }) {
    return BookmarkArtifactSetCompanion(
      id: id ?? this.id,
      sets: sets ?? this.sets,
      mainStats: mainStats ?? this.mainStats,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sets.present) {
      map['sets'] = Variable<String>(
        $BookmarkArtifactSetTableTable.$convertersets.toSql(sets.value),
      );
    }
    if (mainStats.present) {
      map['main_stats'] = Variable<String>(
        $BookmarkArtifactSetTableTable.$convertermainStats.toSql(
          mainStats.value,
        ),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkArtifactSetCompanion(')
          ..write('id: $id, ')
          ..write('sets: $sets, ')
          ..write('mainStats: $mainStats')
          ..write(')'))
        .toString();
  }
}

class $BookmarkArtifactPieceTableTable extends BookmarkArtifactPieceTable
    with TableInfo<$BookmarkArtifactPieceTableTable, BookmarkArtifactPiece> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookmarkArtifactPieceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES bookmark_artifact_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _pieceMeta = const VerificationMeta('piece');
  @override
  late final GeneratedColumn<String> piece = GeneratedColumn<String>(
    'piece',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mainStatMeta = const VerificationMeta(
    'mainStat',
  );
  @override
  late final GeneratedColumn<String> mainStat = GeneratedColumn<String>(
    'main_stat',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, piece, mainStat];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmark_artifact_piece_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<BookmarkArtifactPiece> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('piece')) {
      context.handle(
        _pieceMeta,
        piece.isAcceptableOrUnknown(data['piece']!, _pieceMeta),
      );
    } else if (isInserting) {
      context.missing(_pieceMeta);
    }
    if (data.containsKey('main_stat')) {
      context.handle(
        _mainStatMeta,
        mainStat.isAcceptableOrUnknown(data['main_stat']!, _mainStatMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookmarkArtifactPiece map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarkArtifactPiece(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      piece: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}piece'],
      )!,
      mainStat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}main_stat'],
      ),
    );
  }

  @override
  $BookmarkArtifactPieceTableTable createAlias(String alias) {
    return $BookmarkArtifactPieceTableTable(attachedDatabase, alias);
  }
}

class BookmarkArtifactPiece extends DataClass
    implements Insertable<BookmarkArtifactPiece> {
  final int id;

  /// [ArtifactPieceId]
  final String piece;

  /// [ArtifactPieceTypeId]?
  final String? mainStat;
  const BookmarkArtifactPiece({
    required this.id,
    required this.piece,
    this.mainStat,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['piece'] = Variable<String>(piece);
    if (!nullToAbsent || mainStat != null) {
      map['main_stat'] = Variable<String>(mainStat);
    }
    return map;
  }

  BookmarkArtifactPieceCompanion toCompanion(bool nullToAbsent) {
    return BookmarkArtifactPieceCompanion(
      id: Value(id),
      piece: Value(piece),
      mainStat: mainStat == null && nullToAbsent
          ? const Value.absent()
          : Value(mainStat),
    );
  }

  factory BookmarkArtifactPiece.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkArtifactPiece(
      id: serializer.fromJson<int>(json['id']),
      piece: serializer.fromJson<String>(json['piece']),
      mainStat: serializer.fromJson<String?>(json['mainStat']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'piece': serializer.toJson<String>(piece),
      'mainStat': serializer.toJson<String?>(mainStat),
    };
  }

  BookmarkArtifactPiece copyWith({
    int? id,
    String? piece,
    Value<String?> mainStat = const Value.absent(),
  }) => BookmarkArtifactPiece(
    id: id ?? this.id,
    piece: piece ?? this.piece,
    mainStat: mainStat.present ? mainStat.value : this.mainStat,
  );
  BookmarkArtifactPiece copyWithCompanion(BookmarkArtifactPieceCompanion data) {
    return BookmarkArtifactPiece(
      id: data.id.present ? data.id.value : this.id,
      piece: data.piece.present ? data.piece.value : this.piece,
      mainStat: data.mainStat.present ? data.mainStat.value : this.mainStat,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkArtifactPiece(')
          ..write('id: $id, ')
          ..write('piece: $piece, ')
          ..write('mainStat: $mainStat')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, piece, mainStat);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookmarkArtifactPiece &&
          other.id == this.id &&
          other.piece == this.piece &&
          other.mainStat == this.mainStat);
}

class BookmarkArtifactPieceCompanion
    extends UpdateCompanion<BookmarkArtifactPiece> {
  final Value<int> id;
  final Value<String> piece;
  final Value<String?> mainStat;
  const BookmarkArtifactPieceCompanion({
    this.id = const Value.absent(),
    this.piece = const Value.absent(),
    this.mainStat = const Value.absent(),
  });
  BookmarkArtifactPieceCompanion.insert({
    this.id = const Value.absent(),
    required String piece,
    this.mainStat = const Value.absent(),
  }) : piece = Value(piece);
  static Insertable<BookmarkArtifactPiece> custom({
    Expression<int>? id,
    Expression<String>? piece,
    Expression<String>? mainStat,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (piece != null) 'piece': piece,
      if (mainStat != null) 'main_stat': mainStat,
    });
  }

  BookmarkArtifactPieceCompanion copyWith({
    Value<int>? id,
    Value<String>? piece,
    Value<String?>? mainStat,
  }) {
    return BookmarkArtifactPieceCompanion(
      id: id ?? this.id,
      piece: piece ?? this.piece,
      mainStat: mainStat ?? this.mainStat,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (piece.present) {
      map['piece'] = Variable<String>(piece.value);
    }
    if (mainStat.present) {
      map['main_stat'] = Variable<String>(mainStat.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkArtifactPieceCompanion(')
          ..write('id: $id, ')
          ..write('piece: $piece, ')
          ..write('mainStat: $mainStat')
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
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<Purpose, int>, String>
  purposes =
      GeneratedColumn<String>(
        'purposes',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Map<Purpose, int>>(
        $InGameCharacterStateTableTable.$converterpurposes,
      );
  static const VerificationMeta _equippedWeaponIdMeta = const VerificationMeta(
    'equippedWeaponId',
  );
  @override
  late final GeneratedColumn<String> equippedWeaponId = GeneratedColumn<String>(
    'equipped_weapon_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastUpdatedMeta = const VerificationMeta(
    'lastUpdated',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
    'last_updated',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
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
  VerificationContext validateIntegrity(
    Insertable<InGameCharacterState> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('equipped_weapon_id')) {
      context.handle(
        _equippedWeaponIdMeta,
        equippedWeaponId.isAcceptableOrUnknown(
          data['equipped_weapon_id']!,
          _equippedWeaponIdMeta,
        ),
      );
    }
    if (data.containsKey('last_updated')) {
      context.handle(
        _lastUpdatedMeta,
        lastUpdated.isAcceptableOrUnknown(
          data['last_updated']!,
          _lastUpdatedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid, characterId};
  @override
  InGameCharacterState map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InGameCharacterState(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      )!,
      purposes: $InGameCharacterStateTableTable.$converterpurposes.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}purposes'],
        )!,
      ),
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
  const InGameCharacterState({
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
    {
      map['purposes'] = Variable<String>(
        $InGameCharacterStateTableTable.$converterpurposes.toSql(purposes),
      );
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

  factory InGameCharacterState.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  InGameCharacterState copyWith({
    String? uid,
    String? characterId,
    Map<Purpose, int>? purposes,
    Value<String?> equippedWeaponId = const Value.absent(),
    DateTime? lastUpdated,
  }) => InGameCharacterState(
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
  }) : uid = Value(uid),
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

  InGameCharacterStateCompanion copyWith({
    Value<String>? uid,
    Value<String>? characterId,
    Value<Map<Purpose, int>>? purposes,
    Value<String?>? equippedWeaponId,
    Value<DateTime>? lastUpdated,
    Value<int>? rowid,
  }) {
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
      map['purposes'] = Variable<String>(
        $InGameCharacterStateTableTable.$converterpurposes.toSql(
          purposes.value,
        ),
      );
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
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weaponIdMeta = const VerificationMeta(
    'weaponId',
  );
  @override
  late final GeneratedColumn<String> weaponId = GeneratedColumn<String>(
    'weapon_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<Purpose, int>, String>
  purposes =
      GeneratedColumn<String>(
        'purposes',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Map<Purpose, int>>(
        $InGameWeaponStateTableTable.$converterpurposes,
      );
  static const VerificationMeta _lastUpdatedMeta = const VerificationMeta(
    'lastUpdated',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
    'last_updated',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
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
  VerificationContext validateIntegrity(
    Insertable<InGameWeaponState> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('weapon_id')) {
      context.handle(
        _weaponIdMeta,
        weaponId.isAcceptableOrUnknown(data['weapon_id']!, _weaponIdMeta),
      );
    } else if (isInserting) {
      context.missing(_weaponIdMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
        _lastUpdatedMeta,
        lastUpdated.isAcceptableOrUnknown(
          data['last_updated']!,
          _lastUpdatedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid, characterId, weaponId};
  @override
  InGameWeaponState map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InGameWeaponState(
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
      purposes: $InGameWeaponStateTableTable.$converterpurposes.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}purposes'],
        )!,
      ),
      lastUpdated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated'],
      )!,
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
  const InGameWeaponState({
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
    {
      map['purposes'] = Variable<String>(
        $InGameWeaponStateTableTable.$converterpurposes.toSql(purposes),
      );
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

  factory InGameWeaponState.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  InGameWeaponState copyWith({
    String? uid,
    String? characterId,
    String? weaponId,
    Map<Purpose, int>? purposes,
    DateTime? lastUpdated,
  }) => InGameWeaponState(
    uid: uid ?? this.uid,
    characterId: characterId ?? this.characterId,
    weaponId: weaponId ?? this.weaponId,
    purposes: purposes ?? this.purposes,
    lastUpdated: lastUpdated ?? this.lastUpdated,
  );
  InGameWeaponState copyWithCompanion(InGameWeaponStateCompanion data) {
    return InGameWeaponState(
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
  }) : uid = Value(uid),
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

  InGameWeaponStateCompanion copyWith({
    Value<String>? uid,
    Value<String>? characterId,
    Value<String>? weaponId,
    Value<Map<Purpose, int>>? purposes,
    Value<DateTime>? lastUpdated,
    Value<int>? rowid,
  }) {
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
      map['purposes'] = Variable<String>(
        $InGameWeaponStateTableTable.$converterpurposes.toSql(purposes.value),
      );
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

class $MaterialBagCountTableTable extends MaterialBagCountTable
    with TableInfo<$MaterialBagCountTableTable, MaterialBagCount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaterialBagCountTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hyvIdMeta = const VerificationMeta('hyvId');
  @override
  late final GeneratedColumn<int> hyvId = GeneratedColumn<int>(
    'hyv_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastUpdatedMeta = const VerificationMeta(
    'lastUpdated',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
    'last_updated',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [uid, hyvId, count, lastUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'material_bag_count_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<MaterialBagCount> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('hyv_id')) {
      context.handle(
        _hyvIdMeta,
        hyvId.isAcceptableOrUnknown(data['hyv_id']!, _hyvIdMeta),
      );
    } else if (isInserting) {
      context.missing(_hyvIdMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
        _lastUpdatedMeta,
        lastUpdated.isAcceptableOrUnknown(
          data['last_updated']!,
          _lastUpdatedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid, hyvId};
  @override
  MaterialBagCount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MaterialBagCount(
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
  const MaterialBagCount({
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

  MaterialBagCountCompanion toCompanion(bool nullToAbsent) {
    return MaterialBagCountCompanion(
      uid: Value(uid),
      hyvId: Value(hyvId),
      count: Value(count),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory MaterialBagCount.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  MaterialBagCount copyWith({
    String? uid,
    int? hyvId,
    int? count,
    DateTime? lastUpdated,
  }) => MaterialBagCount(
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
      lastUpdated: data.lastUpdated.present
          ? data.lastUpdated.value
          : this.lastUpdated,
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
  }) : uid = Value(uid),
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

  MaterialBagCountCompanion copyWith({
    Value<String>? uid,
    Value<int>? hyvId,
    Value<int>? count,
    Value<DateTime>? lastUpdated,
    Value<int>? rowid,
  }) {
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
  static const VerificationMeta _furnishingIdMeta = const VerificationMeta(
    'furnishingId',
  );
  @override
  late final GeneratedColumn<String> furnishingId = GeneratedColumn<String>(
    'furnishing_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _setIdMeta = const VerificationMeta('setId');
  @override
  late final GeneratedColumn<String> setId = GeneratedColumn<String>(
    'set_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
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
  VerificationContext validateIntegrity(
    Insertable<FurnishingCraftCount> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('furnishing_id')) {
      context.handle(
        _furnishingIdMeta,
        furnishingId.isAcceptableOrUnknown(
          data['furnishing_id']!,
          _furnishingIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_furnishingIdMeta);
    }
    if (data.containsKey('set_id')) {
      context.handle(
        _setIdMeta,
        setId.isAcceptableOrUnknown(data['set_id']!, _setIdMeta),
      );
    } else if (isInserting) {
      context.missing(_setIdMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
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
  $FurnishingCraftCountTableTable createAlias(String alias) {
    return $FurnishingCraftCountTableTable(attachedDatabase, alias);
  }
}

class FurnishingCraftCount extends DataClass
    implements Insertable<FurnishingCraftCount> {
  final String furnishingId;
  final String setId;
  final int count;
  const FurnishingCraftCount({
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

  FurnishingCraftCountCompanion toCompanion(bool nullToAbsent) {
    return FurnishingCraftCountCompanion(
      furnishingId: Value(furnishingId),
      setId: Value(setId),
      count: Value(count),
    );
  }

  factory FurnishingCraftCount.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  FurnishingCraftCount copyWith({
    String? furnishingId,
    String? setId,
    int? count,
  }) => FurnishingCraftCount(
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
  }) : furnishingId = Value(furnishingId),
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

  FurnishingCraftCountCompanion copyWith({
    Value<String>? furnishingId,
    Value<String>? setId,
    Value<int>? count,
    Value<int>? rowid,
  }) {
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
    'set_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [setId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'furnishing_set_bookmark_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FurnishingSetBookmark> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('set_id')) {
      context.handle(
        _setIdMeta,
        setId.isAcceptableOrUnknown(data['set_id']!, _setIdMeta),
      );
    } else if (isInserting) {
      context.missing(_setIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {setId};
  @override
  FurnishingSetBookmark map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FurnishingSetBookmark(
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
  $FurnishingSetBookmarkTableTable createAlias(String alias) {
    return $FurnishingSetBookmarkTableTable(attachedDatabase, alias);
  }
}

class FurnishingSetBookmark extends DataClass
    implements Insertable<FurnishingSetBookmark> {
  final String setId;
  final DateTime createdAt;
  const FurnishingSetBookmark({required this.setId, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['set_id'] = Variable<String>(setId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FurnishingSetBookmarkCompanion toCompanion(bool nullToAbsent) {
    return FurnishingSetBookmarkCompanion(
      setId: Value(setId),
      createdAt: Value(createdAt),
    );
  }

  factory FurnishingSetBookmark.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FurnishingSetBookmark(
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

  FurnishingSetBookmark copyWith({String? setId, DateTime? createdAt}) =>
      FurnishingSetBookmark(
        setId: setId ?? this.setId,
        createdAt: createdAt ?? this.createdAt,
      );
  FurnishingSetBookmark copyWithCompanion(FurnishingSetBookmarkCompanion data) {
    return FurnishingSetBookmark(
      setId: data.setId.present ? data.setId.value : this.setId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FurnishingSetBookmark(')
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
      (other is FurnishingSetBookmark &&
          other.setId == this.setId &&
          other.createdAt == this.createdAt);
}

class FurnishingSetBookmarkCompanion
    extends UpdateCompanion<FurnishingSetBookmark> {
  final Value<String> setId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FurnishingSetBookmarkCompanion({
    this.setId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FurnishingSetBookmarkCompanion.insert({
    required String setId,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : setId = Value(setId);
  static Insertable<FurnishingSetBookmark> custom({
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

  FurnishingSetBookmarkCompanion copyWith({
    Value<String>? setId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return FurnishingSetBookmarkCompanion(
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
    return (StringBuffer('FurnishingSetBookmarkCompanion(')
          ..write('setId: $setId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BookmarkMaterialGroupTableTable bookmarkMaterialGroupTable =
      $BookmarkMaterialGroupTableTable(this);
  late final $BookmarkMaterialItemTableTable bookmarkMaterialItemTable =
      $BookmarkMaterialItemTableTable(this);
  late final $BookmarkArtifactTableTable bookmarkArtifactTable =
      $BookmarkArtifactTableTable(this);
  late final $BookmarkArtifactSetTableTable bookmarkArtifactSetTable =
      $BookmarkArtifactSetTableTable(this);
  late final $BookmarkArtifactPieceTableTable bookmarkArtifactPieceTable =
      $BookmarkArtifactPieceTableTable(this);
  late final $InGameCharacterStateTableTable inGameCharacterStateTable =
      $InGameCharacterStateTableTable(this);
  late final $InGameWeaponStateTableTable inGameWeaponStateTable =
      $InGameWeaponStateTableTable(this);
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
    bookmarkMaterialGroupTable,
    bookmarkMaterialItemTable,
    bookmarkArtifactTable,
    bookmarkArtifactSetTable,
    bookmarkArtifactPieceTable,
    inGameCharacterStateTable,
    inGameWeaponStateTable,
    materialBagCountTable,
    furnishingCraftCountTable,
    furnishingSetBookmarkTable,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'bookmark_material_group_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('bookmark_material_item_table', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'bookmark_artifact_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('bookmark_artifact_set_table', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'bookmark_artifact_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('bookmark_artifact_piece_table', kind: UpdateKind.delete),
      ],
    ),
  ]);
}

typedef $$BookmarkMaterialGroupTableTableCreateCompanionBuilder =
    BookmarkMaterialGroupCompanion Function({
      required String groupHash,
      required String characterId,
      Value<String?> weaponId,
      required Purpose purposeType,
      Value<DateTime> createdAt,
      required String orderIndex,
      Value<int> rowid,
    });
typedef $$BookmarkMaterialGroupTableTableUpdateCompanionBuilder =
    BookmarkMaterialGroupCompanion Function({
      Value<String> groupHash,
      Value<String> characterId,
      Value<String?> weaponId,
      Value<Purpose> purposeType,
      Value<DateTime> createdAt,
      Value<String> orderIndex,
      Value<int> rowid,
    });

final class $$BookmarkMaterialGroupTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $BookmarkMaterialGroupTableTable,
          BookmarkMaterialGroup
        > {
  $$BookmarkMaterialGroupTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $BookmarkMaterialItemTableTable,
    List<BookmarkMaterialItem>
  >
  _bookmarkMaterialItemTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.bookmarkMaterialItemTable,
        aliasName: $_aliasNameGenerator(
          db.bookmarkMaterialGroupTable.groupHash,
          db.bookmarkMaterialItemTable.groupHash,
        ),
      );

  $$BookmarkMaterialItemTableTableProcessedTableManager
  get bookmarkMaterialItemTableRefs {
    final manager =
        $$BookmarkMaterialItemTableTableTableManager(
          $_db,
          $_db.bookmarkMaterialItemTable,
        ).filter(
          (f) => f.groupHash.groupHash.sqlEquals(
            $_itemColumn<String>('group_hash')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _bookmarkMaterialItemTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BookmarkMaterialGroupTableTableFilterComposer
    extends Composer<_$AppDatabase, $BookmarkMaterialGroupTableTable> {
  $$BookmarkMaterialGroupTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get groupHash => $composableBuilder(
    column: $table.groupHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get characterId => $composableBuilder(
    column: $table.characterId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weaponId => $composableBuilder(
    column: $table.weaponId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Purpose, Purpose, String> get purposeType =>
      $composableBuilder(
        column: $table.purposeType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> bookmarkMaterialItemTableRefs(
    Expression<bool> Function($$BookmarkMaterialItemTableTableFilterComposer f)
    f,
  ) {
    final $$BookmarkMaterialItemTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.groupHash,
          referencedTable: $db.bookmarkMaterialItemTable,
          getReferencedColumn: (t) => t.groupHash,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$BookmarkMaterialItemTableTableFilterComposer(
                $db: $db,
                $table: $db.bookmarkMaterialItemTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$BookmarkMaterialGroupTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BookmarkMaterialGroupTableTable> {
  $$BookmarkMaterialGroupTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get groupHash => $composableBuilder(
    column: $table.groupHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get characterId => $composableBuilder(
    column: $table.characterId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weaponId => $composableBuilder(
    column: $table.weaponId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purposeType => $composableBuilder(
    column: $table.purposeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BookmarkMaterialGroupTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BookmarkMaterialGroupTableTable> {
  $$BookmarkMaterialGroupTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get groupHash =>
      $composableBuilder(column: $table.groupHash, builder: (column) => column);

  GeneratedColumn<String> get characterId => $composableBuilder(
    column: $table.characterId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get weaponId =>
      $composableBuilder(column: $table.weaponId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Purpose, String> get purposeType =>
      $composableBuilder(
        column: $table.purposeType,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  Expression<T> bookmarkMaterialItemTableRefs<T extends Object>(
    Expression<T> Function($$BookmarkMaterialItemTableTableAnnotationComposer a)
    f,
  ) {
    final $$BookmarkMaterialItemTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.groupHash,
          referencedTable: $db.bookmarkMaterialItemTable,
          getReferencedColumn: (t) => t.groupHash,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$BookmarkMaterialItemTableTableAnnotationComposer(
                $db: $db,
                $table: $db.bookmarkMaterialItemTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$BookmarkMaterialGroupTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BookmarkMaterialGroupTableTable,
          BookmarkMaterialGroup,
          $$BookmarkMaterialGroupTableTableFilterComposer,
          $$BookmarkMaterialGroupTableTableOrderingComposer,
          $$BookmarkMaterialGroupTableTableAnnotationComposer,
          $$BookmarkMaterialGroupTableTableCreateCompanionBuilder,
          $$BookmarkMaterialGroupTableTableUpdateCompanionBuilder,
          (BookmarkMaterialGroup, $$BookmarkMaterialGroupTableTableReferences),
          BookmarkMaterialGroup,
          PrefetchHooks Function({bool bookmarkMaterialItemTableRefs})
        > {
  $$BookmarkMaterialGroupTableTableTableManager(
    _$AppDatabase db,
    $BookmarkMaterialGroupTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookmarkMaterialGroupTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$BookmarkMaterialGroupTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$BookmarkMaterialGroupTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> groupHash = const Value.absent(),
                Value<String> characterId = const Value.absent(),
                Value<String?> weaponId = const Value.absent(),
                Value<Purpose> purposeType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> orderIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BookmarkMaterialGroupCompanion(
                groupHash: groupHash,
                characterId: characterId,
                weaponId: weaponId,
                purposeType: purposeType,
                createdAt: createdAt,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String groupHash,
                required String characterId,
                Value<String?> weaponId = const Value.absent(),
                required Purpose purposeType,
                Value<DateTime> createdAt = const Value.absent(),
                required String orderIndex,
                Value<int> rowid = const Value.absent(),
              }) => BookmarkMaterialGroupCompanion.insert(
                groupHash: groupHash,
                characterId: characterId,
                weaponId: weaponId,
                purposeType: purposeType,
                createdAt: createdAt,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BookmarkMaterialGroupTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({bookmarkMaterialItemTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (bookmarkMaterialItemTableRefs) db.bookmarkMaterialItemTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (bookmarkMaterialItemTableRefs)
                    await $_getPrefetchedData<
                      BookmarkMaterialGroup,
                      $BookmarkMaterialGroupTableTable,
                      BookmarkMaterialItem
                    >(
                      currentTable: table,
                      referencedTable:
                          $$BookmarkMaterialGroupTableTableReferences
                              ._bookmarkMaterialItemTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$BookmarkMaterialGroupTableTableReferences(
                            db,
                            table,
                            p0,
                          ).bookmarkMaterialItemTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.groupHash == item.groupHash,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BookmarkMaterialGroupTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BookmarkMaterialGroupTableTable,
      BookmarkMaterialGroup,
      $$BookmarkMaterialGroupTableTableFilterComposer,
      $$BookmarkMaterialGroupTableTableOrderingComposer,
      $$BookmarkMaterialGroupTableTableAnnotationComposer,
      $$BookmarkMaterialGroupTableTableCreateCompanionBuilder,
      $$BookmarkMaterialGroupTableTableUpdateCompanionBuilder,
      (BookmarkMaterialGroup, $$BookmarkMaterialGroupTableTableReferences),
      BookmarkMaterialGroup,
      PrefetchHooks Function({bool bookmarkMaterialItemTableRefs})
    >;
typedef $$BookmarkMaterialItemTableTableCreateCompanionBuilder =
    BookmarkMaterialItemCompanion Function({
      required String hash,
      required String groupHash,
      Value<String?> materialId,
      required int quantity,
      required int upperLevel,
      Value<int> rowid,
    });
typedef $$BookmarkMaterialItemTableTableUpdateCompanionBuilder =
    BookmarkMaterialItemCompanion Function({
      Value<String> hash,
      Value<String> groupHash,
      Value<String?> materialId,
      Value<int> quantity,
      Value<int> upperLevel,
      Value<int> rowid,
    });

final class $$BookmarkMaterialItemTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $BookmarkMaterialItemTableTable,
          BookmarkMaterialItem
        > {
  $$BookmarkMaterialItemTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BookmarkMaterialGroupTableTable _groupHashTable(_$AppDatabase db) =>
      db.bookmarkMaterialGroupTable.createAlias(
        $_aliasNameGenerator(
          db.bookmarkMaterialItemTable.groupHash,
          db.bookmarkMaterialGroupTable.groupHash,
        ),
      );

  $$BookmarkMaterialGroupTableTableProcessedTableManager get groupHash {
    final $_column = $_itemColumn<String>('group_hash')!;

    final manager = $$BookmarkMaterialGroupTableTableTableManager(
      $_db,
      $_db.bookmarkMaterialGroupTable,
    ).filter((f) => f.groupHash.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groupHashTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BookmarkMaterialItemTableTableFilterComposer
    extends Composer<_$AppDatabase, $BookmarkMaterialItemTableTable> {
  $$BookmarkMaterialItemTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get hash => $composableBuilder(
    column: $table.hash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get materialId => $composableBuilder(
    column: $table.materialId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get upperLevel => $composableBuilder(
    column: $table.upperLevel,
    builder: (column) => ColumnFilters(column),
  );

  $$BookmarkMaterialGroupTableTableFilterComposer get groupHash {
    final $$BookmarkMaterialGroupTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.groupHash,
          referencedTable: $db.bookmarkMaterialGroupTable,
          getReferencedColumn: (t) => t.groupHash,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$BookmarkMaterialGroupTableTableFilterComposer(
                $db: $db,
                $table: $db.bookmarkMaterialGroupTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$BookmarkMaterialItemTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BookmarkMaterialItemTableTable> {
  $$BookmarkMaterialItemTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get hash => $composableBuilder(
    column: $table.hash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get materialId => $composableBuilder(
    column: $table.materialId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get upperLevel => $composableBuilder(
    column: $table.upperLevel,
    builder: (column) => ColumnOrderings(column),
  );

  $$BookmarkMaterialGroupTableTableOrderingComposer get groupHash {
    final $$BookmarkMaterialGroupTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.groupHash,
          referencedTable: $db.bookmarkMaterialGroupTable,
          getReferencedColumn: (t) => t.groupHash,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$BookmarkMaterialGroupTableTableOrderingComposer(
                $db: $db,
                $table: $db.bookmarkMaterialGroupTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$BookmarkMaterialItemTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BookmarkMaterialItemTableTable> {
  $$BookmarkMaterialItemTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get hash =>
      $composableBuilder(column: $table.hash, builder: (column) => column);

  GeneratedColumn<String> get materialId => $composableBuilder(
    column: $table.materialId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get upperLevel => $composableBuilder(
    column: $table.upperLevel,
    builder: (column) => column,
  );

  $$BookmarkMaterialGroupTableTableAnnotationComposer get groupHash {
    final $$BookmarkMaterialGroupTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.groupHash,
          referencedTable: $db.bookmarkMaterialGroupTable,
          getReferencedColumn: (t) => t.groupHash,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$BookmarkMaterialGroupTableTableAnnotationComposer(
                $db: $db,
                $table: $db.bookmarkMaterialGroupTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$BookmarkMaterialItemTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BookmarkMaterialItemTableTable,
          BookmarkMaterialItem,
          $$BookmarkMaterialItemTableTableFilterComposer,
          $$BookmarkMaterialItemTableTableOrderingComposer,
          $$BookmarkMaterialItemTableTableAnnotationComposer,
          $$BookmarkMaterialItemTableTableCreateCompanionBuilder,
          $$BookmarkMaterialItemTableTableUpdateCompanionBuilder,
          (BookmarkMaterialItem, $$BookmarkMaterialItemTableTableReferences),
          BookmarkMaterialItem,
          PrefetchHooks Function({bool groupHash})
        > {
  $$BookmarkMaterialItemTableTableTableManager(
    _$AppDatabase db,
    $BookmarkMaterialItemTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookmarkMaterialItemTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$BookmarkMaterialItemTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$BookmarkMaterialItemTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> hash = const Value.absent(),
                Value<String> groupHash = const Value.absent(),
                Value<String?> materialId = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<int> upperLevel = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BookmarkMaterialItemCompanion(
                hash: hash,
                groupHash: groupHash,
                materialId: materialId,
                quantity: quantity,
                upperLevel: upperLevel,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String hash,
                required String groupHash,
                Value<String?> materialId = const Value.absent(),
                required int quantity,
                required int upperLevel,
                Value<int> rowid = const Value.absent(),
              }) => BookmarkMaterialItemCompanion.insert(
                hash: hash,
                groupHash: groupHash,
                materialId: materialId,
                quantity: quantity,
                upperLevel: upperLevel,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BookmarkMaterialItemTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({groupHash = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (groupHash) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.groupHash,
                                referencedTable:
                                    $$BookmarkMaterialItemTableTableReferences
                                        ._groupHashTable(db),
                                referencedColumn:
                                    $$BookmarkMaterialItemTableTableReferences
                                        ._groupHashTable(db)
                                        .groupHash,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BookmarkMaterialItemTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BookmarkMaterialItemTableTable,
      BookmarkMaterialItem,
      $$BookmarkMaterialItemTableTableFilterComposer,
      $$BookmarkMaterialItemTableTableOrderingComposer,
      $$BookmarkMaterialItemTableTableAnnotationComposer,
      $$BookmarkMaterialItemTableTableCreateCompanionBuilder,
      $$BookmarkMaterialItemTableTableUpdateCompanionBuilder,
      (BookmarkMaterialItem, $$BookmarkMaterialItemTableTableReferences),
      BookmarkMaterialItem,
      PrefetchHooks Function({bool groupHash})
    >;
typedef $$BookmarkArtifactTableTableCreateCompanionBuilder =
    BookmarkArtifactCompanion Function({
      Value<int> id,
      required String characterId,
      Value<DateTime> createdAt,
      required List<StatId> subStats,
      required String orderIndex,
    });
typedef $$BookmarkArtifactTableTableUpdateCompanionBuilder =
    BookmarkArtifactCompanion Function({
      Value<int> id,
      Value<String> characterId,
      Value<DateTime> createdAt,
      Value<List<StatId>> subStats,
      Value<String> orderIndex,
    });

final class $$BookmarkArtifactTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $BookmarkArtifactTableTable,
          BookmarkArtifact
        > {
  $$BookmarkArtifactTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $BookmarkArtifactSetTableTable,
    List<BookmarkArtifactSet>
  >
  _bookmarkArtifactSetTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.bookmarkArtifactSetTable,
        aliasName: $_aliasNameGenerator(
          db.bookmarkArtifactTable.id,
          db.bookmarkArtifactSetTable.id,
        ),
      );

  $$BookmarkArtifactSetTableTableProcessedTableManager
  get bookmarkArtifactSetTableRefs {
    final manager = $$BookmarkArtifactSetTableTableTableManager(
      $_db,
      $_db.bookmarkArtifactSetTable,
    ).filter((f) => f.id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _bookmarkArtifactSetTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $BookmarkArtifactPieceTableTable,
    List<BookmarkArtifactPiece>
  >
  _bookmarkArtifactPieceTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.bookmarkArtifactPieceTable,
        aliasName: $_aliasNameGenerator(
          db.bookmarkArtifactTable.id,
          db.bookmarkArtifactPieceTable.id,
        ),
      );

  $$BookmarkArtifactPieceTableTableProcessedTableManager
  get bookmarkArtifactPieceTableRefs {
    final manager = $$BookmarkArtifactPieceTableTableTableManager(
      $_db,
      $_db.bookmarkArtifactPieceTable,
    ).filter((f) => f.id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _bookmarkArtifactPieceTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BookmarkArtifactTableTableFilterComposer
    extends Composer<_$AppDatabase, $BookmarkArtifactTableTable> {
  $$BookmarkArtifactTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get characterId => $composableBuilder(
    column: $table.characterId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<StatId>, List<StatId>, String>
  get subStats => $composableBuilder(
    column: $table.subStats,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> bookmarkArtifactSetTableRefs(
    Expression<bool> Function($$BookmarkArtifactSetTableTableFilterComposer f)
    f,
  ) {
    final $$BookmarkArtifactSetTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.bookmarkArtifactSetTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$BookmarkArtifactSetTableTableFilterComposer(
                $db: $db,
                $table: $db.bookmarkArtifactSetTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> bookmarkArtifactPieceTableRefs(
    Expression<bool> Function($$BookmarkArtifactPieceTableTableFilterComposer f)
    f,
  ) {
    final $$BookmarkArtifactPieceTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.bookmarkArtifactPieceTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$BookmarkArtifactPieceTableTableFilterComposer(
                $db: $db,
                $table: $db.bookmarkArtifactPieceTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$BookmarkArtifactTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BookmarkArtifactTableTable> {
  $$BookmarkArtifactTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get characterId => $composableBuilder(
    column: $table.characterId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subStats => $composableBuilder(
    column: $table.subStats,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BookmarkArtifactTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BookmarkArtifactTableTable> {
  $$BookmarkArtifactTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get characterId => $composableBuilder(
    column: $table.characterId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<StatId>, String> get subStats =>
      $composableBuilder(column: $table.subStats, builder: (column) => column);

  GeneratedColumn<String> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  Expression<T> bookmarkArtifactSetTableRefs<T extends Object>(
    Expression<T> Function($$BookmarkArtifactSetTableTableAnnotationComposer a)
    f,
  ) {
    final $$BookmarkArtifactSetTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.bookmarkArtifactSetTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$BookmarkArtifactSetTableTableAnnotationComposer(
                $db: $db,
                $table: $db.bookmarkArtifactSetTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> bookmarkArtifactPieceTableRefs<T extends Object>(
    Expression<T> Function(
      $$BookmarkArtifactPieceTableTableAnnotationComposer a,
    )
    f,
  ) {
    final $$BookmarkArtifactPieceTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.bookmarkArtifactPieceTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$BookmarkArtifactPieceTableTableAnnotationComposer(
                $db: $db,
                $table: $db.bookmarkArtifactPieceTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$BookmarkArtifactTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BookmarkArtifactTableTable,
          BookmarkArtifact,
          $$BookmarkArtifactTableTableFilterComposer,
          $$BookmarkArtifactTableTableOrderingComposer,
          $$BookmarkArtifactTableTableAnnotationComposer,
          $$BookmarkArtifactTableTableCreateCompanionBuilder,
          $$BookmarkArtifactTableTableUpdateCompanionBuilder,
          (BookmarkArtifact, $$BookmarkArtifactTableTableReferences),
          BookmarkArtifact,
          PrefetchHooks Function({
            bool bookmarkArtifactSetTableRefs,
            bool bookmarkArtifactPieceTableRefs,
          })
        > {
  $$BookmarkArtifactTableTableTableManager(
    _$AppDatabase db,
    $BookmarkArtifactTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookmarkArtifactTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$BookmarkArtifactTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$BookmarkArtifactTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> characterId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<List<StatId>> subStats = const Value.absent(),
                Value<String> orderIndex = const Value.absent(),
              }) => BookmarkArtifactCompanion(
                id: id,
                characterId: characterId,
                createdAt: createdAt,
                subStats: subStats,
                orderIndex: orderIndex,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String characterId,
                Value<DateTime> createdAt = const Value.absent(),
                required List<StatId> subStats,
                required String orderIndex,
              }) => BookmarkArtifactCompanion.insert(
                id: id,
                characterId: characterId,
                createdAt: createdAt,
                subStats: subStats,
                orderIndex: orderIndex,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BookmarkArtifactTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                bookmarkArtifactSetTableRefs = false,
                bookmarkArtifactPieceTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (bookmarkArtifactSetTableRefs)
                      db.bookmarkArtifactSetTable,
                    if (bookmarkArtifactPieceTableRefs)
                      db.bookmarkArtifactPieceTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (bookmarkArtifactSetTableRefs)
                        await $_getPrefetchedData<
                          BookmarkArtifact,
                          $BookmarkArtifactTableTable,
                          BookmarkArtifactSet
                        >(
                          currentTable: table,
                          referencedTable:
                              $$BookmarkArtifactTableTableReferences
                                  ._bookmarkArtifactSetTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BookmarkArtifactTableTableReferences(
                                db,
                                table,
                                p0,
                              ).bookmarkArtifactSetTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) =>
                                  referencedItems.where((e) => e.id == item.id),
                          typedResults: items,
                        ),
                      if (bookmarkArtifactPieceTableRefs)
                        await $_getPrefetchedData<
                          BookmarkArtifact,
                          $BookmarkArtifactTableTable,
                          BookmarkArtifactPiece
                        >(
                          currentTable: table,
                          referencedTable:
                              $$BookmarkArtifactTableTableReferences
                                  ._bookmarkArtifactPieceTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BookmarkArtifactTableTableReferences(
                                db,
                                table,
                                p0,
                              ).bookmarkArtifactPieceTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) =>
                                  referencedItems.where((e) => e.id == item.id),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$BookmarkArtifactTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BookmarkArtifactTableTable,
      BookmarkArtifact,
      $$BookmarkArtifactTableTableFilterComposer,
      $$BookmarkArtifactTableTableOrderingComposer,
      $$BookmarkArtifactTableTableAnnotationComposer,
      $$BookmarkArtifactTableTableCreateCompanionBuilder,
      $$BookmarkArtifactTableTableUpdateCompanionBuilder,
      (BookmarkArtifact, $$BookmarkArtifactTableTableReferences),
      BookmarkArtifact,
      PrefetchHooks Function({
        bool bookmarkArtifactSetTableRefs,
        bool bookmarkArtifactPieceTableRefs,
      })
    >;
typedef $$BookmarkArtifactSetTableTableCreateCompanionBuilder =
    BookmarkArtifactSetCompanion Function({
      Value<int> id,
      required List<ArtifactSetId> sets,
      required Map<String, StatId?> mainStats,
    });
typedef $$BookmarkArtifactSetTableTableUpdateCompanionBuilder =
    BookmarkArtifactSetCompanion Function({
      Value<int> id,
      Value<List<ArtifactSetId>> sets,
      Value<Map<String, StatId?>> mainStats,
    });

final class $$BookmarkArtifactSetTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $BookmarkArtifactSetTableTable,
          BookmarkArtifactSet
        > {
  $$BookmarkArtifactSetTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BookmarkArtifactTableTable _idTable(_$AppDatabase db) =>
      db.bookmarkArtifactTable.createAlias(
        $_aliasNameGenerator(
          db.bookmarkArtifactSetTable.id,
          db.bookmarkArtifactTable.id,
        ),
      );

  $$BookmarkArtifactTableTableProcessedTableManager get id {
    final $_column = $_itemColumn<int>('id')!;

    final manager = $$BookmarkArtifactTableTableTableManager(
      $_db,
      $_db.bookmarkArtifactTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BookmarkArtifactSetTableTableFilterComposer
    extends Composer<_$AppDatabase, $BookmarkArtifactSetTableTable> {
  $$BookmarkArtifactSetTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnWithTypeConverterFilters<
    List<ArtifactSetId>,
    List<ArtifactSetId>,
    String
  >
  get sets => $composableBuilder(
    column: $table.sets,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, StatId?>,
    Map<String, StatId>,
    String
  >
  get mainStats => $composableBuilder(
    column: $table.mainStats,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $$BookmarkArtifactTableTableFilterComposer get id {
    final $$BookmarkArtifactTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.bookmarkArtifactTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$BookmarkArtifactTableTableFilterComposer(
                $db: $db,
                $table: $db.bookmarkArtifactTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$BookmarkArtifactSetTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BookmarkArtifactSetTableTable> {
  $$BookmarkArtifactSetTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get sets => $composableBuilder(
    column: $table.sets,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mainStats => $composableBuilder(
    column: $table.mainStats,
    builder: (column) => ColumnOrderings(column),
  );

  $$BookmarkArtifactTableTableOrderingComposer get id {
    final $$BookmarkArtifactTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.bookmarkArtifactTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$BookmarkArtifactTableTableOrderingComposer(
                $db: $db,
                $table: $db.bookmarkArtifactTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$BookmarkArtifactSetTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BookmarkArtifactSetTableTable> {
  $$BookmarkArtifactSetTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<List<ArtifactSetId>, String> get sets =>
      $composableBuilder(column: $table.sets, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, StatId?>, String>
  get mainStats =>
      $composableBuilder(column: $table.mainStats, builder: (column) => column);

  $$BookmarkArtifactTableTableAnnotationComposer get id {
    final $$BookmarkArtifactTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.bookmarkArtifactTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$BookmarkArtifactTableTableAnnotationComposer(
                $db: $db,
                $table: $db.bookmarkArtifactTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$BookmarkArtifactSetTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BookmarkArtifactSetTableTable,
          BookmarkArtifactSet,
          $$BookmarkArtifactSetTableTableFilterComposer,
          $$BookmarkArtifactSetTableTableOrderingComposer,
          $$BookmarkArtifactSetTableTableAnnotationComposer,
          $$BookmarkArtifactSetTableTableCreateCompanionBuilder,
          $$BookmarkArtifactSetTableTableUpdateCompanionBuilder,
          (BookmarkArtifactSet, $$BookmarkArtifactSetTableTableReferences),
          BookmarkArtifactSet,
          PrefetchHooks Function({bool id})
        > {
  $$BookmarkArtifactSetTableTableTableManager(
    _$AppDatabase db,
    $BookmarkArtifactSetTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookmarkArtifactSetTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$BookmarkArtifactSetTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$BookmarkArtifactSetTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<List<ArtifactSetId>> sets = const Value.absent(),
                Value<Map<String, StatId?>> mainStats = const Value.absent(),
              }) => BookmarkArtifactSetCompanion(
                id: id,
                sets: sets,
                mainStats: mainStats,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required List<ArtifactSetId> sets,
                required Map<String, StatId?> mainStats,
              }) => BookmarkArtifactSetCompanion.insert(
                id: id,
                sets: sets,
                mainStats: mainStats,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BookmarkArtifactSetTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (id) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.id,
                                referencedTable:
                                    $$BookmarkArtifactSetTableTableReferences
                                        ._idTable(db),
                                referencedColumn:
                                    $$BookmarkArtifactSetTableTableReferences
                                        ._idTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BookmarkArtifactSetTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BookmarkArtifactSetTableTable,
      BookmarkArtifactSet,
      $$BookmarkArtifactSetTableTableFilterComposer,
      $$BookmarkArtifactSetTableTableOrderingComposer,
      $$BookmarkArtifactSetTableTableAnnotationComposer,
      $$BookmarkArtifactSetTableTableCreateCompanionBuilder,
      $$BookmarkArtifactSetTableTableUpdateCompanionBuilder,
      (BookmarkArtifactSet, $$BookmarkArtifactSetTableTableReferences),
      BookmarkArtifactSet,
      PrefetchHooks Function({bool id})
    >;
typedef $$BookmarkArtifactPieceTableTableCreateCompanionBuilder =
    BookmarkArtifactPieceCompanion Function({
      Value<int> id,
      required String piece,
      Value<String?> mainStat,
    });
typedef $$BookmarkArtifactPieceTableTableUpdateCompanionBuilder =
    BookmarkArtifactPieceCompanion Function({
      Value<int> id,
      Value<String> piece,
      Value<String?> mainStat,
    });

final class $$BookmarkArtifactPieceTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $BookmarkArtifactPieceTableTable,
          BookmarkArtifactPiece
        > {
  $$BookmarkArtifactPieceTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BookmarkArtifactTableTable _idTable(_$AppDatabase db) =>
      db.bookmarkArtifactTable.createAlias(
        $_aliasNameGenerator(
          db.bookmarkArtifactPieceTable.id,
          db.bookmarkArtifactTable.id,
        ),
      );

  $$BookmarkArtifactTableTableProcessedTableManager get id {
    final $_column = $_itemColumn<int>('id')!;

    final manager = $$BookmarkArtifactTableTableTableManager(
      $_db,
      $_db.bookmarkArtifactTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BookmarkArtifactPieceTableTableFilterComposer
    extends Composer<_$AppDatabase, $BookmarkArtifactPieceTableTable> {
  $$BookmarkArtifactPieceTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get piece => $composableBuilder(
    column: $table.piece,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mainStat => $composableBuilder(
    column: $table.mainStat,
    builder: (column) => ColumnFilters(column),
  );

  $$BookmarkArtifactTableTableFilterComposer get id {
    final $$BookmarkArtifactTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.bookmarkArtifactTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$BookmarkArtifactTableTableFilterComposer(
                $db: $db,
                $table: $db.bookmarkArtifactTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$BookmarkArtifactPieceTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BookmarkArtifactPieceTableTable> {
  $$BookmarkArtifactPieceTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get piece => $composableBuilder(
    column: $table.piece,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mainStat => $composableBuilder(
    column: $table.mainStat,
    builder: (column) => ColumnOrderings(column),
  );

  $$BookmarkArtifactTableTableOrderingComposer get id {
    final $$BookmarkArtifactTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.bookmarkArtifactTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$BookmarkArtifactTableTableOrderingComposer(
                $db: $db,
                $table: $db.bookmarkArtifactTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$BookmarkArtifactPieceTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BookmarkArtifactPieceTableTable> {
  $$BookmarkArtifactPieceTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get piece =>
      $composableBuilder(column: $table.piece, builder: (column) => column);

  GeneratedColumn<String> get mainStat =>
      $composableBuilder(column: $table.mainStat, builder: (column) => column);

  $$BookmarkArtifactTableTableAnnotationComposer get id {
    final $$BookmarkArtifactTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.bookmarkArtifactTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$BookmarkArtifactTableTableAnnotationComposer(
                $db: $db,
                $table: $db.bookmarkArtifactTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$BookmarkArtifactPieceTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BookmarkArtifactPieceTableTable,
          BookmarkArtifactPiece,
          $$BookmarkArtifactPieceTableTableFilterComposer,
          $$BookmarkArtifactPieceTableTableOrderingComposer,
          $$BookmarkArtifactPieceTableTableAnnotationComposer,
          $$BookmarkArtifactPieceTableTableCreateCompanionBuilder,
          $$BookmarkArtifactPieceTableTableUpdateCompanionBuilder,
          (BookmarkArtifactPiece, $$BookmarkArtifactPieceTableTableReferences),
          BookmarkArtifactPiece,
          PrefetchHooks Function({bool id})
        > {
  $$BookmarkArtifactPieceTableTableTableManager(
    _$AppDatabase db,
    $BookmarkArtifactPieceTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookmarkArtifactPieceTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$BookmarkArtifactPieceTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$BookmarkArtifactPieceTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> piece = const Value.absent(),
                Value<String?> mainStat = const Value.absent(),
              }) => BookmarkArtifactPieceCompanion(
                id: id,
                piece: piece,
                mainStat: mainStat,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String piece,
                Value<String?> mainStat = const Value.absent(),
              }) => BookmarkArtifactPieceCompanion.insert(
                id: id,
                piece: piece,
                mainStat: mainStat,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BookmarkArtifactPieceTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (id) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.id,
                                referencedTable:
                                    $$BookmarkArtifactPieceTableTableReferences
                                        ._idTable(db),
                                referencedColumn:
                                    $$BookmarkArtifactPieceTableTableReferences
                                        ._idTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BookmarkArtifactPieceTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BookmarkArtifactPieceTableTable,
      BookmarkArtifactPiece,
      $$BookmarkArtifactPieceTableTableFilterComposer,
      $$BookmarkArtifactPieceTableTableOrderingComposer,
      $$BookmarkArtifactPieceTableTableAnnotationComposer,
      $$BookmarkArtifactPieceTableTableCreateCompanionBuilder,
      $$BookmarkArtifactPieceTableTableUpdateCompanionBuilder,
      (BookmarkArtifactPiece, $$BookmarkArtifactPieceTableTableReferences),
      BookmarkArtifactPiece,
      PrefetchHooks Function({bool id})
    >;
typedef $$InGameCharacterStateTableTableCreateCompanionBuilder =
    InGameCharacterStateCompanion Function({
      required String uid,
      required String characterId,
      required Map<Purpose, int> purposes,
      Value<String?> equippedWeaponId,
      Value<DateTime> lastUpdated,
      Value<int> rowid,
    });
typedef $$InGameCharacterStateTableTableUpdateCompanionBuilder =
    InGameCharacterStateCompanion Function({
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
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get characterId => $composableBuilder(
    column: $table.characterId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Map<Purpose, int>, Map<Purpose, int>, String>
  get purposes => $composableBuilder(
    column: $table.purposes,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get equippedWeaponId => $composableBuilder(
    column: $table.equippedWeaponId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnFilters(column),
  );
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
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get characterId => $composableBuilder(
    column: $table.characterId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purposes => $composableBuilder(
    column: $table.purposes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get equippedWeaponId => $composableBuilder(
    column: $table.equippedWeaponId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnOrderings(column),
  );
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
    column: $table.characterId,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Map<Purpose, int>, String> get purposes =>
      $composableBuilder(column: $table.purposes, builder: (column) => column);

  GeneratedColumn<String> get equippedWeaponId => $composableBuilder(
    column: $table.equippedWeaponId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => column,
  );
}

class $$InGameCharacterStateTableTableTableManager
    extends
        RootTableManager<
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
            BaseReferences<
              _$AppDatabase,
              $InGameCharacterStateTableTable,
              InGameCharacterState
            >,
          ),
          InGameCharacterState,
          PrefetchHooks Function()
        > {
  $$InGameCharacterStateTableTableTableManager(
    _$AppDatabase db,
    $InGameCharacterStateTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InGameCharacterStateTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$InGameCharacterStateTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$InGameCharacterStateTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> uid = const Value.absent(),
                Value<String> characterId = const Value.absent(),
                Value<Map<Purpose, int>> purposes = const Value.absent(),
                Value<String?> equippedWeaponId = const Value.absent(),
                Value<DateTime> lastUpdated = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InGameCharacterStateCompanion(
                uid: uid,
                characterId: characterId,
                purposes: purposes,
                equippedWeaponId: equippedWeaponId,
                lastUpdated: lastUpdated,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uid,
                required String characterId,
                required Map<Purpose, int> purposes,
                Value<String?> equippedWeaponId = const Value.absent(),
                Value<DateTime> lastUpdated = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InGameCharacterStateCompanion.insert(
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
        ),
      );
}

typedef $$InGameCharacterStateTableTableProcessedTableManager =
    ProcessedTableManager<
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
        BaseReferences<
          _$AppDatabase,
          $InGameCharacterStateTableTable,
          InGameCharacterState
        >,
      ),
      InGameCharacterState,
      PrefetchHooks Function()
    >;
typedef $$InGameWeaponStateTableTableCreateCompanionBuilder =
    InGameWeaponStateCompanion Function({
      required String uid,
      required String characterId,
      required String weaponId,
      required Map<Purpose, int> purposes,
      Value<DateTime> lastUpdated,
      Value<int> rowid,
    });
typedef $$InGameWeaponStateTableTableUpdateCompanionBuilder =
    InGameWeaponStateCompanion Function({
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
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get characterId => $composableBuilder(
    column: $table.characterId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weaponId => $composableBuilder(
    column: $table.weaponId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Map<Purpose, int>, Map<Purpose, int>, String>
  get purposes => $composableBuilder(
    column: $table.purposes,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnFilters(column),
  );
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
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get characterId => $composableBuilder(
    column: $table.characterId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weaponId => $composableBuilder(
    column: $table.weaponId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purposes => $composableBuilder(
    column: $table.purposes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnOrderings(column),
  );
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
    column: $table.characterId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get weaponId =>
      $composableBuilder(column: $table.weaponId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<Purpose, int>, String> get purposes =>
      $composableBuilder(column: $table.purposes, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => column,
  );
}

class $$InGameWeaponStateTableTableTableManager
    extends
        RootTableManager<
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
            BaseReferences<
              _$AppDatabase,
              $InGameWeaponStateTableTable,
              InGameWeaponState
            >,
          ),
          InGameWeaponState,
          PrefetchHooks Function()
        > {
  $$InGameWeaponStateTableTableTableManager(
    _$AppDatabase db,
    $InGameWeaponStateTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InGameWeaponStateTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$InGameWeaponStateTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$InGameWeaponStateTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> uid = const Value.absent(),
                Value<String> characterId = const Value.absent(),
                Value<String> weaponId = const Value.absent(),
                Value<Map<Purpose, int>> purposes = const Value.absent(),
                Value<DateTime> lastUpdated = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InGameWeaponStateCompanion(
                uid: uid,
                characterId: characterId,
                weaponId: weaponId,
                purposes: purposes,
                lastUpdated: lastUpdated,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uid,
                required String characterId,
                required String weaponId,
                required Map<Purpose, int> purposes,
                Value<DateTime> lastUpdated = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InGameWeaponStateCompanion.insert(
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
        ),
      );
}

typedef $$InGameWeaponStateTableTableProcessedTableManager =
    ProcessedTableManager<
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
        BaseReferences<
          _$AppDatabase,
          $InGameWeaponStateTableTable,
          InGameWeaponState
        >,
      ),
      InGameWeaponState,
      PrefetchHooks Function()
    >;
typedef $$MaterialBagCountTableTableCreateCompanionBuilder =
    MaterialBagCountCompanion Function({
      required String uid,
      required int hyvId,
      required int count,
      Value<DateTime> lastUpdated,
      Value<int> rowid,
    });
typedef $$MaterialBagCountTableTableUpdateCompanionBuilder =
    MaterialBagCountCompanion Function({
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
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hyvId => $composableBuilder(
    column: $table.hyvId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnFilters(column),
  );
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
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hyvId => $composableBuilder(
    column: $table.hyvId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnOrderings(column),
  );
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
    column: $table.lastUpdated,
    builder: (column) => column,
  );
}

class $$MaterialBagCountTableTableTableManager
    extends
        RootTableManager<
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
            BaseReferences<
              _$AppDatabase,
              $MaterialBagCountTableTable,
              MaterialBagCount
            >,
          ),
          MaterialBagCount,
          PrefetchHooks Function()
        > {
  $$MaterialBagCountTableTableTableManager(
    _$AppDatabase db,
    $MaterialBagCountTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MaterialBagCountTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$MaterialBagCountTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$MaterialBagCountTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> uid = const Value.absent(),
                Value<int> hyvId = const Value.absent(),
                Value<int> count = const Value.absent(),
                Value<DateTime> lastUpdated = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MaterialBagCountCompanion(
                uid: uid,
                hyvId: hyvId,
                count: count,
                lastUpdated: lastUpdated,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uid,
                required int hyvId,
                required int count,
                Value<DateTime> lastUpdated = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MaterialBagCountCompanion.insert(
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
        ),
      );
}

typedef $$MaterialBagCountTableTableProcessedTableManager =
    ProcessedTableManager<
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
        BaseReferences<
          _$AppDatabase,
          $MaterialBagCountTableTable,
          MaterialBagCount
        >,
      ),
      MaterialBagCount,
      PrefetchHooks Function()
    >;
typedef $$FurnishingCraftCountTableTableCreateCompanionBuilder =
    FurnishingCraftCountCompanion Function({
      required String furnishingId,
      required String setId,
      required int count,
      Value<int> rowid,
    });
typedef $$FurnishingCraftCountTableTableUpdateCompanionBuilder =
    FurnishingCraftCountCompanion Function({
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
    column: $table.furnishingId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get setId => $composableBuilder(
    column: $table.setId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );
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
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get setId => $composableBuilder(
    column: $table.setId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );
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
    column: $table.furnishingId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get setId =>
      $composableBuilder(column: $table.setId, builder: (column) => column);

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);
}

class $$FurnishingCraftCountTableTableTableManager
    extends
        RootTableManager<
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
            BaseReferences<
              _$AppDatabase,
              $FurnishingCraftCountTableTable,
              FurnishingCraftCount
            >,
          ),
          FurnishingCraftCount,
          PrefetchHooks Function()
        > {
  $$FurnishingCraftCountTableTableTableManager(
    _$AppDatabase db,
    $FurnishingCraftCountTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FurnishingCraftCountTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$FurnishingCraftCountTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FurnishingCraftCountTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> furnishingId = const Value.absent(),
                Value<String> setId = const Value.absent(),
                Value<int> count = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FurnishingCraftCountCompanion(
                furnishingId: furnishingId,
                setId: setId,
                count: count,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String furnishingId,
                required String setId,
                required int count,
                Value<int> rowid = const Value.absent(),
              }) => FurnishingCraftCountCompanion.insert(
                furnishingId: furnishingId,
                setId: setId,
                count: count,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FurnishingCraftCountTableTableProcessedTableManager =
    ProcessedTableManager<
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
        BaseReferences<
          _$AppDatabase,
          $FurnishingCraftCountTableTable,
          FurnishingCraftCount
        >,
      ),
      FurnishingCraftCount,
      PrefetchHooks Function()
    >;
typedef $$FurnishingSetBookmarkTableTableCreateCompanionBuilder =
    FurnishingSetBookmarkCompanion Function({
      required String setId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$FurnishingSetBookmarkTableTableUpdateCompanionBuilder =
    FurnishingSetBookmarkCompanion Function({
      Value<String> setId,
      Value<DateTime> createdAt,
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
    column: $table.setId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
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
    column: $table.setId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
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

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FurnishingSetBookmarkTableTableTableManager
    extends
        RootTableManager<
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
            BaseReferences<
              _$AppDatabase,
              $FurnishingSetBookmarkTableTable,
              FurnishingSetBookmark
            >,
          ),
          FurnishingSetBookmark,
          PrefetchHooks Function()
        > {
  $$FurnishingSetBookmarkTableTableTableManager(
    _$AppDatabase db,
    $FurnishingSetBookmarkTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FurnishingSetBookmarkTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$FurnishingSetBookmarkTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FurnishingSetBookmarkTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> setId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FurnishingSetBookmarkCompanion(
                setId: setId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String setId,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FurnishingSetBookmarkCompanion.insert(
                setId: setId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FurnishingSetBookmarkTableTableProcessedTableManager =
    ProcessedTableManager<
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
        BaseReferences<
          _$AppDatabase,
          $FurnishingSetBookmarkTableTable,
          FurnishingSetBookmark
        >,
      ),
      FurnishingSetBookmark,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BookmarkMaterialGroupTableTableTableManager
  get bookmarkMaterialGroupTable =>
      $$BookmarkMaterialGroupTableTableTableManager(
        _db,
        _db.bookmarkMaterialGroupTable,
      );
  $$BookmarkMaterialItemTableTableTableManager get bookmarkMaterialItemTable =>
      $$BookmarkMaterialItemTableTableTableManager(
        _db,
        _db.bookmarkMaterialItemTable,
      );
  $$BookmarkArtifactTableTableTableManager get bookmarkArtifactTable =>
      $$BookmarkArtifactTableTableTableManager(_db, _db.bookmarkArtifactTable);
  $$BookmarkArtifactSetTableTableTableManager get bookmarkArtifactSetTable =>
      $$BookmarkArtifactSetTableTableTableManager(
        _db,
        _db.bookmarkArtifactSetTable,
      );
  $$BookmarkArtifactPieceTableTableTableManager
  get bookmarkArtifactPieceTable =>
      $$BookmarkArtifactPieceTableTableTableManager(
        _db,
        _db.bookmarkArtifactPieceTable,
      );
  $$InGameCharacterStateTableTableTableManager get inGameCharacterStateTable =>
      $$InGameCharacterStateTableTableTableManager(
        _db,
        _db.inGameCharacterStateTable,
      );
  $$InGameWeaponStateTableTableTableManager get inGameWeaponStateTable =>
      $$InGameWeaponStateTableTableTableManager(
        _db,
        _db.inGameWeaponStateTable,
      );
  $$MaterialBagCountTableTableTableManager get materialBagCountTable =>
      $$MaterialBagCountTableTableTableManager(_db, _db.materialBagCountTable);
  $$FurnishingCraftCountTableTableTableManager get furnishingCraftCountTable =>
      $$FurnishingCraftCountTableTableTableManager(
        _db,
        _db.furnishingCraftCountTable,
      );
  $$FurnishingSetBookmarkTableTableTableManager
  get furnishingSetBookmarkTable =>
      $$FurnishingSetBookmarkTableTableTableManager(
        _db,
        _db.furnishingSetBookmarkTable,
      );
}
