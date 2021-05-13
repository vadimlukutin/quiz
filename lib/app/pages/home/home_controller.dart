import 'package:quiz/app/fragments/home/home.dart';
import 'package:quiz/app/pages/base/base_controller.dart';
import 'package:quiz/app/pages/home/home_presenter.dart';

class HomeController
    extends BaseController
    implements HomeFragmentDelegate
{

  final HomePresenter presenter;

  HomeController()
      : presenter = HomePresenter(),
        super(){
    title = "Home";
    baseFragment = HomeFragment(delegate: this);
  }

  @override
  // this is called automatically by the parent class
  void initListeners() {

  }

  @override
  void onDisposed() {
    presenter.dispose(); // don't forget to dispose of the presenter

    super.onDisposed();
  }

  @override
  onBoolPressed() {
  }

  @override
  onStringPressed() {
  }

  @override
  onHistoryPressed() {
  }
}
