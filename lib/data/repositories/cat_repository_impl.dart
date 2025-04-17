import 'package:cat_tinder_hsse/data/datasources/cat_remote_data_source.dart';
import 'package:cat_tinder_hsse/domain/entities/cat.dart';
import 'package:cat_tinder_hsse/domain/repositories/cat_repository.dart';

class CatRepositoryImpl implements CatRepository {
  final CatRemoteDataSource remoteDataSource;

  CatRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Cat> getRandomCat() async {
    final dto = await remoteDataSource.getRandomCat();
    return dto.toEntity();
  }

  @override
  Future<void> addToFavorites(Cat cat) async {}

  @override
  Future<void> removeFromFavorites(String id) async {}

  @override
  Future<List<Cat>> getFavorites() async {
    return [];
  }
}
