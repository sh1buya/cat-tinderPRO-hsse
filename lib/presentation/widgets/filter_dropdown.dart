import 'package:cat_tinder_hsse/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterDropdown extends StatelessWidget {
  final List<String> breeds;
  const FilterDropdown({super.key, required this.breeds});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        final current = state is FavoritesUpdated ? state.currentFilter : null;
        return DropdownButton<String?>(
          value: current,
          hint: const Text('All'),
          items: [
            const DropdownMenuItem<String?>(value: null, child: Text('All')),
            ...breeds.map(
              (b) => DropdownMenuItem<String?>(value: b, child: Text(b)),
            ),
          ],
          onChanged:
              (val) => context.read<FavoritesBloc>().add(FilterFavorites(val)),
        );
      },
    );
  }
}
