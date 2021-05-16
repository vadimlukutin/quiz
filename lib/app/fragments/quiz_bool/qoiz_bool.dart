import 'package:quiz/app/fragments/base/fragment.dart';
import 'package:quiz/app/list_items/data_model/base.dart';
import 'package:quiz/app/list_items/data_model/home/category.dart';
import 'package:quiz/app/list_items/data_model/question/question.dart';
import 'package:quiz/app/list_items/data_model/quiz_bool/answer_bool.dart';
import 'package:uuid/uuid.dart';

abstract class QuizBoolFragmentDelegate {
}

class QuizBoolFragment
    extends Fragment
    implements 
        AnswerBoolDataItemDelegate{
  QuizBoolFragmentDelegate delegate;

  QuizBoolFragment(
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
      AnswerBoolDataItem(
        delegate: this,
        uuid: uuid
      )
    );

    uuid = Uuid().v4();
    result.add(QuestionDataItem(
      index: 2,
      question: "Question",
      uuid: uuid,
    ));

    result.add(
        AnswerBoolDataItem(
            delegate: this,
            uuid: uuid
        )
    );

    uuid = Uuid().v4();
    result.add(QuestionDataItem(
      index: 3,
      question: "Question",
      uuid: uuid,
    ));

    result.add(
        AnswerBoolDataItem(
            delegate: this,
            uuid: uuid
        )
    );

    uuid = Uuid().v4();
    result.add(QuestionDataItem(
      index: 4,
      question: "Question",
      uuid: uuid,
    ));

    result.add(
        AnswerBoolDataItem(
            delegate: this,
            uuid: uuid
        )
    );

    uuid = Uuid().v4();
    result.add(QuestionDataItem(
      index: 5,
      question: "Question",
      uuid: uuid,
    ));

    result.add(
        AnswerBoolDataItem(
            delegate: this,
            uuid: uuid
        )
    );

    uuid = Uuid().v4();
    result.add(QuestionDataItem(
      index: 6,
      question: "Question",
      uuid: uuid,
    ));

    result.add(
        AnswerBoolDataItem(
            delegate: this,
            uuid: uuid
        )
    );

    uuid = Uuid().v4();
    result.add(QuestionDataItem(
      index: 7,
      question: "Question",
      uuid: uuid,
    ));

    result.add(
        AnswerBoolDataItem(
            delegate: this,
            uuid: uuid
        )
    );

    uuid = Uuid().v4();
    result.add(QuestionDataItem(
      index: 8,
      question: "Question",
      uuid: uuid,
    ));

    result.add(
        AnswerBoolDataItem(
            delegate: this,
            uuid: uuid
        )
    );

    uuid = Uuid().v4();
    result.add(QuestionDataItem(
      index: 9,
      question: "Question",
      uuid: uuid,
    ));

    result.add(
        AnswerBoolDataItem(
            delegate: this,
            uuid: uuid
        )
    );

    return result;
  }

  @override
  void onPressed({ItemType itemType}) {

  }

  @override
  void onAnswerBoolPressed({AnswerBoolState state, String uuid}) {

  }
}