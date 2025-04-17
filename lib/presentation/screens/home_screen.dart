import 'package:cat_tinder_hsse/domain/entities/cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_tinder_hsse/core/theme/app_theme.dart';
import 'package:cat_tinder_hsse/presentation/bloc/cat/cat_bloc.dart';
import 'package:cat_tinder_hsse/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:cat_tinder_hsse/presentation/widgets/cat_card.dart';
import 'package:cat_tinder_hsse/presentation/widgets/action_button.dart';
import 'package:cat_tinder_hsse/presentation/widgets/error_dialog.dart';
import 'package:cat_tinder_hsse/presentation/screens/favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BuildContext? _dialogCtx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Catinder', style: AppText.title),
        actions: const [_LikeCounter()],
      ),
      body: BlocConsumer<CatBloc, CatState>(
        listener: _handleBloc,
        builder:
            (context, state) => switch (state) {
              CatInitial() => _initialLoad(context),
              CatLoading() => const Center(child: CircularProgressIndicator()),
              CatLoaded() => _content(state),
              CatError() => _noNet(context),
              _ => const SizedBox(),
            },
      ),
    );
  }

  void _handleBloc(BuildContext ctx, CatState state) {
    if (state is CatError && _dialogCtx == null) {
      showErrorDialog(ctx, state.message).then((_) => _dialogCtx = null);
      _dialogCtx = Navigator.of(ctx, rootNavigator: true).context;
    }
    if (state is CatLoaded && _dialogCtx != null) {
      Navigator.of(_dialogCtx!, rootNavigator: true).pop();
      _dialogCtx = null;
    }
  }

  Widget _initialLoad(BuildContext ctx) {
    ctx.read<CatBloc>().add(LoadRandomCatEvent());
    return const Center(child: CircularProgressIndicator());
  }

  Widget _content(CatLoaded state) => Column(
    children: [
      Expanded(
        child: CatCard(
          cat: state.cat,
          onSwipe: (like) => _onSwipe(state.cat, like),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ActionButton(
              icon: Icons.close,
              color: AppColors.dislike,
              onPressed: () => _onSwipe(state.cat, false),
            ),
            ActionButton(
              icon: Icons.favorite,
              color: AppColors.like,
              onPressed: () => _onSwipe(state.cat, true),
            ),
          ],
        ),
      ),
    ],
  );

  Widget _noNet(BuildContext ctx) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.wifi_off, size: 80, color: Colors.grey),
        const SizedBox(height: 12),
        const Text('Нет соединения с интернетом'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => ctx.read<CatBloc>().add(LoadRandomCatEvent()),
          child: const Text('Повторить'),
        ),
      ],
    ),
  );

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
      builder: (_, state) {
        final cnt = state is FavoritesUpdated ? state.cats.length : 0;
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
                    '$cnt',
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
