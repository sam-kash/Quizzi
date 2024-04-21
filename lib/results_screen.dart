import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizzi/data/questions.dart';
//import 'package:flutter/widgets.dart';
import 'package:quizzi/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  // Object are pretty flexible i.e. it can store multiple types of values
  List<Map<String, Object>> getSummarydata() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question':
              questions[i].text, // Cuz We wanna access the text of the question
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummarydata();
    final totalQuestions = questions.length;
    final correctQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctQuestions out of $totalQuestions questions correctly',
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: () {},
              label: const Text('Restart Quiz',
                  style: TextStyle(color: Colors.white)),
              icon: const Icon(Icons.arrow_back_ios),
            )
          ],
        ),
      ),
    );
  }
}
