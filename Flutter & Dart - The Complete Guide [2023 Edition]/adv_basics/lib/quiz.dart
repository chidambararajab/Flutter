import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreenName = 'start-screen';
  final List<String> selectedAnswers = [];

  void changeScreen(screen) {
    setState(() {
      activeScreenName = screen;
    });
  }

  void onSelectAnswer(String answer) {
    selectedAnswers.add(answer);
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(changeScreen);

    if (activeScreenName == 'question-screen') {
      activeScreen = QuestionsScreen(
        changeScreen,
        onSelectAnswer: onSelectAnswer,
      );
    } else if (activeScreenName == 'result-screen') {
      activeScreen = ResultScreen(
        changeScreen,
        selectedAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Colors.indigoAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}




/**!SECTION
 * Later
 */
  // @override
  // Widget build(BuildContext context) {
  //   return const MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: Scaffold(
  //       body: GradientContainer(
  //         colors: [
  //           Colors.blueAccent,
  //           Colors.indigoAccent,
  //         ],
  //         child: activeScreen,
  //       ),
  //     ),
  //   );
  // }
  // }