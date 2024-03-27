import 'package:flutter/material.dart';
// import 'package:meals_app/screens/tabs.dart';
// import 'package:meals_app/widgets/drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

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
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
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
