// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CatsTable extends Cats with TableInfo<$CatsTable, CatRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _breedNameMeta = const VerificationMeta(
    'breedName',
  );
  @override
  late final GeneratedColumn<String> breedName = GeneratedColumn<String>(
    'breed_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<String> origin = GeneratedColumn<String>(
    'origin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _temperamentMeta = const VerificationMeta(
    'temperament',
  );
  @override
  late final GeneratedColumn<String> temperament = GeneratedColumn<String>(
    'temperament',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    breedName,
    imageUrl,
    origin,
    temperament,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cats';
  @override
  VerificationContext validateIntegrity(
    Insertable<CatRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('breed_name')) {
      context.handle(
        _breedNameMeta,
        breedName.isAcceptableOrUnknown(data['breed_name']!, _breedNameMeta),
      );
    } else if (isInserting) {
      context.missing(_breedNameMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('origin')) {
      context.handle(
        _originMeta,
        origin.isAcceptableOrUnknown(data['origin']!, _originMeta),
      );
    }
    if (data.containsKey('temperament')) {
      context.handle(
        _temperamentMeta,
        temperament.isAcceptableOrUnknown(
          data['temperament']!,
          _temperamentMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CatRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CatRow(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      breedName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}breed_name'],
          )!,
      imageUrl:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}image_url'],
          )!,
      origin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}origin'],
      ),
      temperament: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}temperament'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $CatsTable createAlias(String alias) {
    return $CatsTable(attachedDatabase, alias);
  }
}

