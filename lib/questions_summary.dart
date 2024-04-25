import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:quizzi/data/questions.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: data['user_answer'] == data['correct_answer']
                        ? const TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 18,
                          )
                        : const TextStyle(
                            color: Color.fromARGB(255, 245, 157, 220),
                            fontSize: 18,
                          ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 214, 165, 235),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        Text(
                          data['user_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 105, 54, 235),
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        ), // Selected answer

                        Text(
                          data['correct_answer'] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 133, 170, 233),
                              fontSize: 15),
                        ), // correct answer

                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
