import 'package:cat_tinder_hsse/presentation/models/liked_cat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_tinder_hsse/domain/entities/cat.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final List<LikedCat> _liked = [];
  String? _filter;

  FavoritesBloc() : super(FavoritesInitial()) {
    on<AddFavorite>(_add);
    on<RemoveFavorite>(_remove);
    on<FilterFavorites>(_filterBreed);
  }

  void _add(AddFavorite e, Emitter<FavoritesState> emit) {
    _liked.add(LikedCat(cat: e.cat, likedDate: DateTime.now()));
    emit(_updated());
  }

  void _remove(RemoveFavorite e, Emitter<FavoritesState> emit) {
    _liked.removeWhere((l) => l.cat.id == e.id);
    if (_filter != null && !_liked.any((l) => l.cat.breedName == _filter)) {
      _filter = null;
    }
    emit(_updated());
  }

  void _filterBreed(FilterFavorites e, Emitter<FavoritesState> emit) {
    _filter = e.breed;
    emit(_updated());
  }

  List<LikedCat> _apply() =>
      _filter == null
          ? _liked
          : _liked.where((l) => l.cat.breedName == _filter).toList();

  List<String> _breeds() =>
      _liked
          .map((l) => l.cat.breedName)
          .where((b) => b.isNotEmpty)
          .toSet()
          .toList();

  FavoritesUpdated _updated() => FavoritesUpdated(
    cats: _apply(),
    breeds: _breeds(),
    currentFilter: _filter,
  );
}
