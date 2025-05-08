import 'package:cat_tinder_hsse/data/datasources/cat_remote_data_source.dart';
import 'package:cat_tinder_hsse/data/local/cat_local_data_source.dart';
import 'package:cat_tinder_hsse/data/local/favorites_local_data_source.dart';
import 'package:cat_tinder_hsse/domain/entities/cat.dart';
import 'package:cat_tinder_hsse/domain/repositories/cat_repository.dart';
import 'package:cat_tinder_hsse/data/models/cat_dto.dart';

class CatRepositoryImpl implements CatRepository {
  CatRepositoryImpl(this._remote, this._local, this._favorites);

  final CatRemoteDataSource _remote;
  final CatLocalDataSource _local;
  final FavoritesLocalDataSource _favorites;

  @override
  Future<Cat> getRandomCat() async {
    final dto = await _remote.getRandomCat();
    await _local.cacheCat(dto);
    return dto.toEntity();
  }

  @override
  Future<void> addToFavorites(Cat cat) => _favorites.insert(cat.toDto());

  @override
  Future<void> removeFromFavorites(String id) => _favorites.delete(id);

  @override
  Future<List<Cat>> getFavorites() async =>
      (await _favorites.getAll()).map((e) => e.toEntity()).toList();
}
