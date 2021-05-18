import 'package:quiz/app/fragments/base/fragment.dart';
import 'package:quiz/app/list_items/data_model/base.dart';
import 'package:quiz/app/list_items/data_model/question/question.dart';
import 'package:quiz/app/list_items/data_model/quiz_bool/answer_bool.dart';
import 'package:quiz/src/domain/entities/quiz_bool.dart';

abstract class QuizBoolFragmentDelegate {
  void successQuiz();
}

class QuizBoolFragment
    extends Fragment
    implements 
        AnswerBoolDataItemDelegate{
  QuizBool _data;
  QuizBoolFragmentDelegate delegate;

  QuizBoolFragment(
      {
        QuizBool data,
        this.delegate
      }) {
    dataList = buildDataList();
    data = _data;
  }

  set data (QuizBool data) {
    _data = data;
    dataList = buildDataList();
    update();
  }

  List<BaseDataItem> buildDataList() {
    var result = <BaseDataItem>[];

    if (_data == null) {
      return result;
    }

    var index = 1;

    for (final item in this._data.list) {
      result.add(
          QuestionDataItem(
            index: index,
            question: item.question,
            id: item.id,
          )
      );

      result.add(
          AnswerBoolDataItem(
              delegate: this,
              id: item.id
          )
      );

      index ++;
    }

    return result;
  }

  @override
  void onAnswerBoolPressed({
    AnswerBoolState state,
    int id
  }) {
    for (final item in dataList) {
      Type itemType = item.runtimeType;

      if (itemType == AnswerBoolDataItem){
        final state = (item as AnswerBoolDataItem).state;

        switch (state) {
          case AnswerBoolState.none:
            return;

          case AnswerBoolState.positive:
          case AnswerBoolState.none:

            break;
        }
      }
    }

    delegate.successQuiz();
  }
}