class Quiz {
  final String question;
  final List<String> possibleAnswers;
  final int correctAnswerIndex;
  Quiz({
    required this.question,
    required this.possibleAnswers,
    required this.correctAnswerIndex,
  });
}
