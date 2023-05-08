import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;
  List<Meal> _favorites = [];

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
    if (_favorites.contains(meal)) {
      setState(() {
        _favorites.remove(meal);
      });
      _showSnackBar('Meal is removed');
    } else {
      setState(() {
        _favorites.add(meal);
      });
      _showSnackBar('Meal is added');
    }
  }

  void _navigateTo(String screen) {
    if (screen == 'filters') {
      Navigator.of(context).pop();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => const FiltersScreen(),
          ));
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = CategoriesScreen(
      onToggleFavorite: _onToggleFavorite,
    );
    String barTitle = 'Categories';

    if (_selectedIndex == 1) {
      content = MealsScreen(
        meals: _favorites,
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
