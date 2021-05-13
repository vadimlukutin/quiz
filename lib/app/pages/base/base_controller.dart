import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quiz/app/fragments/base/fragment.dart';

abstract class FilterDelegate {
  void onFilterPressed();
}

class BaseController
    extends Controller{
  var baseFragment = Fragment();
  BuildContext baseContext;
  //BaseList baseListView;
  var title = "";

  // Presenter should always be initialized this way
  BaseController(): super();

  @override
  // this is called automatically by the parent class
  void initListeners() {
  }

  @override
  void onResumed() {
    print('On resumed');
  }

  @override
  void onReassembled() => print('View is about to be reassembled');

  @override
  void onDeactivated() => print('View is about to be deactivated');

  @override
  void onDisposed() {
    super.onDisposed();
  }

  void refreshListView() {
      baseFragment.update();
  }

  set context(BuildContext context) {
    baseContext = context;
  }

  // BaseList get listView{
  //   return baseFragment.listView;
  // }
}
