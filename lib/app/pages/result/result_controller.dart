import 'package:quiz/app/extra/navigator/navigator.dart';
import 'package:quiz/app/fragments/result/result.dart';
import 'package:quiz/app/pages/base/base_controller.dart';
import 'package:quiz/app/pages/result/result_presenter.dart';
import 'package:quiz/src/domain/entities/quiz_detail_result.dart';
import 'package:quiz/src/domain/entities/quiz_history.dart';

class ResultController
    extends BaseController
    implements ResultFragmentDelegate
{

  final ResultPresenter presenter;
  final QuizDetailResultList result;
  final QuizHistoryItem savedResult;

  ResultController({
    this.result,
    this.savedResult
  })
      : presenter = ResultPresenter(),
        super()
  {
    title = "Result";

    baseFragment = ResultFragment(
        delegate: this,
        data: result
    );

    presenter.putQuizResult(quiz: savedResult);
  }

  @override
  // this is called automatically by the parent class
  void initListeners() {
    super.initListeners();

    presenter.putQuizHistoryOnComplete = () {
    };

    presenter.putQuizHistoryOnNext = () {
    };
  }

  @override
  void onDisposed() {
    presenter.dispose(); // don't forget to dispose of the presenter

    super.onDisposed();
  }

  void onFinishPressed () {
    NavigationRoutes.back(context: baseContext);
  }
}
