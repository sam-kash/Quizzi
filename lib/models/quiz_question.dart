// This FIle will not contain any widget,
// This file will contain the 🔴QUESTION BLUEBRINT..🔴

class QuizQuestion // IT wont extend anything because it is not a widget
{
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
