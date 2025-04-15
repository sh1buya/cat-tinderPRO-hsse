import 'package:flutter/foundation.dart';
import 'package:cat_tinder_hsse/models/cat_model.dart';

class CatsProvider extends ChangeNotifier {
  int _likesCount = 0;
  int get likesCount => _likesCount;

  void incrementLikes() {
    _likesCount++;
    notifyListeners();
  }
  void decrementLikes() {
    _likesCount = (_likesCount - 1).clamp(0, double.maxFinite.toInt());
    notifyListeners();
  }

  List<Cat> _likedCats = [];
  String? _filterBreed;

  List<Cat> get allLikedCats => _likedCats;

  List<Cat> get filteredLikedCats {
    if (_filterBreed == null) return _likedCats;
    return _likedCats.where((cat) => cat.breedName == _filterBreed).toList();
  }

  List<Cat> get likedCats {
    if (_filterBreed == null) return _likedCats;
    return _likedCats.where((cat) => cat.breedName == _filterBreed).toList();
  }

  List<String> get breeds => _likedCats
      .map((cat) => cat.breedName)
      .where((breed) => breed.isNotEmpty)
      .toSet()
      .toList();

  String? get filterBreed => _filterBreed;

  void addLikedCat(Cat cat) {
    _likedCats.add(cat);
    notifyListeners();
  }

  void removeLikedCat(String id) {
    _likedCats.removeWhere((cat) => cat.id == id);

    decrementLikes();

    if (_filterBreed != null && !_likedCats.any((cat) => cat.breedName == _filterBreed)) {
      _filterBreed = null;
    }

    notifyListeners();
  }

  void setFilter(String? breed) {
    _filterBreed = breed;
    notifyListeners();
  }
}