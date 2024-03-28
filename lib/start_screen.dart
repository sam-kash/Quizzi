import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize
            .min, // instead of taking all the vertical space the widget will only take the most minimum vertical space as needed
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 280,
            color: const Color.fromARGB(148, 255, 255, 255),
          ),

          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 280,
          //   ),
          // ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Lets Start the Quiz",
            style: TextStyle(
              color: Color.fromARGB(255, 252, 249, 255),
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 255, 254, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.6),
                )),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
                'Start'), // widget that is defined inside the ICON  widget to describe the non ICON stuff
          ),
        ],
      ),
    );
  }
}
