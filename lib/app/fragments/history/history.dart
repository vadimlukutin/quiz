
import 'package:quiz/app/fragments/base/fragment.dart';
import 'package:quiz/app/list_items/data_model/base.dart';
import 'package:quiz/app/list_items/data_model/history/history.dart';
import 'package:quiz/app/list_items/data_model/home/category.dart';

abstract class HistoryFragmentDelegate {
}

class HistoryFragment
    extends Fragment {
  HistoryFragmentDelegate delegate;

  HistoryFragment(
      {
        this.delegate
      }) {
    dataList = buildDataList();
  }

  List<BaseDataItem> buildDataList() {
    var result = <BaseDataItem>[];

    result.add(
        HistoryDataItem(
          type: QuizType.bool,
          total: 10,
          correct: 3,
          date: DateTime.now().microsecondsSinceEpoch
        )
    );

    result.add(
        HistoryDataItem(
            type: QuizType.string,
            total: 10,
            correct: 3,
            date: DateTime.now().microsecondsSinceEpoch
        )
    );

    result.add(
        HistoryDataItem(
            type: QuizType.bool,
            total: 10,
            correct: 10,
            date: DateTime.now().microsecondsSinceEpoch
        )
    );

    result.add(
        HistoryDataItem(
            type: QuizType.string,
            total: 10,
            correct: 10,
            date: DateTime.now().microsecondsSinceEpoch
        )
    );

    return result;
  }

  @override
  void onPressed({ItemType itemType}) {

  }
}