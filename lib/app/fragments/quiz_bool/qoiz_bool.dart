import 'package:quiz/app/fragments/base/fragment.dart';
import 'package:quiz/app/list_model_view_items/data_model/base.dart';
import 'package:quiz/app/list_model_view_items/data_model/home/category.dart';

abstract class QuizBoolFragmentDelegate {
}

class QuizBoolFragment
    extends Fragment
    implements CategoryDataItemDelegate{
  QuizBoolFragmentDelegate delegate;

  QuizBoolFragment(
      {
        this.delegate
      }) {
    dataList = buildDataList();
  }

  List<BaseDataItem> buildDataList() {
    var result = <BaseDataItem>[];

    return result;
  }

  @override
  void onPressed({ItemType itemType}) {

  }
}