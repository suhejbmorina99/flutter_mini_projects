import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.categoryName,
    required this.meals,
  });

  final String categoryName;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Uh no... nothing here!'),
          SizedBox(height: 16),
          Text('Try selecting another category'),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => Text(meals[index].title),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: content,
    );
  }
}
