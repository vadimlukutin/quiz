
import 'package:quiz/app/fragments/base/fragment.dart';
import 'package:quiz/app/list_items/data_model/base.dart';
import 'package:quiz/app/list_items/data_model/home/category.dart';
import 'package:quiz/app/list_items/data_model/result/result.dart';

abstract class ResultFragmentDelegate {
}

class ResultFragment
    extends Fragment{
  ResultFragmentDelegate delegate;

  ResultFragment(
      {
        this.delegate
      }) {
    dataList = buildDataList();
  }

  List<BaseDataItem> buildDataList() {
    var result = <BaseDataItem>[];

    result.add(
        ResultDataItem(
          status: ResultStatus.fail,
          index: 1,
          question: "Question",
          answer: "Answer"
        )
    );

    result.add(
        ResultDataItem(
            status: ResultStatus.correct,
            index: 2,
            question: "Question",
            answer: "Answer"
        )
    );

    result.add(
        ResultDataItem(
            status: ResultStatus.fail,
            index: 3,
            question: "Question",
            answer: "Answer"
        )
    );

    result.add(
        ResultDataItem(
            status: ResultStatus.correct,
            index: 4,
            question: "Question",
            answer: "Answer"
        )
    );

    result.add(
        ResultDataItem(
            status: ResultStatus.correct,
            index: 5,
            question: "Question",
            answer: "Answer"
        )
    );

    return result;
  }

  @override
  void onPressed({ItemType itemType}) {

  }
}