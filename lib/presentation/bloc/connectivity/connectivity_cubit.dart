import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class ConnectivityState {}

class Connected extends ConnectivityState {}

class Disconnected extends ConnectivityState {}

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(Connected()) {
    _init();
  }

  late final StreamSubscription _sub;

  Future<void> _init() async {
    final rawFirst = await Connectivity().checkConnectivity();
    final ConnectivityResult first;
    first = rawFirst.first;
    emit(first == ConnectivityResult.none ? Disconnected() : Connected());

    _sub = Connectivity().onConnectivityChanged.listen((raw) {
      final ConnectivityResult result;
      result = raw.first;
      emit(result == ConnectivityResult.none ? Disconnected() : Connected());
    });
  }

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
