import 'package:drift/drift.dart';
import 'package:cat_tinder_hsse/data/local/app_database.dart';
import 'package:cat_tinder_hsse/data/models/cat_dto.dart';
import 'favorites_local_data_source.dart';

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  FavoritesLocalDataSourceImpl(this._db);
  final AppDatabase _db;

  @override
  Future<List<CatDto>> getAll() async {
    final q = _db.select(_db.cats).join([
      innerJoin(_db.likedCats, _db.likedCats.id.equalsExp(_db.cats.id)),
    ]);
    final rows = await q.get();
    return rows
        .map((row) => CatDto.fromDrift(row.readTable(_db.cats)))
        .toList();
  }

  @override
  Future<void> insert(CatDto dto) async {
    await _db.transaction(() async {
      await _db.into(_db.cats).insertOnConflictUpdate(dto.toCompanion());
      await _db
          .into(_db.likedCats)
          .insertOnConflictUpdate(LikedCatsCompanion.insert(id: dto.id));
    });
  }

  @override
  Future<void> delete(String id) =>
      _db.delete(_db.likedCats).delete(LikedCatsCompanion(id: Value(id)));
}
