import 'package:cat_tinder_hsse/data/models/cat_dto.dart';

abstract interface class CatLocalDataSource {
  Future<void> cacheCat(CatDto dto);
  Future<CatDto?> getRandomCachedCat();
}
