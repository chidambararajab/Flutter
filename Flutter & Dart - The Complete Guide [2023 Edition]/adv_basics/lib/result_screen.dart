import 'package:adv_basics/answer_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.changeScreen,
      {super.key, required this.selectedAnswers});

  final void Function(String screen) changeScreen;
  final List<String> selectedAnswers;

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...selectedAnswers.map((resultAnswer) => Text(resultAnswer)),
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
