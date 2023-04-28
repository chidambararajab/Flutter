import 'package:flutter/material.dart';
import 'package:adv_basics/gradient_container.dart';
import 'package:adv_basics/start_screen.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer(
          colors: [
            Colors.blueAccent,
            Colors.indigoAccent,
          ],
          child: StartScreen(),
        ),
      ),
    );
  }
}
