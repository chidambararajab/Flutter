import 'package:adv_basics/answer_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.changeScreen, this.resultAnswers, {super.key});

  final void Function(String screen) changeScreen;
  final List<String> resultAnswers;

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...resultAnswers.map((resultAnswer) => Text(resultAnswer)),
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
