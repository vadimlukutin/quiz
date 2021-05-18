import 'package:quiz/app/fragments/history/history.dart';
import 'package:quiz/app/pages/base/base_controller.dart';
import 'package:quiz/app/pages/history/history_presenter.dart';

class HistoryController
    extends BaseController
    implements HistoryFragmentDelegate
{

  HistoryController()
      :super(presenter: HistoryPresenter()){
    title = "History";
    baseFragment = HistoryFragment(delegate: this);
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
}
