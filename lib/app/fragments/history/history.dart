
import 'package:quiz/app/fragments/base/fragment.dart';
import 'package:quiz/app/list_items/data_model/base.dart';
import 'package:quiz/app/list_items/data_model/history/history.dart';
import 'package:quiz/app/list_items/data_model/home/category.dart';
import 'package:quiz/src/domain/entities/quiz_history.dart';

abstract class HistoryFragmentDelegate {
}

class HistoryFragment
    extends Fragment {
  HistoryFragmentDelegate delegate;
  QuizHistoryList _data;

  HistoryFragment(
      {
        this.delegate
      }) {
    dataList = buildDataList();
  }

  set data (QuizHistoryList data) {
    _data = data;
    dataList = buildDataList();
    update();
  }

  List<BaseDataItem> buildDataList() {
    var result = <BaseDataItem>[];

    if (_data == null) {
      return result;
    }

    for (final item in this._data.list) {
      result.add(
          HistoryDataItem(
              type: item.type,
              total: item.total,
              correct: item.correct,
              date: item.date.microsecondsSinceEpoch
          )
      );
    }

    return result;
  }
}