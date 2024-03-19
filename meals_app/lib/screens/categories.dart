import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.onToggleFavorite});

  final void Function(Meal meal) onToggleFavorite;

  void _selectedCategory(BuildContext context, Category category) {
    final selectedCategory = dummyMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          categoryName: category.title,
          meals: selectedCategory,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
    // Kjo mundet mu bo edhe ne formen me posht,
    // por perdoret ajo lart me shume.
    // Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2, // Me kta nenkuptojm 3/2 madhsia e elementit
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // availableCategories.map((category) => CategoryGridItem(category: category))
        //     .toList(),

        for (final specificCategory in availableCategories)
          CategoryGridItem(
            category: specificCategory,
            onSelectedCategory: () =>
                _selectedCategory(context, specificCategory),
          ),
      ],
    );
  }
}
