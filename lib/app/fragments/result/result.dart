
import 'package:quiz/app/fragments/base/fragment.dart';
import 'package:quiz/app/list_model_view_items/data_model/base.dart';
import 'package:quiz/app/list_model_view_items/data_model/home/category.dart';

abstract class ResultFragmentDelegate {
}

class ResultFragment
    extends Fragment
    implements CategoryDataItemDelegate{
  ResultFragmentDelegate delegate;

  ResultFragment(
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