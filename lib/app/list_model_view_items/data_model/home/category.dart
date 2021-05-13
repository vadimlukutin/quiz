import 'package:flutter/widgets.dart';
import 'package:quiz/app/list_model_view_items/data_model/base.dart';
import 'package:quiz/app/list_model_view_items/view/list_items/home/home_item.dart';

enum ItemType {
  none,
  boolQuiz,
  stringQuiz,
  history
}

abstract class CategoryDataItemDelegate {
  void onPressed({ItemType itemType});
}

class CategoryDataItem
    extends BaseDataItem
{
  var title = "";
  var itemType = ItemType.none;

  CategoryDataItemDelegate delegate;

  CategoryDataItem({
    this.title,
    this.delegate,
    this.itemType
  });

  Widget getWidgetItem() {
    return HomeItem(
        title: title,
        onItemPressed: _onItemPressed
    );
  }

  // Private

  void _onItemPressed() {
    delegate.onPressed(itemType: itemType);
  }
}