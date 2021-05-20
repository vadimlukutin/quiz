import 'package:quiz/app/fragments/base/fragment.dart';
import 'package:quiz/app/list_items/data_model/base.dart';
import 'package:quiz/app/list_items/data_model/question/question.dart';
import 'package:quiz/app/list_items/data_model/quiz_string/answer_string.dart';
import 'package:quiz/src/domain/entities/quiz_detail_result.dart';
import 'package:quiz/src/domain/entities/quiz_history.dart';
import 'package:quiz/src/domain/entities/quiz_string.dart';

abstract class QuizStringFragmentDelegate {
  void successQuiz();
}

class QuizStringFragment
    extends Fragment
    implements
        AnswerStringDataItemDelegate
{
  QuizStringList _data;
  QuizStringFragmentDelegate delegate;

  QuizStringFragment(
      {
        QuizStringList data,
        this.delegate
      }) {
    dataList = buildDataList();
    data = _data;
  }

  set data (QuizStringList data) {
    _data = data;
    dataList = buildDataList();
    update();
  }

  QuizDetailResultList get resultDetails {
    return _data.resultDetails;
  }

  QuizHistoryItem get history {
    return _data.history;
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

      final answers = item.answers;

      for (final answer in answers) {
        result.add(
            AnswerStringDataItem(
              delegate: this,
              text: answer,
              questionId: item.id,
            )
        );
      }

      index ++;
    }

    return result;
  }

  bool get isCorrect {
    return  _data.isCorrect;
  }

  @override
  void onAnswerStringPressed({
    AnswerStringState state,
    int questionId,
    String answer
  }) {
    for (var item in dataList) {
      Type itemType = item.runtimeType;

      if (itemType == AnswerStringDataItem){
        final itemQuestionUuid = (item as AnswerStringDataItem).questionId;
        final itemAnswer = (item as AnswerStringDataItem).text;

        if (itemQuestionUuid == questionId) {
          _data.setAnswer(questionId: questionId, answer: answer);

          if (itemAnswer == answer) {
            (item as AnswerStringDataItem).active();
          } else {
            (item as AnswerStringDataItem).inactive();
          }
        }
      }
    }

    if (_data.filled) {
      delegate.successQuiz();
    }
  }
}