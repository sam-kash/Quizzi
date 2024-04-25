import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzi/data/questions.dart';
//import 'package:flutter/widgets.dart';
import 'package:quizzi/questions_summary.dart';
import 'package:quizzi/quiz.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

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
              'You answered $correctQuestions out of $totalQuestions questions correctly !',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 174, 220),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              label: const Text('Restart Quiz',
                  style: TextStyle(color: Colors.white)),
              icon: const Icon(Icons.restart_alt_rounded),
            )
          ],
        ),
      ),
    );
  }
}
