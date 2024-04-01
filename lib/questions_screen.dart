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
  @override
  Widget build(context) {
    final currentQuestion = questions[0];

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment
            .center, // Literally bring the things in the center of the screen
        children: [
          Text(
            currentQuestion.text,
            style: const TextStyle(
                color: Color.fromARGB(255, 146, 176, 222), fontSize: 18),
          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(
            answerText: currentQuestion.answers[0],
            onTap: () {},
          ),
          AnswerButton(
            answerText: currentQuestion.answers[1],
            onTap: () {},
          ),
          AnswerButton(
            answerText: currentQuestion.answers[2],
            onTap: () {},
          ),
          AnswerButton(
            answerText: currentQuestion.answers[3],
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
