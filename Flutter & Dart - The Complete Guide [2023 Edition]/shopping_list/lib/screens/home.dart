import 'package:flutter/material.dart';
import 'package:shopping_list/Widgets/grocery_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GroceryList(),
    );
  }
}
