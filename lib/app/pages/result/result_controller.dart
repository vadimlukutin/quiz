import 'package:quiz/app/fragments/result/result.dart';
import 'package:quiz/app/pages/base/base_controller.dart';
import 'package:quiz/app/pages/result/result_presenter.dart';

class ResultController
    extends BaseController
    implements ResultFragmentDelegate
{

  final ResultPresenter presenter;

  ResultController()
      : presenter = ResultPresenter(),
        super(){
    title = "Home";
    baseFragment = ResultFragment(delegate: this);
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
