import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'core/di/locator.dart';
import 'presentation/bloc/cat/cat_bloc.dart';
import 'presentation/bloc/favorites/favorites_bloc.dart';
import 'presentation/bloc/connectivity/connectivity_cubit.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final sl = GetIt.instance;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<CatBloc>()),
        BlocProvider(create: (_) => sl<FavoritesBloc>()),
        BlocProvider(create: (_) => sl<ConnectivityCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: BlocListener<CatBloc, CatState>(
          listenWhen: (prev, curr) => curr is CatError && curr != prev,
          listener: (ctx, state) {
            if (state is CatError) {
              showDialog(
                context: ctx,
                builder:
                    (_) => AlertDialog(
                      title: const Text('Error'),
                      content: Text(state.message),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
              );
            }
          },
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
