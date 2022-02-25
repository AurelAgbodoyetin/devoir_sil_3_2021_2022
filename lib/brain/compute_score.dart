double computeUserSuccessRate(List<int> choices) {
  List<int> _correctAnswers = [0, 0, 2, 3, 2, 0];
  assert(
    _correctAnswers.length == choices.length,
    "Arrays must have equal length",
  );

  int _nCorrectAnswers = 0;

  for (int i = 0; i < choices.length; i++) {
    if (choices[i] == _correctAnswers[i]) {
      _nCorrectAnswers++;
    }
  }

  return _nCorrectAnswers / choices.length;
}
