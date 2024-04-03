// Return Text Widget

import 'package:flutter/material.dart';
import 'package:quizzi/answer_button.dart';
import 'package:quizzi/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(
      {super.key}); // Conatructor function where you get and forward that key to the main Widget class which is Stateful Widget

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
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
              style: const TextStyle(
                  color: Color.fromARGB(255, 146, 176, 222), fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),

            // Dynamically generated instead of hardcoded

            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: answerQuestion, // Acting as a pointer, so not to use ()
              );
            })
          ],
        ),
      ),
    );
  }
}
