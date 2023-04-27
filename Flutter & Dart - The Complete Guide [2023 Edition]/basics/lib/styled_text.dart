import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    );
  }
}
