import 'package:cat_tinder_hsse/domain/entities/cat.dart';

class LikedCat {
  final Cat cat;
  final DateTime likedDate;
  LikedCat({required this.cat, required this.likedDate});
}
