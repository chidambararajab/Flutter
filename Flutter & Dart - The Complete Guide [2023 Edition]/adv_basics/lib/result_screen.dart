import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.changeScreen,
      {super.key, required this.selectedAnswers});

  final void Function(String screen) changeScreen;
  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'selected_answer': selectedAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final List<Map<String, Object>> summaryData = getSummaryData();
    final int totalQuestions = questions.length;
    final int numbCorrectQuestions = summaryData
        .where((item) => item['correct_answer'] == item['selected_answer'])
        .length;

    return SizedBox(
      // width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numbCorrectQuestions out of $totalQuestions questions correctly!',
              style: GoogleFonts.aBeeZee(
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            QuestionsSummary(data: summaryData),
            const SizedBox(height: 40),
            TextButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text('Restart'),
              style: TextButton.styleFrom(foregroundColor: Colors.amberAccent),
              onPressed: () {
                changeScreen('start-screen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
