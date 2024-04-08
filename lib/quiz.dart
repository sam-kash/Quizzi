//PARENT WIDGET THat controls the the navigation of the screens
// Must contain the Material App

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizzi/data/questions.dart';
import 'package:quizzi/questions_screen.dart';
import 'package:quizzi/start_screen.dart';
import 'package:quizzi/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

// We havent aadded a constructor finction, but we dont have to instead dart automatically gives you one

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void choseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen =
            'results-screen'; // Temporary, will be gaving a result screen soon
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(
        switchScreen); // Variable only available to the build method

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: choseAnswer,
      );
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers);
    }

    return MaterialApp(
      // We are removing the const because the container do not support it
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 48, 7, 99),
                Color.fromARGB(255, 78, 13, 163)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}



// INITSTATE IS REMOVED
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }