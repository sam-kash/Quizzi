// Must contain the Material App
//PARENT WIDGET THat controls the the navigation of the screens

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizzi/questions_screen.dart';
import 'package:quizzi/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

// We havent aadded a constructor finction, but we dont have to instead dart automatically gives you one

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  // Widget?
  //     activeScreen; // TYhis will the be the initial screen that we see in the UI

  // Now we are adding a method here which is called SwitchScreen
  // In flutter Development, we generally call functions as methods, Anyway

  // INITSTATE IS REMOVED
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(
        switchScreen); // Variable only available to the build method

    if (activeScreen == 'questions-screen') {
      screenWidget = const QuestionsScreen();
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
