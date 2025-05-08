part of 'favorites_bloc.dart';

sealed class FavoritesEvent {
  const FavoritesEvent();
}

class InitFavorites extends FavoritesEvent {
  const InitFavorites();
}

class AddFavorite extends FavoritesEvent {
  const AddFavorite(this.cat);
  final Cat cat;
}

class RemoveFavorite extends FavoritesEvent {
  const RemoveFavorite(this.id);
  final String id;
}

class FilterFavorites extends FavoritesEvent {
  const FilterFavorites(this.breed);
  final String? breed;
}
