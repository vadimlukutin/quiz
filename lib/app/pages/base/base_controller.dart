import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:quiz/app/fragments/base/fragment.dart';
import 'package:quiz/app/pages/base/base_presenter.dart';

abstract class FilterDelegate {
  void onFilterPressed();
}

enum DeviceType {
  none,
  ios,
  android
}

class BaseController
    extends Controller{
  var baseFragment = Fragment();
  BuildContext baseContext;
  //BaseList baseListView;
  var title = "";

  final BasePresenter presenter;

  // Presenter should always be initialized this way
  BaseController({
    this.presenter
  }): super();

  @override
  // this is called automatically by the parent class
  void initListeners() {
    presenter.onError = (e) {
      print('Could not retrieve user.');
      // ScaffoldMessenger.of(getContext())
      //     .showSnackBar(SnackBar(content: Text(e.message)));
      // _user = null;
      // refreshUI(); // Refreshes the UI manually
    };
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

  DeviceType get device {
    if (Device.get().isIos) {
      return DeviceType.ios;
    }

    if (Device.get().isAndroid) {
      return DeviceType.android;
    }

    return DeviceType.none;
  }
}
