// Return Text Widget

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzi/answer_button.dart';
import 'package:quizzi/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(
      {super.key,
      required this.onSelectAnswer}); // Conatructor function where you get and forward that key to the main Widget class which is Stateful Widget

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer('selectedAnswer');
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, // Literally bring the things in the center of the screen VERTICAL AXIS
          crossAxisAlignment: CrossAxisAlignment.stretch, // Horizontal axis
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 203, 170, 253),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),

            // Dynamically generated instead of hardcoded

            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                }, // Acting as a pointer, so not to use ()
              );
            })
          ],
        ),
      ),
    );
  }
}
