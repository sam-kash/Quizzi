// Return Text Widget

import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

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
    return const Text('Questions Screen');
  }
}
