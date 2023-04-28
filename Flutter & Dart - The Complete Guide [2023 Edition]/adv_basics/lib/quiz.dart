import 'package:flutter/material.dart';
import 'package:adv_basics/gradient_container.dart';
import 'package:adv_basics/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
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
