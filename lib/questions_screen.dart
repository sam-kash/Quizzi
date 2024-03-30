// Return Text Widget

import 'package:flutter/material.dart';

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
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment
            .center, // Literally bring the things in the center of the screen
        children: [
          const Text(
            'The Questions .....',
            style: TextStyle(
                color: Color.fromARGB(255, 166, 216, 37), fontSize: 18),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Answer 1'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Answer 2'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Answer 3'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Answer 4'),
          ),
        ],
      ),
    );
  }
}
