import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.changeScreen, {super.key});

  final void Function(String screen) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.aBeeZee(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          OutlinedButton.icon(
            onPressed: () {
              changeScreen('question-screen');
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    );
  }
}
