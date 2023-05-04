import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class Meals extends StatelessWidget {
  const Meals({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    var content = const Text('No meals found');

    if (meals.isNotEmpty) {
      content = const Text('Meals found');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Specific Category'),
        titleTextStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      body: Container(
        child: content,
      ),
    );
  }
}
