import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_tinder_hsse/core/theme/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_tinder_hsse/presentation/models/liked_cat.dart';
import 'package:cat_tinder_hsse/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:cat_tinder_hsse/presentation/widgets/filter_dropdown.dart';

const _appBarColor = Color(0xFFECECEC);

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        if (state is! FavoritesUpdated) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: _appBarColor,
            title: const Text('Liked Cats', style: AppText.title),
            actions: [FilterDropdown(breeds: state.breeds)],
          ),
          body: _list(context, state.cats),
        );
      },
    );
  }

  Widget _list(BuildContext context, List<LikedCat> cats) => ListView.separated(
    itemCount: cats.length,
    separatorBuilder: (_, __) => const Divider(height: 1),
    itemBuilder: (_, i) {
      final liked = cats[i];
      final cat = liked.cat;
      final date = DateFormat('dd.MM.yyyy  HH:mm').format(liked.likedDate);

      return Dismissible(
        key: Key(cat.id),
        background: Container(
          color: const Color(0x1AFF0000),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 24),
          child: const Icon(Icons.delete_outline, color: Colors.red),
        ),
        direction: DismissDirection.endToStart,
        onDismissed:
            (_) => context.read<FavoritesBloc>().add(RemoveFavorite(cat.id)),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: cat.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(cat.breedName),
          subtitle: Text(date),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.grey),
            onPressed:
                () => context.read<FavoritesBloc>().add(RemoveFavorite(cat.id)),
          ),
        ),
      );
    },
  );
}
