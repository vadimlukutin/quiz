class QuizDetailResultItem {
  final bool isCorrect;
  final String question;
  final String answer;

  QuizDetailResultItem({
    this.question,
    this.answer,
    this.isCorrect,
  });
}

class QuizDetailResultList {
  var _list = <QuizDetailResultItem>[];

  QuizDetailResultList();

  void add ({QuizDetailResultItem item}) {
    _list.add(item);
  }

  List<QuizDetailResultItem> get list {
    return _list;
  }
}