import 'package:cat_tinder_hsse/data/datasources/cat_api.dart';
import 'package:cat_tinder_hsse/data/datasources/cat_remote_data_source.dart';
import 'package:cat_tinder_hsse/data/repositories/cat_repository_impl.dart';
import 'package:cat_tinder_hsse/domain/repositories/cat_repository.dart';
import 'package:cat_tinder_hsse/presentation/bloc/cat/cat_bloc.dart';
import 'package:cat_tinder_hsse/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  _registerDataSources();
  _registerRepositories();
  _registerBlocs();
}

void _registerDataSources() {
  getIt.registerLazySingleton<CatRemoteDataSource>(() => CatApi());
}

void _registerRepositories() {
  getIt.registerLazySingleton<CatRepository>(
    () => CatRepositoryImpl(remoteDataSource: getIt()),
  );
}

void _registerBlocs() {
  getIt.registerFactory(() => CatBloc(getIt<CatRepository>()));

  getIt.registerLazySingleton(() => FavoritesBloc());
}
