import 'package:flutter/widgets.dart';
import 'package:quiz/app/components/list_vertical/base/base_list.dart';
import 'package:quiz/app/list_model_view_items/data_model/base.dart';

class Fragment {
  BaseList _listView;
  var  dataList = <BaseDataItem>[];

  Fragment(){
    _listView = BaseList(fragment: this);
  }

  get listView {
    return _listView;
  }

  void update () {
    _listView.update(fragment: this);
  }

  int getListCount() {
    return dataList.length;
  }

  Widget getListItem(int index) {
    return dataList[index].getWidgetItem();
  }
}
