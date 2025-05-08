import 'package:cat_tinder_hsse/data/models/cat_dto.dart';

abstract interface class FavoritesLocalDataSource {
  Future<List<CatDto>> getAll();
  Future<void> insert(CatDto dto);
  Future<void> delete(String id);
}
