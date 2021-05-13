
import 'package:quiz/app/fragments/base/fragment.dart';
import 'package:quiz/app/list_model_view_items/data_model/base.dart';
import 'package:quiz/app/list_model_view_items/data_model/home/category.dart';

abstract class HistoryFragmentDelegate {
}

class HistoryFragment
    extends Fragment
    implements CategoryDataItemDelegate{
  HistoryFragmentDelegate delegate;

  HistoryFragment(
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