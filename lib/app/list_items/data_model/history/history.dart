import 'package:flutter/widgets.dart';
import 'package:quiz/app/list_items/data_model/base.dart';
import 'package:quiz/app/list_items/view/list_items/history/history.dart';
import 'package:quiz/src/domain/entities/quiz_history.dart';

class HistoryDataItem
    extends BaseDataItem
{
  final QuizType type;
  final int date;

  final int correct;
  final int total;

  final _stringQuiz = "One Answer Quiz";
  final _boolQuiz = "True or False Quiz";

  var _quizTypeText = "";

  HistoryDataItem({
    this.type,
    this.date,
    this.correct,
    this.total
  }){
    switch (type) {
      case QuizType.bool:
        _quizTypeText = _boolQuiz;
        break;

      case QuizType.string:
        _quizTypeText = _stringQuiz;
        break;
    }
  }

  Widget getWidgetItem() {
    if (total == correct) {
      return HistoryCorrectItem(
        date: DateTime.fromMicrosecondsSinceEpoch(date),
        correct: correct,
        total: total,
        quizTypeText: _quizTypeText,
      );
    } else {
      return HistoryFailItem(
        date: DateTime.fromMicrosecondsSinceEpoch(date),
        correct: correct,
        total: total,
        quizTypeText: _quizTypeText,
      );
    }
  }
}