import 'dart:math';
import 'package:cat_tinder_hsse/data/local/app_database.dart';
import 'package:cat_tinder_hsse/data/models/cat_dto.dart';
import 'cat_local_data_source.dart';

class CatLocalDataSourceImpl implements CatLocalDataSource {
  CatLocalDataSourceImpl(this._db);
  final AppDatabase _db;
  final _rng = Random();

  @override
  Future<void> cacheCat(CatDto dto) =>
      _db.into(_db.cats).insertOnConflictUpdate(dto.toCompanion());

  @override
  Future<CatDto?> getRandomCachedCat() async {
    final rows = await _db.select(_db.cats).get();
    if (rows.isEmpty) return null;
    return CatDto.fromDrift(rows[_rng.nextInt(rows.length)]);
  }
}
