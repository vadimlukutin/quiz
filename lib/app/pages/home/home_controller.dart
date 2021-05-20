import 'package:quiz/app/extra/navigator/navigator.dart';
import 'package:quiz/app/fragments/home/home.dart';
import 'package:quiz/app/pages/base/base_controller.dart';
import 'package:quiz/app/pages/home/home_presenter.dart';
import 'package:quiz/src/data/repositories/local_data/local_data.dart';

class HomeController
    extends BaseController
    implements HomeFragmentDelegate
{

  final HomePresenter presenter;

  LocalDB localDb;

  HomeController()
      : presenter = HomePresenter(),
        super(){
    title = "Home";
    baseFragment = HomeFragment(delegate: this);

    localDb = LocalDB();

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
    NavigationRoutes.openQuizBool(context: baseContext);
  }

  @override
  onStringPressed() {
    NavigationRoutes.openQuizString(context: baseContext);
  }

  @override
  onHistoryPressed() {
    NavigationRoutes.openHistory(context: baseContext);
  }
}
