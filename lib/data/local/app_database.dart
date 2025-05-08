import 'dart:io';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';

part 'app_database.g.dart';

@DataClassName('CatRow')
class Cats extends Table {
  TextColumn get id => text()();
  TextColumn get breedName => text()();
  TextColumn get imageUrl => text()();
  TextColumn get origin => text().nullable()();
  TextColumn get temperament => text().nullable()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('LikedCatRow')
class LikedCats extends Table {
  TextColumn get id => text()();
  DateTimeColumn get likedDate =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Cats, LikedCats])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_open());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _open() => LazyDatabase(() async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File(p.join(dir.path, 'cattinder.db'));
  return NativeDatabase(file);
});
