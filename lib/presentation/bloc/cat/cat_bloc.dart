import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_tinder_hsse/domain/entities/cat.dart';
import 'package:cat_tinder_hsse/domain/repositories/cat_repository.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatRepository repository;
  late final StreamSubscription _connSub;

  CatBloc(this.repository) : super(CatInitial()) {
    on<LoadRandomCatEvent>(_onLoad);

    _connSub = Connectivity().onConnectivityChanged.listen((event) {
      final connected = _isConnected(event);
      if (connected && state is CatError) add(LoadRandomCatEvent());
    });
  }

  bool _isConnected(dynamic ev) {
    if (ev is ConnectivityResult) return ev != ConnectivityResult.none;
    if (ev is List<ConnectivityResult>) {
      return ev.any((e) => e != ConnectivityResult.none);
    }
    return false;
  }

  Future<void> _onLoad(LoadRandomCatEvent event, Emitter<CatState> emit) async {
    try {
      emit(CatLoading());
      final cat = await repository.getRandomCat();
      emit(CatLoaded(cat));
    } catch (e) {
      emit(CatError('Нет соединения с интернетом'));
    }
  }

  @override
  Future<void> close() {
    _connSub.cancel();
    return super.close();
  }
}
