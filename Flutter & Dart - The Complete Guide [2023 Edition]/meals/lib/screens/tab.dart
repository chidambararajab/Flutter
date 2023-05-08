import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

const kInitialFilter = {
  Filter.isGlutenFree: false,
  Filter.isLactoseFree: false,
  Filter.isVeg: false,
  Filter.isVegan: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;
  List<Meal> favorites = [];
  Map<Filter, bool> _filters = kInitialFilter;

  void _onChangeIndex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showSnackBar(message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _onToggleFavorite(Meal meal) {
    if (favorites.contains(meal)) {
      setState(() {
        favorites.remove(meal);
      });
      _showSnackBar('Meal is removed');
    } else {
      setState(() {
        favorites.add(meal);
      });
      _showSnackBar('Meal is added');
    }
  }

  void _navigateTo(String screen) async {
    if (screen == 'filters') {
      Navigator.of(context).pop();
      final result = await Navigator.push<Map<Filter, bool>>(
          context,
          MaterialPageRoute(
            builder: (ctx) => FiltersScreen(
              currentFilters: _filters,
            ),
          ));

      setState(() {
        _filters = result ?? kInitialFilter;
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Meal> filteredMeals = dummyMeals.where((meal) {
      if (_filters[Filter.isGlutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_filters[Filter.isLactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_filters[Filter.isVeg]! && !meal.isVegetarian) {
        return false;
      }
      if (_filters[Filter.isVeg]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget content = CategoriesScreen(
      onToggleFavorite: _onToggleFavorite,
      filteredMeals: filteredMeals,
    );
    String barTitle = 'Categories';

    if (_selectedIndex == 1) {
      content = MealsScreen(
        meals: favorites,
        onToggleFavorite: _onToggleFavorite,
      );
      barTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(barTitle),
        centerTitle: false,
      ),
      drawer: MainDrawer(
        onNavigateTo: _navigateTo,
      ),
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _onChangeIndex(index);
        },
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorities'),
        ],
      ),
    );
  }
}
