import 'package:adv_basics/answer_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.changeScreen, {super.key});

  final void Function(String screen) changeScreen;

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Result Screen'),
          AnswerButton(
              label: 'Restart',
              onPressed: () {
                changeScreen('start-screen');
              })
        ],
      ),
    );
  }
}
