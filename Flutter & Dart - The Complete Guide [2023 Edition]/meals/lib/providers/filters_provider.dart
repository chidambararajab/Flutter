import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filter {
  isGlutenFree,
  isLactoseFree,
  isVeg,
  isVegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.isGlutenFree: false,
          Filter.isLactoseFree: false,
          Filter.isVeg: false,
          Filter.isVegan: false,
        });

  void setFilter(Filter filter, bool flag) {
    state = {
      ...state,
      filter: flag,
    };
  }

  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

final filteredMealProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final filters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (filters[Filter.isGlutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (filters[Filter.isLactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (filters[Filter.isVeg]! && !meal.isVegetarian) {
      return false;
    }
    if (filters[Filter.isVeg]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
