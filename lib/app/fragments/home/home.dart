import 'package:quiz/app/fragments/base/fragment.dart';
import 'package:quiz/app/list_items/data_model/base.dart';
import 'package:quiz/app/list_items/data_model/home/category.dart';

abstract class HomeFragmentDelegate {
  onBoolPressed();
  onStringPressed();
  onHistoryPressed();
}

class HomeFragment
    extends Fragment
    implements CategoryDataItemDelegate{
  HomeFragmentDelegate delegate;

  HomeFragment(
      {
        this.delegate
      }) {
    dataList = buildDataList();
  }

  List<BaseDataItem> buildDataList() {
    var result = <BaseDataItem>[];

    result.add(
        CategoryDataItem(
            title: "True or False Quiz",
            itemType: ItemType.boolQuiz,
            delegate: this
        )
    );

    result.add(
        CategoryDataItem(
            title: "One Answer Quiz",
            itemType: ItemType.stringQuiz,
            delegate: this
        )
    );

    result.add(
        CategoryDataItem(
            title: "History",
            itemType: ItemType.history,
            delegate: this
        )
    );

    return result;
  }

  @override
  void onPressed({ItemType itemType}) {
    switch (itemType) {
      case ItemType.boolQuiz:
        delegate.onBoolPressed();
        break;

      case ItemType.stringQuiz:
        delegate.onStringPressed();
        break;

      case ItemType.history:
        delegate.onHistoryPressed();
        break;
    }
  }
}