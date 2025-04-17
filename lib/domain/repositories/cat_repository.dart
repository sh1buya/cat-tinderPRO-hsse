import 'package:cat_tinder_hsse/domain/entities/cat.dart';

abstract class CatRepository {
  Future<Cat> getRandomCat();

  Future<void> addToFavorites(Cat cat);

  Future<void> removeFromFavorites(String id);

  Future<List<Cat>> getFavorites();
}
