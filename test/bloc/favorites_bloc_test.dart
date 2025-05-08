import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:cat_tinder_hsse/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:cat_tinder_hsse/data/local/favorites_local_data_source.dart';
import 'package:cat_tinder_hsse/domain/entities/cat.dart';
import 'package:cat_tinder_hsse/data/models/cat_dto.dart';

class _MockDs extends Mock implements FavoritesLocalDataSource {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final demo = const Cat(id: '1', breedName: 'Abyssinian', imageUrl: 'url');

  late _MockDs ds;
  late FavoritesBloc bloc;

  setUp(() {
    ds = _MockDs();
    registerFallbackValue(demo.toDto());
    when(() => ds.getAll()).thenAnswer((_) async => []);
    when(() => ds.insert(any())).thenAnswer((_) async {});
    when(() => ds.delete(any())).thenAnswer((_) async {});
    bloc = FavoritesBloc(ds);
  });

  tearDown(() => bloc.close());

  test('AddFavorite вызывает insert', () async {
    bloc.add(AddFavorite(demo));

    await expectLater(bloc.stream, emitsThrough(isA<FavoritesUpdated>()));
    verify(() => ds.insert(any())).called(1);
  });

  test('RemoveFavorite вызывает delete', () async {
    bloc.emit(
      FavoritesUpdated(cats: [demo], breeds: const [], currentFilter: null),
    );
    bloc.add(RemoveFavorite(demo.id));

    await expectLater(bloc.stream, emitsThrough(isA<FavoritesUpdated>()));
    verify(() => ds.delete(demo.id)).called(1);
  });
}
