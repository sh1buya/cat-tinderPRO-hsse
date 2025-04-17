import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_tinder_hsse/core/di/locator.dart';
import 'package:cat_tinder_hsse/presentation/bloc/cat/cat_bloc.dart';
import 'package:cat_tinder_hsse/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:cat_tinder_hsse/presentation/screens/home_screen.dart';

import 'core/theme/app_theme.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<CatBloc>()),
        BlocProvider(create: (_) => getIt<FavoritesBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        home: const HomeScreen(),
      ),
    );
  }
}
