import 'package:flutter/material.dart';
import 'package:adv_basics/gradient_container.dart';
import 'package:adv_basics/start_screen_content.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GradientContainer(
      colors: [
        Colors.blueAccent,
        Colors.indigoAccent,
      ],
      child: StartScreenContent(),
    );
  }
}
