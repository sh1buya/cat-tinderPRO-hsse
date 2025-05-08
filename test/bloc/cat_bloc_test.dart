import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:cat_tinder_hsse/presentation/bloc/cat/cat_bloc.dart';
import 'package:cat_tinder_hsse/domain/repositories/cat_repository.dart';
import 'package:cat_tinder_hsse/domain/entities/cat.dart';

class _MockRepo extends Mock implements CatRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final demo = const Cat(id: '1', breedName: 'Abyssinian', imageUrl: 'url');

  test('Успешная загрузка → CatLoaded', () async {
    final repo = _MockRepo();
    when(() => repo.getRandomCat()).thenAnswer((_) async => demo);

    final bloc = CatBloc(repo)..add(LoadRandomCatEvent());

    await expectLater(
      bloc.stream,
      emitsInOrder([isA<CatLoading>(), isA<CatLoaded>()]),
    );
    await bloc.close();
  });

  test('Ошибка → CatError', () async {
    final repo = _MockRepo();
    when(() => repo.getRandomCat()).thenThrow(Exception('net'));

    final bloc = CatBloc(repo)..add(LoadRandomCatEvent());

    await expectLater(
      bloc.stream,
      emitsInOrder([isA<CatLoading>(), isA<CatError>()]),
    );
    await bloc.close();
  });
}