class CatRow extends DataClass implements Insertable<CatRow> {
  final String id;
  final String breedName;
  final String imageUrl;
  final String? origin;
  final String? temperament;
  final String? description;
  const CatRow({
    required this.id,
    required this.breedName,
    required this.imageUrl,
    this.origin,
    this.temperament,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['breed_name'] = Variable<String>(breedName);
    map['image_url'] = Variable<String>(imageUrl);
    if (!nullToAbsent || origin != null) {
      map['origin'] = Variable<String>(origin);
    }
    if (!nullToAbsent || temperament != null) {
      map['temperament'] = Variable<String>(temperament);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  CatsCompanion toCompanion(bool nullToAbsent) {
    return CatsCompanion(
      id: Value(id),
      breedName: Value(breedName),
      imageUrl: Value(imageUrl),
      origin:
          origin == null && nullToAbsent ? const Value.absent() : Value(origin),
      temperament:
          temperament == null && nullToAbsent
              ? const Value.absent()
              : Value(temperament),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
    );
  }

  factory CatRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CatRow(
      id: serializer.fromJson<String>(json['id']),
      breedName: serializer.fromJson<String>(json['breedName']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      origin: serializer.fromJson<String?>(json['origin']),
      temperament: serializer.fromJson<String?>(json['temperament']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'breedName': serializer.toJson<String>(breedName),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'origin': serializer.toJson<String?>(origin),
      'temperament': serializer.toJson<String?>(temperament),
      'description': serializer.toJson<String?>(description),
    };
  }

  CatRow copyWith({
    String? id,
    String? breedName,
    String? imageUrl,
    Value<String?> origin = const Value.absent(),
    Value<String?> temperament = const Value.absent(),
    Value<String?> description = const Value.absent(),
  }) => CatRow(
    id: id ?? this.id,
    breedName: breedName ?? this.breedName,
    imageUrl: imageUrl ?? this.imageUrl,
    origin: origin.present ? origin.value : this.origin,
    temperament: temperament.present ? temperament.value : this.temperament,
    description: description.present ? description.value : this.description,
  );
  CatRow copyWithCompanion(CatsCompanion data) {
    return CatRow(
      id: data.id.present ? data.id.value : this.id,
      breedName: data.breedName.present ? data.breedName.value : this.breedName,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      origin: data.origin.present ? data.origin.value : this.origin,
      temperament:
          data.temperament.present ? data.temperament.value : this.temperament,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CatRow(')
          ..write('id: $id, ')
          ..write('breedName: $breedName, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('origin: $origin, ')
          ..write('temperament: $temperament, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, breedName, imageUrl, origin, temperament, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CatRow &&
          other.id == this.id &&
          other.breedName == this.breedName &&
          other.imageUrl == this.imageUrl &&
          other.origin == this.origin &&
          other.temperament == this.temperament &&
          other.description == this.description);
}

class CatsCompanion extends UpdateCompanion<CatRow> {
  final Value<String> id;
  final Value<String> breedName;
  final Value<String> imageUrl;
  final Value<String?> origin;
  final Value<String?> temperament;
  final Value<String?> description;
  final Value<int> rowid;
  const CatsCompanion({
    this.id = const Value.absent(),
    this.breedName = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.origin = const Value.absent(),
    this.temperament = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CatsCompanion.insert({
    required String id,
    required String breedName,
    required String imageUrl,
    this.origin = const Value.absent(),
    this.temperament = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       breedName = Value(breedName),
       imageUrl = Value(imageUrl);
  static Insertable<CatRow> custom({
    Expression<String>? id,
    Expression<String>? breedName,
    Expression<String>? imageUrl,
    Expression<String>? origin,
    Expression<String>? temperament,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (breedName != null) 'breed_name': breedName,
      if (imageUrl != null) 'image_url': imageUrl,
      if (origin != null) 'origin': origin,
      if (temperament != null) 'temperament': temperament,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CatsCompanion copyWith({
    Value<String>? id,
    Value<String>? breedName,
    Value<String>? imageUrl,
    Value<String?>? origin,
    Value<String?>? temperament,
    Value<String?>? description,
    Value<int>? rowid,
  }) {
    return CatsCompanion(
      id: id ?? this.id,
      breedName: breedName ?? this.breedName,
      imageUrl: imageUrl ?? this.imageUrl,
      origin: origin ?? this.origin,
      temperament: temperament ?? this.temperament,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (breedName.present) {
      map['breed_name'] = Variable<String>(breedName.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (temperament.present) {
      map['temperament'] = Variable<String>(temperament.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CatsCompanion(')
          ..write('id: $id, ')
          ..write('breedName: $breedName, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('origin: $origin, ')
          ..write('temperament: $temperament, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LikedCatsTable extends LikedCats
    with TableInfo<$LikedCatsTable, LikedCatRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LikedCatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _likedDateMeta = const VerificationMeta(
    'likedDate',
  );
  @override
  late final GeneratedColumn<DateTime> likedDate = GeneratedColumn<DateTime>(
    'liked_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [id, likedDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'liked_cats';
  @override
  VerificationContext validateIntegrity(
    Insertable<LikedCatRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('liked_date')) {
      context.handle(
        _likedDateMeta,
        likedDate.isAcceptableOrUnknown(data['liked_date']!, _likedDateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LikedCatRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LikedCatRow(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      likedDate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}liked_date'],
          )!,
    );
  }

  @override
  $LikedCatsTable createAlias(String alias) {
    return $LikedCatsTable(attachedDatabase, alias);
  }
}

class LikedCatRow extends DataClass implements Insertable<LikedCatRow> {
  final String id;
  final DateTime likedDate;
  const LikedCatRow({required this.id, required this.likedDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['liked_date'] = Variable<DateTime>(likedDate);
    return map;
  }

  LikedCatsCompanion toCompanion(bool nullToAbsent) {
    return LikedCatsCompanion(id: Value(id), likedDate: Value(likedDate));
  }

  factory LikedCatRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LikedCatRow(
      id: serializer.fromJson<String>(json['id']),
      likedDate: serializer.fromJson<DateTime>(json['likedDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'likedDate': serializer.toJson<DateTime>(likedDate),
    };
  }

  LikedCatRow copyWith({String? id, DateTime? likedDate}) =>
      LikedCatRow(id: id ?? this.id, likedDate: likedDate ?? this.likedDate);
  LikedCatRow copyWithCompanion(LikedCatsCompanion data) {
    return LikedCatRow(
      id: data.id.present ? data.id.value : this.id,
      likedDate: data.likedDate.present ? data.likedDate.value : this.likedDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LikedCatRow(')
          ..write('id: $id, ')
          ..write('likedDate: $likedDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, likedDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LikedCatRow &&
          other.id == this.id &&
          other.likedDate == this.likedDate);
}

class LikedCatsCompanion extends UpdateCompanion<LikedCatRow> {
  final Value<String> id;
  final Value<DateTime> likedDate;
  final Value<int> rowid;
  const LikedCatsCompanion({
    this.id = const Value.absent(),
    this.likedDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LikedCatsCompanion.insert({
    required String id,
    this.likedDate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<LikedCatRow> custom({
    Expression<String>? id,
    Expression<DateTime>? likedDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (likedDate != null) 'liked_date': likedDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LikedCatsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? likedDate,
    Value<int>? rowid,
  }) {
    return LikedCatsCompanion(
      id: id ?? this.id,
      likedDate: likedDate ?? this.likedDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (likedDate.present) {
      map['liked_date'] = Variable<DateTime>(likedDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LikedCatsCompanion(')
          ..write('id: $id, ')
          ..write('likedDate: $likedDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CatsTable cats = $CatsTable(this);
  late final $LikedCatsTable likedCats = $LikedCatsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cats, likedCats];
}

typedef $$CatsTableCreateCompanionBuilder =
    CatsCompanion Function({
      required String id,
      required String breedName,
      required String imageUrl,
      Value<String?> origin,
      Value<String?> temperament,
      Value<String?> description,
      Value<int> rowid,
    });
typedef $$CatsTableUpdateCompanionBuilder =
    CatsCompanion Function({
      Value<String> id,
      Value<String> breedName,
      Value<String> imageUrl,
      Value<String?> origin,
      Value<String?> temperament,
      Value<String?> description,
      Value<int> rowid,
    });

class $$CatsTableFilterComposer extends Composer<_$AppDatabase, $CatsTable> {
  $$CatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breedName => $composableBuilder(
    column: $table.breedName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get temperament => $composableBuilder(
    column: $table.temperament,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CatsTableOrderingComposer extends Composer<_$AppDatabase, $CatsTable> {
  $$CatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breedName => $composableBuilder(
    column: $table.breedName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get temperament => $composableBuilder(
    column: $table.temperament,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CatsTable> {
  $$CatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get breedName =>
      $composableBuilder(column: $table.breedName, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => column);

  GeneratedColumn<String> get temperament => $composableBuilder(
    column: $table.temperament,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $$CatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CatsTable,
          CatRow,
          $$CatsTableFilterComposer,
          $$CatsTableOrderingComposer,
          $$CatsTableAnnotationComposer,
          $$CatsTableCreateCompanionBuilder,
          $$CatsTableUpdateCompanionBuilder,
          (CatRow, BaseReferences<_$AppDatabase, $CatsTable, CatRow>),
          CatRow,
          PrefetchHooks Function()
        > {
  $$CatsTableTableManager(_$AppDatabase db, $CatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> breedName = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
                Value<String?> origin = const Value.absent(),
                Value<String?> temperament = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CatsCompanion(
                id: id,
                breedName: breedName,
                imageUrl: imageUrl,
                origin: origin,
                temperament: temperament,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String breedName,
                required String imageUrl,
                Value<String?> origin = const Value.absent(),
                Value<String?> temperament = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CatsCompanion.insert(
                id: id,
                breedName: breedName,
                imageUrl: imageUrl,
                origin: origin,
                temperament: temperament,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CatsTable,
      CatRow,
      $$CatsTableFilterComposer,
      $$CatsTableOrderingComposer,
      $$CatsTableAnnotationComposer,
      $$CatsTableCreateCompanionBuilder,
      $$CatsTableUpdateCompanionBuilder,
      (CatRow, BaseReferences<_$AppDatabase, $CatsTable, CatRow>),
      CatRow,
      PrefetchHooks Function()
    >;
typedef $$LikedCatsTableCreateCompanionBuilder =
    LikedCatsCompanion Function({
      required String id,
      Value<DateTime> likedDate,
      Value<int> rowid,
    });
typedef $$LikedCatsTableUpdateCompanionBuilder =
    LikedCatsCompanion Function({
      Value<String> id,
      Value<DateTime> likedDate,
      Value<int> rowid,
    });

class $$LikedCatsTableFilterComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get likedDate => $composableBuilder(
    column: $table.likedDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LikedCatsTableOrderingComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get likedDate => $composableBuilder(
    column: $table.likedDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LikedCatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get likedDate =>
      $composableBuilder(column: $table.likedDate, builder: (column) => column);
}

class $$LikedCatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LikedCatsTable,
          LikedCatRow,
          $$LikedCatsTableFilterComposer,
          $$LikedCatsTableOrderingComposer,
          $$LikedCatsTableAnnotationComposer,
          $$LikedCatsTableCreateCompanionBuilder,
          $$LikedCatsTableUpdateCompanionBuilder,
          (
            LikedCatRow,
            BaseReferences<_$AppDatabase, $LikedCatsTable, LikedCatRow>,
          ),
          LikedCatRow,
          PrefetchHooks Function()
        > {
  $$LikedCatsTableTableManager(_$AppDatabase db, $LikedCatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$LikedCatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$LikedCatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$LikedCatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> likedDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LikedCatsCompanion(
                id: id,
                likedDate: likedDate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> likedDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LikedCatsCompanion.insert(
                id: id,
                likedDate: likedDate,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LikedCatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LikedCatsTable,
      LikedCatRow,
      $$LikedCatsTableFilterComposer,
      $$LikedCatsTableOrderingComposer,
      $$LikedCatsTableAnnotationComposer,
      $$LikedCatsTableCreateCompanionBuilder,
      $$LikedCatsTableUpdateCompanionBuilder,
      (
        LikedCatRow,
        BaseReferences<_$AppDatabase, $LikedCatsTable, LikedCatRow>,
      ),
      LikedCatRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CatsTableTableManager get cats => $$CatsTableTableManager(_db, _db.cats);
  $$LikedCatsTableTableManager get likedCats =>
      $$LikedCatsTableTableManager(_db, _db.likedCats);
}
