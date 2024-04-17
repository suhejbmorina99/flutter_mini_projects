import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
// import 'package:meals_app/screens/tabs.dart';
// import 'package:meals_app/widgets/drawer.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({
    super.key,
  });

  @override
  ConsumerState<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = activeFilters[Filter.vegetarian]!;
    _veganFilterSet = activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // Nese dojm me pas edhe drawer ne filter screen bone uncomment

      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (ctx) => const TabScreen(),
      //       ),
      //     );
      //   }
      // }),
      body: PopScope(
        canPop: true,
        onPopInvoked: (bool didPop) {
          // if (didPop) return;
          // Navigator.of(context).pop({
          ref.read(filtersProvider.notifier).setAllFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
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
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
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
              value: _vegetarianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
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
              value: _veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
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
      ),
    );
  }
}
