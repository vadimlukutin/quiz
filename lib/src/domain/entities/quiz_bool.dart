import 'package:encrypt/encrypt.dart';
import 'package:quiz/src/domain/entities/base.dart';
import 'package:quiz/src/domain/entities/quiz_detail_result.dart';
import 'package:quiz/src/domain/entities/quiz_history.dart';

class QuizBoolItem {
  int id = -1;
  String question = "";
  bool rightAnswer = false;
  bool answer;

  var _isCorrect = false;

  QuizBoolItem({
      Map<String, dynamic> source
  }){
    id = source["id"] as int ?? -1;
    question = source["question"] as String ?? "";
    rightAnswer = source["rightAnswer"] as bool ?? false;
  }

  bool get isCorrect {
    _isCorrect = answer == rightAnswer;

    return _isCorrect;
  }
}

class QuizBoolList {
  var _isCorrect = false;
  var _status = QuizStatus.progress;
  var list = <QuizBoolItem>[];

  final _positiveTitle = "YES";
  final _negativeTitle = "NO";

  QuizBoolList ({
    List<dynamic> source,
  }) {
    for(final item in source) {
      list.add(QuizBoolItem(source: item));
    }
  }

  QuizStatus get status {
    for (final item in list) {
      if (item.answer == null) {
        _status = QuizStatus.progress;

        return _status;
      }
    }

    _status = QuizStatus.filled;

    return _status;
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
    return status == QuizStatus.filled;
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

  bool setAnswer ({int questionId, bool answer}){
    for (final item in list) {
      if (item.id == questionId) {
        item.answer = answer;

        return true;
      }
    }

    return false;
  }

  QuizDetailResultList get resultDetails {
    var result = QuizDetailResultList();

    for (final item in list) {
      final detail = QuizDetailResultItem(
          isCorrect: item.isCorrect,
          question: item.question,
          answer: item.answer ? _positiveTitle : _negativeTitle
      );

      result.add(item: detail);
    }

    return result;
  }

  QuizHistoryItem get history {
    final result = QuizHistoryItem(
      uuid: SecureRandom(16).bytes,
      type: QuizType.bool,
      total: list.length,
      correct: correctCount,
      date: DateTime.now(),
    );

    return result;
  }
}