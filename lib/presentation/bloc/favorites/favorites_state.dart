part of 'favorites_bloc.dart';

sealed class FavoritesState {
  const FavoritesState();
}

class FavoritesInitial extends FavoritesState {
  const FavoritesInitial();
}

class FavoritesUpdated extends FavoritesState {
  const FavoritesUpdated({
    required this.cats,
    required this.breeds,
    required this.currentFilter,
  });

  final List<Cat> cats;
  final List<String> breeds;
  final String? currentFilter;
}
