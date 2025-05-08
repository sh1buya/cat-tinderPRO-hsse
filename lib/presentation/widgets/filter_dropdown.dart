import 'package:flutter/material.dart';

class FilterDropdown extends StatelessWidget {
  const FilterDropdown({
    super.key,
    required this.breeds,
    required this.current,
    required this.onSelected,
  });

  final List<String> breeds;

  final String? current;

  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    if (breeds.length < 2) return const SizedBox();

    return DropdownButton<String>(
      value: breeds.contains(current) ? current : null,
      hint: const Text('Фильтр'),
      items: [
        const DropdownMenuItem(value: null, child: Text('Все')),
        ...breeds.map((b) => DropdownMenuItem(value: b, child: Text(b))),
      ],
      onChanged: onSelected,
    );
  }
}
