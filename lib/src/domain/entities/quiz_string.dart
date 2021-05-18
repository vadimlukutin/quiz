class QuizStringItem {
  var _isCorrect = false;
  var id = -1;
  var question = "";
  var rightAnswer = "";
  var answers = <dynamic>[];
  var answer = "";

  QuizStringItem({
    Map<String, dynamic> source
  }){
    id = source["id"] as int ?? -1;
    question = source["question"] as String ?? "";
    rightAnswer = source["rightAnswer"] as String ?? "";
    answers = source["answers"] as List<dynamic> ?? [];
  }

  bool get isCorrect {
    _isCorrect = answer == rightAnswer;

    return _isCorrect;
  }
}

enum QuizStringStatus {
  progress,
  filled
}

class QuizString {
  var _isCorrect = false;
  var _status = QuizStringStatus.progress;
  var list = <QuizStringItem>[];

  QuizString ({
    List<dynamic> source,
  }) {
    for(final item in source) {
      list.add(QuizStringItem(source: item));
    }
  }

  bool get isCorrect {
    for (final item in list) {
      if (!item.isCorrect) {
        _isCorrect = false;
        return _isCorrect;
      }
    }

    _isCorrect = true;
    return _isCorrect;
  }

  bool get filled {
    return status == QuizStringStatus.filled;
  }

  QuizStringStatus get status {
    for (final item in list) {
      if (item.answer.isEmpty) {
        _status = QuizStringStatus.progress;

        return _status;
      }
    }

    _status = QuizStringStatus.filled;

    return _status;
  }

  bool setAnswer ({int questionId, String answer}){
    for (final item in list) {
      if (item.id == questionId) {
        item.answer = answer;

        return true;
      }
    }

    return false;
  }
}