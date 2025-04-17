import 'package:cat_tinder_hsse/data/models/cat_dto.dart';

abstract class CatRemoteDataSource {
  Future<CatDto> getRandomCat();
}
