class QuestionModel {
  const QuestionModel(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> getShuffledAnswer() {
    // qetu e bojna ni copy te answers puna qe mos me prish renditjen
    // origjinale te answers me kete list.of pastaj shuffle edhe e bojm return
    final shuffledAnswer = List.of(answers);
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }
}
