import 'package:flutter/material.dart';
import 'package:quizzi/data/questions.dart';
//import 'package:flutter/widgets.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  // Object are pretty flexible i.e. it can store multiple types of values
  List<Map<String, Object>> getSummarydata() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'Question_index': i,
          'question':
              questions[i].text, // Cuz We wanna access the text of the question
          'correct_answers': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answered X out of 6 questions correctly'),
            const SizedBox(
              height: 30,
            ),
            const Text('List of Questions and answers....'),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text('Restart Quiz'),
              icon: const Icon(Icons.arrow_back_ios),
            )
          ],
        ),
      ),
    );
  }
}
