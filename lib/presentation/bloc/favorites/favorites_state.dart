part of 'favorites_bloc.dart';

sealed class FavoritesState {
  const FavoritesState();
}

class FavoritesInitial extends FavoritesState {}

class FavoritesUpdated extends FavoritesState {
  final List<LikedCat> cats;
  final List<String> breeds;
  final String? currentFilter;

  const FavoritesUpdated({
    required this.cats,
    required this.breeds,
    this.currentFilter,
  });
}
