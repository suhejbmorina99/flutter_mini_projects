import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: const Text(
              'Gluten-free',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: const Text(
              'Include only gluten-free meals.',
              style: TextStyle(color: Colors.black),
            ),
            activeColor: Colors.green,
            contentPadding: const EdgeInsets.only(left: 43, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            title: const Text(
              'Lactose-free',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: const Text(
              'Include only lactose-free meals.',
              style: TextStyle(color: Colors.black),
            ),
            activeColor: Colors.green,
            contentPadding: const EdgeInsets.only(left: 43, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            title: const Text(
              'Vegetarian',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: const Text(
              'Include only vegetarian meals.',
              style: TextStyle(color: Colors.black),
            ),
            activeColor: Colors.green,
            contentPadding: const EdgeInsets.only(left: 43, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: const Text(
              'Vegan',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: const Text(
              'Include only vegan meals.',
              style: TextStyle(color: Colors.black),
            ),
            activeColor: Colors.green,
            contentPadding: const EdgeInsets.only(left: 43, right: 22),
          )
        ],
      ),
    );
  }
}
