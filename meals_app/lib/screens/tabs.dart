import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _favoriteMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _addFavoriteMeal(Meal meal) {
    final isFavorite = _favoriteMeals.contains(meal);

    if (isFavorite) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _favoriteMessage('Meal is no longer a favorite meal.');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _favoriteMessage('Marked as a favorite!');
    }
  }

  void _selectPage(int index) {
    //Index vjen prej BottomNavigationBar dinamikisht
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = Categories(
      onToggleFavorite: _addFavoriteMeal,
    );
    var title = 'Choose a category';

    if (_selectedPageIndex == 1) {
      activeScreen = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _addFavoriteMeal,
      );
      title = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
