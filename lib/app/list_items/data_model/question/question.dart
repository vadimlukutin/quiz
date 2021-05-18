import 'package:flutter/widgets.dart';
import 'package:quiz/app/list_items/data_model/base.dart';
import 'package:quiz/app/list_items/view/list_items/question/question.dart';

class QuestionDataItem
    extends BaseDataItem
{
  final int id;
  final int index;
  final String question;

  QuestionDataItem({
    this.index,
    this.question,
    this.id
  });

  Widget getWidgetItem() {
    return QuestionItem(
      text: question,
      index: index,
    );
  }
}