import 'package:cat_tinder_hsse/data/local/app_database.dart';
import 'package:cat_tinder_hsse/data/local/cat_local_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:cat_tinder_hsse/data/local/cat_local_data_source_impl.dart';
import 'package:cat_tinder_hsse/data/local/favorites_local_data_source.dart';
import 'package:cat_tinder_hsse/data/local/favorites_local_data_source_impl.dart';
import 'package:cat_tinder_hsse/data/datasources/cat_remote_data_source.dart';
import 'package:cat_tinder_hsse/data/datasources/cat_api.dart';
import 'package:cat_tinder_hsse/data/repositories/cat_repository_impl.dart';
import 'package:cat_tinder_hsse/domain/repositories/cat_repository.dart';
import 'package:cat_tinder_hsse/presentation/bloc/cat/cat_bloc.dart';
import 'package:cat_tinder_hsse/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:cat_tinder_hsse/presentation/bloc/connectivity/connectivity_cubit.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
  getIt.registerLazySingleton<CatRemoteDataSource>(() => CatApi());
  getIt.registerLazySingleton<CatLocalDataSource>(
    () => CatLocalDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<FavoritesLocalDataSource>(
    () => FavoritesLocalDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<CatRepository>(
    () => CatRepositoryImpl(
      getIt<CatRemoteDataSource>(),
      getIt<CatLocalDataSource>(),
      getIt<FavoritesLocalDataSource>(),
    ),
  );
  getIt.registerFactory(() => CatBloc(getIt<CatRepository>()));
  getIt.registerFactory(() => FavoritesBloc(getIt<FavoritesLocalDataSource>()));
  getIt.registerFactory(() => ConnectivityCubit());
}
