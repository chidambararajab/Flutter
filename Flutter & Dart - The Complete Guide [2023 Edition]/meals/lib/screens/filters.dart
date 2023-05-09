import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/widgets/single_switch.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVeg = false;
  bool _isVegan = false;

  @override
  void initState() {
    super.initState();
    final activeFilter = ref.read(filtersProvider);

    _isGlutenFree = activeFilter[Filter.isGlutenFree]!;
    _isLactoseFree = activeFilter[Filter.isLactoseFree]!;
    _isVeg = activeFilter[Filter.isVeg]!;
    _isVegan = activeFilter[Filter.isVegan]!;
  }

  @override
  Widget build(BuildContext context) {
    final activeFilter = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(children: [
        SingleSwitch(
          value: activeFilter[Filter.isGlutenFree]!,
          onToggle: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.isGlutenFree, isChecked);
          },
          title: 'Gluten-Free',
          subTitle: 'Only include gluten-free meals',
        ),
        SingleSwitch(
          value: activeFilter[Filter.isLactoseFree]!,
          onToggle: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.isLactoseFree, isChecked);
          },
          title: 'Lactose-Free',
          subTitle: 'Only include lactose-free meals',
        ),
        SingleSwitch(
          value: activeFilter[Filter.isVeg]!,
          onToggle: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.isVeg, isChecked);
          },
          title: 'Vegetrain',
          subTitle: 'Only include Vegetrain meals',
        ),
        SingleSwitch(
          value: activeFilter[Filter.isVegan]!,
          onToggle: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.isVegan, isChecked);
          },
          title: 'Vegan',
          subTitle: 'Only include vegan meals',
        ),
      ]),
    );
  }
}
