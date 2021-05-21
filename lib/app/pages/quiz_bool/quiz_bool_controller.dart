import 'package:quiz/app/extra/navigator/navigator.dart';
import 'package:quiz/app/fragments/quiz_bool/qoiz_bool.dart';
import 'package:quiz/app/pages/base/base_controller.dart';
import 'package:quiz/app/pages/quiz_bool/quiz_bool_presenter.dart';
import 'package:quiz/src/domain/entities/quiz_bool.dart';

enum QuizBoolControllerState {
  in_progress,
  ready
}

class QuizBoolController
    extends BaseController
    implements QuizBoolFragmentDelegate
{
  var _state = QuizBoolControllerState.in_progress;

  final QuizBoolPresenter presenter;

  QuizBoolController():
      presenter = QuizBoolPresenter(),
        super()
  {
    title = "True or False Quiz";

    baseFragment = QuizBoolFragment(delegate: this);

    presenter.getQuiz();
  }

  @override
  // this is called automatically by the parent class
  void initListeners() {
    super.initListeners();

    presenter.getQuizOnComplete = () {
    };

    presenter.getQuizOnNext = (QuizBoolList quiz) {
      (baseFragment as QuizBoolFragment).data = quiz;
    };
  }

  @override
  void onDisposed() {
    presenter.dispose(); // don't forget to dispose of the presenter

    super.onDisposed();
  }

  void onNextPressed () {
    if (_state == QuizBoolControllerState.ready) {
      final resultDetails = (baseFragment as QuizBoolFragment).resultDetails;
      final savedResult = (baseFragment as QuizBoolFragment).history;

      NavigationRoutes.openResult(
          context: baseContext,
          result: resultDetails,
          savedResult: savedResult,
      );
    }
  }

  QuizBoolControllerState get state {
    return _state;
  }

  @override
  void successQuiz() {
    _state = QuizBoolControllerState.ready;
  }
}
