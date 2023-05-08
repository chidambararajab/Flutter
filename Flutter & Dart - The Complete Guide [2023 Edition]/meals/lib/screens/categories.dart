import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _onSelectCategory(BuildContext context, Category category) {
    final filteredList = dummyMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredList,
        ),
      ),
    );
    // Also I can use the below
    // Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        ...availableCategories
            .map((category) => CategoryGridItem(
                  category: category,
                  onSelectCategory: () {
                    _onSelectCategory(context, category);
                  },
                ))
            .toList()
      ],
    );
  }
}
