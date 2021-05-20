import 'package:quiz/app/fragments/history/history.dart';
import 'package:quiz/app/pages/base/base_controller.dart';
import 'package:quiz/app/pages/history/history_presenter.dart';
import 'package:quiz/src/domain/entities/quiz_history.dart';

class HistoryController
    extends BaseController
    implements HistoryFragmentDelegate
{

  final HistoryPresenter presenter;

  HistoryController():
        presenter = HistoryPresenter(),
        super()
  {
    title = "History";
    baseFragment = HistoryFragment(delegate: this);

    presenter.getHistoryList();
  }

  @override
  // this is called automatically by the parent class
  void initListeners() {

    presenter.getQuizOnComplete = () {
    };

    presenter.getQuizOnNext = (QuizHistoryList quiz) {
      (baseFragment as HistoryFragment).data = quiz;
    };
  }

  @override
  void onDisposed() {
    presenter.dispose(); // don't forget to dispose of the presenter

    super.onDisposed();
  }
}
