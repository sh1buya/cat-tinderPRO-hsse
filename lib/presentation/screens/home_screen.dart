import 'package:cat_tinder_hsse/domain/entities/cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_tinder_hsse/core/theme/app_theme.dart';
import 'package:cat_tinder_hsse/presentation/bloc/cat/cat_bloc.dart';
import 'package:cat_tinder_hsse/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:cat_tinder_hsse/presentation/bloc/connectivity/connectivity_cubit.dart';
import 'package:cat_tinder_hsse/presentation/widgets/cat_card.dart';
import 'package:cat_tinder_hsse/presentation/widgets/action_button.dart';
import 'package:cat_tinder_hsse/presentation/screens/favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Catinder', style: AppText.title),
        actions: const [_LikeCounter()],
      ),
      body: BlocBuilder<ConnectivityCubit, ConnectivityState>(
        builder: (context, netState) {
          final offline = netState is Disconnected;

          if (offline) {
            return _buildOfflinePlaceholder(context);
          }

          return BlocBuilder<CatBloc, CatState>(
            builder: (context, state) {
              if (state is CatInitial) {
                context.read<CatBloc>().add(LoadRandomCatEvent());
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CatLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CatLoaded) {
                return _buildContent(state.cat);
              }
              return _buildOfflinePlaceholder(context);
            },
          );
        },
      ),
    );
  }

  Widget _buildOfflinePlaceholder(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off, size: 100, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'Вы оффлайн',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Свайпы и кнопки недоступны.\n'
              'Подключитесь к интернету для новых котиков.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.favorite),
              label: const Text('Перейти в избранное'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FavoritesScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(Cat cat) {
    return Column(
      children: [
        Expanded(
          child: CatCard(cat: cat, onSwipe: (like) => _onSwipe(cat, like)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ActionButton(
                icon: Icons.close,
                color: AppColors.dislike,
                onPressed: () => _onSwipe(cat, false),
              ),
              ActionButton(
                icon: Icons.favorite,
                color: AppColors.like,
                onPressed: () => _onSwipe(cat, true),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onSwipe(Cat cat, bool like) {
    if (like) {
      context.read<FavoritesBloc>().add(AddFavorite(cat));
    }
    context.read<CatBloc>().add(LoadRandomCatEvent());
  }
}

class _LikeCounter extends StatelessWidget {
  const _LikeCounter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        final count = state is FavoritesUpdated ? state.cats.length : 0;
        return Padding(
          padding: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
          child: GestureDetector(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FavoritesScreen()),
                ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: Colors.grey.shade400),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                children: [
                  const Icon(Icons.favorite, size: 20, color: Colors.red),
                  const SizedBox(width: 4),
                  Text(
                    '$count',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
