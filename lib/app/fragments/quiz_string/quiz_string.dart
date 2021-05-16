import 'package:quiz/app/fragments/base/fragment.dart';
import 'package:quiz/app/list_items/data_model/base.dart';
import 'package:quiz/app/list_items/data_model/home/category.dart';
import 'package:quiz/app/list_items/data_model/question/question.dart';
import 'package:quiz/app/list_items/data_model/quiz_string/answer_string.dart';
import 'package:uuid/uuid.dart';

abstract class QuizStringFragmentDelegate {
}

class QuizStringFragment
    extends Fragment
    implements
        AnswerStringDataItemDelegate
{
  QuizStringFragmentDelegate delegate;

  QuizStringFragment(
      {
        this.delegate
      }) {
    dataList = buildDataList();
  }

  List<BaseDataItem> buildDataList() {
    var result = <BaseDataItem>[];

    var uuid = Uuid().v4();
    result.add(QuestionDataItem(
      index: 1,
      question: "Question",
      uuid: uuid,
    ));

    result.add(
        AnswerStringDataItem(
          delegate: this,
          text: "Answer 1",
          questionUuid: uuid,
          answerUuid: Uuid().v4(),
        )
    );

    result.add(
        AnswerStringDataItem(
          delegate: this,
          text: "Answer 2",
          questionUuid: uuid,
          answerUuid: Uuid().v4(),
        )
    );

    result.add(
        AnswerStringDataItem(
          delegate: this,
          text: "Answer 3",
          questionUuid: uuid,
          answerUuid: Uuid().v4(),
        )
    );

    uuid = Uuid().v4();
    result.add(QuestionDataItem(
      index: 2,
      question: "Question",
      uuid: uuid,
    ));

    result.add(
        AnswerStringDataItem(
            delegate: this,
            text: "Answer 1",
            questionUuid: uuid,
            answerUuid: Uuid().v4(),
        )
    );

    result.add(
        AnswerStringDataItem(
          delegate: this,
          text: "Answer 2",
          questionUuid: uuid,
          answerUuid: Uuid().v4(),
        )
    );

    result.add(
        AnswerStringDataItem(
          delegate: this,
          text: "Answer 3",
          questionUuid: uuid,
          answerUuid: Uuid().v4(),
        )
    );

    uuid = Uuid().v4();
    result.add(QuestionDataItem(
      index: 3,
      question: "Question",
      uuid: uuid,
    ));

    result.add(
        AnswerStringDataItem(
          delegate: this,
          text: "Answer 1",
          questionUuid: uuid,
          answerUuid: Uuid().v4(),
        )
    );

    result.add(
        AnswerStringDataItem(
          delegate: this,
          text: "Answer 2",
          questionUuid: uuid,
          answerUuid: Uuid().v4(),
        )
    );

    result.add(
        AnswerStringDataItem(
          delegate: this,
          text: "Answer 3",
          questionUuid: uuid,
          answerUuid: Uuid().v4(),
        )
    );

    uuid = Uuid().v4();
    result.add(QuestionDataItem(
      index: 4,
      question: "Question",
      uuid: uuid,
    ));

    result.add(
        AnswerStringDataItem(
          delegate: this,
          text: "Answer 1",
          questionUuid: uuid,
          answerUuid: Uuid().v4(),
        )
    );

    result.add(
        AnswerStringDataItem(
          delegate: this,
          text: "Answer 2",
          questionUuid: uuid,
          answerUuid: Uuid().v4(),
        )
    );

    result.add(
        AnswerStringDataItem(
          delegate: this,
          text: "Answer 3",
          questionUuid: uuid,
          answerUuid: Uuid().v4(),
        )
    );

    uuid = Uuid().v4();
    result.add(QuestionDataItem(
      index: 5,
      question: "Question",
      uuid: uuid,
    ));

    result.add(
        AnswerStringDataItem(
          delegate: this,
          text: "Answer 1",
          questionUuid: uuid,
          answerUuid: Uuid().v4(),
        )
    );

    result.add(
        AnswerStringDataItem(
          delegate: this,
          text: "Answer 2",
          questionUuid: uuid,
          answerUuid: Uuid().v4(),
        )
    );

    result.add(
        AnswerStringDataItem(
          delegate: this,
          text: "Answer 3",
          questionUuid: uuid,
          answerUuid: Uuid().v4(),
        )
    );

    return result;
  }

  @override
  void onPressed({ItemType itemType}) {

  }

  @override
  void onAnswerStringPressed({
    AnswerStringState state,
    String questionUuid,
    String answerUuid
  }) {
    for (var item in dataList) {
      Type itemType = item.runtimeType;

      if (itemType == AnswerStringDataItem){
        final itemQuestionUuid = (item as AnswerStringDataItem).questionUuid;
        final itemAnswerUuid = (item as AnswerStringDataItem).answerUuid;

        if (itemQuestionUuid == questionUuid) {
          if (itemAnswerUuid == answerUuid) {
            (item as AnswerStringDataItem).active();
          } else {
            (item as AnswerStringDataItem).inactive();
          }
        }
      }
    }
  }
}