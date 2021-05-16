import 'package:flutter/widgets.dart';
import 'package:quiz/app/list_items/data_model/base.dart';
import 'package:quiz/app/list_items/view/list_items/question/question.dart';

class QuestionDataItem
    extends BaseDataItem
{
  var uuid = "";
  var index = 0;
  var question = "";

  QuestionDataItem({
    this.index,
    this.question,
    this.uuid
  });

  Widget getWidgetItem() {
    return QuestionItem(
      text: question,
      index: index,
    );
  }
}