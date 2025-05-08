import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_tinder_hsse/domain/entities/cat.dart';
import 'package:cat_tinder_hsse/data/models/cat_dto.dart';
import 'package:cat_tinder_hsse/data/local/favorites_local_data_source.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc(this._ds) : super(const FavoritesInitial()) {
    on<InitFavorites>(_onInit);
    on<AddFavorite>(_onAdd);
    on<RemoveFavorite>(_onRemove);
    on<FilterFavorites>(_onFilter);
    add(const InitFavorites());
  }

  final FavoritesLocalDataSource _ds;
  final _liked = <Cat>[];
  String? _filter;

  Future<void> _onInit(InitFavorites e, Emitter<FavoritesState> emit) async {
    final stored = await _ds.getAll();
    _liked
      ..clear()
      ..addAll(stored.map((e) => e.toEntity()));
    emit(_build());
  }

  Future<void> _onAdd(AddFavorite e, Emitter<FavoritesState> emit) async {
    _liked.add(e.cat);
    await _ds.insert(e.cat.toDto());
    emit(_build());
  }

  Future<void> _onRemove(RemoveFavorite e, Emitter<FavoritesState> emit) async {
    _liked.removeWhere((c) => c.id == e.id);
    await _ds.delete(e.id);
    emit(_build());
  }

  void _onFilter(FilterFavorites e, Emitter<FavoritesState> emit) {
    _filter = e.breed;
    emit(_build());
  }

  FavoritesUpdated _build() {
    final breeds = _liked.map((c) => c.breedName).toSet().toList();

    if (_filter != null && !breeds.contains(_filter)) _filter = null;

    final visible =
        _filter == null
            ? _liked
            : _liked.where((c) => c.breedName == _filter).toList();

    return FavoritesUpdated(
      cats: visible,
      breeds: breeds,
      currentFilter: _filter,
    );
  }
}
