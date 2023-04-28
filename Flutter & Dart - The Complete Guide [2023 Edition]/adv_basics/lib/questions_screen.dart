import 'package:flutter/material.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.changeScreen,
      {super.key, required this.onSelectAnswer});

  final void Function(String screen) changeScreen;
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestion = 0;

  @override
  Widget build(BuildContext context) {
    void onAnswer(String answer) {
      widget.onSelectAnswer(answer);
      if (currentQuestion >= questions[currentQuestion].answers.length) {
        widget.changeScreen('result-screen');
      } else {
        setState(() {
          currentQuestion++;
        });
      }
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestion].question,
              style: GoogleFonts.adamina(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
                wordSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...questions[currentQuestion]
                .getShuffledAnswers()
                .map((answer) => AnswerButton(
                      label: answer,
                      onPressed: () {
                        onAnswer(answer);
                      },
                    ))
          ],
        ),
      ),
    );
  }
}
