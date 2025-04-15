import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:cat_tinder_hsse/widgets/filter_dropdown.dart';
import 'package:cat_tinder_hsse/providers/cats_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked Cats'),
        actions: const [FilterDropdown()],
      ),
      body: Consumer<CatsProvider>(
        builder: (context, provider, _) {
          if (provider.filteredLikedCats.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.pets, size: 64, color: Colors.grey),
                  Text(
                    provider.filterBreed == null
                        ? 'No liked cats yet'
                        : 'No cats of breed "${provider.filterBreed}"',
                    style: const TextStyle(fontSize: 18),
                  ),
                  if (provider.filterBreed != null)
                    TextButton(
                      onPressed: () => provider.setFilter(null),
                      child: const Text('Clear filter'),
                    ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: provider.filteredLikedCats.length,
            itemBuilder: (context, index) {
              final cat = provider.filteredLikedCats[index];
              return Dismissible(
                key: Key(cat.id),
                direction: DismissDirection.endToStart,
                background: Container(color: Colors.red),
                onDismissed: (_) => provider.removeLikedCat(cat.id),
                child: ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: cat.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(cat.breedName),
                  subtitle: Text(
                    DateFormat('dd MMM yyyy, HH:mm').format(cat.likedDate),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}