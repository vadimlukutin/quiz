import 'package:encrypt/encrypt.dart';
import 'package:quiz/src/domain/entities/base.dart';
import 'package:quiz/src/domain/entities/quiz_detail_result.dart';
import 'package:quiz/src/domain/entities/quiz_history.dart';

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
    id          = source["id"] as int ?? -1;
    question    = source["question"] as String ?? "";
    rightAnswer = source["rightAnswer"] as String ?? "";
    answers     = source["answers"] as List<dynamic> ?? [];
  }

  bool get isCorrect {
    _isCorrect = answer == rightAnswer;

    return _isCorrect;
  }
}

class QuizStringList {
  var _isCorrect = false;
  var _status = QuizStatus.progress;
  var list = <QuizStringItem>[];

  QuizStringList ({
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

  int get correctCount {
    var result = 0;

    for (final item in list) {
      if (item.isCorrect) {
        result ++;
      }
    }

    return result;
  }

  bool get filled {
    return status == QuizStatus.filled;
  }

  QuizStatus get status {
    for (final item in list) {
      if (item.answer.isEmpty) {
        _status = QuizStatus.progress;

        return _status;
      }
    }

    _status = QuizStatus.filled;

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

  QuizDetailResultList get resultDetails
  {
    var result = QuizDetailResultList();

    for (final item in list) {
      final detail = QuizDetailResultItem(
          isCorrect: item.isCorrect,
          question: item.question,
          answer: item.answer
      );

      result.add(item: detail);
    }

    return result;
  }

  QuizHistoryItem get history
  {
    final result = QuizHistoryItem(
      uuid: SecureRandom(16).bytes,
      type: QuizType.string,
      total: list.length,
      correct: correctCount,
      date: DateTime.now(),
    );

    return result;
  }
}