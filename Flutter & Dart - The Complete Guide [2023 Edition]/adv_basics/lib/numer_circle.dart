import 'package:flutter/material.dart';

class NumberCircle extends StatelessWidget {
  const NumberCircle(
      {super.key, required this.condition, required this.stringNumb});

  final String stringNumb;
  final bool condition;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        gradient: RadialGradient(
          colors: condition
              ? [
                  Colors.greenAccent,
                  Colors.green,
                ]
              : [
                  Colors.redAccent,
                  Colors.red,
                ],
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 2,
      ),
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Text(
        stringNumb,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
