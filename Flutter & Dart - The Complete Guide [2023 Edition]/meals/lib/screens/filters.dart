import 'package:flutter/material.dart';
import 'package:meals/widgets/single_switch.dart';

enum Filter {
  isGlutenFree,
  isLactoseFree,
  isVeg,
  isVegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVeg = false;
  bool _isVegan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.isGlutenFree: _isGlutenFree,
            Filter.isLactoseFree: _isLactoseFree,
            Filter.isVeg: _isVeg,
            Filter.isVegan: _isVegan
          });
          return false;
        },
        child: Column(children: [
          SingleSwitch(
            value: _isGlutenFree,
            onToggle: (isChecked) {
              setState(() {
                _isGlutenFree = isChecked;
              });
            },
            title: 'Gluten-Free',
            subTitle: 'Only include gluten-free meals',
          ),
          SingleSwitch(
            value: _isLactoseFree,
            onToggle: (isChecked) {
              setState(() {
                _isLactoseFree = isChecked;
              });
            },
            title: 'Lactose-Free',
            subTitle: 'Only include lactose-free meals',
          ),
          SingleSwitch(
            value: _isVeg,
            onToggle: (isChecked) {
              setState(() {
                _isVeg = isChecked;
              });
            },
            title: 'Vegetrain',
            subTitle: 'Only include Vegetrain meals',
          ),
          SingleSwitch(
            value: _isVegan,
            onToggle: (isChecked) {
              setState(() {
                _isVegan = isChecked;
              });
            },
            title: 'Vegan',
            subTitle: 'Only include vegan meals',
          ),
        ]),
      ),
    );
  }
}
