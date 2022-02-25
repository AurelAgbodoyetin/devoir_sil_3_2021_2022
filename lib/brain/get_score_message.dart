String getScoreMessage(double rate) {
  if (rate < 0.4) {
    return "Vous devez apprendre plus";
  } else {
    if (rate < 0.7) {
      return "Vous pouvez mieux faire";
    } else {
      return "Vous avez bien répondu à toutes les questions";
    }
  }
}
