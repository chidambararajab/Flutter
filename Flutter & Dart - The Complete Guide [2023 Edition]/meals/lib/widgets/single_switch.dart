import 'package:flutter/material.dart';

class SingleSwitch extends StatelessWidget {
  const SingleSwitch({
    super.key,
    required this.value,
    required this.onToggle,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;
  final bool value;
  final void Function(bool isChanged) onToggle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: (isChecked) {
        onToggle(isChecked);
      },
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );
  }
}
