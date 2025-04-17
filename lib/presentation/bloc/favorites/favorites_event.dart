part of 'favorites_bloc.dart';

sealed class FavoritesEvent {
  const FavoritesEvent();
}

class AddFavorite extends FavoritesEvent {
  final Cat cat;
  const AddFavorite(this.cat);
}

class RemoveFavorite extends FavoritesEvent {
  final String id;
  const RemoveFavorite(this.id);
}

class FilterFavorites extends FavoritesEvent {
  final String? breed;
  const FilterFavorites(this.breed);
}
