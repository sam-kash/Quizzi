// I wrote this code myself, But it is not suited for the function of the whole app, so I am not using it anymore

import 'package:flutter/material.dart';
//import 'package:quizzi/main.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.lightBlueAccent,
            Color.fromARGB(255, 96, 139, 97)
          ], // Colors are taken as list thats why we use the [] brackets
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Or Row for horizontal layout
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
          ),
          const SizedBox(height: 100),
          const Center(
            child: Text(
              'Why are you GAY',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
            onPressed: () {
              // Not yet
            },
            child: const Text('Start the Quiz'),
          )
        ],
      ),
    );
  }
}
