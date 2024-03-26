import 'package:flutter/material.dart';
// import 'package:meals_app/screens/tabs.dart';
// import 'package:meals_app/widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterSet = false;

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
      body: Column(
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
          )
        ],
      ),
    );
  }
}
