import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cat_tinder_hsse/providers/cats_provider.dart';

class FilterDropdown extends StatelessWidget {
  const FilterDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CatsProvider>(context);

    final breeds = provider.allLikedCats
        .map((cat) => cat.breedName)
        .toSet()
        .toList();

    return DropdownButton<String>(
      value: provider.filterBreed,
      hint: const Text('Filter by breed'),
      items: [
        const DropdownMenuItem(value: null, child: Text('All')),
        ...breeds.map((breed) => DropdownMenuItem(
          value: breed,
          child: Text(breed),
        ))

      ],
      onChanged: (value) => provider.setFilter(value),
    );
  }
}