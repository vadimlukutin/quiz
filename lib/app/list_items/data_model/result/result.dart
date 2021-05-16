import 'package:flutter/widgets.dart';
import 'package:quiz/app/list_items/data_model/base.dart';
import 'package:quiz/app/list_items/view/list_items/question/question.dart';
import 'package:quiz/app/list_items/view/list_items/result/result.dart';

enum ResultStatus {
  correct,
  fail
}

class ResultDataItem
    extends BaseDataItem
{
  final int index;
  final String question;
  final String answer;
  final ResultStatus status;

  ResultDataItem({
    this.index,
    this.question,
    this.answer,
    this.status
  });

  Widget getWidgetItem() {
    switch (status) {
      case ResultStatus.correct:
        return ResultCorrectItem(
          questionText: question,
          answerText: answer,
          index: index,
        );

      case ResultStatus.fail:
        return ResultFailItem(
          questionText: question,
          answerText: answer,
          index: index,
        );
    }

    return ResultCorrectItem(
      questionText: question,
      answerText: answer,
      index: index,
    );
  }
}